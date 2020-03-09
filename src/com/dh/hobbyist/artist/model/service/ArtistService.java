package com.dh.hobbyist.artist.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistCategory;
import com.dh.hobbyist.artist.model.vo.ArtistCerts;
import com.dh.hobbyist.artist.model.vo.ArtistEducation;
import com.dh.hobbyist.artist.model.dao.ArtistDao;
import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.member.model.vo.Member;

import static com.dh.hobbyist.common.JDBCTemplate.*;
public class ArtistService {

	//아티스트 닉네임 중복체크 메소드
	public int nickCheck(String nick) {
		Connection con = getConnection();
		
		int result = new ArtistDao().nickCheck(con, nick);
		
		close(con);
		
		return result;
	}

	//아티스트 전문 카테고리 등록 메소드 
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

	//아티스트 자격증 등록 메소드
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

	//학력/전공 등록 메소드
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

	//경력 등록 메소드
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

	//member 테이블에서 아티스트 닉네임과 아티스트 소개, 계좌번호 업데이트
	public int updateMember(Member requestMember) {
		Connection con = getConnection();
		
		int result = new ArtistDao().updateMember(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//프로필 사진 파일과 학력, 자격증 파일 등록
	public int insertImage(ArrayList<Image> fileList) {
		Connection con = getConnection();
		
		int result = 0;
		
		for(int i = 0; i < fileList.size(); i++) {
			result += new ArtistDao().insertImage(con, fileList.get(i));
		}
		
		if(result == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
			result = 0;
		}
		
		return result;
	}

	//아티스트 신청 내역 등록
	public int insertApply(String memberPk) {
		Connection con = getConnection();
		
		int count = new ArtistDao().selectApplyCount(con, memberPk);
		
		int result = new ArtistDao().insertApply(con, memberPk, count);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	//아티스트 신청한 회원 한명 조회
	public Member selectOneArtist(int num) {
		Connection con = getConnection();
		
		Member m = new ArtistDao().selectOneArtist(con, num);
		
		close(con);
		
		return m;
	}

	//아티스트 신청한 회원이 첨부한 이미지 조회
	public List<Image> selectImageList(int num) {
		Connection con = getConnection();
		
		List<Image> imgList = new ArtistDao().selectImageList(con, num);
	
		close(con);
		
		return imgList;
	}

	//아티스트 신청한 회원의 전문분야 조회
	public List<ArtistCategory> selectArtistCategoryList(int num) {
		Connection con = getConnection();
		
		List<ArtistCategory> arCatList = new ArtistDao().selectArtistCategoryList(con, num);
		
		close(con);
		
		return arCatList;
	}

	//아티스트 신청한 회원의 보유자격증 조회
	public List<ArtistCerts> selectArtistCertsList(int num) {
		Connection con = getConnection();
		
		List<ArtistCerts> arCertsList = new ArtistDao().selectArtistCertsList(con, num);
		
		close(con);
		
		return arCertsList;
	}

	//아티스트 신청한 회원의 학력 조회
	public List<ArtistEducation> selectArtistEduList(int num) {
		Connection con = getConnection();
		
		List<ArtistEducation> arEduList = new ArtistDao().selectArtistEduList(con, num);
		
		close(con);
		
		return arEduList;
	}

	//아티스트 신청한 회원의 경력 조회
	public List<ArtistCareer> selectArtistCareerList(int num) {
		Connection con = getConnection();
		
		List<ArtistCareer> arCareerList = new ArtistDao().selectArtistCareerList(con, num);
		
		close(con);
		
		return arCareerList;
	}

	//아티스트 증명 첨부파일  조회
	public Image selectOneImage(int num) {
		Connection con = getConnection();
		
		Image img = new ArtistDao().selectOneImage(con, num);
		
		close(con);
		
		return img;
	}

	//아티스트 승인 처리
	public int permitArtist(int num, int memCode) {
		Connection con = getConnection();
		
		int result1 = new ArtistDao().updateApplyConfirmed(con, num);
		int result2 = 0;
		int result = 0;
		
		if(result1 > 0) {
			result2 = new ArtistDao().updateArtistAccepted(con, memCode);
		}
		if(result2 > 0) {
			result = 1;
		} 
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//아티스트 거절 처리
	public int refuseArtist(int applyCode, String rejectReason) {
		Connection con = getConnection();
		
		int result = new ArtistDao().updateRejectReason(con, applyCode, rejectReason);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	//기존 아티스트 신청내역이 있는 회원의 전문분야 카테고리 업데이트
	public int updateCategory(String memberPk, String[] details) {
		Connection con = getConnection();
		
		int result1 = new ArtistDao().deleteCategory(con, memberPk);
		int result = new ArtistDao().insertCategory(con, memberPk, details);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	//기존 아티스트 신청내역이 있는 회원의 보유 자격증 업데이트
	public int updateCerts(String memberPk, HashMap<String, String[]> certsMap) {
		Connection con = getConnection();
		
		int result1 = new ArtistDao().deleteCerts(con, memberPk);
		int result = new ArtistDao().insertCerts(con, memberPk, certsMap);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	//기존 아티스트 신청내역이 있는 회원의 학력/전공 업데이트
	public int updateEdu(String memberPk, HashMap<String, String[]> eduMap) {
		Connection con = getConnection();
		
		int result1 = new ArtistDao().deleteEdu(con, memberPk);
		int result = new ArtistDao().insertEdu(con, memberPk, eduMap);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	//기존 아티스트 신청내역이 있는 회원의 경력 업데이트
	public int updateCareer(String memberPk, HashMap<String, String[]> careerMap) {
		Connection con = getConnection();
		
		int result1 = new ArtistDao().deleteCareer(con, memberPk);
		int result = new ArtistDao().insertCareer(con, memberPk, careerMap);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	//기존 아티스트 신청내역이 있는 회원의 이미지 업데이트
	public int updateImage(ArrayList<Image> fileList) {
		Connection con = getConnection();
		
		int result = 0;
		
		for(int i = 0; i < fileList.size(); i++) {
			if(fileList.get(i).getImageType() == "profile") {
				result += new ArtistDao().updateImage(con, fileList.get(i));
			} else if(fileList.get(i).getImageType() == "artistproof") {
				result += new ArtistDao().insertImage(con, fileList.get(i));
			}
		}
		
		if(result == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
			result = 0;
		}
		
		return result;
	}


	

	

	

	

}
