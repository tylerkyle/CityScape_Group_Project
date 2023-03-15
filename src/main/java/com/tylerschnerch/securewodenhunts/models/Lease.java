package com.tylerschnerch.securewodenhunts.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
//import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
    private Integer id;
    private Integer usersId;
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
	


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public List<Hunt> getHunts() {
		return hunts;
	}


	public void setHunts(List<Hunt> hunts) {
		this.hunts = hunts;
	}
	private Double rate;
	private String description;
    private String blinds;
    private String accessPoints;
	// This will disable updating the created at column after object instance creation 
    @Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @ManyToOne(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;
    
    @OneToMany(mappedBy="lease", cascade=CascadeType.ALL, fetch = FetchType.LAZY)
   	private List<Hunt> hunts;
    

	public Lease() {}
	
	
	public Integer getUsersId() {
		return usersId;
	}
	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	/////Getter and setters////
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
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


	

