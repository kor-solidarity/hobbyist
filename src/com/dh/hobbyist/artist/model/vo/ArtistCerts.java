package com.dh.hobbyist.artist.model.vo;

import java.sql.Date;

public class ArtistCerts implements java.io.Serializable {
	private int certCode;
	private String certName;
	private Date certDate;
	private String certOrg;
	private int memberPk;
	
	public ArtistCerts() {}

	public ArtistCerts(int certCode, String certName, Date certDate, String certOrg, int memberPk) {
		super();
		this.certCode = certCode;
		this.certName = certName;
		this.certDate = certDate;
		this.certOrg = certOrg;
		this.memberPk = memberPk;
	}

	public int getCertCode() {
		return certCode;
	}

	public void setCertCode(int certCode) {
		this.certCode = certCode;
	}

	public String getCertName() {
		return certName;
	}

	public void setCertName(String certName) {
		this.certName = certName;
	}

	public Date getCertDate() {
		return certDate;
	}

	public void setCertDate(Date certDate) {
		this.certDate = certDate;
	}

	public String getCertOrg() {
		return certOrg;
	}

	public void setCertOrg(String certOrg) {
		this.certOrg = certOrg;
	}

	public int getMemberPk() {
		return memberPk;
	}

	public void setMemberPk(int memberPk) {
		this.memberPk = memberPk;
	}

	@Override
	public String toString() {
		return "ArtistCerts [certCode=" + certCode + ", certName=" + certName + ", certDate=" + certDate + ", certOrg="
				+ certOrg + ", memberPk=" + memberPk + "]";
	}

	
	
}
