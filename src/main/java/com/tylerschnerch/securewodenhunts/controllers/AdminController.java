package com.tylerschnerch.securewodenhunts.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tylerschnerch.securewodenhunts.models.Hunt;
import com.tylerschnerch.securewodenhunts.models.Lease;
import com.tylerschnerch.securewodenhunts.models.User;
import com.tylerschnerch.securewodenhunts.services.HuntService;
import com.tylerschnerch.securewodenhunts.services.LeaseService;
import com.tylerschnerch.securewodenhunts.services.UserService;
import com.tylerschnerch.securewodenhunts.validator.UserValidator;


@RequestMapping("/admin")
@Controller

public class AdminController {
	@Autowired LeaseService leaseService;
	@Autowired UserValidator userValidator;
	@Autowired UserService userService;
	@Autowired HuntService huntService;

	@RequestMapping("/super")
	public String superAdminPage(Principal principal, Model model) {
		String username = principal.getName();

		model.addAttribute("currentUser", userService.findByUsername(username));
		
		model.addAttribute("allLeases", leaseService.allLeases());
		System.out.println(model.addAttribute("allLeases", leaseService.allLeases()));
		model.addAttribute("allHunts", huntService.allHunts());
		model.addAttribute("allUsers", userService.allUsers());
		return "superAdminPage.jsp";
	}

	
	
	@RequestMapping("/super/edit/lease/{id}")
	public String editLease(@PathVariable("id") Integer id, Principal principal, Model model, HttpSession session) {

    	if (session.getAttribute("userId") == null) {
				return "redirect:/logout";
    	}
    	String username = principal.getName();
    	
    	model.addAttribute("user", userService.findByUsername(username));
    	model.addAttribute("thisLease", leaseService.findLease(id));
    	Lease lease = leaseService.findLease(id); 
    	model.addAttribute("blankLease", lease);

		return "superAdminEditLease.jsp";
	}
	
	@PutMapping("/super/update/lease/{id}")
	public String updateLease(@PathVariable("id") Integer id,Lease lease, BindingResult result, Principal principal, Model model, HttpSession session ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		if (result.hasErrors()) {
			model.addAttribute("aLease", lease);
			return "editlease.jsp";
		}
		{
			leaseService.update(lease);
			return "redirect:/admin/super";
		}
	}

		
	
	@RequestMapping("/super/edit/hunt/{id}")
	public String editHunt(@PathVariable("id") Integer id, Principal principal, Model model, Hunt hunt, HttpSession session, BindingResult result) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		String username = principal.getName();
		model.addAttribute("blankHunt", hunt);
		model.addAttribute("user", userService.findByUsername(username));
		model.addAttribute("thisHunt", huntService.findHunt(id));
		
			return "editHunt.jsp";
		
		
	}
	
	@PutMapping("/super/update/hunt/{id}")
	public String updateHunt(@PathVariable("id") Integer id, Principal principal, Model model, Hunt hunt, HttpSession session, BindingResult result) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		if (result.hasErrors()) {
			model.addAttribute("aHunt", hunt);
			return "editUser.jsp";
		}
		{
			huntService.update(hunt);
			return "redirect:/admin/super";
		}
		
	}
	
	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();

		model.addAttribute("currentUser", userService.findByUsername(username));

		model.addAttribute("users", userService.allUsers());

		return "adminPage.jsp";
	}
	
	@PostMapping("/super/delete/user/{id}")
	public String superUserDeleteuser(@PathVariable("id") Integer id, Principal principal, Model model) {
		userService.deleteUser(id);
		return "redirect:/admin/super";
	}
	
	@PostMapping("/super/delete/lease/{id}")
	public String superUserDeletelease(@PathVariable("id") Integer id, Principal principal, Model model) {
		leaseService.deleteLease(id);
		return "redirect:/admin/super";
	}
	
	@PostMapping("/super/delete/hunt/{id}")
	public String superUserDeletehunt(@PathVariable("id") Integer id, Principal principal, Model model) {
		huntService.deleteHunt(id);
		return "redirect:/admin/super";
	}
 
	

}
