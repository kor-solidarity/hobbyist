package com.dh.hobbyist.suggest.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.dh.hobbyist.suggest.model.dao.CategoryDao;
import com.dh.hobbyist.suggest.model.vo.Category;
import static com.dh.hobbyist.common.JDBCTemplate.*;
public class CategoryService {

	//대분류 카테고리를 통해 소분류 카테고리들을 뽑아오는 메소드
	public List<Category> selectDetailCategory(int categoryCode) {
		Connection con = getConnection();
		
		List<Category> list = new CategoryDao().selectDetailCategory(con, categoryCode);
		
		close(con);
		
		return list;
	}

}
