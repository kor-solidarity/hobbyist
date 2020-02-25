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

import com.dh.hobbyist.memberUpdate.model.vo.*;

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
	            m.setMemberCode(rset.getInt("MEMBER_PK"));
	            m.setMemberId(rset.getString("MEMBER_ID"));
	            m.setPhone(rset.getString("MEMBER_PWD"));
	            m.setMemberName(rset.getString("MEMBER_NAME"));
	            m.setEmail(rset.getString("MEMBER_EMAIL"));
	            m.setPhone(rset.getString("MEMBER_PHONE"));
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
	   
	   public Member memberUpdate(Connection con, Member member) {
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   
		   Member memberUpdate = null;
		
		   String query = prop.getProperty("memberUpdate");
		   
		   try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(0, member.getMemberCode());
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberUpdate  = new Member();
				memberUpdate.setMemberCode(rset.getInt("MEMBER_PK"));
				memberUpdate.setMemberId(rset.getString("MEMBER_ID"));
				memberUpdate.setMemberPwd(rset.getString("MEMBER_PWD"));
				memberUpdate.setMemberName(rset.getString("MEMBER_NAME"));
				memberUpdate.setPhone(rset.getString("MEMBER_PHONE"));
				memberUpdate.setEmail(rset.getString("MEMBER_EAMAIL"));
				memberUpdate.setBankName(rset.getString("MEMBER_BANK_NAME"));
				memberUpdate.setBankOwner(rset.getString("MEMBER_BANK_NAME"));
				memberUpdate.setBankNum(rset.getString("MEMBER_BANK_NUM"));
				memberUpdate.setDel(rset.getInt("MEBER_DEL"));
				memberUpdate.setPoint(rset.getInt("MEMBEER_POINT"));
				memberUpdate.setRegDate(rset.getDate("REG_DATE"));
				memberUpdate.setFirstLogin(rset.getInt("FIRST_LOGIN"));
				memberUpdate.setWarnings(rset.getInt("WRANINGS"));
				memberUpdate.setIsArtist(rset.getInt("IS_ARTIST"));
				memberUpdate.setArtistAccepted(rset.getDate("ARTIST_ACCEPTED"));
				memberUpdate.setArtistNick(rset.getString("ARTIST_NICK"));
				memberUpdate.setArtistIntro(rset.getString("ARTIST_INTRO"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}  
		   return memberUpdate;  
	   }
	   
	   
	   
}
