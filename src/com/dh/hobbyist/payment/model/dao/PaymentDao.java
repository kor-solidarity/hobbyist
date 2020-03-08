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
		return payList;
	}

	//결제 시 회원수 증가용 메소드
	public int updateMemberCtn(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getImpNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//결제 시 회원 수업 진행 상태 표시 및 추가
	public int insertRegister(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRegister");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getImpNum());
			pstmt.setString(2, p.getImpNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Payment showPayView(Connection con, int scheduleCode, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Payment p = null;
		
		String query = prop.getProperty("showPayView");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			pstmt.setInt(2, scheduleCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				p = new Payment();
				p.setScheduleCode(rset.getInt("SCHEDULE_PK"));
				p.setLessonName(rset.getString("LESSON_NAME"));
				p.setArtistCode(rset.getInt("MEMBER_PK"));
				p.setArtistName(rset.getString("ARTIST_NICK"));
				p.setTotalOrder(rset.getInt("TOTAL_ORDERS"));
				p.setCostPerOrder(rset.getInt("COST_PER_ORDER"));
				p.setTotalCost(rset.getInt("TOTAL_COSTS"));
				p.setRegion(rset.getString("REGION"));
				p.setSubRegion(rset.getString("SUB_REGION"));
				p.setAddress(rset.getString("ADDRESS"));
				p.setTotalPoint(rset.getInt("MEMBER_POINT"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(p);
		return p;
	}
	
	//결제할때 포인트 사용 시 포인트 변동
	public int insertUsingPoint(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertUsingPoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setTimestamp(1, p.getPayDate());
			pstmt.setInt(2, p.getUsingPoint());
			pstmt.setInt(3, p.getMemberCode());
			pstmt.setString(4, "결제");
			pstmt.setString(5, p.getImpNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int updateUsingPoint(Connection con, Payment p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateUsingPoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getUsingPoint());
			pstmt.setInt(2, p.getMemberCode());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
