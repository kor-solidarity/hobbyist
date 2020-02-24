package com.dh.hobbyist.suggest.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dh.hobbyist.suggest.model.dao.SuggestDao;
import com.dh.hobbyist.suggest.model.vo.PageInfo;
import com.dh.hobbyist.suggest.model.vo.Petition;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class SuggestService {

	//건의 게시판 등록용 메소드
	public int insertSuggest(Petition petition) {
		Connection con = getConnection();
		
		int result = new SuggestDao().insertSuggest(con, petition);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	//건의 게시판 리스트 조회용 메소드
	public ArrayList<Petition> selectList() {
		Connection con = getConnection();
		
		ArrayList<Petition> result = new SuggestDao().selectList(con);
		
		close(con);
		
		return result;
	}

	//건의 게시판 갯수 조회용 메소드
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new SuggestDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//페이징 처리 포함한 건의게시판 조회용 메소드
	public ArrayList<Petition> selectList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Petition> list = new SuggestDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}

	//건의게시판 하나 조회용 메소드
	public Petition selectOne(int num) {
		Connection con = getConnection();
		
		int result = new SuggestDao().updateCount(con, num);
		Petition p = null;
		
		if(result > 0) {
			commit(con);
			p = new SuggestDao().selectOne(con, num);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return p;
	}

}
