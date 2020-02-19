package com.dh.hobbyist.suggest.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CategoryDao {

	//대분류 카테고리를 통해 소분류 카테고리들을 뽑아오는 메소드
	public String[] selectDetailCategory(Connection con, String categoryName) {
		Statement stmt = null;
		String[] list = null;
		ResultSet rset = null;
		
		
		return null;
	}

}
