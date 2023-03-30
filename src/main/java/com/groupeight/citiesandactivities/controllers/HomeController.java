package com.groupeight.citiesandactivities.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.groupeight.citiesandactivities.models.Activity;
import com.groupeight.citiesandactivities.models.City;
import com.groupeight.citiesandactivities.models.User;
import com.groupeight.citiesandactivities.services.ActivityService;
import com.groupeight.citiesandactivities.services.CityService;
import com.groupeight.citiesandactivities.services.UserService;
import com.groupeight.citiesandactivities.validator.UserValidator;

@Controller
public class HomeController {
	@Autowired
	UserValidator userValidator;
	@Autowired
	UserService userService;
	
	private final CityService cityServ;
	private final ActivityService activityServ;
	
	public HomeController (CityService cityServ, ActivityService activityServ) {
		this.cityServ = cityServ;
		this.activityServ = activityServ;
	}

	@RequestMapping(value = { "/" })
	public String home(Principal principal, Model model, HttpSession session) {

		String username = principal.getName();
		model.addAttribute("user", userService.findByUsername(username));
		User user = userService.findByUsername(username);

		if (session.getAttribute("userId") == null) {
			Long thisUsersId = user.getId();
			session.setAttribute("userId", thisUsersId);

		}

		return "redirect:/home";
	}

	@GetMapping("/home")
	public String homePage(Model model){
		List<City> cities = cityServ.allCities();
		List<Activity> activities = activityServ.allActivities();
		
		model.addAttribute("cities", cities);
		model.addAttribute("activites", activities);
		
		return "dashboardPage.jsp";
	}
	
	@RequestMapping("/registration")
	public String registerForm(@Valid @ModelAttribute("user") User user) {
		return "registrationPage.jsp";
	}

	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			HttpSession session) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "registrationPage.jsp";
		}

		if (userService.allUsers().size() == 0) {
			userService.newUser(user, "ROLE_SUPER_ADMIN");
		} else if (userService.allUsers().size() <= 2) {
			userService.newUser(user, "ROLE_ADMIN");
		} else {
			userService.newUser(user, "ROLE_USER");
		}
		session.setAttribute("userId", user.getId());
		session.setAttribute("userzipcode", user.getZipcode());

		return "redirect:/login";
	}

	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model, HttpSession session) {
		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful!");
		}

		return "loginPage.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);
		session.setAttribute("userId", null);
		return "redirect:/login";

	}

}
