package com.tylerschnerch.securewodenhunts.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="hunts")
public class Hunt {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@OneToMany
    @JoinTable(
    	name = "leases_hunts",
        joinColumns = @JoinColumn(name = "lease_id"),
        inverseJoinColumns = @JoinColumn(name = "hunt_id"))
    private List <Hunt> hunts;

	
    @Size(min = 0, max = 100000)
    private String total;
	
	
    @Size(min = 0, max = 100000)
    private String tax;
	
	@NotNull
	private int leaseeId;
	
	@NotNull
	private int leaseorId;
	
	@NotNull
	@Size(min = 0, max = 100000)
	private  String startDate;
	
	@NotNull
	@Size(min = 0, max = 100000)
	private  String endDate;
	
	@NotNull
	private  boolean confirmed;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="lease_id")
	private Lease lease;
	
	private String serviceFee;
	
	public boolean isConfirmed() {
		return confirmed;
	}




	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}

	
	public Long getId() {
		return id;
	}




	public void setId(Long id) {
		this.id = id;
	}




	public List<Hunt> getHunts() {
		return hunts;
	}




	public void setHunts(List<Hunt> hunts) {
		this.hunts = hunts;
	}




	public int getLeaseeId() {
		return leaseeId;
	}




	public void setLeaseeId(int leaseeId) {
		this.leaseeId = leaseeId;
	}




	public int getLeaseorId() {
		return leaseorId;
	}




	public void setLeaseorId(int leaseorId) {
		this.leaseorId = leaseorId;
	}




	public String getStartDate() {
		return startDate;
	}




	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}




	public String getEndDate() {
		return endDate;
	}




	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}




	public Lease getLease() {
		return lease;
	}




	public void setLease(Lease lease) {
		this.lease = lease;
	}


	//Pojo
	public Hunt() {}
	
	
	
	
	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getServiceFee() {
		return serviceFee;
	}

	public void setServiceFee(String serviceFee) {
		this.serviceFee = serviceFee;
	}
}
