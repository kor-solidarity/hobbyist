package com.dh.hobbyist.member.model.dao;

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

	public int idCheck(Connection con, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}
	
	//관리자에서 회원리스트 조회용 메소드 (찬영)
	public List<Member> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		List<Member> memberList = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			memberList = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberCode(rset.getInt("MEMBER_PK"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setPhone(rset.getString("MEMBER_PHONE"));
				m.setEmail(rset.getString("MEMBER_EMAIL"));
				m.setIsArtist(rset.getInt("IS_ARTIST"));
				m.setWarnings(rset.getInt("WARNINGS"));
				m.setRegDate(rset.getDate("REG_DATE"));
				
				memberList.add(m);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return memberList;
	}
	
	//관리자에서 아티스트 정보 조회용 메소드 (찬영)
	public List<Member> selectArtistList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		List<Member> artistList = null;
		
		String query = prop.getProperty("selectArtistList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			artistList = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberCode(rset.getInt("MEMBER_PK"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setArtistNick(rset.getString("ARTIST_NICK"));
				m.setPhone(rset.getString("MEMBER_PHONE"));
				m.setEmail(rset.getString("MEMBER_EMAIL"));
				m.setBankName(rset.getString("MEMBER_BANK_NAME"));
				m.setBankOwner(rset.getString("MEMBER_BANK_OWNER"));
				m.setBankNum(rset.getString("MEMBER_BANK_NUM"));
				m.setArtistAccepted(rset.getDate("ARTIST_ACCEPTED"));
				
				artistList.add(m);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return artistList;
	}

}
