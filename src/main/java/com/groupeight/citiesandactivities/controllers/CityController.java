package com.groupeight.citiesandactivities.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.groupeight.citiesandactivities.models.City;
import com.groupeight.citiesandactivities.services.CityService;

@Controller
public class CityController {
	@Autowired
	CityService cityService;

	@RequestMapping("all/cities")
	private String allCities(@ModelAttribute("allCities") Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("allActivities", cityService.allCities());
		return "ViewActivities.jsp";
	}

	@RequestMapping("city/{id}")
	private String viewCityById(@PathVariable("id") Long id, @ModelAttribute("thisCity") Model model,
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("thisCity", cityService.findCity(id));

		return "viewCity.jsp";
	}
	
	@RequestMapping("city/add")
	private String newCity(Model model, @ModelAttribute("city") City newCity,
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

			model.addAttribute("city", newCity);
		return "addCity.jsp";
	}
	
	@RequestMapping("city/edit/{id}")
	private String editCityById(@PathVariable("id") Long id, @ModelAttribute("thisCity") Model model,
			HttpSession session, BindingResult result, City city) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("thisCity", cityService.findCity(id));
		return "editCity.jsp";
	}
	
	@PutMapping("city/{id}")
	private String updateCityById(@PathVariable("id") Long id, @ModelAttribute("thisCity") Model model,
			HttpSession session, BindingResult result, City city) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if (result.hasErrors()) {
			model.addAttribute("thisCity", city);
			return "redirect:city/new";

		} else {
			cityService.update(city);
			return "redirect:/all/cities";
		}
	}

	@PostMapping("city/new")
	private String newcity(@ModelAttribute("city") City newCity, Model model, HttpSession session,
			BindingResult result) {
		System.out.print("I made it here");
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if (result.hasErrors()) {
			return "addCity.jsp";
		} else {
			cityService.createCity(newCity);
			return "redirect:/all/cities";
		}

	}

	@PostMapping("city/delete/{id}")
	public String deleteCity(@PathVariable("id") Long id, HttpSession session) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		cityService.deleteCity(id);
		return "redirect:/all/cities";
	}

}
