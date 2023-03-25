package com.groupeight.citiesandactivities.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.groupeight.citiesandactivities.models.Activity;

@Repository
public interface ActivityRepository extends CrudRepository<Activity, Long> {

	List<Activity> findAll();

	List<Activity> findByName(String name);

	List<Activity> findByUserId(Long id);

	Optional<Activity> findById(Long id);
}
