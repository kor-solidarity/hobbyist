package com.dh.hobbyist.payment.model.vo;

import java.sql.Timestamp;

public class RegisterPayment {
	private int scheduleCode;			//수업일정코드
	private String lessonImgRoute;		//수업 이미지 경로
	private String lessonImgName;		//수업 이미지 파일명	
	private String lessonName;			//수업명
	private Timestamp startDate;		//수업시작일
	private String region;				//지역
	private int paymentCode;			//결제코드
	private Timestamp paymentDate;		//결제일
	private String profileImgRoute;		//프로필 이미지 경로
	private String profileImgName;		//프로필 이미지 파일명
	private String artistNick;			//아티스트 별명
	private String artistName;			//아티스으 이름
	private int payCost;				//결제비용
	private int status;					//수업 상태
	
	public RegisterPayment() {}

	public RegisterPayment(int scheduleCode, String lessonImgRoute, String lessonImgName, String lessonName,
			Timestamp startDate, String region, int paymentCode, Timestamp paymentDate, String profileImgRoute,
			String profileImgName, String artistNick, String artistName, int payCost, int status) {
		super();
		this.scheduleCode = scheduleCode;
		this.lessonImgRoute = lessonImgRoute;
		this.lessonImgName = lessonImgName;
		this.lessonName = lessonName;
		this.startDate = startDate;
		this.region = region;
		this.paymentCode = paymentCode;
		this.paymentDate = paymentDate;
		this.profileImgRoute = profileImgRoute;
		this.profileImgName = profileImgName;
		this.artistNick = artistNick;
		this.artistName = artistName;
		this.payCost = payCost;
		this.status = status;
	}

	public int getScheduleCode() {
		return scheduleCode;
	}

	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	public String getLessonImgRoute() {
		return lessonImgRoute;
	}

	public void setLessonImgRoute(String lessonImgRoute) {
		this.lessonImgRoute = lessonImgRoute;
	}

	public String getLessonImgName() {
		return lessonImgName;
	}

	public void setLessonImgName(String lessonImgName) {
		this.lessonImgName = lessonImgName;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}

	public Timestamp getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Timestamp paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getProfileImgRoute() {
		return profileImgRoute;
	}

	public void setProfileImgRoute(String profileImgRoute) {
		this.profileImgRoute = profileImgRoute;
	}

	public String getProfileImgName() {
		return profileImgName;
	}

	public void setProfileImgName(String profileImgName) {
		this.profileImgName = profileImgName;
	}

	public String getArtistNick() {
		return artistNick;
	}

	public void setArtistNick(String artistNick) {
		this.artistNick = artistNick;
	}

	public String getArtistName() {
		return artistName;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}

	public int getPayCost() {
		return payCost;
	}

	public void setPayCost(int payCost) {
		this.payCost = payCost;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RegisterPayment [scheduleCode=" + scheduleCode + ", lessonImgRoute=" + lessonImgRoute
				+ ", lessonImgName=" + lessonImgName + ", lessonName=" + lessonName + ", startDate=" + startDate
				+ ", region=" + region + ", paymentCode=" + paymentCode + ", paymentDate=" + paymentDate
				+ ", profileImgRoute=" + profileImgRoute + ", profileImgName=" + profileImgName + ", artistNick="
				+ artistNick + ", artistName=" + artistName + ", payCost=" + payCost + ", status=" + status + "]";
	}
}
