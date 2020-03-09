package com.dh.hobbyist.artist.model.dao;

import static com.dh.hobbyist.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistCategory;
import com.dh.hobbyist.artist.model.vo.ArtistCerts;
import com.dh.hobbyist.artist.model.vo.ArtistEducation;

public class ArtistInfoDao {
	private Properties prop = new Properties();
	
	public ArtistInfoDao() {
		String fileName = ArtistInfoDao.class.getResource("/sql/artist/artist-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ArtistCerts> selectCerts(Connection con, int aCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArtistCerts> list = null;
		ArtistCerts ac = null;
		
		//System.out.println("aCode : " + aCode);
		
		String query = prop.getProperty("selectCerts");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, aCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ArtistCerts>();
			
			while(rset.next()) {
				ac = new ArtistCerts();
				ac.setCertCode(rset.getInt("CERT_PK"));
				ac.setCertName(rset.getString("CERT_NAME"));
				ac.setCertDate(rset.getDate("CERT_DATE"));
				ac.setCertOrg(rset.getString("CERT_ORG"));
				ac.setMemberPk(rset.getInt("MEMBER_PK"));
				
				//System.out.println("ac : " + ac);
				
				list.add(ac);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<ArtistCareer> selectCareer(Connection con, int aCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArtistCareer> list = null;
		ArtistCareer ac = null;
				
		String query = prop.getProperty("selectCareer");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, aCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ArtistCareer>();
			
			while(rset.next()) {
				ac = new ArtistCareer();
				ac.setRecCode(rset.getInt("REC_PK"));
				ac.setOrgName(rset.getString("ORG_NAME"));
				ac.setRank(rset.getString("RANK"));
				ac.setOccupation(rset.getString("OCCUPATION"));
				ac.setOccupationTerm(rset.getString("OCCUPATION_TERM"));
				ac.setMemberPk(rset.getInt("MEMBER_PK"));
				
				//System.out.println(rset.getString("OCCUPATION_TERM"));
				//System.out.println("ac.getOccupationTerm() : " + ac.getOccupationTerm());
				
				list.add(ac);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<ArtistEducation> selectEducation(Connection con, int artistCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArtistEducation> list = null;
		ArtistEducation ae = null;
				
		String query = prop.getProperty("selectEducation");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, artistCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ArtistEducation>();
			
			while(rset.next()) {
				ae = new ArtistEducation();
				ae.setEduCode(rset.getInt("EDU_PK"));
				ae.setEduInsitituteName(rset.getString("EDU_INSTITUTE_NAME"));
				ae.setEduMajor(rset.getString("EDU_MAJOR"));
				ae.setStatus(rset.getInt("STATUS"));
				ae.setMemberPk(rset.getInt("MEMBER_PK"));
				
				list.add(ae);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<ArtistCategory> selectCategory(Connection con, int artistCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArtistCategory> list = null;
		ArtistCategory ac = null;
		
		String query = prop.getProperty("selectCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, artistCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ArtistCategory>();
			
			while(rset.next()) {
				ac = new ArtistCategory();
				ac.setCategoryCode(rset.getInt("CATEGORY_PK"));
				ac.setCategoryName(rset.getString("NODE_NAME"));
				ac.setCategoryParentCode(rset.getInt("PARENT_PK"));
				
				list.add(ac);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}














