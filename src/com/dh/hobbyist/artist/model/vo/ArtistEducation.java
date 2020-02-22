package com.dh.hobbyist.artist.model.vo;

public class ArtistEducation implements java.io.Serializable {
	private int eduCode;
	private String eduInsitituteName;
	private String eduMajor;
	private int status;
	private int memberPk;
	
	public ArtistEducation() {}

	public ArtistEducation(int eduCode, String eduInsitituteName, String eduMajor, int status, int memberPk) {
		super();
		this.eduCode = eduCode;
		this.eduInsitituteName = eduInsitituteName;
		this.eduMajor = eduMajor;
		this.status = status;
		this.memberPk = memberPk;
	}

	public int getEduCode() {
		return eduCode;
	}

	public void setEduCode(int eduCode) {
		this.eduCode = eduCode;
	}

	public String getEduInsitituteName() {
		return eduInsitituteName;
	}

	public void setEduInsitituteName(String eduInsitituteName) {
		this.eduInsitituteName = eduInsitituteName;
	}

	public String getEduMajor() {
		return eduMajor;
	}

	public void setEduMajor(String eduMajor) {
		this.eduMajor = eduMajor;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getMemberPk() {
		return memberPk;
	}

	public void setMemberPk(int memberPk) {
		this.memberPk = memberPk;
	}

	@Override
	public String toString() {
		return "ArtistEducation [eduCode=" + eduCode + ", eduInsitituteName=" + eduInsitituteName + ", eduMajor="
				+ eduMajor + ", status=" + status + ", memberPk=" + memberPk + "]";
	}

	
	
}
