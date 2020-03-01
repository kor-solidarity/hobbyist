package com.dh.hobbyist.lesson.model.vo;

public class MemberCategory implements java.io.Serializable{
	private int memberCode;         //회원코드
	private int categoryCode;       //카테고리 아이디
	
	public MemberCategory() {}

	public MemberCategory(int memberCode, int categoryCode) {
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
		return "MemberCategory [memberCode=" + memberCode + ", categoryCode=" + categoryCode + "]";
	}
	
	
}
