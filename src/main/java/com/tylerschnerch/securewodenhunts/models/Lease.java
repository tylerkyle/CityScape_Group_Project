package com.tylerschnerch.securewodenhunts.models;

import java.util.Date;



//import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
//import javax.validation.constraints.NotNull;
//import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="leases")
public class Lease{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long usersId;
    private String stands;
    private  String acres;
   	//Need to increase validations
   	private String monday;
   	private String tuesday;
   	private String wednesday; 
   	private String thursday; 
   	private String friday;
   	private String saturday;
   	private String sunday;
   	private String morningBooking; 
   	private String eveningBooking;
   	private String termsofService;
    private String title;
	private String game;
    private String zipcode;
	private String rate;
	private String description;
    private String blinds;
    private String accessPoints;
	// This will disable updating the created at column after object instance creation 
    @Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    public Lease() {}
	public Lease(
			String title, 
			Long id, 
			String zipcode,
			User user, 
			String description, 
			String acres, 
			String monday,
			String accessPoints,
			String blinds,
			String stands,
			String tuesday, 
			String wednesday, 
			String thursday, 
			String friday, 
			String saturday, 
			String  sunday, 
			String morningBooking, 
			String eveningBooking, 
			String termsofService, 
			String publishListing,
			String game, 
			String rate,
			Long usersId){
        this.id = id;
        this.title = title;
        this.blinds = blinds;
        this.stands= stands;
        this.description = description;
        this.accessPoints = accessPoints;
        this.game = game;
        this.zipcode = zipcode;
        this.acres = acres;
        this.monday = monday;
        this.tuesday = tuesday;
        this.wednesday = wednesday;
        this.thursday = thursday;
        this.friday = friday;
        this.saturday = saturday;
        this.sunday = sunday;
        this.morningBooking = morningBooking;
        this.eveningBooking = eveningBooking;
        this.termsofService = termsofService;
        this.rate = rate;
        //the leaseor id
        this.usersId = usersId;
    }

	
	public Long getUsersId() {
		return usersId;
	}
	public void setUsersId(Long usersId) {
		this.usersId = usersId;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	/////Getter and setters////
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	
	public String getStands() {
		return stands;
	}
	public void setStands(String stands) {
		this.stands = stands;
	}
	public String getAcres() {
		return acres;
	}
	public void setAcres(String acres) {
		this.acres = acres;
	}
	public String getMonday() {
		return monday;
	}
	public void setMonday(String monday) {
		this.monday = monday;
	}
	public String getTuesday() {
		return tuesday;
	}
	public void setTuesday(String tuesday) {
		this.tuesday = tuesday;
	}
	public String getWednesday() {
		return wednesday;
	}
	public void setWednesday(String wednesday) {
		this.wednesday = wednesday;
	}
	public String getThursday() {
		return thursday;
	}
	public void setThursday(String thursday) {
		this.thursday = thursday;
	}
	public String getFriday() {
		return friday;
	}
	public void setFriday(String friday) {
		this.friday = friday;
	}
	public String getSaturday() {
		return saturday;
	}
	public void setSaturday(String saturday) {
		this.saturday = saturday;
	}
	public String getSunday() {
		return sunday;
	}
	public void setSunday(String sunday) {
		this.sunday = sunday;
	}
	public String getMorningBooking() {
		return morningBooking;
	}
	public void setMorningBooking(String morningBooking) {
		this.morningBooking = morningBooking;
	}
	public String getEveningBooking() {
		return eveningBooking;
	}
	public void setEveningBooking(String eveningBooking) {
		this.eveningBooking = eveningBooking;
	}
	public String getTermsofService() {
		return termsofService;
	}
	public void setTermsofService(String termsofService) {
		this.termsofService = termsofService;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGame() {
		return game;
	}
	public void setGame(String game) {
		this.game = game;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBlinds() {
		return blinds;
	}
	public void setBlinds(String blinds) {
		this.blinds = blinds;
	}
	public String getAccessPoints() {
		return accessPoints;
	}
	public void setAccessPoints(String accessPoints) {
		this.accessPoints = accessPoints;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }	
}


	

