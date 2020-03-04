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
		String fileName = MemberDao.class.getResource("/sql/member/memberUpdate-query.properties").getPath();
		System.out.println(fileName);
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	
	
	
	
		//회원 정보수정
	   public int memberUpdate(Connection con, Member member) {
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   
		   int memberUpdate = 0;
		   
		   String query = prop.getProperty("memberUpdate");
		   
		   System.out.println(member.getMemberId());
		   System.out.println(member.getMemberPwd());
		   System.out.println(member.getEmail());
		   System.out.println(member.getPhone());
		   System.out.println(member.getBankName());
		   System.out.println(member.getBankNum());
		   
		   try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getBankName());
			pstmt.setString(7, member.getBankNum());
			
			
			memberUpdate = pstmt.executeUpdate();
			
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}  
		   return memberUpdate;  
	   }

	   
	   
	public Member pwCheck(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginMember =null;
		
		String query = prop.getProperty("loginSelect");
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getMemberId());
			
			rset = pstmt.executeQuery();
			
			System.out.println(member.getMemberId());
			System.out.println(member.getMemberPwd());
			
			if(rset.next()) {
				loginMember = new Member();
				
				loginMember.setMemberCode(rset.getInt("MEMBER_PK"));
				loginMember.setMemberId(rset.getString("MEMBER_ID"));
				loginMember.setMemberPwd(rset.getString("MEMBER_PWD"));
				loginMember.setMemberName(rset.getString("MEMBER_NAME"));
				loginMember.setPhone(rset.getString("MEMBER_PHONE"));
				loginMember.setEmail(rset.getString("MEMBER_EMAIL"));
				loginMember.setBankName(rset.getString("MEMBER_BANK_NAME"));
				loginMember.setBankOwner(rset.getString("MEMBER_BANK_OWNER"));
				loginMember.setBankNum(rset.getString("MEMBER_BANK_NUM"));
				loginMember.setDel(rset.getInt("MEMBER_DEL"));
				loginMember.setPoint(rset.getInt("MEMBER_POINT"));
				loginMember.setRegDate(rset.getDate("REG_DATE"));
				loginMember.setFirstLogin(rset.getInt("FIRST_LOGIN"));
				loginMember.setWarnings(rset.getInt("WARNINGS"));
				loginMember.setIsArtist(rset.getInt("IS_ARTIST"));
				loginMember.setArtistAccepted(rset.getDate("ARTIST_ACCEPTED"));
				loginMember.setArtistNick(rset.getString("ARTIST_NICK"));
				loginMember.setArtistIntro(rset.getString("ARTIST_INTRO"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		return loginMember;
		
	}






	   
}
