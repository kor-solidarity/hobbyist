package com.dh.hobbyist.calculatePay.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.dh.hobbyist.calculatePay.model.vo.Accounts;
import com.dh.hobbyist.calculatePay.model.vo.PaySettlement;
import com.dh.hobbyist.calculatePay.model.vo.Settlement;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class CalculatePayDao {
	private Properties prop = new Properties();
	
	public CalculatePayDao() {
		String fileName = CalculatePayDao.class.getResource("/sql/calculatePay/calculatePay-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//현재 시간 기준으로 회차 종료시간이 지난 수업에 관한 정보들 조회하는 메소드 
	public ArrayList<Accounts> selectPayList(Connection con) {
		ArrayList<Accounts> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPayList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Accounts>();
			while(rset.next()) {
				Accounts a = new Accounts();
				a.setLessonOrderCode(rset.getInt("LESSON_ORDER_PK"));
				a.setLessonOrderTime(rset.getInt("LESSON_ORDER_TIME"));
				a.setMemberCode(rset.getInt("MEMBER_PK"));
				a.setMemberId(rset.getString("MEMBER_ID"));
				a.setMemberName(rset.getString("MEMBER_NAME"));
				a.setCostPerOder(rset.getInt("COST_PER_ORDER"));
				a.setListeners(rset.getInt("LISTENERS"));
				a.setTotalCost(rset.getInt("TOTAL_COST"));
				a.setFee(rset.getInt("FEE"));
				a.setPaymentAmount(rset.getInt("PAYMENT_AMOUNT"));
				a.setBankName(rset.getString("MEMBER_BANK_NAME"));
				a.setBankOwner(rset.getString("MEMBER_BANK_OWNER"));
				a.setBankNum(rset.getString("MEMBER_BANK_NUM"));
				
				list.add(a);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
	
		return list;
	}

	//정산 DB 전체 조회하는 메소드
	public ArrayList<Settlement> selectSettlementList(Connection con) {
		ArrayList<Settlement> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectSettlementList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Settlement>();
			
			while(rset.next()) {
				Settlement s = new Settlement();
				s.setSettleCode(rset.getInt("SETTLE_PK"));
				s.setSettleFee(rset.getInt("SETTLE_FEE"));
				s.setTotalPayGiven(rset.getInt("TOTAL_PAY_GIVEN"));
				s.setStatus(rset.getInt("STATUS"));
				s.setLessonOrderCode(rset.getInt("LESSON_ORDER_PK"));
				s.setArtistCode(rset.getInt("ARTIST_PK"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	//정산 DB 등록 메소드
	public int insertPayment(Connection con, Accounts accounts) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accounts.getPaymentAmount());
			pstmt.setInt(2, accounts.getLessonOrderCode());
			pstmt.setInt(3, accounts.getMemberCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//정산내역 뷰에서 보여질 VO 조회 메소드
	public ArrayList<PaySettlement> selectPaySettlementList(Connection con) {
		ArrayList<PaySettlement> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPaySettlementList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<PaySettlement>();
			
			while(rset.next()) {
				PaySettlement ps = new PaySettlement();
				ps.setSettleCode(rset.getInt("SETTLE_PK"));
				ps.setLessonOrderCode(rset.getInt("LESSON_ORDER_PK"));
				ps.setLessonOrderTime(rset.getInt("LESSON_ORDER_TIME"));
				ps.setMemberCode(rset.getInt("MEMBER_PK"));
				ps.setMemberId(rset.getString("MEMBER_ID"));
				ps.setMemberName(rset.getString("MEMBER_NAME"));
				ps.setCostPerOrder(rset.getInt("COST_PER_ORDER"));
				ps.setListeners(rset.getInt("LISTENERS"));
				ps.setTotalCost(rset.getInt("TOTAL_COST"));
				ps.setSettleFee(rset.getInt("SETTLE_FEE"));
				ps.setTotalPayGiven(rset.getInt("TOTAL_PAY_GIVEN"));
				ps.setBankName(rset.getString("MEMBER_BANK_NAME"));
				ps.setBankOwner(rset.getString("MEMBER_BANK_OWNER"));
				ps.setBankNum(rset.getString("MEMBER_BANK_NUM"));
				ps.setStatus(rset.getInt("STATUS"));
				ps.setLessonName(rset.getString("LESSON_NAME"));
				ps.setLessonOrderEnd(rset.getTimestamp("LESSON_ORDER_END"));
				ps.setLessonCode(rset.getInt("LESSON_PK"));
				
				list.add(ps);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

}
