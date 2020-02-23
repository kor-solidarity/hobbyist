package com.dh.hobbyist.suggest.model.service;

import java.sql.Connection;

import com.dh.hobbyist.suggest.model.dao.SuggestDao;
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

}
