package com.dh.hobbyist.suggest.model.vo;

public class PetitionWithLesson implements java.io.Serializable{
	private int lessonCode;
	private String lessonName;
	private int artistCode;
	private String artistName;
	
	public PetitionWithLesson() {}

	public PetitionWithLesson(int lessonCode, String lessonName, int artistCode, String artistName) {
		super();
		this.lessonCode = lessonCode;
		this.lessonName = lessonName;
		this.artistCode = artistCode;
		this.artistName = artistName;
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

	public int getArtistCode() {
		return artistCode;
	}

	public void setArtistCode(int artistCode) {
		this.artistCode = artistCode;
	}

	public String getArtistName() {
		return artistName;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}

	@Override
	public String toString() {
		return "PetitionWithLesson [lessonCode=" + lessonCode + ", lessonName=" + lessonName + ", artistCode="
				+ artistCode + ", artistName=" + artistName + "]";
	}
	
}
