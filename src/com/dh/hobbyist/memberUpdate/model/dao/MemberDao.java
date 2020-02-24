package com.dh.hobbyist.memberUpdate.model.dao;

import static com.dh.hobbyist.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.dh.hobbyist.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	 //회원정보 수정 메소드 (재선)
	   public List<Member> UpdateMemberList(Connection con) {
	      Statement stmt =null;
	      ResultSet rset =null;
	      List<Member> memberList = null;
	      
	      String query = prop.getProperty("updateMemberList");
	      
	      try {
	         stmt = con.createStatement();
	         rset = stmt.executeQuery(query);
	         
	         memberList = new ArrayList<Member>();
	         
	         while(rset.next()) {
	            Member m = new Member();
	            m.setMemberId(rset.getString("MEMBER_ID"));
	            m.setMemberName(rset.getString("MEMBER_NAME"));
	            m.setEmail(rset.getString("MEMBER_EMAIL"));
	            m.setPhone(rset.getString("MEMBER_PHONE"));
	            m.setPhone(rset.getString("MEMBER_PWD"));
	            memberList.add(m);
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(stmt);
	         close(rset);
	      }
	      return memberList;   
	   }
}
