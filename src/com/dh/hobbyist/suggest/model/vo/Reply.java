package com.dh.hobbyist.suggest.model.vo;

import java.sql.Date;

public class Reply implements java.io.Serializable {
	private int replyCode;
	private int lessonPetitionCode;
	private Date replyDate;
	private String replyContent;
	private int memberCode;
	private int deleted;
	private String memberName;
	private String imageRoot;
	private String petitionTitle;
	private int rowNum;
	
	public Reply() {}

	public Reply(int replyCode, int lessonPetitionCode, Date replyDate, String replyContent, int memberCode,
			int deleted, String memberName, String imageRoot, String petitionTitle, int rowNum) {
		super();
		this.replyCode = replyCode;
		this.lessonPetitionCode = lessonPetitionCode;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.memberCode = memberCode;
		this.deleted = deleted;
		this.memberName = memberName;
		this.imageRoot = imageRoot;
		this.petitionTitle = petitionTitle;
		this.rowNum = rowNum;
	}

	public int getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}

	public int getLessonPetitionCode() {
		return lessonPetitionCode;
	}

	public void setLessonPetitionCode(int lessonPetitionCode) {
		this.lessonPetitionCode = lessonPetitionCode;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getImageRoot() {
		return imageRoot;
	}

	public void setImageRoot(String imageRoot) {
		this.imageRoot = imageRoot;
	}

	public String getPetitionTitle() {
		return petitionTitle;
	}

	public void setPetitionTitle(String petitionTitle) {
		this.petitionTitle = petitionTitle;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	@Override
	public String toString() {
		return "Reply [replyCode=" + replyCode + ", lessonPetitionCode=" + lessonPetitionCode + ", replyDate="
				+ replyDate + ", replyContent=" + replyContent + ", memberCode=" + memberCode + ", deleted=" + deleted
				+ ", memberName=" + memberName + ", imageRoot=" + imageRoot + ", petitionTitle=" + petitionTitle
				+ ", rowNum=" + rowNum + "]";
	}


}
