package com.dh.hobbyist.artist.model.vo;

public class ArtistCategory implements java.io.Serializable {
	private int memberCode;
	private int categoryCode;
	private String categoryName;
	private int categoryParentCode;
	
	public ArtistCategory() {}

	public ArtistCategory(int memberCode, int categoryCode, String categoryName, int categoryParentCode) {
		super();
		this.memberCode = memberCode;
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
		this.categoryParentCode = categoryParentCode;
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryParentCode() {
		return categoryParentCode;
	}

	public void setCategoryParentCode(int categoryParentCode) {
		this.categoryParentCode = categoryParentCode;
	}

	@Override
	public String toString() {
		return "ArtistCategory [memberCode=" + memberCode + ", categoryCode=" + categoryCode + ", categoryName="
				+ categoryName + ", categoryParentCode=" + categoryParentCode + "]";
	}

	
}
