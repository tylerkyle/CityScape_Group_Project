package com.tylerschnerch.securewodenhunts.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tylerschnerch.securewodenhunts.models.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Integer> {

	 List<Role> findAll();
	    
	 List<Role> findByName(String name);

}
