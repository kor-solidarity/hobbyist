package com.dh.hobbyist.artist.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.dh.hobbyist.artist.model.vo.ApplyArtist;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class ArtistAdminDao {
	private Properties prop = new Properties();
	
	public ArtistAdminDao() {
		String fileName = ArtistAdminDao.class.getResource("/sql/artist/artist-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//아티스트 신청 내역 전체 조회
	public ArrayList<ApplyArtist> selectApplyList(Connection con) {
		ArrayList<ApplyArtist> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectApplyList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<ApplyArtist>();
			
			while(rset.next()) {
				ApplyArtist aa = new ApplyArtist();
				aa.setApplyCode(rset.getInt("APPLY_PK"));
				aa.setApplyDate(rset.getDate("APPLY_DATE"));
				aa.setApplyAttempts(rset.getInt("APPLY_ATTEMPTS"));
				aa.setApplyConfirmed(rset.getInt("APPLY_CONFIRMED"));
				aa.setRejectReason(rset.getString("REJECT_REASON"));
				aa.setApplyMember(rset.getInt("APPLY_MEMBER"));
				aa.setApplyMemberId(rset.getString("MEMBER_ID"));
				
				list.add(aa);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

}
