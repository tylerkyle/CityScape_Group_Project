package com.tylerschnerch.securewodenhunts.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tylerschnerch.securewodenhunts.services.UserService;
import com.tylerschnerch.securewodenhunts.validator.UserValidator;


@RequestMapping("/admin")
@Controller

public class AdminController {
	@Autowired
	UserValidator userValidator;
	@Autowired
	UserService userService;

	@RequestMapping("/super")
	public String superAdminPage(Principal principal, Model model) {
		String username = principal.getName();

		model.addAttribute("currentUser", userService.findByUsername(username));

		model.addAttribute("users", userService.allUsers());

		return "superAdminPage.jsp";
	}

	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();

		model.addAttribute("currentUser", userService.findByUsername(username));

		model.addAttribute("users", userService.allUsers());

		return "adminPage.jsp";
	}

	@RequestMapping("/admin/{id}")
	public String adminDelete(@PathVariable("id") Long id, Principal principal, Model model) {
		userService.deleteUser(id);
		return "redirect:/admin/admin";
	}

	

}
