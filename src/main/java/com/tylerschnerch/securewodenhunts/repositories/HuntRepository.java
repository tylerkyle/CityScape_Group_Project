package com.tylerschnerch.securewodenhunts.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.tylerschnerch.securewodenhunts.models.Hunt;


public interface HuntRepository extends CrudRepository <Hunt, Long> {
	 	
		// this method retrieves all the books from the database
		List<Hunt> findAll();
	    
	    //this method Deletes a Book by id
	    void deleteById(Long id);
	    //Long saveById(String thisBookId);
	    
	    Long save(Long id);
	    //Long save(Long id);
	    
	   
	    
	    
	    
}
