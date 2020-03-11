package com.dh.hobbyist.refund.model.vo;

import java.sql.Timestamp;

public class Refund implements java.io.Serializable{
	private int refundCode;
	private int payCode;
	private int schedulCode;
	private String lessonName;
	private String memberCode;
	private String memberName;
	private String phone;
	private int artistCode;
	private String artistName;
	private int payCost;
	private int refundCost;
	private int refundPoint;
	private int givePoint;
	private int usingPoint;
	private Timestamp payDate;
	private Timestamp applyRefundDate;
	private Timestamp refundDate;
	private int status;
	private String reason;
	private String refuseReason;
	private String impNum;		
	
	public Refund() {}

	public Refund(int refundCode, int payCode, int schedulCode, String lessonName, String memberCode, String memberName,
			String phone, int artistCode, String artistName, int payCost, int refundCost, int refundPoint,
			int givePoint, int usingPoint, Timestamp payDate, Timestamp applyRefundDate, Timestamp refundDate,
			int status, String reason, String refuseReason, String impNum) {
		super();
		this.refundCode = refundCode;
		this.payCode = payCode;
		this.schedulCode = schedulCode;
		this.lessonName = lessonName;
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.phone = phone;
		this.artistCode = artistCode;
		this.artistName = artistName;
		this.payCost = payCost;
		this.refundCost = refundCost;
		this.refundPoint = refundPoint;
		this.givePoint = givePoint;
		this.usingPoint = usingPoint;
		this.payDate = payDate;
		this.applyRefundDate = applyRefundDate;
		this.refundDate = refundDate;
		this.status = status;
		this.reason = reason;
		this.refuseReason = refuseReason;
		this.impNum = impNum;
	}

	public int getRefundCode() {
		return refundCode;
	}

	public void setRefundCode(int refundCode) {
		this.refundCode = refundCode;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getSchedulCode() {
		return schedulCode;
	}

	public void setSchedulCode(int schedulCode) {
		this.schedulCode = schedulCode;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public int getPayCost() {
		return payCost;
	}

	public void setPayCost(int payCost) {
		this.payCost = payCost;
	}

	public int getRefundCost() {
		return refundCost;
	}

	public void setRefundCost(int refundCost) {
		this.refundCost = refundCost;
	}

	public int getRefundPoint() {
		return refundPoint;
	}

	public void setRefundPoint(int refundPoint) {
		this.refundPoint = refundPoint;
	}

	public int getGivePoint() {
		return givePoint;
	}

	public void setGivePoint(int givePoint) {
		this.givePoint = givePoint;
	}

	public int getUsingPoint() {
		return usingPoint;
	}

	public void setUsingPoint(int usingPoint) {
		this.usingPoint = usingPoint;
	}

	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}

	public Timestamp getApplyRefundDate() {
		return applyRefundDate;
	}

	public void setApplyRefundDate(Timestamp applyRefundDate) {
		this.applyRefundDate = applyRefundDate;
	}

	public Timestamp getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Timestamp refundDate) {
		this.refundDate = refundDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getRefuseReason() {
		return refuseReason;
	}

	public void setRefuseReason(String refuseReason) {
		this.refuseReason = refuseReason;
	}

	public String getImpNum() {
		return impNum;
	}

	public void setImpNum(String impNum) {
		this.impNum = impNum;
	}

	@Override
	public String toString() {
		return "Refund [refundCode=" + refundCode + ", payCode=" + payCode + ", schedulCode=" + schedulCode
				+ ", lessonName=" + lessonName + ", memberCode=" + memberCode + ", memberName=" + memberName
				+ ", phone=" + phone + ", artistCode=" + artistCode + ", artistName=" + artistName + ", payCost="
				+ payCost + ", refundCost=" + refundCost + ", refundPoint=" + refundPoint + ", givePoint=" + givePoint
				+ ", usingPoint=" + usingPoint + ", payDate=" + payDate + ", applyRefundDate=" + applyRefundDate
				+ ", refundDate=" + refundDate + ", status=" + status + ", reason=" + reason + ", refuseReason="
				+ refuseReason + ", impNum=" + impNum + "]";
	}
}