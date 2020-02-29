package com.dh.hobbyist.admin.model.vo;

public class Admin implements java.io.Serializable{
	private int adminCode;
	private String adminId;
	private String adminPwd;
	private String adminName;
	
	public Admin() {}

	public Admin(int adminCode, String adminId, String adminPwd, String adminName) {
		super();
		this.adminCode = adminCode;
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminName = adminName;
	}
	
	public int getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}
	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	@Override
	public String toString() {
		return "Admin [adminCode=" + adminCode + ", adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminName="
				+ adminName + "]";
	}
	
}
