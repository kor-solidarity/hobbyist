package com.dh.hobbyist.member.model.service;

import java.sql.Connection;

import com.dh.hobbyist.member.model.dao.MemberDao;
import com.dh.hobbyist.member.model.vo.Member;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class MemberService {
	
	//회원가입용 메소드
	public int insertMember(Member member) {
		
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, member);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Member loginCheck(Member member) {
		
		Connection con = getConnection();
		
		Member loginMember = new MemberDao().loginCheck(con, member);
		
		close(con);
		
		return loginMember;
	}

}
