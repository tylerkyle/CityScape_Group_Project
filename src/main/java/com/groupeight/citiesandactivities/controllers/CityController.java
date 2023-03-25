package com.groupeight.citiesandactivities.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.groupeight.citiesandactivities.services.CityService;
@Controller
public class CityController {
	@Autowired
	CityService cityService;

	@RequestMapping("/all/cities")
	private String allCities(@ModelAttribute ("allCities") Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("allActivities", cityService.allCities());
		return "allActivities.jsp";
	}
}
