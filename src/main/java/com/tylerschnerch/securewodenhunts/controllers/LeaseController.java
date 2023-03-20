package com.tylerschnerch.securewodenhunts.controllers;

import java.security.Principal;
import java.util.List;

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
import com.tylerschnerch.securewodenhunts.models.Lease;
import com.tylerschnerch.securewodenhunts.models.User;
import com.tylerschnerch.securewodenhunts.services.HuntService;
import com.tylerschnerch.securewodenhunts.services.LeaseService;
import com.tylerschnerch.securewodenhunts.services.UserService;
import com.tylerschnerch.securewodenhunts.validator.UserValidator;
@Controller
@RequestMapping("/lease")
public class LeaseController {
	@Autowired UserValidator userValidator;
    @Autowired LeaseService leaseService;
    @Autowired HuntService huntService;
    @Autowired UserService userService;


    @GetMapping("/new")
	public String newLease(@ModelAttribute("newLease") Lease lease, Model model, HttpSession session, Principal principal, String zip ) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/logout";
			}
    			
    		String username = principal.getName();
    		model.addAttribute("user", userService.findByUsername(username));	
    		model.addAttribute("lease", lease);
				return"newlease.jsp";
			}

    @GetMapping("/{id}")
	public String thisLease(@ModelAttribute("newHunt") Hunt hunt,
			@PathVariable("id") Integer id, Model model,
			HttpSession session, Principal principal) {
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
		}
		
		Lease lease = leaseService.findLease(id);
		model.addAttribute("thisLease", lease);
		Integer userId = (Integer) session.getAttribute("userId");
		Long longUserId = userId.longValue(); 
		model.addAttribute("userId",longUserId);
		String username = principal.getName();
		User user = userService.findByUsername(username); 
		model.addAttribute("user", user);
		model.addAttribute("thisHunt", hunt);
				return "leaseshow.jsp";
	}

    @RequestMapping("/{id}/edit")
    public String editThisLease(@PathVariable("id") Integer id, Model model, HttpSession session, Object sessionId, Integer leasesUserId) {
    	sessionId =  session.getAttribute("userId");
    	
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}
    	
    	Lease lease = leaseService.findLease(id);
    	model.addAttribute("thisLease", lease);
    	leasesUserId =  lease.getUsersId();
				
    	if (sessionId == leasesUserId) {
    		return "editlease.jsp";
    	}
    	return "editlease.jsp";
    }

    @GetMapping("/all")
    public String allLeases(HttpSession session, Model model, Principal principal) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}
    	String username = principal.getName();
    	User user = userService.findByUsername(username);
    	System.out.println(user);
    	model.addAttribute("user", userService.findByUsername(username));
    	List <Lease> leases = leaseService.allLeases();
    	model.addAttribute("allLeases", leases);
    	List <Hunt> hunts = huntService.allHunts();
    	model.addAttribute("allHunts", hunts);
    	return "leasedashboard.jsp";
    }

    @GetMapping("/myleases")
    public String myLeases(HttpSession session, Model model, Principal principal, String username, User user) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}
		
    	username = principal.getName();
    	Integer userId = (Integer) session.getAttribute("userId");
		User theUser =  userService.findByUsername(username);
		
    	model.addAttribute("user",theUser);
    	
    	List <Lease> myleases = leaseService.allUserLeasesById(userId);
    	model.addAttribute("myLeases", myleases);
				
    	return"myleases.jsp";
    }

    @GetMapping("/near/{zipcode}")
    public String leasesNearMe(@PathVariable("zipcode") String zipcode, Model model, HttpSession session, 
    		String username,  Principal principal) {
    	
    	username = principal.getName();
    	
    	User theUser =  userService.findByUsername(username);
    	
    	String usersZipcode = theUser.getZipcode();
    	
    	List <Lease> leasesNearZip = leaseService.allZipsLeases(usersZipcode );  
    	
    	model.addAttribute("leasesNearMe", leasesNearZip);
    	
    	model.addAttribute("usersZipcode", usersZipcode);
    	
    	return"leasesnearme.jsp";
    }

		//////////////////////// post methods//////////////////////////
			//Create Lease
    @PostMapping("/create")
    public String createNewLease(@Valid @ModelAttribute("newLease") Lease lease, BindingResult result,
    		HttpSession session) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}

    	if (result.hasErrors()) {
    		List<FieldError> errors = result.getFieldErrors();
    		for (FieldError error : errors ) {
    			System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
    		}
     		return "redirect:/lease/new";

    	} else {
    		System.out.println("C");
    		leaseService.createLease(lease);
    		System.out.println("D");
    		return "redirect:/lease/all";
    	}
    }

    @PutMapping("/{id}/update")
    public String updateLease(@Valid @ModelAttribute("aLease") Lease lease, BindingResult result, Model model, HttpSession session) {

    	if (session.getAttribute("userId") == null) {
				return "redirect:/logout";
    	}

    	if (result.hasErrors()) {
    		model.addAttribute("aLease", lease);
    		return "editlease.jsp";
    	}
    	leaseService.update(lease);
    	return "redirect:/lease/all";
    }

    @PostMapping("/delete/{id}")
    public String deleteLease(@PathVariable("id") Integer id, HttpSession session) {

    	if (session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}

    	leaseService.deleteLease(id);
    	return"redirect:/lease/all";
    }

}
