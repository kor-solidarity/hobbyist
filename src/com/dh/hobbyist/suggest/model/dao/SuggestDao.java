package com.dh.hobbyist.suggest.model.dao;

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

import com.dh.hobbyist.suggest.model.vo.PageInfo;
import com.dh.hobbyist.suggest.model.vo.Petition;
import com.dh.hobbyist.suggest.model.vo.Reply;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class SuggestDao {
	private Properties prop = new Properties();
	
	public SuggestDao() {
		String fileName = SuggestDao.class.getResource("/sql/suggest/suggest-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//건의 게시판 등록용 메소드
	public int insertSuggest(Connection con, Petition petition) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSuggest");
		//INSERT INTO LESSON_PETITION VALUES (LESSON_PETITION_SEQ.NEXTVAL, ?, ?, ?, ?, 
		//?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, ?)
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, petition.getNumOfStudents());
			pstmt.setInt(2, petition.getCost());
			pstmt.setInt(3, petition.getNumOfLessons());
			pstmt.setString(4, petition.getLocation());
			pstmt.setDate(5, petition.getRequestedDate());
			pstmt.setString(6, petition.getRequestedDays());
			pstmt.setString(7, petition.getRequestTime());
			pstmt.setString(8, petition.getTitle());
			pstmt.setString(9, petition.getContents());
			pstmt.setInt(10, petition.getPetitionedMember());
			pstmt.setInt(11, petition.getCategoryCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//건의 게시판 전체 조회용 메소드
	public ArrayList<Petition> selectList(Connection con) {
		ArrayList<Petition> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Petition>();
			
			while(rset.next()) {
				Petition p = new Petition();
				p.setPetitionCode(rset.getInt("PETITION_PK"));
				p.setNumOfStudents(rset.getString("NUM_OF_STUDENTS"));
				p.setCost(rset.getInt("COST"));
				p.setNumOfLessons(rset.getInt("NUM_OF_LESSONS"));
				p.setLocation(rset.getString("LOCATION"));
				p.setRequestedDate(rset.getDate("REQUESTED_DATE"));
				p.setRequestedDays(rset.getString("REQUESTED_DAYS"));
				p.setRequestTime(rset.getString("REQUESTED_TIME"));
				p.setTitle(rset.getString("TITLE"));
				p.setContents(rset.getString("CONTENTS"));
				p.setPetitionedTime(rset.getDate("PETITIONED_TIME"));
				p.setWishlisted(rset.getInt("WISHLISTED"));
				p.setViews(rset.getInt("VIEWS"));
				p.setPetitionedMember(rset.getInt("PETITIONED_MEMBER"));
				p.setCategoryCode(rset.getInt("CATEGORY_PK"));
				p.setMemberName(rset.getString("MEMBER_NAME"));
				p.setCategoryParentCode(rset.getInt("PARENT_PK"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	//건의 게시판 갯수 조회용 메소드
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return listCount;
	}
	
	//페이징 처리 포함한 건의게시판 조회용 메소드
	public ArrayList<Petition> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Petition> list = null;
		
		String query = prop.getProperty("selectListWithPaging");
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Petition>();
			
			while(rset.next()) {
				Petition p = new Petition();
				p.setPetitionCode(rset.getInt("PETITION_PK"));
				p.setNumOfStudents(rset.getString("NUM_OF_STUDENTS"));
				p.setCost(rset.getInt("COST"));
				p.setNumOfLessons(rset.getInt("NUM_OF_LESSONS"));
				p.setLocation(rset.getString("LOCATION"));
				p.setRequestedDate(rset.getDate("REQUESTED_DATE"));
				p.setRequestedDays(rset.getString("REQUESTED_DAYS"));
				p.setRequestTime(rset.getString("REQUESTED_TIME"));
				p.setTitle(rset.getString("TITLE"));
				p.setContents(rset.getString("CONTENTS"));
				p.setPetitionedTime(rset.getDate("PETITIONED_TIME"));
				p.setWishlisted(rset.getInt("WISHLISTED"));
				p.setViews(rset.getInt("VIEWS"));
				p.setPetitionedMember(rset.getInt("PETITIONED_MEMBER"));
				p.setCategoryCode(rset.getInt("CATEGORY_PK"));
				p.setMemberName(rset.getString("MEMBER_NAME"));
				p.setCategoryParentCode(rset.getInt("PARENT_PK"));
				p.setReplyCount(rset.getInt("REPLY_COUNT"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	//조회수 증가용 메소드
	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//건의 게시판 하나 조회용 메소드
	public Petition selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Petition p = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Petition();
				p.setPetitionCode(rset.getInt("PETITION_PK"));
				p.setNumOfStudents(rset.getString("NUM_OF_STUDENTS"));
				p.setCost(rset.getInt("COST"));
				p.setNumOfLessons(rset.getInt("NUM_OF_LESSONS"));
				p.setLocation(rset.getString("LOCATION"));
				p.setRequestedDate(rset.getDate("REQUESTED_DATE"));
				p.setRequestedDays(rset.getString("REQUESTED_DAYS"));
				p.setRequestTime(rset.getString("REQUESTED_TIME"));
				p.setTitle(rset.getString("TITLE"));
				p.setContents(rset.getString("CONTENTS"));
				p.setPetitionedTime(rset.getDate("PETITIONED_TIME"));
				p.setWishlisted(rset.getInt("WISHLISTED"));
				p.setViews(rset.getInt("VIEWS"));
				p.setPetitionedMember(rset.getInt("PETITIONED_MEMBER"));
				p.setCategoryCode(rset.getInt("CATEGORY_PK"));
				p.setCategoryName(rset.getString("NODE_NAME"));
				p.setMemberName(rset.getString("MEMBER_NAME"));
				p.setCategoryParentCode(rset.getInt("PARENT_PK"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return p;
	}
	public int insertReply(Connection con, Reply reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reply.getLessonPetitionCode());
			pstmt.setString(2, reply.getReplyContent());
			pstmt.setInt(3, reply.getMemberCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//댓글 전체 조회용 메소드
	public List<Reply> selectReplyList(Connection con, int lessonPetitionCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reply> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lessonPetitionCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Reply>();
			
			while(rset.next()) {
				Reply r = new Reply();
				r.setReplyCode(rset.getInt("REPLY_PK"));
				r.setLessonPetitionCode(rset.getInt("LESSON_PETITION_PK"));
				r.setReplyDate(rset.getDate("REPLY_DATE"));
				r.setReplyContent(rset.getString("REPLY_CONTENT"));
				r.setMemberCode(rset.getInt("MEMBER_PK"));
				r.setDeleted(rset.getInt("DELETED"));
				r.setMemberName(rset.getString("MEMBER_NAME"));
				r.setImageRoot(rset.getString("IMAGE_ROUTE") + "/" + rset.getString("IMAGE_NAME"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	//마이페이지에서 쓰일 내가 등록한 건의 게시판 갯수 조회용 메소드
	public int getMyListCount(Connection con, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("myListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
	}
	
	//마이페이지에 쓰일 내가 등록한 건의 게시판 리스트 조회용 메소드 (페이징 처리)
	public ArrayList<Petition> selectMyList(Connection con, int memberCode, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Petition> list = null;
		
		String query = prop.getProperty("selectMyListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, memberCode);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Petition>();
			
			while(rset.next()) {
				Petition p = new Petition();
				p.setPetitionCode(rset.getInt("PETITION_PK"));
				p.setNumOfStudents(rset.getString("NUM_OF_STUDENTS"));
				p.setCost(rset.getInt("COST"));
				p.setNumOfLessons(rset.getInt("NUM_OF_LESSONS"));
				p.setLocation(rset.getString("LOCATION"));
				p.setRequestedDate(rset.getDate("REQUESTED_DATE"));
				p.setRequestedDays(rset.getString("REQUESTED_DAYS"));
				p.setRequestTime(rset.getString("REQUESTED_TIME"));
				p.setTitle(rset.getString("TITLE"));
				p.setContents(rset.getString("CONTENTS"));
				p.setPetitionedTime(rset.getDate("PETITIONED_TIME"));
				p.setWishlisted(rset.getInt("WISHLISTED"));
				p.setViews(rset.getInt("VIEWS"));
				p.setPetitionedMember(rset.getInt("PETITIONED_MEMBER"));
				p.setCategoryCode(rset.getInt("CATEGORY_PK"));
				p.setMemberName(rset.getString("MEMBER_NAME"));
				p.setCategoryParentCode(rset.getInt("PARENT_PK"));
				p.setReplyCount(rset.getInt("REPLY_COUNT"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	//마이페이지에서 쓰일 나의 댓글 갯수 조회용 메소드
	public int getMyReplyList(Connection con, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("myReplyListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
	}
	
	//마이페이지에 쓰일 나의 댓글 리스트 조회용 메소드 (페이징 처리)
	public ArrayList<Reply> selectMyReplyList(Connection con, int memberCode, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = null;
		
		String query = prop.getProperty("selectMyReplyListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, memberCode);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Reply>();
			
			while(rset.next()) {
				Reply r = new Reply();
				r.setRowNum(rset.getInt("RNUM"));
				r.setReplyCode(rset.getInt("REPLY_PK"));
				r.setLessonPetitionCode(rset.getInt("LESSON_PETITION_PK"));
				r.setPetitionTitle(rset.getString("TITLE"));
				r.setReplyDate(rset.getDate("REPLY_DATE"));
				r.setReplyContent(rset.getString("REPLY_CONTENT"));
				r.setMemberCode(rset.getInt("MEMBER_PK"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	//건의 찜했을 때 등록 메소드
	public int insertWishList(Connection con, int petitionCode, int memberCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWishList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, petitionCode);
			pstmt.setInt(2, memberCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//찜한 건의 취소 했을 때 메소드
	public int deleteWishList(Connection con, int petitionCode, int memberCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteWishList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, petitionCode);
			pstmt.setInt(2, memberCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
