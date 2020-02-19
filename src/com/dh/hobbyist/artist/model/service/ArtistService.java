package com.dh.hobbyist.artist.model.service;

import java.sql.Connection;

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

}
