package com.dh.hobbyist.applyRefund.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.sql.Connection;

import com.dh.hobbyist.applyRefund.model.dao.ApplyRefundDao;
import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;

public class ApplyRefundService {

	public ApplyRefund selectDetail(int num) {
		Connection con = getConnection();
		
		ApplyRefund arf = new ApplyRefundDao().selectDetail(con, num);
		
		close(con);
		
		return arf;
	}

}
