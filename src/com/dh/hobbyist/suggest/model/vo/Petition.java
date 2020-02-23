package com.dh.hobbyist.suggest.model.vo;

import java.sql.Date;

public class Petition implements java.io.Serializable {
	private int petitionCode;
	private String numOfStudents;
	private int cost;
	private int numOfLessons;
	private String location;
	private Date requestedDate;
	private String requestedDays;
	private String requestTime;
	private String title;
	private String contents;
	private Date petitionedTime;
	private int wishlisted;
	private int views;
	private int petitionedMember;
	private int categoryCode;
	private String categoryName;
	
	public Petition() {}

	public Petition(int petitionCode, String numOfStudents, int cost, int numOfLessons, String location,
			Date requestedDate, String requestedDays, String requestTime, String title, String contents,
			Date petitionedTime, int wishlisted, int views, int petitionedMember, int categoryCode,
			String categoryName) {
		super();
		this.petitionCode = petitionCode;
		this.numOfStudents = numOfStudents;
		this.cost = cost;
		this.numOfLessons = numOfLessons;
		this.location = location;
		this.requestedDate = requestedDate;
		this.requestedDays = requestedDays;
		this.requestTime = requestTime;
		this.title = title;
		this.contents = contents;
		this.petitionedTime = petitionedTime;
		this.wishlisted = wishlisted;
		this.views = views;
		this.petitionedMember = petitionedMember;
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
	}

	public int getPetitionCode() {
		return petitionCode;
	}

	public void setPetitionCode(int petitionCode) {
		this.petitionCode = petitionCode;
	}

	public String getNumOfStudents() {
		return numOfStudents;
	}

	public void setNumOfStudents(String numOfStudents) {
		this.numOfStudents = numOfStudents;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getNumOfLessons() {
		return numOfLessons;
	}

	public void setNumOfLessons(int numOfLessons) {
		this.numOfLessons = numOfLessons;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}

	public String getRequestedDays() {
		return requestedDays;
	}

	public void setRequestedDays(String requestedDays) {
		this.requestedDays = requestedDays;
	}

	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getPetitionedTime() {
		return petitionedTime;
	}

	public void setPetitionedTime(Date petitionedTime) {
		this.petitionedTime = petitionedTime;
	}

	public int getWishlisted() {
		return wishlisted;
	}

	public void setWishlisted(int wishlisted) {
		this.wishlisted = wishlisted;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getPetitionedMember() {
		return petitionedMember;
	}

	public void setPetitionedMember(int petitionedMember) {
		this.petitionedMember = petitionedMember;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Petition [petitionCode=" + petitionCode + ", numOfStudents=" + numOfStudents + ", cost=" + cost
				+ ", numOfLessons=" + numOfLessons + ", location=" + location + ", requestedDate=" + requestedDate
				+ ", requestedDays=" + requestedDays + ", requestTime=" + requestTime + ", title=" + title
				+ ", contents=" + contents + ", petitionedTime=" + petitionedTime + ", wishlisted=" + wishlisted
				+ ", views=" + views + ", petitionedMember=" + petitionedMember + ", categoryCode=" + categoryCode
				+ ", categoryName=" + categoryName + "]";
	}

	
	
}
