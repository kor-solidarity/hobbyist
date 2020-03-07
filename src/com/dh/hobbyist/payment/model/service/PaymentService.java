package com.dh.hobbyist.payment.model.service;

import java.sql.Connection;
import java.util.List;

import com.dh.hobbyist.payment.model.dao.PaymentDao;
import com.dh.hobbyist.payment.model.vo.Payment;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class PaymentService {

	//결제 시 실행 되는 메소드 3개
	public int insertPayment(Payment p) {
		Connection con = getConnection();
		
		System.out.println("p : " + p);
		
		int result = new PaymentDao().insertPayment(con, p);
		
		System.out.println("1 " + result);
		if(result > 0) {
			
			commit(con);
			//결제시 회원수 증가용 메소드
			result = new PaymentDao().updateMemberCtn(con, p);
			System.out.println("2 " + result);
			if(result > 0) {
				
				commit(con);
				
				result = new PaymentDao().insertRegister(con, p);
				System.out.println("3 " + result);
				if(result > 0) {
//					result = new PaymentDao().insertUsingPoint(con, p);
//					if(result > 0) {
						commit(con);
						
//					}else {
//						rollback(con);
//					}
					
				} else {
					rollback(con);
				}
			}else {
				rollback(con);
			}
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public List<Payment> selectList() {
		Connection con = getConnection();
		
		List<Payment> payList = new PaymentDao().selectList(con);
		
		close(con);
		
		return payList;
	}

	public Payment showPayView(int scheduleCode, int memberCode) {
		Connection con = getConnection();
		
		Payment p = new PaymentDao().showPayView(con, scheduleCode, memberCode);
		
		close(con);
		
		return p;
	}

}
