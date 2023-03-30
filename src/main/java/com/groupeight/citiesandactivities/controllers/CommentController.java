package com.groupeight.citiesandactivities.controllers;

import javax.servlet.http.HttpSession;

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

import com.groupeight.citiesandactivities.models.Comment;
import com.groupeight.citiesandactivities.services.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;

	@RequestMapping("activity/{activityId}/comments")
	private String aActivitysComments(@PathVariable("activityId") Long activityVariable,
			@ModelAttribute("activitysComments") Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("activitysComments", commentService.allActivitiesCommentsByActivityId(activityVariable));
		return "activitysComments.jsp";
	}

	@GetMapping("activity/comment/{commentId}")
	private String aComment(@PathVariable("commentId") Long commentId, @ModelAttribute("thisComment") Model model,
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("thisComment", commentService.findComment(commentId));
		return "viewComment.jsp";
	}

	@PutMapping("activity/comment/{commentId}")
	private String editComment(@PathVariable("commentId") Long commentId, @ModelAttribute("thisComment") Model model,
			HttpSession session, BindingResult result, Comment comment) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if (result.hasErrors()) {
			model.addAttribute("thisComment", comment);
			return "redirect:city/new";

		} else {
			commentService.update(comment);
			return "redirect:/all/cities";
		}
	}

	@PostMapping("activity/comment/{commentId}")
	private String updateComment(@PathVariable("commentId") Long commentId, @ModelAttribute("thisComment") Model model,
			HttpSession session, BindingResult result, Comment comment) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if (result.hasErrors()) {
			model.addAttribute("thisComment", comment);
			return "redirect:city/new";

		} else {
			commentService.createComment(comment);
			return "redirect:/all/cities";
		}
	}

	@PostMapping("comment/delete/{id}")
	public String deleteComment(@PathVariable("id") Long id, HttpSession session) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		commentService.deleteComment(id);
		return "redirect:/all/cities";
	}

}
