package com.tylerschnerch.securewodenhunts.services;



import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tylerschnerch.securewodenhunts.models.Lease;
import com.tylerschnerch.securewodenhunts.repositories.LeaseRepository;

	@Service
	public class LeaseService {
	    // adding the lease repo as a dependency
	    private final LeaseRepository leaseRepository;
	    
	    public LeaseService(LeaseRepository leaseRepository) {
	        this.leaseRepository = leaseRepository;
	    }
	    // returns all the leases
	    public List<Lease> allLeases() {
	        return leaseRepository.findAll();
	    }
	    
	 // returns all the leases sorting by the users id
	    public List<Lease> allUserLeasesById(Long id) {
	        return leaseRepository.findByusersId(id);
	    }
	    
		 // returns all the leases sorting by the users zip
	    public List<Lease> allZipsLeases(String zip) {
	        
	    	return leaseRepository.findByzipcode(zip);
	    }
	    
	    // creates a lease
	    public Lease createLease(Lease l) {
	        return leaseRepository.save(l);
	    }
	    
	    // retrieves a lease
	    public Lease findLease(Long id) {
	        Optional<Lease> optionalLease= leaseRepository.findById(id);
	        if(optionalLease.isPresent()) {
	            return optionalLease.get();
	        } else {
	            return null;
	        }
	    }
	    
	    //saves a lease
	    public Lease update(Lease lease) {
	    	return leaseRepository.save(lease);
	    }
	    
	    public void  deleteLease(Long id) {
	    	leaseRepository.deleteById(id);
	    }
		
	   
	}