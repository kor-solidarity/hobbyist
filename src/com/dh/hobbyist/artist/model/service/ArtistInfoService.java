package com.dh.hobbyist.artist.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.close;
import static com.dh.hobbyist.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.dh.hobbyist.artist.model.dao.ArtistInfoDao;
import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistCerts;

public class ArtistInfoService {

	public ArrayList<ArtistCerts> selectCerts(int aCode) {
		Connection con = getConnection();
		
		ArrayList<ArtistCerts> list = new ArtistInfoDao().selectCerts(con, aCode);

		close(con);
		
		return list;
	}

	public ArrayList<ArtistCareer> selectCareer(int aCode) {
		Connection con = getConnection();
		
		ArrayList<ArtistCareer> list = new ArtistInfoDao().selectCareer(con, aCode);
		
		close(con);
		
		return list;
	}

}
