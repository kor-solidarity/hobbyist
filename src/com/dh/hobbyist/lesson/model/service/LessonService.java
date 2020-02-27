package com.dh.hobbyist.lesson.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.dh.hobbyist.lesson.model.dao.LessonDao;

import static com.dh.hobbyist.common.JDBCTemplate.*;


public class LessonService {
	
	//카테고리별 리스트 페이지 메솓(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectCategoryList(con);
		
		close(con);
		
		return list;
	}

}
