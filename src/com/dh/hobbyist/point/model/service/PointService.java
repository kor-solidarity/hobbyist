package com.dh.hobbyist.point.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.close;
import static com.dh.hobbyist.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.dh.hobbyist.point.model.dao.PointDao;
import com.dh.hobbyist.point.model.vo.Point;

public class PointService {

	public PointService() {}

	public ArrayList<Point> PointList(int memberCode) {
		Connection con = getConnection();
		
		ArrayList<Point> pointList = new PointDao().PointList(con, memberCode);
		
		close(con);
		
		return pointList;
	}
	

}
