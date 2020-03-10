package com.dh.hobbyist.review.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class LessonReview implements Serializable {
	int reviewPk;
	int lessonPk;
	int stars;
	String content;
	Timestamp reviewDate;
	int memberPk;
	
	public LessonReview() {
	}
	
	public LessonReview(int reviewPk, int lessonPk, int stars, String content,
						Timestamp reviewDate, int memberPk) {
		this.reviewPk = reviewPk;
		this.lessonPk = lessonPk;
		this.stars = stars;
		this.content = content;
		this.reviewDate = reviewDate;
		this.memberPk = memberPk;
	}
	
	@Override
	public String toString() {
		return "LessonReview{" +
				"reviewPk=" + reviewPk +
				", lessonPk=" + lessonPk +
				", stars=" + stars +
				", content='" + content + '\'' +
				", reviewDate=" + reviewDate +
				", memberPk=" + memberPk +
				'}';
	}
	
	public int getReviewPk() {
		return reviewPk;
	}
	
	public void setReviewPk(int reviewPk) {
		this.reviewPk = reviewPk;
	}
	
	public int getLessonPk() {
		return lessonPk;
	}
	
	public void setLessonPk(int lessonPk) {
		this.lessonPk = lessonPk;
	}
	
	public int getStars() {
		return stars;
	}
	
	public void setStars(int stars) {
		this.stars = stars;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Timestamp getReviewDate() {
		return reviewDate;
	}
	
	public void setReviewDate(Timestamp reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	public int getMemberPk() {
		return memberPk;
	}
	
	public void setMemberPk(int memberPk) {
		this.memberPk = memberPk;
	}
}
