package com.dh.hobbyist.artist.model.vo;

public class ArtistCategory implements java.io.Serializable {
	private int memberPk;
	private int categoryPk;
	
	public ArtistCategory() {}

	public ArtistCategory(int memberPk, int categoryPk) {
		super();
		this.memberPk = memberPk;
		this.categoryPk = categoryPk;
	}

	public int getMemberPk() {
		return memberPk;
	}

	public void setMemberPk(int memberPk) {
		this.memberPk = memberPk;
	}

	public int getCategoryPk() {
		return categoryPk;
	}

	public void setCategoryPk(int categoryPk) {
		this.categoryPk = categoryPk;
	}

	@Override
	public String toString() {
		return "ArtistCategory [memberPk=" + memberPk + ", categoryPk=" + categoryPk + "]";
	}
	
	

	
}
