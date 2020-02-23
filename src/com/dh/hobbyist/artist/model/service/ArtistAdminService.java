package com.dh.hobbyist.artist.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dh.hobbyist.artist.model.dao.ArtistAdminDao;
import com.dh.hobbyist.artist.model.vo.ApplyArtist;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class ArtistAdminService {

	//아티스트 신청 내역 전체 조회
	public ArrayList<ApplyArtist> selectApplyList() {
		Connection con = getConnection();
		
		ArrayList<ApplyArtist> list = new ArtistAdminDao().selectApplyList(con);
		
		close(con);
		
		return list;
	}

}
