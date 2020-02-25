package com.dh.hobbyist.applyRefund.model.vo;

import java.sql.Timestamp;

public class ApplyRefund {
	
	private int refundCode;			//신청코드
	private int paymentCode;		//결제코드
	private int memberCode;			//회원코드
	private String memberName;		//회원이름
	private String phone;			//전화번호
	private int artistCode;			//아티스트 코드
	private int refundCost;			//환불금액
	private Timestamp applyDate;	//신청일
	
	public ApplyRefund() {}

	public ApplyRefund(int refundCode, int paymentCode, int memberCode, String memberName, String phone, int artistCode,
			int refundCost, Timestamp applyDate) {
		super();
		this.refundCode = refundCode;
		this.paymentCode = paymentCode;
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.phone = phone;
		this.artistCode = artistCode;
		this.refundCost = refundCost;
		this.applyDate = applyDate;
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

	@Override
	public String toString() {
		return "ApplyRefund [refundCode=" + refundCode + ", paymentCode=" + paymentCode + ", memberCode=" + memberCode
				+ ", memberName=" + memberName + ", phone=" + phone + ", artistCode=" + artistCode + ", refundCost="
				+ refundCost + ", applyDate=" + applyDate + "]";
	}
}
