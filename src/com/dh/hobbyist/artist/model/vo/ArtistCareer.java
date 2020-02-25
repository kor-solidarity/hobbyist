package com.dh.hobbyist.artist.model.vo;

public class ArtistCareer implements java.io.Serializable {
	private int recCode;
	private String orgName;
	private String rank;
	private String occupation;
	private String occupationTerm;
	private int memberPk;
	
	public ArtistCareer() {}

	public ArtistCareer(int recCode, String orgName, String rank, String occupation, String occupationTerm,
			int memberPk) {
		super();
		this.recCode = recCode;
		this.orgName = orgName;
		this.rank = rank;
		this.occupation = occupation;
		this.occupationTerm = occupationTerm;
		this.memberPk = memberPk;
	}

	public int getRecCode() {
		return recCode;
	}

	public void setRecCode(int recCode) {
		this.recCode = recCode;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getOccupationTerm() {
		return occupationTerm;
	}

	public void setOccupationTerm(String occupationTerm) {
		this.occupationTerm = occupationTerm;
	}

	public int getMemberPk() {
		return memberPk;
	}

	public void setMemberPk(int memberPk) {
		this.memberPk = memberPk;
	}

	@Override
	public String toString() {
		return "ArtistCareer [recCode=" + recCode + ", orgName=" + orgName + ", rank=" + rank + ", occupation="
				+ occupation + ", occupationTerm=" + occupationTerm + ", memberPk=" + memberPk + "]";
	}

	
	
}
