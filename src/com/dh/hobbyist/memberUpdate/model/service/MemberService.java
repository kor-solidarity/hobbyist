package com.dh.hobbyist.memberUpdate.model.service;

import java.sql.Connection;
import java.util.List;

import com.dh.hobbyist.memberUpdate.model.dao.MemberDao;
import com.dh.hobbyist.memberUpdate.model.vo.Member;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class MemberService {
	

	
	//회원 정보 수정 목록 메소드(재선)
	   public List<Member> UpdateMemberList(){
	      Connection con = getConnection();
	      
	      List<Member> UpdateMemberList = new MemberDao().UpdateMemberList(con);
	      
	      close(con);
	      return UpdateMemberList;
	   }
	   
	public Member memberUpdate(Member member) {
		Connection con = getConnection();
		Member memberUpdate = new MemberDao().memberUpdate(con, member);
		close(con);
		return memberUpdate;
	}
	   

	
}
