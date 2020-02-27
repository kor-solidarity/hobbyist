package com.dh.hobbyist.memberUpdate.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.close;
import static com.dh.hobbyist.common.JDBCTemplate.commit;
import static com.dh.hobbyist.common.JDBCTemplate.getConnection;
import static com.dh.hobbyist.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.dh.hobbyist.memberUpdate.model.dao.MemberDao;
import com.dh.hobbyist.memberUpdate.model.vo.Member;

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

	//패스워드 확인 목록
	public Member pwCheck(Member member) {
		Connection con = getConnection();
		
		Member loginMember = new MemberDao().pwCheck(con, member);
		
		close(con);
		
		return loginMember;
	}

	
	   

	
}
