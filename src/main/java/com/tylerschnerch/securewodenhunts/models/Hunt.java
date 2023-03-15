package com.tylerschnerch.securewodenhunts.models;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;



@Entity
@Table(name="hunts")
public class Hunt {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Range(min = 0, max = 100000)
    private Double total;
	
	
    @Range(min = 0, max = 100000)
    private Double tax;
	
	
	@NotNull
	private int leaseorId;
	
	@NotNull
	private  Date startDate;
	
	@NotNull
	private  Date endDate;
	
	@Range(min=0, max = 100000)
	private Long totalDays;
	
	@Range(min = 0,max = 1000)
	private Double rate;
	
	@NotNull
	private  boolean confirmed;

	
	
	private Double serviceFee;
	
	private Double grandTotal;
	
	
	
	@ManyToOne(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;
	
	 @ManyToOne(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
		@JoinColumn(name="lease_id")
		private Lease lease;
	


	

	

	public Lease getLease() {
		return lease;
	}

	public void setLease(Lease lease) {
		this.lease = lease;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	//Pojo
	public Hunt() {}
	
	public Double getGrandTotal() {
		return grandTotal;
	}

	





	public void setGrandTotal(Double grandTotal) {
		this.grandTotal = grandTotal;
	}







	public void setServiceFee(Double serviceFee) {
		this.serviceFee = serviceFee;
	}







	public boolean isConfirmed() {
		return confirmed;
	}


	
	public Double getRate() {
		return rate;
	}


	public void setRate(Double rate) {
		this.rate = rate;
	}
	
	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Double getTax() {
		return tax;
	}

	public void setTax(Double tax) {
		this.tax = tax;
	}

	public Double getServiceFee() {
		return serviceFee;
	}

	
	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}

	
	public Integer getId() {
		return id;
	}




	public void setId(Integer id) {
		this.id = id;
	}





	public int getLeaseorId() {
		return leaseorId;
	}




	public void setLeaseorId(int leaseorId) {
		this.leaseorId = leaseorId;
	}




	public Date getStartDate() {
		return startDate;
	}
	




	public Long getTotalDays() {
		return totalDays;
	}




	public void setTotalDays(Long totalDays) {
		this.totalDays = totalDays;
	}




	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}




	public Date getEndDate() {
		return endDate;
	}




	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}




	
}
