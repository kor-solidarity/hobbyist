package com.dh.hobbyist.suggest.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dh.hobbyist.suggest.model.dao.CategoryDao;
import com.dh.hobbyist.suggest.model.vo.Category;
import static com.dh.hobbyist.common.JDBCTemplate.*;
public class CategoryService {

	//대분류 카테고리를 통해 소분류 카테고리들을 뽑아오는 메소드
	public String[] selectDetailCategory(String categoryName) {
		Connection con = getConnection();
		
		String[] list = new CategoryDao().selectDetailCategory(con, categoryName);
		return list;
	}

}
