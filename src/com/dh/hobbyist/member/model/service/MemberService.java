package com.dh.hobbyist.member.model.service;

import java.sql.Connection;
import java.util.List;

import com.dh.hobbyist.member.model.dao.MemberDao;
import com.dh.hobbyist.member.model.vo.Member;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class MemberService {
	
	//회원가입용 메소드(유승)
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
	//로그인 메소드(유승)
	public Member loginCheck(Member member) {
		
		Connection con = getConnection();
		
		Member loginMember = new MemberDao().loginCheck(con, member);
		
		close(con);
		
		return loginMember;
	}
	//아이디 중복체크 메소드(유승)
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
		
		close(con);
		
		return memberList;
	}
	
	//관리자에서 아티스트 정보 조회용 메소드 (찬영)
	public List<Member> selectArtistList() {
		Connection con = getConnection();
		
		List<Member> artistList = new MemberDao().selectArtistList(con);
		
		close(con);
		
		return artistList;
	}
	
	
	   
	//아이디 찾기 메소드(유승)   
	public Member findId(Member member) {
		Connection con = getConnection();
		
		Member findMember = new MemberDao().findId(con, member);
		
		close(con);
		
		return findMember;
	}
	
	//비밀번호 찾기 메소드(유승)
	public Member findPassword(Member member) {
		Connection con = getConnection();
		
		Member findMember = new MemberDao().findPassword(con, member);
		
		close(con);
		
		return findMember;
	}
	
	//비밀번호 재설정(유승)
	public int setPassword(String memberPwd, String memberId) {
		Connection con = getConnection();
		
		int result = new MemberDao().setPassword(con, memberPwd, memberId);
		
		close(con);
		
		return result;
	}
	//휴대전화 중복 체크(유승)
	public int phoneCheck(String phone) {
		Connection con = getConnection();
		
		int result = new MemberDao().phoneCheck(con, phone);
		
		close(con);
		
		return result;
	}
	   

	
}
