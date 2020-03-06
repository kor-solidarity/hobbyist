package com.dh.hobbyist.lesson.model.vo;

public class LessonSchedule implements java.io.Serializable {
	private int scheduleCode;		//수업일정코드
	private int lessonCode;			//수업코드
	private String region;			//지역
	private String subRegion;		//세부지역
	private String address;			//상세주소
	private int status;				//수업상태
	
	public LessonSchedule() {}

	public LessonSchedule(int scheduleCode, int lessonCode, String region, String subRegion, String address,
			int status) {
		super();
		this.scheduleCode = scheduleCode;
		this.lessonCode = lessonCode;
		this.region = region;
		this.subRegion = subRegion;
		this.address = address;
		this.status = status;
	}

	public int getScheduleCode() {
		return scheduleCode;
	}

	public int getLessonCode() {
		return lessonCode;
	}

	public String getRegion() {
		return region;
	}

	public String getSubRegion() {
		return subRegion;
	}

	public String getAddress() {
		return address;
	}

	public int getStatus() {
		return status;
	}

	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	public void setLessonCode(int lessonCode) {
		this.lessonCode = lessonCode;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public void setSubRegion(String subRegion) {
		this.subRegion = subRegion;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "LessonSchedule [scheduleCode=" + scheduleCode + ", lessonCode=" + lessonCode + ", region=" + region
				+ ", subRegion=" + subRegion + ", address=" + address + ", status="
				+ status + "]";
	}
	
	
}
