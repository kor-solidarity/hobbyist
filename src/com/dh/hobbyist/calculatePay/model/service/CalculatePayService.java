package com.dh.hobbyist.calculatePay.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dh.hobbyist.calculatePay.model.dao.CalculatePayDao;
import com.dh.hobbyist.calculatePay.model.vo.Accounts;
import com.dh.hobbyist.calculatePay.model.vo.PaySettlement;
import com.dh.hobbyist.calculatePay.model.vo.Settlement;

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

	
}
