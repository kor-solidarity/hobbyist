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
	
	public Reply() {}

	public Reply(int replyCode, int lessonPetitionCode, Date replyDate, String replyContent, int memberCode,
			int deleted, String memberName) {
		super();
		this.replyCode = replyCode;
		this.lessonPetitionCode = lessonPetitionCode;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.memberCode = memberCode;
		this.deleted = deleted;
		this.memberName = memberName;
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

	@Override
	public String toString() {
		return "Reply [replyCode=" + replyCode + ", lessonPetitionCode=" + lessonPetitionCode + ", replyDate="
				+ replyDate + ", replyContent=" + replyContent + ", memberCode=" + memberCode + ", deleted=" + deleted
				+ ", memberName=" + memberName + "]";
	}

	
	
}
