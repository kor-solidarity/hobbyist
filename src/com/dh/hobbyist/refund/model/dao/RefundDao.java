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
				// r.setPaymentCode(rset.getInt("PAYMENT_PK"));
				// r.setLessonName(rset.getString("LESSON_NAME"));
				// r.setMemberName(rset.getString("MEMBER_NAME"));
				// r.setPhone(rset.getString("MEMBER_PHONE"));
				// r.setTotalCost(rset.getInt("TOTAL_COSTS"));
				// r.setPayCost(rset.getInt("PAYMENT_COSTS"));
				// r.setUsingPoint(rset.getInt("POINTS_USED"));
				// r.setImpNum(rset.getString("PAYMENT_IMP_NUM"));
				// r.setPayDate(rset.getTimestamp("PAYMENT_DATE"));
				//
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
	public int insertReturnUsingPoint() {
		return 0;
	}
	
	//환불 시 적립 포인트 수거하기
	public int insertReCollectPoint() {
		return 0;
	}

	//환불시 멤버 포인트바꾸어주는 메소드
	public int updatePoint(Connection con, Refund r) {
		return 0;
	}
}
