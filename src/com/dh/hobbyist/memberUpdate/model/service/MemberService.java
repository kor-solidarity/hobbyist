package com.dh.hobbyist.memberUpdate.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.close;
import static com.dh.hobbyist.common.JDBCTemplate.commit;
import static com.dh.hobbyist.common.JDBCTemplate.getConnection;
import static com.dh.hobbyist.common.JDBCTemplate.rollback;

import java.sql.Connection;

import javax.rmi.ssl.SslRMIClientSocketFactory;

import com.dh.hobbyist.memberUpdate.model.dao.MemberDao;
import com.dh.hobbyist.memberUpdate.model.vo.Member;

public class MemberService {
	

	
	//회원 정보 수정 목록 메소드(재선)
	
	public int memberUpdate(Member member) {
		Connection con = getConnection();
		
		int memberUpdate = new MemberDao().memberUpdate(con, member);
		System.out.println("DB에서 받아온의" + memberUpdate);
		
		if(memberUpdate > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return memberUpdate;
	}

	//패스워드 확인 여부
	public int pwConfirm(String member) {
		Connection con = getConnection();
		System.out.println("서비스쪽의" + pwConfirm(member));
		int result = new MemberDao().pwConfirm(con, member);
		
		close(con);
		
		return result;
	}

	//패스워드 변경시 일치여부확인
	public int pwCheck(String userPw) {
		Connection con = getConnection();
		
		int result = new MemberDao().pwCheck(con, userPw);
		
		close(con);
		
		return result;
	}
	
	//전화번호 확인
	public int telCheck(String userTel) {
		Connection con = getConnection();
		int result = new MemberDao().telCheck(con, userTel);
		
		close(con);
		
		return result;
	}



	
	   

	
}
