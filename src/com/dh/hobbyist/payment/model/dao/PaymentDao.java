package com.dh.hobbyist.payment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.dh.hobbyist.payment.model.vo.Payment;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class PaymentDao {
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertPayment(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getUsingPoint());
			pstmt.setInt(2, p.getGivePoint());
			pstmt.setInt(3, p.getPayCost());
			pstmt.setString(4, p.getPayMethod());
			pstmt.setString(5, p.getImpNum());
			pstmt.setTimestamp(6, p.getPayDate());
			pstmt.setInt(7, p.getScheduleCode());
			pstmt.setInt(8, p.getArtistCode());
			pstmt.setInt(9, p.getMemberCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("result : " + result);
		return result;
	}

}
