package com.dh.hobbyist.artist.model.vo;

public class ArtistCategory implements java.io.Serializable {
	private int memberCode;
	private int categoryCode;
	
	public ArtistCategory() {}

	public ArtistCategory(int memberCode, int categoryCode) {
		super();
		this.memberCode = memberCode;
		this.categoryCode = categoryCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	@Override
	public String toString() {
		return "ArtistCategory [memberCode=" + memberCode + ", categoryCode=" + categoryCode + "]";
	}

	
}
