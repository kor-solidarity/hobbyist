package com.dh.hobbyist.calculatePay.model.vo;

public class SettlementInquiry implements java.io.Serializable {
	private int inquiryCode; //관리번호
	private int settlementCode; //정산번호
	private String content; //내용
	private int LVL; // 글단계
	private int adminCode; //관리자번호
	private String adminName; //관리자 이름
	private int originInquiry; // 원글번호
	private int artistCode; //아티스트번호
	private String artistName; //아티스트 이름
	
	public SettlementInquiry() {}

	public SettlementInquiry(int inquiryCode, int settlementCode, String content, int lVL, int adminCode,
			String adminName, int originInquiry, int artistCode, String artistName) {
		super();
		this.inquiryCode = inquiryCode;
		this.settlementCode = settlementCode;
		this.content = content;
		LVL = lVL;
		this.adminCode = adminCode;
		this.adminName = adminName;
		this.originInquiry = originInquiry;
		this.artistCode = artistCode;
		this.artistName = artistName;
	}

	public int getInquiryCode() {
		return inquiryCode;
	}

	public void setInquiryCode(int inquiryCode) {
		this.inquiryCode = inquiryCode;
	}

	public int getSettlementCode() {
		return settlementCode;
	}

	public void setSettlementCode(int settlementCode) {
		this.settlementCode = settlementCode;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLVL() {
		return LVL;
	}

	public void setLVL(int lVL) {
		LVL = lVL;
	}

	public int getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public int getOriginInquiry() {
		return originInquiry;
	}

	public void setOriginInquiry(int originInquiry) {
		this.originInquiry = originInquiry;
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

	@Override
	public String toString() {
		return "SettlementInquiry [inquiryCode=" + inquiryCode + ", settlementCode=" + settlementCode + ", content="
				+ content + ", LVL=" + LVL + ", adminCode=" + adminCode + ", adminName=" + adminName
				+ ", originInquiry=" + originInquiry + ", artistCode=" + artistCode + ", artistName=" + artistName
				+ "]";
	}

	
}
