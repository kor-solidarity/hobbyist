package com.dh.hobbyist.calculatePay.model.dao;

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

import com.dh.hobbyist.calculatePay.model.vo.Accounts;
import com.dh.hobbyist.calculatePay.model.vo.PaySettlement;
import com.dh.hobbyist.calculatePay.model.vo.Settlement;
import com.dh.hobbyist.calculatePay.model.vo.SettlementInquiry;
import com.dh.hobbyist.suggest.model.vo.PageInfo;

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

	//마이페이지 - 나의 정산에서 쓰일 나의 정산 갯수 조회용 메소드
	public int getMyPayList(Connection con, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		int listCount = 0;
		
		String query = prop.getProperty("getMyPayListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}

	//마이페이지 - 나의 정산에서 쓰일 나의 정산 전체 조회용 메소드 (페이징 처리)
	public ArrayList<PaySettlement> selectMyPaySettlementList(Connection con, int memberCode, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ArrayList<PaySettlement> list = null;
		
		String query = prop.getProperty("selectMyPayListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, memberCode);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//정산pk를 이용해 정산DB 한개 조회용 메소드
	public PaySettlement selectOneCalculation(Connection con, int orderCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PaySettlement ps = null;
		
		String query = prop.getProperty("selectOneCalculation");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, orderCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ps = new PaySettlement();
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ps;
	}

	//"정상 확정" 클릭 시 정산 DB에서 상태(STATUS) 값 변경용 메소드
	public int updateConfirmStatus(Connection con, int settleCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateConfirmStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, settleCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//"수정 요청" 클릭시 정산 DB에서 상태(STATUS) 값 변경용 메소드
	public int updateModifyStatus(Connection con, int settleCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateModifyStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, settleCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//"수정 요청" 클릭시 수정요청 사항 정산문답 DB에 등록용 메소드
	public int insertSettlementReply(Connection con, int settleCode, String modifyText) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSettlementReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, settleCode);
			pstmt.setString(2, modifyText);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//관리자 - 금액 정산 부분에서 상태 정렬하여 조회하는 메소드
	public ArrayList<PaySettlement> sortStatus(Connection con, int value) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PaySettlement> list = null;
		
		String query = prop.getProperty("sortStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, value);
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//관리자 - 금액 정산 부분에서 "수정 요청" 클릭 시 회원의 문의 댓글 조회용 메소드
	public List<SettlementInquiry> selectSettlementInquiryList(Connection con, int settleCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<SettlementInquiry> inquiryList = null;
		
		String query = prop.getProperty("selectSettlementInquiryList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, settleCode);
			
			rset = pstmt.executeQuery();
			
			inquiryList = new ArrayList<SettlementInquiry>();
			
			while(rset.next()) {
				SettlementInquiry si = new SettlementInquiry();
				si.setInquiryCode(rset.getInt("INQUIRY_PK"));
				si.setSettlementCode(rset.getInt("SETTLEMENT_PK"));
				si.setContent(rset.getString("CONTENT"));
				si.setLVL(rset.getInt("LVL"));
				si.setAdminCode(rset.getInt("ADMIN_PK"));
				si.setAdminName(rset.getString("ADM_NAME"));
				si.setOriginInquiry(rset.getInt("ORIGINAL_INQUIRY"));
				si.setArtistCode(rset.getInt("ARTIST_PK"));
				si.setArtistName(rset.getString("MEMBER_NAME"));
				
				inquiryList.add(si);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return inquiryList;
	}

	//관리자 - 금액 정산 부분에서 "수정 요청" 클릭 시 회차정보 조회용 메소드
	public PaySettlement selectOnePaySettlement(Connection con, int settleCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PaySettlement ps = null;
		
		String query = prop.getProperty("selectOnePaySettlement");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, settleCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ps = new PaySettlement();
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
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ps;
	}

}
