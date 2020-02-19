package com.dh.hobbyist.member.model.service;

import java.sql.Connection;
import java.util.List;

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

	public int idCheck(String memberId) {
		Connection con = getConnection();
		
		int result = new MemberDao().idCheck(con, memberId);
		
		close(con);
		
		return result;
	}

	//관리자에서 회원정보 조회용 메소드 (찬영)
	public List<Member> selectList() {
		
		Connection con = getConnection();
		
		List<Member> memberList = new MemberDao().selectList(con);
		
		if(memberList != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return memberList;
	}

}
