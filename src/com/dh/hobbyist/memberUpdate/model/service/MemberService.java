package com.dh.hobbyist.memberUpdate.model.service;

import java.sql.Connection;
import java.util.List;

import com.dh.hobbyist.memberUpdate.model.dao.MemberDao;
import com.dh.hobbyist.memberUpdate.model.vo.Member;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class MemberService {
	

	
	//회원 정보 수정 목록 메소드(재선)
	
	public int memberUpdate(Member member) {
		Connection con = getConnection();
		
		int memberUpdate = new MemberDao().memberUpdate(con, member);
		
		if(memberUpdate > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return memberUpdate;
	}
	   

	
}
