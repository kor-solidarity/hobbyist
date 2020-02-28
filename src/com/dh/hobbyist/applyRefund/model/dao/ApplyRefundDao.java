package com.dh.hobbyist.applyRefund.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;

public class ApplyRefundDao {
	private Properties prop = new Properties();
	
	public ApplyRefundDao() {
		String fileName = ApplyRefundDao.class.getResource("/sql/applyRefund/applyRefund-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ApplyRefund selectDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
