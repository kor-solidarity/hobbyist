package com.dh.hobbyist.lesson.model.vo;

public class RefundOnly implements java.io.Serializable {
	private int refundCode;
	private int refundAccepted;
	
	public RefundOnly() {}

	public RefundOnly(int refundCode, int refundAccepted) {
		super();
		this.refundCode = refundCode;
		this.refundAccepted = refundAccepted;
	}

	public int getRefundCode() {
		return refundCode;
	}

	public void setRefundCode(int refundCode) {
		this.refundCode = refundCode;
	}

	public int getRefundAccepted() {
		return refundAccepted;
	}

	public void setRefundAccepted(int refundAccepted) {
		this.refundAccepted = refundAccepted;
	}

	@Override
	public String toString() {
		return "RefundOnly [refundCode=" + refundCode + ", refundAccepted=" + refundAccepted + "]";
	}
	
	
}
