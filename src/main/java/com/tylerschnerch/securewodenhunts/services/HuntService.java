package com.tylerschnerch.securewodenhunts.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tylerschnerch.securewodenhunts.models.Hunt;

import com.tylerschnerch.securewodenhunts.repositories.HuntRepository;
@Service
public class HuntService {

	 // adding the hunt repo as a dependency
		    private final HuntRepository huntRepository;
		    
		    public HuntService(HuntRepository huntRepository) {
		        this.huntRepository = huntRepository;
		    }
		    // returns all the hunts
		    public List<Hunt> allHunts() {
		        return huntRepository.findAll();
		    }
		    
		    // creates a hunt
		    public Hunt createHunt(Hunt h) {
		        return huntRepository.save(h);
		    }
		    
		    // retrieves a hunt
		    public Hunt findHunt(Integer id) {
		        Optional<Hunt> optionalHunt= huntRepository.findById(id);
		        if(optionalHunt.isPresent()) {
		            return optionalHunt.get();
		        } else {
		            return null;
		        }
		    }
		    //saves a hunt
		    public Hunt update(Hunt hunt) {
		    	return huntRepository.save(hunt);
		    }
		    
		    public void  deleteLease(Integer id) {
		    	huntRepository.deleteById(id);
		    }
		    public List<Hunt> allOfAUsersHunts(Integer id) {
		        
		    	return huntRepository.findByUserId(id);
		    }

}
