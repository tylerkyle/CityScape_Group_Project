package com.tylerschnerch.securewodenhunts.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;


import com.tylerschnerch.securewodenhunts.models.Lease;

public interface LeaseRepository extends CrudRepository <Lease, Integer> {
	 	
		// this method retrieves all the books from the database
		List<Lease> findAll();
	    
	    //this method Deletes a Book by id
	    void deleteById(Integer id);
	    //Long saveById(String thisBookId);
	    
	    Long save(Integer id);
	    //Long save(Long id);
	    
	    List<Lease> findByUsersId(Integer userId);
	    Optional<Lease> findById(Integer id);
	    List<Lease> findByZipcode(String zip);
	    
	   
	    
	    
	    
}
