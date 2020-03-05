package com.dh.hobbyist.lesson.model.vo;

public class MyRegiLesson implements java.io.Serializable {
	private int scheduleCode;			//수업일정코드
	private String lessonImgRoute;		//수업 이미지 경로
	private String lessonImgName;		//수업 이미지 파일명	
	private String lessonName;			//수업명
										//수업시작일
	private String region;				//지역
										//결제일
	private String profileImgRoute;		//프로필 이미지 경로
	private String profileImgName;		//프로필 이미지 파일명
	private String artistNick;			//아티스트 별명
	private String artistName;			//아티스으 이름
	
	public MyRegiLesson() {}

	public MyRegiLesson(int scheduleCode, String lessonImgRoute, String lessonImgName, String lessonName, String region,
			String profileImgRoute, String profileImgName, String artistNick, String artistName) {
		super();
		this.scheduleCode = scheduleCode;
		this.lessonImgRoute = lessonImgRoute;
		this.lessonImgName = lessonImgName;
		this.lessonName = lessonName;
		this.region = region;
		this.profileImgRoute = profileImgRoute;
		this.profileImgName = profileImgName;
		this.artistNick = artistNick;
		this.artistName = artistName;
	}

	public int getScheduleCode() {
		return scheduleCode;
	}

	public String getLessonImgRoute() {
		return lessonImgRoute;
	}

	public String getLessonImgName() {
		return lessonImgName;
	}

	public String getLessonName() {
		return lessonName;
	}

	public String getRegion() {
		return region;
	}

	public String getProfileImgRoute() {
		return profileImgRoute;
	}

	public String getProfileImgName() {
		return profileImgName;
	}

	public String getArtistNick() {
		return artistNick;
	}

	public String getArtistName() {
		return artistName;
	}

	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	public void setLessonImgRoute(String lessonImgRoute) {
		this.lessonImgRoute = lessonImgRoute;
	}

	public void setLessonImgName(String lessonImgName) {
		this.lessonImgName = lessonImgName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public void setProfileImgRoute(String profileImgRoute) {
		this.profileImgRoute = profileImgRoute;
	}

	public void setProfileImgName(String profileImgName) {
		this.profileImgName = profileImgName;
	}

	public void setArtistNick(String artistNick) {
		this.artistNick = artistNick;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}

	@Override
	public String toString() {
		return "MyRegiLesson [scheduleCode=" + scheduleCode + ", lessonImgRoute=" + lessonImgRoute + ", lessonImgName="
				+ lessonImgName + ", lessonName=" + lessonName + ", region=" + region + ", profileImgRoute="
				+ profileImgRoute + ", profileImgName=" + profileImgName + ", artistNick=" + artistNick
				+ ", artistName=" + artistName + "]";
	}
	
	
}
