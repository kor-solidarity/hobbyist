package com.dh.hobbyist.lesson.model.vo;

import java.sql.Date;

public class Lesson {
	private int lessonCode;          //수업관리코드
	private String lessonName;       //수업명      
	private int minStudents;         //수업최소인원
	private int maxStudents;         //수업최대인원
	private int totalLessons;        //총 회차
	private int costPerLesson;       //회차당 수업료
	private int totalCosts;          //총 수업료
	private String artistIntro;      //아티스트 소개
	private String lessonIntro;      //수업 소개
	private int petitionCode;        //건의게시물 코드(있을 시)
	private Date registeredDate;     //수업등록일시
	private String status;    		 //수업 상태
	private int categoryCode;        //카테고리 아이디
	private int artistCode;          //아티스트 코드
	
	public Lesson() {}

	public Lesson(int lessonCode, String lessonName, int minStudents, int maxStudents, int totalLessons,
			int costPerLesson, int totalCosts, String artistIntro, String lessonIntro, int petitionCode,
			Date registeredDate, String status, int categoryCode, int artistCode) {
		super();
		this.lessonCode = lessonCode;
		this.lessonName = lessonName;
		this.minStudents = minStudents;
		this.maxStudents = maxStudents;
		this.totalLessons = totalLessons;
		this.costPerLesson = costPerLesson;
		this.totalCosts = totalCosts;
		this.artistIntro = artistIntro;
		this.lessonIntro = lessonIntro;
		this.petitionCode = petitionCode;
		this.registeredDate = registeredDate;
		this.status = status;
		this.categoryCode = categoryCode;
		this.artistCode = artistCode;
	}

	public int getLessonCode() {
		return lessonCode;
	}

	public void setLessonCode(int lessonCode) {
		this.lessonCode = lessonCode;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public int getMinStudents() {
		return minStudents;
	}

	public void setMinStudents(int minStudents) {
		this.minStudents = minStudents;
	}

	public int getMaxStudents() {
		return maxStudents;
	}

	public void setMaxStudents(int maxStudents) {
		this.maxStudents = maxStudents;
	}

	public int getTotalLessons() {
		return totalLessons;
	}

	public void setTotalLessons(int totalLessons) {
		this.totalLessons = totalLessons;
	}

	public int getCostPerLesson() {
		return costPerLesson;
	}

	public void setCostPerLesson(int costPerLesson) {
		this.costPerLesson = costPerLesson;
	}

	public int getTotalCosts() {
		return totalCosts;
	}

	public void setTotalCosts(int totalCosts) {
		this.totalCosts = totalCosts;
	}

	public String getArtistIntro() {
		return artistIntro;
	}

	public void setArtistIntro(String artistIntro) {
		this.artistIntro = artistIntro;
	}

	public String getLessonIntro() {
		return lessonIntro;
	}

	public void setLessonIntro(String lessonIntro) {
		this.lessonIntro = lessonIntro;
	}

	public int getPetitionCode() {
		return petitionCode;
	}

	public void setPetitionCode(int petitionCode) {
		this.petitionCode = petitionCode;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getArtistCode() {
		return artistCode;
	}

	public void setArtistCode(int artistCode) {
		this.artistCode = artistCode;
	}

	@Override
	public String toString() {
		return "Lesson [lessonCode=" + lessonCode + ", lessonName=" + lessonName + ", minStudents=" + minStudents
				+ ", maxStudents=" + maxStudents + ", totalLessons=" + totalLessons + ", costPerLesson=" + costPerLesson
				+ ", totalCosts=" + totalCosts + ", artistIntro=" + artistIntro + ", lessonIntro=" + lessonIntro
				+ ", petitionCode=" + petitionCode + ", registeredDate=" + registeredDate + ", status=" + status
				+ ", categoryCode=" + categoryCode + ", artistCode=" + artistCode + "]";
	}
	
	
	
	
}
