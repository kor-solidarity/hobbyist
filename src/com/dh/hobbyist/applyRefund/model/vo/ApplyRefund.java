package com.dh.hobbyist.applyRefund.model.vo;

import java.sql.Timestamp;

public class ApplyRefund implements java.io.Serializable{
	
	private int refundCode;			//신청코드
	private int paymentCode;		//결제코드
	private String lessonName;		//수업이름
	private int memberCode;			//회원코드
	private String memberName;		//회원이름
	private String phone;			//전화번호
	private String email;			//이메일
	private int artistCode;			//아티스트 코드
	private int refundCost;			//환불금액
	private Timestamp applyDate;	//신청일
	private int totalOrder;			//총 수업회차
	private int finishOrder;		//진행회차
	private int leftOrder;			//잔여회차
	private int usingPoint;			//사용포인트
	private int givePoint; 			//지금예정포인트
	private int payCost;			//결제금액
	private int resultCost;			//환불금액
	private String reason;			//환불 사유
	private String reasonDetail;	//환불 상세사유
	private String impNum;			//결제고유번호
	
	public ApplyRefund() {}

	public ApplyRefund(int refundCode, int paymentCode, String lessonName, int memberCode, String memberName,
			String phone, String email, int artistCode, int refundCost, Timestamp applyDate, int totalOrder,
			int finishOrder, int leftOrder, int usingPoint, int givePoint, int payCost, int resultCost, String reason,
			String reasonDetail, String impNum) {
		super();
		this.refundCode = refundCode;
		this.paymentCode = paymentCode;
		this.lessonName = lessonName;
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.artistCode = artistCode;
		this.refundCost = refundCost;
		this.applyDate = applyDate;
		this.totalOrder = totalOrder;
		this.finishOrder = finishOrder;
		this.leftOrder = leftOrder;
		this.usingPoint = usingPoint;
		this.givePoint = givePoint;
		this.payCost = payCost;
		this.resultCost = resultCost;
		this.reason = reason;
		this.reasonDetail = reasonDetail;
		this.impNum = impNum;
	}

	public int getRefundCode() {
		return refundCode;
	}

	public void setRefundCode(int refundCode) {
		this.refundCode = refundCode;
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

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getArtistCode() {
		return artistCode;
	}

	public void setArtistCode(int artistCode) {
		this.artistCode = artistCode;
	}

	public int getRefundCost() {
		return refundCost;
	}

	public void setRefundCost(int refundCost) {
		this.refundCost = refundCost;
	}

	public Timestamp getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Timestamp applyDate) {
		this.applyDate = applyDate;
	}

	public int getTotalOrder() {
		return totalOrder;
	}

	public void setTotalOrder(int totalOrder) {
		this.totalOrder = totalOrder;
	}

	public int getFinishOrder() {
		return finishOrder;
	}

	public void setFinishOrder(int finishOrder) {
		this.finishOrder = finishOrder;
	}

	public int getLeftOrder() {
		return leftOrder;
	}

	public void setLeftOrder(int leftOrder) {
		this.leftOrder = leftOrder;
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

	public int getResultCost() {
		return resultCost;
	}

	public void setResultCost(int resultCost) {
		this.resultCost = resultCost;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getReasonDetail() {
		return reasonDetail;
	}

	public void setReasonDetail(String reasonDetail) {
		this.reasonDetail = reasonDetail;
	}

	public String getImpNum() {
		return impNum;
	}

	public void setImpNum(String impNum) {
		this.impNum = impNum;
	}

	@Override
	public String toString() {
		return "ApplyRefund [refundCode=" + refundCode + ", paymentCode=" + paymentCode + ", lessonName=" + lessonName
				+ ", memberCode=" + memberCode + ", memberName=" + memberName + ", phone=" + phone + ", email=" + email
				+ ", artistCode=" + artistCode + ", refundCost=" + refundCost + ", applyDate=" + applyDate
				+ ", totalOrder=" + totalOrder + ", finishOrder=" + finishOrder + ", leftOrder=" + leftOrder
				+ ", usingPoint=" + usingPoint + ", givePoint=" + givePoint + ", payCost=" + payCost + ", resultCost="
				+ resultCost + ", reason=" + reason + ", reasonDetail=" + reasonDetail + ", impNum=" + impNum + "]";
	}
}