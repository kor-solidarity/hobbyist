package com.dh.hobbyist.point.model.dao;

import static com.dh.hobbyist.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dh.hobbyist.payment.model.dao.PaymentDao;
import com.dh.hobbyist.point.model.vo.Point;

public class PointDao {
	private Properties prop = new Properties();
	
	public PointDao() {
		String fileName = PaymentDao.class.getResource("/sql/point/point-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Point> PointList(Connection con, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Point> pointList = null;
		
		String query = prop.getProperty("pointList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			rset = pstmt.executeQuery();
			
			pointList = new ArrayList<Point>();
			
			while(rset.next()) {
				
				Point p = new Point();
				p.setPointDate(rset.getTimestamp("RECEIVE_DATE"));
				p.setPoint(rset.getInt("CHANGED_POINTS"));
				p.setType(rset.getInt("TYPE"));
				p.setBase(rset.getString("BASED_ON"));
				
				pointList.add(p);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return pointList;
	}

}
