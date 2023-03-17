package com.tylerschnerch.securewodenhunts.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tylerschnerch.securewodenhunts.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
    User findByUsername(String username);
    
    Optional<User> findById(Integer id);
   
    List<User> findAll();
    
}
