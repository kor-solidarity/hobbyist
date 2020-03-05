package com.dh.hobbyist.calculatePay.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.dh.hobbyist.calculatePay.model.dao.CalculatePayDao;
import com.dh.hobbyist.calculatePay.model.vo.Accounts;
import com.dh.hobbyist.calculatePay.model.vo.PaySettlement;
import com.dh.hobbyist.calculatePay.model.vo.Settlement;
import com.dh.hobbyist.calculatePay.model.vo.SettlementInquiry;
import com.dh.hobbyist.suggest.model.vo.PageInfo;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class CalculatePayService {

	//현재 시간 기준으로 회차 종료시간이 지난 수업에 관한 정보들 조회하는 메소드 
	public ArrayList<Accounts> selectPayList() {
		Connection con = getConnection();
		
		ArrayList<Accounts> list = new CalculatePayDao().selectPayList(con);
		
		close(con);
		
		return list;
	}

	//정산 DB 전체 조회하는 메소드
	public ArrayList<Settlement> selectSettlementList() {
		Connection con = getConnection();
		
		ArrayList<Settlement> list = new CalculatePayDao().selectSettlementList(con);
		
		close(con);
		
		return list;
	}

	//정산 DB 등록 메소드
	public int insertPayment(ArrayList<Accounts> list, ArrayList<Settlement> settleList) {
		Connection con = getConnection();
		int result = 0;
		
		exit_For:for(int i = 0; i < list.size(); i++) {
			for(int j = 0; j < settleList.size(); j++) {
				if(list.get(i).getLessonOrderCode() == settleList.get(j).getLessonOrderCode()) {
					break exit_For;
				}
			}
			result += new CalculatePayDao().insertPayment(con, list.get(i));
		}
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//정산내역 뷰에서 보여질 VO 조회 메소드 
	public ArrayList<PaySettlement> selectPaySettlementList() {
		Connection con = getConnection();
		
		ArrayList<PaySettlement> list = new CalculatePayDao().selectPaySettlementList(con);
		
		close(con);
		
		return list;
	}

	//마이페이지 - 나의 정산에서 쓰일 나의 정산 갯수 조회용 메소드
	public int getMyPayList(int memberCode) {
		Connection con = getConnection();
		
		int listCount = new CalculatePayDao().getMyPayList(con, memberCode);
		
		close(con);
		
		return listCount;
	}

	//마이페이지 - 나의 정산에서 쓰일 나의 정산 전체 조회용 메소드 (페이징 처리)
	public ArrayList<PaySettlement> selectMyPaySettlementList(PageInfo pi, int memberCode) {
		Connection con = getConnection();
		
		ArrayList<PaySettlement> list = new CalculatePayDao().selectMyPaySettlementList(con, memberCode, pi);
		
		close(con);
		
		return list;
	}

	//정산pk를 이용해 정산DB 한개 조회용 메소드
	public PaySettlement selectOneCalculation(int orderCode) {
		Connection con = getConnection();
		
		PaySettlement ps = new CalculatePayDao().selectOneCalculation(con, orderCode);
		
		close(con);
		
		return ps;
	}

	//"정산 확정" 클릭 시 정산 DB에서 상태(STATUS) 값 변경용 메소드
	public int updateConfirmStatus(int settleCode) {
		Connection con = getConnection();
		
		int result = new CalculatePayDao().updateConfirmStatus(con, settleCode);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	//"수정 요청" 클릭 시 정산 DB에서 상태(STATUS) 값 변경 후 정산문답 DB에 등록용 메소드
	public int insertSettlementReply(int settleCode, String modifyText) {
		Connection con = getConnection();
		
		int result1 = new CalculatePayDao().updateModifyStatus(con, settleCode);
		int result2 = 0;
		int result = 0;
		
		if(result1 > 0) {
			result2 = new CalculatePayDao().insertSettlementReply(con, settleCode, modifyText);
		}
		
		if(result2 > 0) {
			result = 1;
			commit(con);
		} else {
			result = 0;
			rollback(con);
		}
		
		return result;
	}

	//관리자 - 금액 정산 부분에서 상태 정렬하여 조회하는 메소드
	public ArrayList<PaySettlement> sortStatus(int value) {
		Connection con = getConnection();
		
		ArrayList<PaySettlement> list = new CalculatePayDao().sortStatus(con, value);
		
		close(con);
		
		return list;
	}

	//관리자 - 금액 정산 부분에서 "수정 요청" 클릭 시 회원의 문의 댓글 조회용 메소드
	public List<SettlementInquiry> selectSettlementInquiryList(int settleCode) {
		Connection con = getConnection();
		
		List<SettlementInquiry> inquiryList = new CalculatePayDao().selectSettlementInquiryList(con, settleCode);
		
		close(con);
		
		return inquiryList;
	}

	//관리자 - 금액 정산 부분에서 "수정 요청" 클릭 시 회차정보 조회용 메소드
	public PaySettlement selectOnePaySettlement(int settleCode) {
		Connection con = getConnection();
		
		PaySettlement ps = new CalculatePayDao().selectOnePaySettlement(con, settleCode);
		
		close(con);
		
		return ps;
	}
	
	
	

	
	
}
