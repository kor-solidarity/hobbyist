package com.dh.hobbyist.artist.model.vo;

import java.sql.Date;

public class ApplyArtist implements java.io.Serializable {
	private int applyCode;
	private Date applyDate;
	private int applyAttempts;
	private int applyConfirmed;
	private String rejectReason;
	private int applyMember;
	private String applyMemberId;
	
	public ApplyArtist() {}

	public ApplyArtist(int applyCode, Date applyDate, int applyAttempts, int applyConfirmed, String rejectReason,
			int applyMember, String applyMemberId) {
		super();
		this.applyCode = applyCode;
		this.applyDate = applyDate;
		this.applyAttempts = applyAttempts;
		this.applyConfirmed = applyConfirmed;
		this.rejectReason = rejectReason;
		this.applyMember = applyMember;
		this.applyMemberId = applyMemberId;
	}

	public int getApplyCode() {
		return applyCode;
	}

	public void setApplyCode(int applyCode) {
		this.applyCode = applyCode;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public int getApplyAttempts() {
		return applyAttempts;
	}

	public void setApplyAttempts(int applyAttempts) {
		this.applyAttempts = applyAttempts;
	}

	public int getApplyConfirmed() {
		return applyConfirmed;
	}

	public void setApplyConfirmed(int applyConfirmed) {
		this.applyConfirmed = applyConfirmed;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public int getApplyMember() {
		return applyMember;
	}

	public void setApplyMember(int applyMember) {
		this.applyMember = applyMember;
	}

	public String getApplyMemberId() {
		return applyMemberId;
	}

	public void setApplyMemberId(String applyMemberId) {
		this.applyMemberId = applyMemberId;
	}

	@Override
	public String toString() {
		return "ApplyArtist [applyCode=" + applyCode + ", applyDate=" + applyDate + ", applyAttempts=" + applyAttempts
				+ ", applyConfirmed=" + applyConfirmed + ", rejectReason=" + rejectReason + ", applyMember="
				+ applyMember + ", applyMemberId=" + applyMemberId + "]";
	}

	
}
