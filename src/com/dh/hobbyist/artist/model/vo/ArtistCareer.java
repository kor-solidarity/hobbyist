package com.dh.hobbyist.artist.model.vo;

public class ArtistCareer implements java.io.Serializable {
	private int recCode;
	private String orgName;
	private String rank;
	private String occupation;
	private String ocuupationTerm;
	private int memberPk;
	
	public ArtistCareer() {}

	public ArtistCareer(int recCode, String orgName, String rank, String occupation, String ocuupationTerm,
			int memberPk) {
		super();
		this.recCode = recCode;
		this.orgName = orgName;
		this.rank = rank;
		this.occupation = occupation;
		this.ocuupationTerm = ocuupationTerm;
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

	public String getOcuupationTerm() {
		return ocuupationTerm;
	}

	public void setOcuupationTerm(String ocuupationTerm) {
		this.ocuupationTerm = ocuupationTerm;
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
				+ occupation + ", ocuupationTerm=" + ocuupationTerm + ", memberPk=" + memberPk + "]";
	}

	
	
}
