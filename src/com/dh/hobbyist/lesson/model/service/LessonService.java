package com.dh.hobbyist.lesson.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.dh.hobbyist.common.model.vo.PageInfo;
import com.dh.hobbyist.lesson.model.dao.LessonDao;
import com.dh.hobbyist.suggest.model.vo.Category;

import static com.dh.hobbyist.common.JDBCTemplate.*;


public class LessonService {
	
	
	//관심 수업 리스트 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectInterest(int memberCode) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectInterest(con, memberCode);
		
		close(con);
		
		return list;
	}
	
	
	// 리스트 카운트(유승)
	public int getListCount(int parentCode) {
		Connection con = getConnection();
		
		int listCount = new LessonDao().getListCount(con, parentCode);
		
		close(con);
		
		return listCount;
	}
	
	//음악 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryMusic(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectCategoryMusic(con, pi);
		
		close(con);
		
		return list;
	}
	
	//댄스 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryDance(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectCategoryDance(con, pi);
		
		close(con);
		
		return list;
	}
	
	//영상/사진 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryVideo(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectCategoryVideo(con, pi);
		
		close(con);
		
		return list;
	}
	
	//라이프스타일 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryLife(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectCategoryLife(con, pi);
		
		close(con);
		
		return list;
	}
	
	//뷰티 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryBeauty(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectCategoryBeauty(con, pi);
		
		close(con);
		
		return list;
	}
	
	//디자인 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryDesign(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectCategoryDesign(con, pi);
		
		close(con);
		
		return list;
	}
	
	//스포츠 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategorySports(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectCategorySports(con, pi);
		
		close(con);
		
		return list;
	}
	
	
	
	
	//메인페이지 인기수업 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectMainPopular() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new LessonDao().selectMainPopular(con);
		
		close(con);
		
		return list;
	}
	
	
	
	

}
