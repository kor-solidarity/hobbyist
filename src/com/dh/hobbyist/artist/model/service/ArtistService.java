package com.dh.hobbyist.artist.model.service;

import java.sql.Connection;
import java.util.HashMap;

import com.dh.hobbyist.artist.model.dao.ArtistDao;

import static com.dh.hobbyist.common.JDBCTemplate.*;
public class ArtistService {

	//아티스트 닉네임 중복체크 메소드
	public int nickCheck(String nick) {
		Connection con = getConnection();
		
		int result = new ArtistDao().nickCheck(con, nick);
		
		close(con);
		
		return result;
	}

	//아티스트 전문 카테고리 삽입 메소드 
	public int insertCategory(String memberPk, String[] details) {
		Connection con = getConnection();
		
		int result = new ArtistDao().insertCategory(con, memberPk, details);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//아티스트 자격증 삽입 메소드
	public int insertCerts(String memberPk, HashMap<String, String[]> certsMap) {
		Connection con = getConnection();
		
		int result = new ArtistDao().insertCerts(con, memberPk, certsMap);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//학력/전공 삽입 메소드
	public int insertEdu(String memberPk, HashMap<String, String[]> eduMap) {
		Connection con = getConnection();
		
		int result = new ArtistDao().insertEdu(con, memberPk, eduMap);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//경력 삽입 메소드
	public int insertCareer(String memberPk, HashMap<String, String[]> careerMap) {
		Connection con = getConnection();
		
		int result = new ArtistDao().insertCareer(con, memberPk, careerMap);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	

}
