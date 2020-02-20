package com.dh.hobbyist.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.dh.hobbyist.admin.model.vo.Admin;
import com.dh.hobbyist.member.model.vo.Member;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class AdminDao {

	private Properties prop = new Properties();
	
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public Admin loginCheck(Connection con, Admin admin) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Admin loginAdmin = null;
		
		String query = prop.getProperty("loginCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, admin.getAdminId());
			pstmt.setString(2, admin.getAdminPwd());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				loginAdmin = new Admin();
				loginAdmin.setAdminCode(rset.getInt("ADM_PK"));
				loginAdmin.setAdminId(rset.getString("ADM_ID"));
				loginAdmin.setAdminName(rset.getString("ADM_NAME"));
				loginAdmin.setAdminPwd(rset.getString("ADM_PWD"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return loginAdmin;
	}

}
