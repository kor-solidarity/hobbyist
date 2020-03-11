package com.dh.hobbyist.refund.model.dao;

import static com.dh.hobbyist.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.dh.hobbyist.payment.model.dao.PaymentDao;
import com.dh.hobbyist.payment.model.vo.Payment;
import com.dh.hobbyist.payment.model.vo.RegisterPayment;
import com.dh.hobbyist.refund.model.vo.Refund;

public class RefundDao {
	private Properties prop = new Properties();
	
	public RefundDao() {
		String fileName = PaymentDao.class.getResource("/sql/refund/refund-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Refund> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Refund> refundList = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			refundList = new ArrayList<Refund>();
			
			while(rset.next()) {
				Refund r = new Refund();
				r.setRefundCode(rset.getInt("REFUND_PK"));
				r.setPayCode(rset.getInt("PAYMENT_PK"));
				r.setMemberName(rset.getString("MEMBER_NAME"));
				r.setArtistName(rset.getString("ARTIST_NAME"));
				r.setPhone(rset.getString("MEMBER_PHONE"));
				r.setPayDate(rset.getTimestamp("PAYMENT_DATE"));
				r.setRefundDate(rset.getTimestamp("REFUND_DATE"));
				
				refundList.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return refundList;
	}

	//환불 승인시 환불 상테로 바꾸어주는 메소드
	public int approveRefund(Connection con, Refund r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("approveRefund");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, r.getPayCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//환불 시 멤버 포인트 반환해주기
	public int insertReturnUsingPoint(Connection con, Refund r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReturnUsingPoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, r.getRefundPoint());
			pstmt.setInt(2, r.getPayCode());
			pstmt.setString(3, "반환");
			pstmt.setInt(4, r.getPayCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//환불 시 적립 포인트 수거하기
	public int insertReCollectPoint(Connection con, Refund r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReCollectPoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, r.getGivePoint());
			pstmt.setInt(2, r.getPayCode());
			pstmt.setString(3, "수거");
			pstmt.setInt(4, r.getPayCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//환불시 멤버 포인트바꾸어주는 메소드
	public int updatePoint(Connection con, Refund r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, r.getRefundPoint());
			pstmt.setInt(2, r.getGivePoint());
			pstmt.setInt(3, r.getPayCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//마이페이지 환불 내역
	public ArrayList<Refund> refundList(Connection con, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Refund> rList = null;
		
		String query = prop.getProperty("refundList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			rset = pstmt.executeQuery();
			
			rList = new ArrayList<Refund>();
			
			while(rset.next()) {
				
				Refund r = new Refund();
				r.setLessonName(rset.getString("LESSON_NAME"));
				r.setArtistName(rset.getString("ARTIST_NAME"));
				r.setRefundDate(rset.getTimestamp("REFUND_DATE"));
				r.setPayCost(rset.getInt("PAYMENT_COSTS"));
				r.setRefundCost(rset.getInt("COSTS"));
				r.setStatus(rset.getInt("REFUND_ACCEPTED"));
				
				rList.add(r);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return rList;
	}
}
