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
import com.dh.hobbyist.lesson.model.vo.MyRegiLesson;
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
				arf.setMemberName(rset.getString("MEMBER_NAME"));
				arf.setArtistName(rset.getString("ARTIST_NAME"));
				arf.setPhone(rset.getString("MEMBER_PHONE"));
				arf.setPayDate(rset.getTimestamp("PAYMENT_DATE"));
				arf.setApplyDate(rset.getTimestamp("REQUESTED_TIME"));
				
				applyList.add(arf);
				
				System.out.println(arf);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return applyList;
	}

	public ApplyRefund selectDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ApplyRefund arf = null;
		
		String query = prop.getProperty("selectDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			pstmt.setInt(3, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				arf = new ApplyRefund();
				arf.setImpNum(rset.getString("PAYMENT_IMP_NUM"));
				arf.setLessonName(rset.getString("LESSON_NAME"));
				arf.setPayCost(rset.getInt("PAYMENT_COSTS"));
				arf.setUsingPoint(rset.getInt("POINTS_USED"));
				arf.setRefundCost(rset.getInt("COSTS"));
				arf.setTotalOrder(rset.getInt("TOTAL_ORDER"));
				arf.setFinishOrder(rset.getInt("FINISH_ORDER"));
				arf.setReason(rset.getString("REASON"));
				arf.setReasonDetail(rset.getString("REASON_DETAIL"));
				arf.setRefuseReason(rset.getString("REFUSE_REASON"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println(arf);
		return arf;
	}



	//환불 신청 반려시 상태 거부하는 메소드
	public int refuseRefund(Connection con, int num, String reasonDetail) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("refuseRefund");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reasonDetail);
			pstmt.setInt(2, num);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}




	public List<ApplyRefund> selectRefuseList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		List<ApplyRefund> applyList = null;
		
		String query = prop.getProperty("selectRefuseList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			applyList = new ArrayList<ApplyRefund>();
			
			while(rset.next()) {
				ApplyRefund arf = new ApplyRefund();
				arf.setRefundCode(rset.getInt("REFUND_PK"));
				arf.setPaymentCode(rset.getInt("PAYMENT_PK"));
				arf.setMemberName(rset.getString("MEMBER_NAME"));
				arf.setArtistName(rset.getString("ARTIST_NAME"));
				arf.setPhone(rset.getString("MEMBER_PHONE"));
				arf.setEmail(rset.getString("MEMBER_EMAIL"));
				arf.setPayDate(rset.getTimestamp("PAYMENT_DATE"));
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
	
	//환불반려 취소시 메소드
	public int cancelRefuse(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("cancelRefuse");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//마이페이지 환불신청 페이지 수업정보
	public MyRegiLesson showMyReg(Connection con, int paymentCode, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyRegiLesson myReg = null;
		
		String query = prop.getProperty("showMyReg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, paymentCode);
			pstmt.setInt(2, paymentCode);
			pstmt.setInt(3, paymentCode);
			pstmt.setInt(4, paymentCode);
			pstmt.setInt(5, paymentCode);
			pstmt.setInt(6, paymentCode);
			pstmt.setInt(7, paymentCode);
			pstmt.setInt(8, paymentCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				myReg = new MyRegiLesson();
				myReg.setScheduleCode(rset.getInt("SCHEDULE_PK"));
				myReg.setLessonImgRoute(rset.getString("LESSON_IMG_ROUTE"));
				myReg.setLessonImgName(rset.getString("LESSON_IMG_NAME"));
				myReg.setLessonName(rset.getString("LESSON_NAME"));
				myReg.setStartDate(rset.getTimestamp("START_DATE"));
				myReg.setRegion(rset.getString("REGION"));
				myReg.setPaymentCode(rset.getInt("PAYMENT_PK"));
				myReg.setPaymentDate(rset.getTimestamp("PAYMENT_DATE"));
				myReg.setProfileImgRoute(rset.getString("ARTIST_IMG_ROUTE"));
				myReg.setProfileImgName(rset.getString("ARTIST_IMG_NAME"));
				myReg.setArtistNick(rset.getString("ARTIST_NICK"));
				myReg.setArtistName(rset.getString("ARTIST_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return myReg;
	}

	//마이페이지 환불신청 페이지 결제정보
	public ApplyRefund showApplyRefundView(Connection con, int paymentCode, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ApplyRefund ap = null;
		
		String query = prop.getProperty("showApplyForm");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, paymentCode);
			pstmt.setInt(2, paymentCode);
			pstmt.setInt(3, paymentCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ap = new ApplyRefund();
				ap.setPaymentCode(paymentCode);
				ap.setPayCost(rset.getInt("PAYMENT_COSTS"));
				ap.setScheduleCode(rset.getInt("LESSON_SCHEDULE_PK"));
				ap.setUsingPoint(rset.getInt("POINTS_USED"));
				ap.setTotalOrder(rset.getInt("TOTAL_ORDER"));
				ap.setFinishOrder(rset.getInt("FINISH_ORDER"));
		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return ap;
	}

	//환불 신청 내역 추가
	public int insetApplyRefund(Connection con, ApplyRefund arf) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertApplyRefund");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, arf.getRefundCost());
			pstmt.setString(2, arf.getReason());
			pstmt.setString(3, arf.getReasonDetail());
			pstmt.setInt(4, arf.getPaymentCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	

}
