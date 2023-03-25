package com.groupeight.citiesandactivities.services;

import java.util.List;
import java.util.Optional;

import com.groupeight.citiesandactivities.models.City;
import com.groupeight.citiesandactivities.repositories.CityRepository;

public class CityService {
	private final CityRepository cityRepository;

	public CityService(CityRepository cityRepository) {
		this.cityRepository = cityRepository;
	}

	// returns all the Cities
	public List<City> allCities() {
		return cityRepository.findAll();
	}

	// returns all the Cities sorting by the users id
	public List<City> allAUsersCitiesById(Long id) {
		return cityRepository.findByUserId(id);
	}

	// creates a city
	public City createCity(City city) {
		return cityRepository.save(city);
	}

	// retrieves a city
	public City findCity(Long id) {
		Optional<City> optionalCity = cityRepository.findById(id);
		if (optionalCity.isPresent()) {
			return optionalCity.get();
		} else {
			return null;
		}
	}

	// updates (saves) a city
	public City update(City city) {
		return cityRepository.save(city);
	}

	public void deleteCity(Long id) {
		cityRepository.deleteById(id);
	}
}
