package com.dh.hobbyist.payment.model.vo;

import java.sql.Timestamp;

public class Payment implements java.io.Serializable{
	private int paymentCode;			// 시퀀스
	private String lessonName;			// 수업 이름
	private String region;				// 대주소
	private String subRegion;			// 중주소
	private String address;				// 소주소
	private int totalOrder;				// 총회차
	private int costPerOrder;			// 회차당 수업료
	private int totalPoint;				// 보유 포인트
	private int usingPoint;				// 사용 포인트
	private int givePoint;				// 지급 포인트
	private int totalCost;				// 수업료
	private int payCost;				// 결제금액
	private String payMethod = "card";	// 결제방식 기본이 카드 
	private String memberName;			// 회원이름
	private String phone;				// 전화번호
	private String impNum;				// 결제 고유 번호
	private Timestamp payDate;			// 결제일
	private Timestamp firstTime;		// 수업시작시간
	private Timestamp lastTime;			// 수업종료시간
	private int scheduleCode;			// 수업일정 코드
	private int artistCode;				// 아티스트 코드
	private String artistName;			// 아티스트 이름
	private int memberCode;				// 결제한 회원코드
	
	public Payment() {}

	public Payment(int paymentCode, String lessonName, String region, String subRegion, String address, int totalOrder,
			int costPerOrder, int totalPoint, int usingPoint, int givePoint, int totalCost, int payCost,
			String payMethod, String memberName, String phone, String impNum, Timestamp payDate, Timestamp firstTime,
			Timestamp lastTime, int scheduleCode, int artistCode, String artistName, int memberCode) {
		super();
		this.paymentCode = paymentCode;
		this.lessonName = lessonName;
		this.region = region;
		this.subRegion = subRegion;
		this.address = address;
		this.totalOrder = totalOrder;
		this.costPerOrder = costPerOrder;
		this.totalPoint = totalPoint;
		this.usingPoint = usingPoint;
		this.givePoint = givePoint;
		this.totalCost = totalCost;
		this.payCost = payCost;
		this.payMethod = payMethod;
		this.memberName = memberName;
		this.phone = phone;
		this.impNum = impNum;
		this.payDate = payDate;
		this.firstTime = firstTime;
		this.lastTime = lastTime;
		this.scheduleCode = scheduleCode;
		this.artistCode = artistCode;
		this.artistName = artistName;
		this.memberCode = memberCode;
	}

	public int getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getSubRegion() {
		return subRegion;
	}

	public void setSubRegion(String subRegion) {
		this.subRegion = subRegion;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTotalOrder() {
		return totalOrder;
	}

	public void setTotalOrder(int totalOrder) {
		this.totalOrder = totalOrder;
	}

	public int getCostPerOrder() {
		return costPerOrder;
	}

	public void setCostPerOrder(int costPerOrder) {
		this.costPerOrder = costPerOrder;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
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

	public int getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
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

	public String getImpNum() {
		return impNum;
	}

	public void setImpNum(String impNum) {
		this.impNum = impNum;
	}

	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}

	public Timestamp getFirstTime() {
		return firstTime;
	}

	public void setFirstTime(Timestamp firstTime) {
		this.firstTime = firstTime;
	}

	public Timestamp getLastTime() {
		return lastTime;
	}

	public void setLastTime(Timestamp lastTime) {
		this.lastTime = lastTime;
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

	public String getArtistName() {
		return artistName;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	@Override
	public String toString() {
		return "Payment [paymentCode=" + paymentCode + ", lessonName=" + lessonName + ", region=" + region
				+ ", subRegion=" + subRegion + ", address=" + address + ", totalOrder=" + totalOrder + ", costPerOrder="
				+ costPerOrder + ", totalPoint=" + totalPoint + ", usingPoint=" + usingPoint + ", givePoint="
				+ givePoint + ", totalCost=" + totalCost + ", payCost=" + payCost + ", payMethod=" + payMethod
				+ ", memberName=" + memberName + ", phone=" + phone + ", impNum=" + impNum + ", payDate=" + payDate
				+ ", firstTime=" + firstTime + ", lastTime=" + lastTime + ", scheduleCode=" + scheduleCode
				+ ", artistCode=" + artistCode + ", artistName=" + artistName + ", memberCode=" + memberCode + "]";
	}
	
}
	