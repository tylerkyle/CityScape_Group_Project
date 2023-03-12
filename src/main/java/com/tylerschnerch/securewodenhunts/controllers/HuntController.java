package com.tylerschnerch.securewodenhunts.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tylerschnerch.securewodenhunts.models.Hunt;
import com.tylerschnerch.securewodenhunts.models.User;
import com.tylerschnerch.securewodenhunts.services.HuntService;
@RequestMapping("/hunt")
@Controller


public class HuntController {
	
	@Autowired HuntService huntService;
	@PostMapping("/submit")
	public String createNewHunt(@Valid @ModelAttribute("newHunt") Hunt hunt, BindingResult result, 
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			
			return "redirect:/logout";
		}

		if (result.hasErrors()) {
			System.out.println("Has error");
			return "redirect:/hunt";

		} else { 
			System.out.println("C");
			huntService.createHunt(hunt);
			System.out.println("D");
			return "redirect:/review";
			}
	
		}
	@GetMapping("/review/{id}")
	public String reviewHunt(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		return "reviewHunt.jsp";
	}
}
