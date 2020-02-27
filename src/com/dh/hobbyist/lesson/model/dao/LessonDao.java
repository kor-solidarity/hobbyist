package com.dh.hobbyist.lesson.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class LessonDao {
	private Properties prop = new Properties();
	
	public LessonDao() {
		String fileName = LessonDao.class.getResource("/sql/lesson-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<HashMap<String, Object>> selectCategoryList(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCategoryList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}

}
