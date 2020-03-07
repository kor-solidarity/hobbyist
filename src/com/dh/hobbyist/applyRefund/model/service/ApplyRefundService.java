package com.dh.hobbyist.applyRefund.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.dh.hobbyist.applyRefund.model.dao.ApplyRefundDao;
import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;
import com.dh.hobbyist.payment.model.dao.PaymentDao;
import com.dh.hobbyist.payment.model.vo.Payment;

public class ApplyRefundService {

	public ApplyRefund selectDetail(int num) {
		Connection con = getConnection();
		
		ApplyRefund arf = new ApplyRefundDao().selectDetail(con, num);
		
		close(con);
		
		return arf;
	}

	public List<ApplyRefund> selectList() {
		Connection con = getConnection();
		
		List<ApplyRefund> applyList = new ApplyRefundDao().selectList(con);
		
		close(con);
		
		return applyList;
		
	}

	//최종 반려버튼 클릭 시
	public int refuseRefund(int num, String reasonDetail) {
		Connection con = getConnection();
		
		int result = new ApplyRefundDao().refuseRefund(con, num, reasonDetail);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public List<ApplyRefund> selectRefuseList() {
		Connection con = getConnection();
		
		List<ApplyRefund> applyList = new ApplyRefundDao().selectRefuseList(con);
		
		close(con);
		
		return applyList;
	}

	//반려 취소버튼 클릭 시
	public int cancelRefund(int num) {
		Connection con = getConnection();
		
		int result = new ApplyRefundDao().cancelRefund(con, num);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
