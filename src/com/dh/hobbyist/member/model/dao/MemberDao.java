package com.dh.hobbyist.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.dh.hobbyist.member.model.vo.Member;
import static com.dh.hobbyist.common.JDBCTemplate.*;

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

	public int insertMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member loginCheck(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginMember = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginMember = new Member();
				
				loginMember.setMemberCode(rset.getInt("MEMBER_CODE"));
				loginMember.setMemberId(rset.getString("MEMBER_ID"));
				loginMember.setMemberPwd(rset.getString("MEMBER_PWD"));
				loginMember.setMemberName(rset.getString("MEMBER_NAME"));
				loginMember.setPhone(rset.getString("MEMBER_PHONE"));
				loginMember.setEmail(rset.getString("MEMBER_EMAIL"));
				loginMember.setBankName(rset.getString("MEMBER_BANK_NAME"));
				loginMember.setBankNum(rset.getString("MEMBER_BANK_NUM"));
				loginMember.setDel(rset.getInt("MEMBER_DEL"));
				loginMember.setPoints(rset.getInt("MEMBER_POINTS"));
				loginMember.setRegDate(rset.getDate("REG_DATE"));
				loginMember.setFirstLogin(rset.getInt("FIRST_LOGIN"));
				loginMember.setWarnings(rset.getInt("WARNINGS"));
				loginMember.setIsArtist(rset.getInt("IS_ARTIST"));
				loginMember.setArtistAccepted(rset.getDate("ARTIST_ACCEPTED"));
				
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
