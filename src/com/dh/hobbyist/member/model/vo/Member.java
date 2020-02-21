package com.dh.hobbyist.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private int memberCode;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String phone;
	private String email;
	private String bankName;
	private String bankOwner;
	private String bankNum;
	private int del;
	private int point;
	private Date regDate;
	private int firstLogin;
	private int warnings;
	private int isArtist;
	private Date artistAccepted;
	private String artistNick;
	
	
	public Member() {}

	
	public Member(int memberCode, String memberId, String memberPwd, String memberName, String phone, String email,
			String bankName, String bankOwner, String bankNum, int del, int point, Date regDate, int firstLogin,
			int warnings, int isArtist, Date artistAccepted, String artistNick) {
		super();
		this.memberCode = memberCode;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.bankName = bankName;
		this.bankOwner = bankOwner;
		this.bankNum = bankNum;
		this.del = del;
		this.point = point;
		this.regDate = regDate;
		this.firstLogin = firstLogin;
		this.warnings = warnings;
		this.isArtist = isArtist;
		this.artistAccepted = artistAccepted;
		this.artistNick = artistNick;
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


	public String getMemberPwd() {
		return memberPwd;
	}


	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
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


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public int getFirstLogin() {
		return firstLogin;
	}


	public void setFirstLogin(int firstLogin) {
		this.firstLogin = firstLogin;
	}


	public int getWarnings() {
		return warnings;
	}


	public void setWarnings(int warnings) {
		this.warnings = warnings;
	}


	public int getIsArtist() {
		return isArtist;
	}


	public void setIsArtist(int isArtist) {
		this.isArtist = isArtist;
	}


	public Date getArtistAccepted() {
		return artistAccepted;
	}


	public void setArtistAccepted(Date artistAccepted) {
		this.artistAccepted = artistAccepted;
	}


	public String getArtistNick() {
		return artistNick;
	}


	public void setArtistNick(String artistNick) {
		this.artistNick = artistNick;
	}

	

	@Override
	public String toString() {
		return "Member [memberCode=" + memberCode + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", phone=" + phone + ", email=" + email + ", bankName=" + bankName
				+ ", bankOwner=" + bankOwner + ", bankNum=" + bankNum + ", del=" + del + ", point=" + point
				+ ", regDate=" + regDate + ", firstLogin=" + firstLogin + ", warnings=" + warnings + ", isArtist="
				+ isArtist + ", artistAccepted=" + artistAccepted + ", artistNick=" + artistNick + "]";
	}
	
	
	
	
	
	
	
	
}
