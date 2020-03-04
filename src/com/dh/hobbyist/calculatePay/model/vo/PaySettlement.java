package com.dh.hobbyist.calculatePay.model.vo;

import java.sql.Timestamp;

//관리자 - 정산내역에서 보여주기 위해 쓰는 vo..
public class PaySettlement implements java.io.Serializable {
	private int settleCode; //정산코드
	private int lessonOrderCode; //수업회차코드
	private int lessonOrderTime; //수업 회차
	private int memberCode; //아티스트 코드
	private String memberId; //아티스트 아이디
	private String memberName; //아티스트 이름
	private int costPerOrder; //회차당 수업료
	private int listeners; //수업인원
	private int totalCost; //총 수업료
	private int settleFee; //수수료
	private int totalPayGiven; //총 지급액
	private String bankName; //계좌명
	private String bankOwner; //예금주
	private String bankNum; //계좌번호
	private int status; //상태
	private String lessonName; //수업명
	private Timestamp lessonOrderEnd; //회차 종료시간
	private int lessonCode; //수업코드
	
	public PaySettlement() {}

	public PaySettlement(int settleCode, int lessonOrderCode, int lessonOrderTime, int memberCode, String memberId,
			String memberName, int costPerOrder, int listeners, int totalCost, int settleFee, int totalPayGiven,
			String bankName, String bankOwner, String bankNum, int status, String lessonName, Timestamp lessonOrderEnd,
			int lessonCode) {
		super();
		this.settleCode = settleCode;
		this.lessonOrderCode = lessonOrderCode;
		this.lessonOrderTime = lessonOrderTime;
		this.memberCode = memberCode;
		this.memberId = memberId;
		this.memberName = memberName;
		this.costPerOrder = costPerOrder;
		this.listeners = listeners;
		this.totalCost = totalCost;
		this.settleFee = settleFee;
		this.totalPayGiven = totalPayGiven;
		this.bankName = bankName;
		this.bankOwner = bankOwner;
		this.bankNum = bankNum;
		this.status = status;
		this.lessonName = lessonName;
		this.lessonOrderEnd = lessonOrderEnd;
		this.lessonCode = lessonCode;
	}

	public int getSettleCode() {
		return settleCode;
	}

	public void setSettleCode(int settleCode) {
		this.settleCode = settleCode;
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

	public int getCostPerOrder() {
		return costPerOrder;
	}

	public void setCostPerOrder(int costPerOrder) {
		this.costPerOrder = costPerOrder;
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

	public int getSettleFee() {
		return settleFee;
	}

	public void setSettleFee(int settleFee) {
		this.settleFee = settleFee;
	}

	public int getTotalPayGiven() {
		return totalPayGiven;
	}

	public void setTotalPayGiven(int totalPayGiven) {
		this.totalPayGiven = totalPayGiven;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public Timestamp getLessonOrderEnd() {
		return lessonOrderEnd;
	}

	public void setLessonOrderEnd(Timestamp lessonOrderEnd) {
		this.lessonOrderEnd = lessonOrderEnd;
	}

	public int getLessonCode() {
		return lessonCode;
	}

	public void setLessonCode(int lessonCode) {
		this.lessonCode = lessonCode;
	}

	@Override
	public String toString() {
		return "PaySettlement [settleCode=" + settleCode + ", lessonOrderCode=" + lessonOrderCode + ", lessonOrderTime="
				+ lessonOrderTime + ", memberCode=" + memberCode + ", memberId=" + memberId + ", memberName="
				+ memberName + ", costPerOrder=" + costPerOrder + ", listeners=" + listeners + ", totalCost="
				+ totalCost + ", settleFee=" + settleFee + ", totalPayGiven=" + totalPayGiven + ", bankName=" + bankName
				+ ", bankOwner=" + bankOwner + ", bankNum=" + bankNum + ", status=" + status + ", lessonName="
				+ lessonName + ", lessonOrderEnd=" + lessonOrderEnd + ", lessonCode=" + lessonCode + "]";
	}

}
