package com.dh.hobbyist.payment.model.dao;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.dh.hobbyist.payment.model.vo.Payment;

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

	public List<Payment> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		List<Payment> payList = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			payList = new ArrayList<Payment>();
			
			while(rset.next()) {
				Payment p = new Payment();
				p.setPaymentCode(rset.getInt("PAYMENT_PK"));
				p.setUsingPoint(rset.getInt("POINTS_USED"));
				p.setGivePoint(rset.getInt("POINTS_GIVEN"));
				p.setPayCost(rset.getInt("PAYMENT_COSTS"));
				p.setMemberName(rset.getString("MEMBER_NAME"));
				p.setPhone(rset.getString("MEMBER_PHONE"));
				p.setPayMethod(rset.getString("PAYMENT_METHOD"));
				p.setImpNum(rset.getString("PAYMENT_IMP_NUM"));
				p.setPayDate(rset.getTimestamp("PAYMENT_DATE"));
				p.setScheduleCode(rset.getInt("LESSON_SCHEDULE_PK"));
				p.setArtistCode(rset.getInt("ARTIST_PK"));
				p.setMemberCode(rset.getInt("MEMBER_PK"));
				
				payList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		System.out.println(payList);
		return payList;
	}

	public int updateMemberCtn(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		
		
		return result;
	}
}
