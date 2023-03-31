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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.groupeight.citiesandactivities.models.Activity;
import com.groupeight.citiesandactivities.models.City;
import com.groupeight.citiesandactivities.models.User;
import com.groupeight.citiesandactivities.services.ActivityService;
import com.groupeight.citiesandactivities.services.CityService;
import com.groupeight.citiesandactivities.services.CommentService;
import com.groupeight.citiesandactivities.services.UserService;

@Controller
public class ActivityController {
	@Autowired
	CityService cityService;
	@Autowired
	ActivityService activityService;
	@Autowired
	UserService userService;
	@Autowired
	CommentService commentService;

	@RequestMapping("city/{cityId}/acitivity/{acitivityId}")
	private String oneOfACitysActivities(@PathVariable("cityId") Long cityId,
			@PathVariable("activityId") Long activityId, Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("activitysComments", commentService.allActivitiesCommentsByActivityId(activityId));
		model.addAttribute("citysActivities", activityService.findByCityId(cityId));

		return "oneOfACitiesActivities.jsp";
	}

	@RequestMapping("city/{cityId}/activities")
	private String allOfACitysActivities(@PathVariable("cityId") Long cityId,
			@PathVariable("activityId") Long activityId, Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		model.addAttribute("citysActivities", activityService.findByCityId(cityId));

		return "allOfACitiesActivities.jsp";
	}

	@RequestMapping("activity/{id}")
	private String oneOfAUsersActivities(@PathVariable("id") Long id, @ModelAttribute("thisActivity") Model model,
			HttpSession session, Principal principal) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		String username = principal.getName();
		User user = userService.findByUsername(username);
		Long userId = user.getId();

		model.addAttribute("usersActivities", activityService.allUserActivitiesById(userId));

		return "oneOfAUsersActivities.jsp";
	}

	@RequestMapping("activities")
	private String allOfAUsersActivities(@PathVariable("id") Long id, @ModelAttribute("usersActivities") Model model,
			HttpSession session, Principal principal) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		String username = principal.getName();
		User user = userService.findByUsername(username);
		Long userId = user.getId();

		model.addAttribute("usersActivities", activityService.allUserActivitiesById(userId));

		return "allOfAUsersActivities.jsp";
	}

	@GetMapping("city/{cityId}/new/activity")
	private String newActivity(@PathVariable("cityId") Long cityId, @ModelAttribute("thisCity") Model model,
			Activity activity, BindingResult result) {
		model.addAttribute("newActivity", activity);
		model.addAttribute("thisCity", cityService.findCity(cityId));
		return "newActivity.jsp";
	}

	@RequestMapping("activity/add")
	private String newActivity (Model model, @ModelAttribute("activity") Activity newActivity,
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		return "AddActivity.jsp";
	}
	
	// TODO: Need to discuss a better redirect solution after creating activity
	@PostMapping("activity/create")
	private String createNewActivity(@ModelAttribute("activity") Activity activity, HttpSession session,
			BindingResult result, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if (result.hasErrors()) {
			model.addAttribute("thisActivity", activity);
			return "redirect:activity/new";

		} else {
			activityService.createActivity(activity);
			
			List<City> cities = cityService.allCities();
			List<Activity> activities = activityService.allActivities();
			model.addAttribute("cities", cities);
			model.addAttribute("activites", activities);

			return "dashboardPage.jsp";
		}

	}

	// TODO: Need to figure out better redirect
	@PutMapping("activity/{id}")
	private String updateActivityById(@PathVariable("id") Long id, @ModelAttribute("thisActivity") Model model,
			HttpSession session, BindingResult result, Activity activity) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if (result.hasErrors()) {
			model.addAttribute("thisActivity", activity);
			return "redirect:city/new";

		} else {
			activityService.update(activity);
			return "redirect:/all/cities";
		}
	}

}
