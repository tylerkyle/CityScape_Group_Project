package com.groupeight.citiesandactivities.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.groupeight.citiesandactivities.models.City;

@Repository
public interface CityRepository extends CrudRepository<City, Long> {

	List<City> findAll();

	List<City> findByName(String name);

	List<City> findByUserId(Long id);

	Optional<City> findById(Long id);
}
