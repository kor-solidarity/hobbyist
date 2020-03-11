package com.dh.hobbyist.refund.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dh.hobbyist.refund.model.dao.RefundDao;
import com.dh.hobbyist.refund.model.vo.Refund;

public class RefundService {

	public ArrayList<Refund> selectList() {
		Connection con = getConnection();
		
		ArrayList<Refund> refundList = new RefundDao().selectList(con);
		
		close(con);
		
		return refundList;
	}

	public int approveRefund(Refund r) {
		Connection con = getConnection();
		
		int result = new RefundDao().approveRefund(con, r);
		
		if(result > 0) {
				result = new RefundDao().insertReturnUsingPoint(con, r);
				
				if(result > 0) {
					result = new RefundDao().insertReCollectPoint(con, r);

					if(result > 0) {
						result = new RefundDao().updatePoint(con, r);
						commit(con);
						
					}else {
						rollback(con);
					}
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//마이페이지 환불 내역
	public ArrayList<Refund> refundList(int memberCode) {
		Connection con = getConnection();
		
		ArrayList<Refund> rList = new RefundDao().refundList(con, memberCode);
		
		close(con);
		
		return rList;
	}

}
