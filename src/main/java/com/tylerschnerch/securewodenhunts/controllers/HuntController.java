package com.tylerschnerch.securewodenhunts.controllers;

import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tylerschnerch.securewodenhunts.models.Hunt;
import com.tylerschnerch.securewodenhunts.models.User;
import com.tylerschnerch.securewodenhunts.services.HuntService;
import com.tylerschnerch.securewodenhunts.services.LeaseService;
import com.tylerschnerch.securewodenhunts.services.UserService;
import com.tylerschnerch.securewodenhunts.validator.UserValidator;
@RequestMapping("/hunt")
@Controller


public class HuntController {
	@Autowired 
	LeaseService leaseService;
	@Autowired
	UserValidator userValidator;
	@Autowired
	UserService userService;
	@Autowired HuntService huntService;
	
	@PostMapping("/submit/{id}")
	public String createNewHunt( @Valid  @ModelAttribute("newHunt") @PathVariable("id") Integer id, Hunt hunt, BindingResult result, 
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		if (result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
		    for (FieldError error : errors ) {
		        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		}
			return "redirect:/hunt";

		} else { 
			System.out.println("C");
			huntService.createHunt(hunt);
			//Lease lease = leaseService.findLease(id);
			//List<Hunt> hunts = lease.getHunts();
			//hunts.add(hunt);
			//lease.setHunts(hunts);
			//Hunt lastHunt = hunts.get(0);
			//List <Lease> lastHuntsLease = lastHunt.getLease();
			//lastHunt.setLease(lease);
			
			
			
			System.out.println("D");
			return "redirect:/hunt/review";
			}
	
		}
	@GetMapping("/review")
	public String reviewHunt(@ModelAttribute("updateHunt") Hunt hunt, Model model, Integer id, HttpSession session, String username, Principal principal) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		//user stuff
		username = principal.getName();
		User theUser =  userService.findByUsername(username);
		Integer usersId = theUser.getId();
		model.addAttribute("user",theUser);
		model.addAttribute("updateHunt", hunt);
		
		List <Hunt> hunts = huntService.allOfAUsersHunts(usersId);
		ArrayList<Hunt> huntsArray = (ArrayList <Hunt>) hunts;
		Hunt lastHunt = huntsArray.get(0);
		
		Date startDate = lastHunt.getStartDate();
	    Date endDate = lastHunt.getEndDate();
	    
	    Long diffInMilliSeconds =  Math.abs(endDate.getTime() - startDate.getTime());
	    Long totalDays = TimeUnit.DAYS.convert(diffInMilliSeconds, TimeUnit.MILLISECONDS);
	    lastHunt.setTotalDays(totalDays);
	    Long daysBooked = lastHunt.getTotalDays();
	    
	    Double rate = lastHunt.getRate();
	    
	    Double serviceFee = rate * .10;
	    lastHunt.setServiceFee(serviceFee);
	    
	    Double total = daysBooked * rate;
	    lastHunt.setTotal(total);
	    
	    Double taxRate = .10;
	    Double tax =  total * taxRate;
	    lastHunt.setTax(tax);
	    
	    Double grandTotal = total + tax + lastHunt.getServiceFee();
	    lastHunt.setGrandTotal(grandTotal);
	    
	    model.addAttribute("lastHunt", lastHunt);
		
	    
	    
	    return "reviewHunt.jsp";
	}
	
	@PutMapping("/confirmed/{id}")
	public String confirmedHunt(@PathVariable("id") Integer id,@ModelAttribute("updateHunt") Hunt hunt, Model model, HttpSession session, String username, Principal principal) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
			
			return "redirect:/yourhunts";
	}
	
	@GetMapping("/yourhunts")
	public String yourHunts(@ModelAttribute("yourHunts") Hunt hunt, Model model, Integer id, HttpSession session, String username, Principal principal) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
			
			return "yourHunts.jsp";
	}
}
