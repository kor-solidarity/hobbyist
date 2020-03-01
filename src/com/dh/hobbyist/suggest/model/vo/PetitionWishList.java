package com.dh.hobbyist.suggest.model.vo;

public class PetitionWishList implements java.io.Serializable {
	 private int petitionCode;
	 private int memberCode;
	 
	 public PetitionWishList() {}

	public PetitionWishList(int petitionCode, int memberCode) {
		super();
		this.petitionCode = petitionCode;
		this.memberCode = memberCode;
	}

	public int getPetitionCode() {
		return petitionCode;
	}

	public void setPetitionCode(int petitionCode) {
		this.petitionCode = petitionCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	@Override
	public String toString() {
		return "PetitionWishList [petitionCode=" + petitionCode + ", memberCode=" + memberCode + "]";
	}
	 
	 

}
