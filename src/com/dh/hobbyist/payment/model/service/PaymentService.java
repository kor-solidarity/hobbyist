package com.dh.hobbyist.payment.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.close;
import static com.dh.hobbyist.common.JDBCTemplate.commit;
import static com.dh.hobbyist.common.JDBCTemplate.getConnection;
import static com.dh.hobbyist.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.dh.hobbyist.lesson.model.vo.MyRegiLesson;
import com.dh.hobbyist.payment.model.dao.PaymentDao;
import com.dh.hobbyist.payment.model.vo.Payment;

public class PaymentService {

	//결제 시 실행 되는 메소드 3개
	public int insertPayment(Payment p) {
		Connection con = getConnection();
		
		int result = new PaymentDao().insertPayment(con, p);
		
		System.out.println("1 " + result);
		if(result > 0) {
			
		
			//결제시 회원수 증가용 메소드
			result = new PaymentDao().updateMemberCtn(con, p);
			System.out.println("2 " + result);
			
			if(result > 0) {
				
				result = new PaymentDao().insertRegister(con, p);
				System.out.println("3 " + result);
				
				if(result > 0) {
					result = new PaymentDao().insertUsingPoint(con, p);
					System.out.println("4 " + result);
						
					if(result > 0) {
						result = new PaymentDao().updateUsingPoint(con, p);
						System.out.println("5 " + result);
						
						if(result > 0) {
							commit(con);
						}else {
							rollback(con);
						}
					}else {
						rollback(con);
					}
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

	//마이페이지 결제 리스트
	public ArrayList<MyRegiLesson> payList(int memberCode) {
		Connection con = getConnection();
		
		ArrayList<MyRegiLesson> pList = new PaymentDao().payList(con, memberCode);
		
		close(con);
		
		return pList;
	}

}
