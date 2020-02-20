package com.dh.hobbyist.admin.model.service;

import java.sql.Connection;

import com.dh.hobbyist.admin.model.dao.AdminDao;
import com.dh.hobbyist.admin.model.vo.Admin;
import com.dh.hobbyist.member.model.dao.MemberDao;
import com.dh.hobbyist.member.model.vo.Member;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class AdminService {

	public Admin loginCheck(Admin admin) {
		
		Connection con = getConnection();
		
		Admin loginAdmin = new AdminDao().loginCheck(con, admin);
		
		close(con);
		
		return loginAdmin;
	}

}
