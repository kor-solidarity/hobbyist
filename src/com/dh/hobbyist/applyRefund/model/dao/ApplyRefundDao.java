package com.dh.hobbyist.applyRefund.model.dao;

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

import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;
import com.dh.hobbyist.payment.model.vo.Payment;

import static com.dh.hobbyist.common.JDBCTemplate.*;

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
		ApplyRefund arf = null;
		
		String query = prop.getProperty("selectDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				arf = new ApplyRefund();
				arf.setImpNum(rset.getString("PAYMENT_IMP_NUM"));
				arf.setLessonName(rset.getString("LESSON_NAME"));
				arf.setPayCost(rset.getInt("PAYMENT_COSTS"));
				arf.setUsingPoint(rset.getInt("POINTS_USED"));
				arf.setTotalOrder(rset.getInt("TOTAL_ORDER"));
				arf.setFinishOrder(rset.getInt("FINISH_ORDER"));
				arf.setLeftOrder(rset.getInt("LEFT_ORDER"));
				arf.setArtistCode(rset.getInt("ARTIST_PK"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("arf : " + arf);
		return arf;
	}


	public List<ApplyRefund> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		List<ApplyRefund> applyList = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			applyList = new ArrayList<ApplyRefund>();
			
			while(rset.next()) {
				ApplyRefund arf = new ApplyRefund();
				arf.setRefundCode(rset.getInt("REFUND_PK"));
				arf.setPaymentCode(rset.getInt("PAYMENT_PK"));
				arf.setMemberCode(rset.getInt("MEMBER_PK"));
				arf.setMemberName(rset.getString("MEMBER_NAME"));
				arf.setPhone(rset.getString("MEMBER_PHONE"));
				arf.setEmail(rset.getString("MEMBER_EMAIL"));
				arf.setArtistCode(rset.getInt("ARTIST_PK"));
				arf.setApplyDate(rset.getTimestamp("REQUESTED_TIME"));
				
				applyList.add(arf);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return applyList;
	}

}
