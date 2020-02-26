package com.dh.hobbyist.artist.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistCategory;
import com.dh.hobbyist.artist.model.vo.ArtistCerts;
import com.dh.hobbyist.artist.model.vo.ArtistEducation;
import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.member.model.vo.Member;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class ArtistDao {

	private Properties prop = new Properties();
	
	public ArtistDao() {
		String fileName = ArtistDao.class.getResource("/sql/artist/artist-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int nickCheck(Connection con, String nick) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("nickCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nick);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}
	
	//아티스트 전문 카테고리 등록 메소드 
	public int insertCategory(Connection con, String memberPk, String[] details) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCategory");
		
		try {
			
			for(int i = 0; i < details.length; i++) {
				
				if(!details[i].equals("")) {
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, Integer.parseInt(memberPk));
					pstmt.setInt(2, Integer.parseInt(details[i]));
					result = pstmt.executeUpdate();
				}
				
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//아티스트 자격증 등록 메소드
	public int insertCerts(Connection con, String memberPk, HashMap<String, String[]> certsMap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCerts");
		
		String[] certiNames = certsMap.get("certiNames");
		String[] certiDays = certsMap.get("certiDays");
		String[] certiSpaces = certsMap.get("certiSpaces");
		
		
		try {
			for(int i = 0; i < 3; i++) {
				if(!certiNames[i].equals("") && !certiDays[i].equals("") && !certiSpaces[i].equals("")) {
					
					Date certsDate = Date.valueOf(certiDays[i]);
					
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, certiNames[i]);
					pstmt.setDate(2, certsDate);
					pstmt.setString(3, certiSpaces[i]);
					pstmt.setInt(4, Integer.parseInt(memberPk));
					result = pstmt.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 학력/전공 등록 메소드
	public int insertEdu(Connection con, String memberPk, HashMap<String, String[]> eduMap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertEdu");
		
		String[] schoolNames = eduMap.get("schoolNames");
		String[] majors = eduMap.get("majors");
		String[] statuses = eduMap.get("statuses");
		
		try {
			for(int i = 0; i < 3; i++) {
				if(!schoolNames[i].equals("") && !majors[i].equals("") && !statuses[i].equals("")) {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, schoolNames[i]);
					pstmt.setString(2, majors[i]);
					if(statuses[i].equals("inSchool")) {
						pstmt.setInt(3, 0);
					} else if(statuses[i].equals("graduate")) {
						pstmt.setInt(3, 1);
					}
					pstmt.setInt(4, Integer.parseInt(memberPk));
					result = pstmt.executeUpdate();
				}
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//경력 등록 메소드
	public int insertCareer(Connection con, String memberPk, HashMap<String, String[]> careerMap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCareer");
		
		String[] officeNames = careerMap.get("officeNames");
		String[] positions = careerMap.get("positions");
		String[] workContents = careerMap.get("workContents");
		String[] workYears = careerMap.get("workYears");
		String[] workMonths = careerMap.get("workMonths");
		
		try {
					
				for(int i = 0; i < 3; i++) {
						
					if(!officeNames[i].equals("") && !positions[i].equals("") && !workContents[i].equals("") && !workYears[i].equals("") && !workMonths[i].equals("")) {
						
						String term = workYears[i] + "년 " + workMonths[i] +"개월"; 
						
						pstmt = con.prepareStatement(query);
						pstmt.setString(1, officeNames[i]);
						pstmt.setString(2, positions[i]);
						pstmt.setString(3, workContents[i]);
						pstmt.setString(4, term);
						pstmt.setInt(5, Integer.parseInt(memberPk));
						result = pstmt.executeUpdate();
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		return result;
	}

	//member 테이블에서 아티스트 닉네임과 아티스트 소개, 계좌번호 업데이트
	public int updateMember(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getArtistNick());
			pstmt.setString(2, requestMember.getArtistIntro());
			pstmt.setString(3, requestMember.getBankName());
			pstmt.setInt(4, requestMember.getMemberCode());
			pstmt.setString(5, requestMember.getBankNum());
			pstmt.setInt(6, requestMember.getMemberCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//프로필 사진 파일과 학력, 자격증 파일 등록
	public int insertImage(Connection con, Image image) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertImage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, image.getImageRoute());
			pstmt.setString(2, image.getImageName());
			pstmt.setString(3, image.getImageType());
			pstmt.setInt(4, image.getImageFkPk());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	//신청내역 수 조회용 
	public int selectApplyCount(Connection con, String memberPk) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectApplyCount"); 
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberPk));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int insertApply(Connection con, String memberPk, int count) {
		PreparedStatement pstmt = null;
		int result = 0;
		int attempt = count + 1;
		
		String query = prop.getProperty("insertApply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, attempt);
			pstmt.setInt(2, Integer.parseInt(memberPk));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member selectOneArtist(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = prop.getProperty("selectOneArtist");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setArtistNick(rset.getString("ARTIST_NICK"));
				m.setArtistIntro(rset.getString("ARTIST_INTRO"));
				m.setBankName(rset.getString("MEMBER_BANK_NAME"));
				m.setBankOwner(rset.getString("MEMBER_BANK_OWNER"));
				m.setBankNum(rset.getString("MEMBER_BANK_NUM"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public List<Image> selectImageList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Image> imgList = null;
		
		String query = prop.getProperty("selectImageList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			imgList = new ArrayList<Image>();
			
			while(rset.next()) {
				Image img = new Image();
				img.setImageCode(rset.getInt("IMAGE_PK"));
				img.setImageRoute(rset.getString("IMAGE_ROUTE"));
				img.setImageName(rset.getString("IMAGE_NAME"));
				img.setImageType(rset.getString("IMAGE_TYPE"));
				
				imgList.add(img);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return imgList;
	}

	public List<ArtistCategory> selectArtistCategoryList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ArtistCategory> arCatList = null;
		
		String query = prop.getProperty("selectArtistCategoryList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			arCatList = new ArrayList<ArtistCategory>();
			
			while(rset.next()) {
				ArtistCategory ac = new ArtistCategory();
				ac.setCategoryCode(rset.getInt("CATEGORY_PK"));
				ac.setCategoryParentCode(rset.getInt("PARENT_PK"));
				ac.setCategoryName(rset.getString("NODE_NAME"));
				
				arCatList.add(ac);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return arCatList;
	}

	public List<ArtistCerts> selectArtistCertsList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ArtistCerts> arCertsList = null;
		
		String query = prop.getProperty("selectArtistCertsList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			arCertsList = new ArrayList<ArtistCerts>();
			
			while(rset.next()) {
				ArtistCerts ac = new ArtistCerts();
				ac.setCertCode(rset.getInt("CERT_PK"));
				ac.setCertName(rset.getString("CERT_NAME"));
				ac.setCertDate(rset.getDate("CERT_DATE"));
				ac.setCertOrg(rset.getString("CERT_ORG"));
				
				arCertsList.add(ac);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return arCertsList;
	}

	public List<ArtistEducation> selectArtistEduList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ArtistEducation> arEduList = null;
		
		String query = prop.getProperty("selectArtistEduList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			arEduList = new ArrayList<ArtistEducation>();
			
			while(rset.next()) {
				ArtistEducation ae = new ArtistEducation();
				ae.setEduCode(rset.getInt("EDU_PK"));
				ae.setEduInsitituteName(rset.getString("EDU_INSTITUTE_NAME"));
				ae.setEduMajor(rset.getString("EDU_MAJOR"));
				ae.setStatus(rset.getInt("STATUS"));
				
				arEduList.add(ae);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return arEduList;
	}

	public List<ArtistCareer> selectArtistCareerList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ArtistCareer> arCareerList = null;
		
		String query = prop.getProperty("selectArtistCareerList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			arCareerList = new ArrayList<ArtistCareer>();
			
			while(rset.next()) {
				ArtistCareer ac = new ArtistCareer();
				ac.setRecCode(rset.getInt("REC_PK"));
				ac.setOrgName(rset.getString("ORG_NAME"));
				ac.setRank(rset.getString("RANK"));
				ac.setOccupation(rset.getString("OCCUPATION"));
				ac.setOccupationTerm(rset.getString("OCCUPATION_TERM"));
				
				arCareerList.add(ac);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return arCareerList;
	}

	public Image selectOneImage(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Image img = null;
		
		String query = prop.getProperty("selectOneImage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				img = new Image();
				img.setImageRoute(rset.getString("IMAGE_ROUTE"));
				img.setImageName(rset.getString("IMAGE_NAME"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return img;
	}

	
	public int updateApplyConfirmed(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateApplyConfirmed");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateArtistAccepted(Connection con, int memCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateArtistAccepted");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateRejectReason(Connection con, int applyCode, String rejectReason) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateRejectReason");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rejectReason);
			pstmt.setInt(2, applyCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

}
