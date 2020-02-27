package com.dh.hobbyist.refund.model.vo;

import java.sql.Timestamp;

public class Refund {
	private int refundCode;
	private int payCode;
	private int schedulCode;
	private String memberCode;
	private String memberName;
	private String phone;
	private int artistCode;
	private int refundCost;
	private Timestamp refundDate;
	private String reason;
	
	public Refund() {}

	public Refund(int refundCode, int payCode, int schedulCode, String memberCode, String memberName, String phone,
			int artistCode, int refundCost, Timestamp refundDate, String reason) {
		super();
		this.refundCode = refundCode;
		this.payCode = payCode;
		this.schedulCode = schedulCode;
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.phone = phone;
		this.artistCode = artistCode;
		this.refundCost = refundCost;
		this.refundDate = refundDate;
		this.reason = reason;
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

	public int getRefundCost() {
		return refundCost;
	}

	public void setRefundCost(int refundCost) {
		this.refundCost = refundCost;
	}

	public Timestamp getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Timestamp refundDate) {
		this.refundDate = refundDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Override
	public String toString() {
		return "Refund [refundCode=" + refundCode + ", payCode=" + payCode + ", schedulCode=" + schedulCode
				+ ", memberCode=" + memberCode + ", memberName=" + memberName + ", phone=" + phone + ", artistCode="
				+ artistCode + ", refundCost=" + refundCost + ", refundDate=" + refundDate + ", reason=" + reason + "]";
	}
}
