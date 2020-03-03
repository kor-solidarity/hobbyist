package com.dh.hobbyist.calculatePay.model.vo;

public class Accounts implements java.io.Serializable {
	private int lessonOrderCode; //수업회차코드
	private int lessonOrderTime; //수업회차
	private int memberCode; //아티스트pk
	private String memberId; //아티스트 아이디
	private String memberName; //아티스트 이름
	private int costPerOder; //회차당 수업료
	private int listeners; //수업인원
	private int totalCost; //총 수업료
	private int fee; //수수료
	private int paymentAmount; //총 지급액
	private String bankName; //계좌 이름
	private String bankOwner; //예금주
	private String bankNum; // 계좌 번호
	
	public Accounts() {}

	public Accounts(int lessonOrderCode, int lessonOrderTime, int memberCode, String memberId, String memberName,
			int costPerOder, int listeners, int totalCost, int fee, int paymentAmount, String bankName,
			String bankOwner, String bankNum) {
		super();
		this.lessonOrderCode = lessonOrderCode;
		this.lessonOrderTime = lessonOrderTime;
		this.memberCode = memberCode;
		this.memberId = memberId;
		this.memberName = memberName;
		this.costPerOder = costPerOder;
		this.listeners = listeners;
		this.totalCost = totalCost;
		this.fee = fee;
		this.paymentAmount = paymentAmount;
		this.bankName = bankName;
		this.bankOwner = bankOwner;
		this.bankNum = bankNum;
	}

	public int getLessonOrderCode() {
		return lessonOrderCode;
	}

	public void setLessonOrderCode(int lessonOrderCode) {
		this.lessonOrderCode = lessonOrderCode;
	}

	public int getLessonOrderTime() {
		return lessonOrderTime;
	}

	public void setLessonOrderTime(int lessonOrderTime) {
		this.lessonOrderTime = lessonOrderTime;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getCostPerOder() {
		return costPerOder;
	}

	public void setCostPerOder(int costPerOder) {
		this.costPerOder = costPerOder;
	}

	public int getListeners() {
		return listeners;
	}

	public void setListeners(int listeners) {
		this.listeners = listeners;
	}

	public int getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankOwner() {
		return bankOwner;
	}

	public void setBankOwner(String bankOwner) {
		this.bankOwner = bankOwner;
	}

	public String getBankNum() {
		return bankNum;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}

	@Override
	public String toString() {
		return "Accounts [lessonOrderCode=" + lessonOrderCode + ", lessonOrderTime=" + lessonOrderTime + ", memberCode="
				+ memberCode + ", memberId=" + memberId + ", memberName=" + memberName + ", costPerOder=" + costPerOder
				+ ", listeners=" + listeners + ", totalCost=" + totalCost + ", fee=" + fee + ", paymentAmount="
				+ paymentAmount + ", bankName=" + bankName + ", bankOwner=" + bankOwner + ", bankNum=" + bankNum + "]";
	}

	
}
