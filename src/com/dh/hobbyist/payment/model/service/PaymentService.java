package com.dh.hobbyist.payment.model.service;

import java.sql.Connection;

import com.dh.hobbyist.payment.model.dao.PaymentDao;
import com.dh.hobbyist.payment.model.vo.Payment;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class PaymentService {

	public int insertPayment(Payment p) {
		Connection con = getConnection();
		
		int result = new PaymentDao().insertPayment(con, p);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
