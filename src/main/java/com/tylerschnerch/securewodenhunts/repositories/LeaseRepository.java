package com.tylerschnerch.securewodenhunts.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


import com.tylerschnerch.securewodenhunts.models.Lease;

public interface LeaseRepository extends CrudRepository <Lease, Long> {
	 	
		// this method retrieves all the books from the database
		List<Lease> findAll();
	    
	    //this method Deletes a Book by id
	    void deleteById(Long id);
	    //Long saveById(String thisBookId);
	    
	    Long save(Long id);
	    //Long save(Long id);
	    
	    List<Lease> findByusersId(Long userId);
	    
	    List<Lease> findByzipcode(String zip);
	    
	   
	    
	    
	    
}
