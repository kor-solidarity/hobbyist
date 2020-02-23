package com.dh.hobbyist.payment.model.vo;

import java.sql.Date;

public class Payment {
	private int paymentCode;			// 시퀀스
	private int usingPoint;				// 사용 포인트
	private int givePoint;				// 지급 포인트
	private int payCost;				// 결제금액
	private String payMethod = "card";	// 결제방식 기본이 카드 
	private String impNum;				// 결제 고유 번호
	private Date payDate;				// 결제일
	private int scheduleCode;			// 수업일정 코드
	private int artistCode;				// 아티스트 코드
	private int memberCode;				// 결제한 회원코드
	
	public Payment() {}

	public Payment(int paymentCode, int usingPoint, int givePoint, int payCost, String payMethod, String impNum,
			Date payDate, int scheduleCode, int artistCode, int memberCode) {
		super();
		this.paymentCode = paymentCode;
		this.usingPoint = usingPoint;
		this.givePoint = givePoint;
		this.payCost = payCost;
		this.payMethod = payMethod;
		this.impNum = impNum;
		this.payDate = payDate;
		this.scheduleCode = scheduleCode;
		this.artistCode = artistCode;
		this.memberCode = memberCode;
	}

	public int getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}

	public int getUsingPoint() {
		return usingPoint;
	}

	public void setUsingPoint(int usingPoint) {
		this.usingPoint = usingPoint;
	}

	public int getGivePoint() {
		return givePoint;
	}

	public void setGivePoint(int givePoint) {
		this.givePoint = givePoint;
	}

	public int getPayCost() {
		return payCost;
	}

	public void setPayCost(int payCost) {
		this.payCost = payCost;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getImpNum() {
		return impNum;
	}

	public void setImpNum(String impNum) {
		this.impNum = impNum;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getScheduleCode() {
		return scheduleCode;
	}

	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	public int getArtistCode() {
		return artistCode;
	}

	public void setArtistCode(int artistCode) {
		this.artistCode = artistCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	@Override
	public String toString() {
		return "Payment [paymentCode=" + paymentCode + ", usingPoint=" + usingPoint + ", givePoint=" + givePoint
				+ ", payCost=" + payCost + ", payMethod=" + payMethod + ", impNum=" + impNum + ", payDate=" + payDate
				+ ", scheduleCode=" + scheduleCode + ", artistCode=" + artistCode + ", memberCode=" + memberCode + "]";
	}
}
