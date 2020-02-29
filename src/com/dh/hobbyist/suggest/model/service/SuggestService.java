package com.dh.hobbyist.suggest.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.dh.hobbyist.suggest.model.dao.SuggestDao;
import com.dh.hobbyist.suggest.model.vo.PageInfo;
import com.dh.hobbyist.suggest.model.vo.Petition;
import com.dh.hobbyist.suggest.model.vo.Reply;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class SuggestService {

	//건의 게시판 등록용 메소드
	public int insertSuggest(Petition petition) {
		Connection con = getConnection();
		
		int result = new SuggestDao().insertSuggest(con, petition);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	//건의 게시판 리스트 조회용 메소드
	public ArrayList<Petition> selectList() {
		Connection con = getConnection();
		
		ArrayList<Petition> result = new SuggestDao().selectList(con);
		
		close(con);
		
		return result;
	}

	//건의 게시판 갯수 조회용 메소드
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new SuggestDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//페이징 처리 포함한 건의게시판 조회용 메소드
	public ArrayList<Petition> selectList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Petition> list = new SuggestDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}

	//건의게시판 하나 조회용 메소드
	public Petition selectOne(int num) {
		Connection con = getConnection();
		
		int result = new SuggestDao().updateCount(con, num);
		Petition p = null;
		
		if(result > 0) {
			commit(con);
			p = new SuggestDao().selectOne(con, num);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return p;
	}

	//댓글 등록용 메소드
	public List<Reply> insertReply(Reply reply) {
		Connection con = getConnection();
		List<Reply> replyList = null;
		
		int result = new SuggestDao().insertReply(con, reply);
		
		if(result > 0) {
			commit(con);
			replyList = new SuggestDao().selectReplyList(con, reply.getLessonPetitionCode());
		} else {
			rollback(con);
		}
		
		close(con);
		
		return replyList;
	}

	public List<Reply> selectReplyList(int lessonPetitionCode) {
		Connection con = getConnection();
		List<Reply> replyList = null;
		
		replyList = new SuggestDao().selectReplyList(con, lessonPetitionCode);
		
		close(con);
		
		return replyList;
	}

	//마이페이지에서 쓰일 내가 등록한 건의 게시판 갯수 조회용 메소드
	public int getMyListCount(int memberCode) {
		Connection con = getConnection();
		
		int listCount = new SuggestDao().getMyListCount(con, memberCode);
		
		close(con);
		
		return listCount;
	}

	//마이페이지에 쓰일 내가 등록한 건의 게시판 리스트 조회용 메소드 (페이징 처리)
	public ArrayList<Petition> selectMyList(int memberCode, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Petition> list = new SuggestDao().selectMyList(con, memberCode, pi);
		
		close(con);
		
		return list;
	}

	//마이페이지에서 쓰일 나의 댓글 갯수 조회용 메소드
	public int getMyReplyList(int memberCode) {
		Connection con = getConnection();
		
		int listCount = new SuggestDao().getMyReplyList(con, memberCode);
		
		close(con);
		
		return listCount;
	}

	//마이페이지에 쓰일 나의 댓글 리스트 조회용 메소드 (페이징 처리)
	public ArrayList<Reply> selectMyReplyList(PageInfo pi, int memberCode) {
		Connection con = getConnection();
		
		ArrayList<Reply> list = new SuggestDao().selectMyReplyList(con, memberCode, pi);
		
		close(con);
		
		return list;
	}
}
