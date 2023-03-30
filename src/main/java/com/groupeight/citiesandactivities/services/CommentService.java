package com.groupeight.citiesandactivities.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.groupeight.citiesandactivities.models.Comment;
import com.groupeight.citiesandactivities.repositories.CommentRepository;
@Service
public class CommentService {
	private final CommentRepository commentRepository;

	public CommentService(CommentRepository commentRepository) {
		this.commentRepository = commentRepository;
	}

	// returns all the comments
	public List<Comment> allComments() {
		return commentRepository.findAll();
	}

	// returns all the comments sorting by the users id
	public List<Comment> allUserCommentsById(Long id) {
		return commentRepository.findByUserId(id);
	}

	// returns all the comments sorting by the activities id
	public List<Comment> allActivitiesCommentsByActivityId(Long id) {
		return commentRepository.findByActivityId(id);
	}

	// creates a comment
	public Comment createComment(Comment comment) {
		return commentRepository.save(comment);
	}

	// retrieves a comment
	public Comment findComment(Long id) {
		Optional<Comment> optionalComment = commentRepository.findById(id);
		if (optionalComment.isPresent()) {
			return optionalComment.get();
		} else {
			return null;
		}
	}

	// saves a comment
	public Comment update(Comment comment) {
		return commentRepository.save(comment);
	}

	public void deleteComment(Long id) {
		commentRepository.deleteById(id);
	}
}
