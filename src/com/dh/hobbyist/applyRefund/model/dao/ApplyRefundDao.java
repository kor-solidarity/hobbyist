package com.dh.hobbyist.applyRefund.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;
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
	

	public ApplyRefund selectDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ApplyRefund arf = null;
		
		String query = prop.getProperty("selectDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				arf = new ApplyRefund();
				arf.setImpNum(rset.getString("PAYMENT_IMP_NUM"));
				arf.setLessonName(rset.getString("LESSON_NAME"));
				arf.setPayCost(rset.getInt("PAYMENT_COSTS"));
				arf.setUsingPoint(rset.getInt("POINTS_USED"));
				arf.setTotalOrder(rset.getInt("TOTAL_ORDER"));
				arf.setFinishOrder(rset.getInt("FINISH_ORDER"));
				arf.setLeftOrder(rset.getInt("LEFT_ORDER"));
				arf.setArtistCode(rset.getInt("ARTIST_PK"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("arf : " + arf);
		return arf;
	}

}
