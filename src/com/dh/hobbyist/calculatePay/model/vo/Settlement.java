package com.dh.hobbyist.calculatePay.model.vo;

public class Settlement implements java.io.Serializable {
	private int settleCode; //관리 번호
	private int settleFee; //수수료
	private int totalPayGiven; //총 지급액
	private int status; //상태
	private int lessonOrderCode; //수업회차 코드
	private int artistCode; //아티스트 코드
	
	public Settlement() {}
	
	public Settlement(int settleCode, int settleFee, int totalPayGiven, int status, int lessonOrderCode,
			int artistCode) {
		super();
		this.settleCode = settleCode;
		this.settleFee = settleFee;
		this.totalPayGiven = totalPayGiven;
		this.status = status;
		this.lessonOrderCode = lessonOrderCode;
		this.artistCode = artistCode;
	}

	public int getSettleCode() {
		return settleCode;
	}

	public void setSettleCode(int settleCode) {
		this.settleCode = settleCode;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getLessonOrderCode() {
		return lessonOrderCode;
	}

	public void setLessonOrderCode(int lessonOrderCode) {
		this.lessonOrderCode = lessonOrderCode;
	}

	public int getArtistCode() {
		return artistCode;
	}

	public void setArtistCode(int artistCode) {
		this.artistCode = artistCode;
	}

	@Override
	public String toString() {
		return "Settlement [settleCode=" + settleCode + ", settleFee=" + settleFee + ", totalPayGiven=" + totalPayGiven
				+ ", status=" + status + ", lessonOrderCode=" + lessonOrderCode + ", artistCode=" + artistCode + "]";
	}
	
	
}
