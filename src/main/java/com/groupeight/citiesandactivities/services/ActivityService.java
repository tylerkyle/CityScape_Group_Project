package com.groupeight.citiesandactivities.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.groupeight.citiesandactivities.models.Activity;
import com.groupeight.citiesandactivities.repositories.ActivityRepository;
@Service
public class ActivityService {

	private final ActivityRepository activityRepository;

	public ActivityService(ActivityRepository activityRepository) {
		this.activityRepository = activityRepository;
	}

	// returns all the activities
	public List<Activity> allActivities() {
		return activityRepository.findAll();
	}

	// returns all the activities sorting by the users id
	public List<Activity> allUserActivitiesById(Long id) {
		return activityRepository.findByUserId(id);
	}

	// creates a activity
	public Activity createActivity(Activity activity) {
		return activityRepository.save(activity);
	}
	
	public List<Activity> findByCityId(Long id) {
		return activityRepository.findByCityId(id);
	}
	// retrieves a activities
	public Activity findActivity(Long id) {
		Optional<Activity> optionalActivity = activityRepository.findById(id);
		if (optionalActivity.isPresent()) {
			return optionalActivity.get();
		} else {
			return null;
		}
	}

	// saves a activity
	public Activity update(Activity activity) {
		return activityRepository.save(activity);
	}

	public void deleteActivity(Long id) {
		activityRepository.deleteById(id);
	}

}
