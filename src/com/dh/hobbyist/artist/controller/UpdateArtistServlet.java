package com.dh.hobbyist.artist.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dh.hobbyist.artist.model.service.ArtistService;
import com.dh.hobbyist.common.MyFileRenamePolicy;
import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateArtistServlet
 */
@WebServlet("/update.ar")
public class UpdateArtistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateArtistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root + "static/upload/artist";
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
//			ArrayList<String> saveFiles = new ArrayList<String>();
//			ArrayList<String> originFiles = new ArrayList<String>();
//			
//			Enumeration<String> files = multiRequest.getFileNames();
//			
//			while(files.hasMoreElements()) {
//				String name = files.nextElement();
//				
//				System.out.println("name : " + name);
//				
//				saveFiles.add(multiRequest.getFilesystemName(name));
//				originFiles.add(multiRequest.getOriginalFileName(name));
//			}
			
			//로그인 회원의 pk값
			String memberPk = multiRequest.getParameter("reLoginMemberPk");
			
			//첨부 파일 & 이미지 파일
			ArrayList<Image> fileList = new ArrayList<Image>();
			
//			for(int i = originFiles.size() - 1; i >= 0; i--) {
//				if(saveFiles.get(i) != null) {
//					
//					Image img = new Image();
//					img.setImageRoute("/hobbyist/static/upload/artist");
//					img.setImageName(saveFiles.get(i));
//					if(i == originFiles.size() - 1) {
//						img.setImageType("profile");
//					} else {
//						img.setImageType("artistproof");
//					}
//					img.setImageFkPk(Integer.parseInt(memberPk));
//					
//					fileList.add(img);
//				}
//			}
			
//			System.out.println(fileList);
			System.out.println("memberPk : " + memberPk);
			
			//아티스트 증멸 파일 과 프로필 사진 처리
//			int imageResult = new ArtistService().updateImage(fileList);
//			
//			if(imageResult > 0) {
//				
//			} else {
//				for(int i = 0; i <saveFiles.size(); i++) {
//					File failedFile = new File(savePath + saveFiles.get(i));
//					failedFile.delete();
//				}
//			}
			
			// 01. 자기소게에서 받아오는 input
			String reNickName = multiRequest.getParameter("reNickName");
			String reBankName = multiRequest.getParameter("reBankName");
			String reBankNum = multiRequest.getParameter("reBankNum");
			String reIntroduce = multiRequest.getParameter("reIntroduce");
			
			Member requestMember = new Member();
			requestMember.setMemberCode(Integer.parseInt(memberPk));
			requestMember.setArtistNick(reNickName);
			requestMember.setBankName(reBankName);
			requestMember.setBankNum(reBankNum);
			requestMember.setArtistIntro(reIntroduce);
			
			//MEMBER 업데이트
//			int memberResult = new ArtistService().updateMember(requestMember);
			
			//"02. 전문분야" 에서 받아오는 input
			String reDetailCategory1 = multiRequest.getParameter("reDetailCategory1");
			String reDetailCategory2 = multiRequest.getParameter("reDetailCategory2");
			String reDetailCategory3 = multiRequest.getParameter("reDetailCategory3");
			
			System.out.println("reDetailCategory1 : " + reDetailCategory1);
			System.out.println("reDetailCategory2 : " + reDetailCategory2);
			System.out.println("reDetailCategory3 : " + reDetailCategory3);
//			String[] details = {reDetailCategory1, reDetailCategory2, reDetailCategory3};
			
			//아티스트 전문분야 처리
//			int categoryResult = 
//						new ArtistService().updateCategory(memberPk, details);
			
			//"03. 보유 자격증" 에서 받아오는 input
			String reCertiName1 = multiRequest.getParameter("reCertiName1");
			String reCertiDay1 = multiRequest.getParameter("reCertiDay1");
			String reCertiSpace1 = multiRequest.getParameter("reCertiSpace1");
			
			String reCertiName2 = multiRequest.getParameter("reCertiName2");
			String reCertiDay2 = multiRequest.getParameter("reCertiDay2");
			String reCertiSpace2 = multiRequest.getParameter("reCertiSpace2");
			
			String reCertiName3 = multiRequest.getParameter("reCertiName3");
			String reCertiDay3 = multiRequest.getParameter("reCertiDay3");
			String reCertiSpace3 = multiRequest.getParameter("reCertiSpace3");
			
//			String[] certiNames = {reCertiName1, reCertiName2, reCertiName3};
//			String[] certiDays = {reCertiDay1, reCertiDay2, reCertiDay3};
//			String[] certiSpaces = {reCertiSpace1, reCertiSpace2, reCertiSpace3};
//			
//			HashMap<String, String[]> certsMap = new HashMap<String, String[]>();
//			certsMap.put("certiNames", certiNames);
//			certsMap.put("certiDays", certiDays);
//			certsMap.put("certiSpaces", certiSpaces);
			
			
			//아티스트 보유 자격증 처리
//			int certiResult = new ArtistService().updateCerts(memberPk, certsMap);
			
			
			//"04. 학력/전공" 에서 받아오는 input
			String reSchoolName1 = multiRequest.getParameter("reSchoolName1");
			String reMajor1 = multiRequest.getParameter("reMajor1");
			String reStatus1 = multiRequest.getParameter("reStatus1");
			
			String reSchoolName2 = multiRequest.getParameter("reSchoolName2");
			String reMajor2 = multiRequest.getParameter("reMajor2");
			String reStatus2 = multiRequest.getParameter("reStatus2");
			
			String reSchoolName3 = multiRequest.getParameter("reSchoolName3");
			String reMajor3 = multiRequest.getParameter("reMajor3");
			String reStatus3 = multiRequest.getParameter("reStatus3");
			
//			String[] schoolNames = {reSchoolName1, reSchoolName2, reSchoolName3};
//			String[] majors = {reMajor1, reMajor2, reMajor3};
//			String[] statuses = {reStatus1, reStatus2, reStatus3};
//			
//			HashMap<String, String[]> eduMap = new HashMap<String, String[]>();
//			eduMap.put("schoolNames", schoolNames);
//			eduMap.put("majors", majors);
//			eduMap.put("statuses", statuses);
			
			
			//아티스트 학력/전공 처리
//			int eduResult = new ArtistService().updateEdu(memberPk, eduMap);
			
			//"05. 경력" 에서 받아오는 input
			String reOfficeName1 = multiRequest.getParameter("reOfficeName1");
			String rePosition1 = multiRequest.getParameter("rePosition1");
			String reWorkContent1 = multiRequest.getParameter("reWorkContent1");
			String reWorkYear1 = multiRequest.getParameter("reWorkYear1");
			String reWorkMonth1 = multiRequest.getParameter("reWorkMonth1");
			
			String reOfficeName2 = multiRequest.getParameter("reOfficeName2");
			String rePosition2 = multiRequest.getParameter("rePosition2");
			String reWorkContent2 = multiRequest.getParameter("reWorkContent2");
			String reWorkYear2 = multiRequest.getParameter("reWorkYear2");
			String reWorkMonth2 = multiRequest.getParameter("reWorkMonth2");
			
			String reOfficeName3 = multiRequest.getParameter("reOfficeName3");
			String rePosition3 = multiRequest.getParameter("rePosition3");
			String reWorkContent3 = multiRequest.getParameter("reWorkContent3");
			String reWorkYear3 = multiRequest.getParameter("reWorkYear3");
			String reWorkMonth3 = multiRequest.getParameter("reWorkMonth3");
			
//			String[] officeNames = {reOfficeName1, reOfficeName2, reOfficeName3};
//			String[] positions = {rePosition1, rePosition2, rePosition3};
//			String[] workContents = {reWorkContent1, reWorkContent2, reWorkContent3};
//			String[] workYears = {reWorkYear1, reWorkYear2, reWorkYear3};
//			String[] workMonths = {reWorkMonth1, reWorkMonth2, reWorkMonth3};
			
//			HashMap<String, String[]> careerMap = new HashMap<String, String[]>();
//			careerMap.put("officeNames", officeNames);
//			careerMap.put("positions", positions);
//			careerMap.put("workContents", workContents);
//			careerMap.put("workYears", workYears);
//			careerMap.put("workMonths", workMonths);
			
			
			//아티스트 경력 처리
//			int careerResult = new ArtistService().updateCareer(memberPk, careerMap);
			
			int totalResult = 0;
			
			//모든 사항 등록 시 신청내역 등록
//			if(categoryResult > 0 && memberResult > 0) {
//				totalResult = new ArtistService().insertApply(memberPk);
//			}
			
			
//			String page = "";
//			
//			if(totalResult > 0) {
//				page = "views/common/successPage.jsp";
//				request.setAttribute("successCode", "applyArtist");
//			} else {
//				page = "views/common/errorPage.jsp";
//				request.setAttribute("msg", "아티스트 등록 실패");
//			}
//			request.getRequestDispatcher(page).forward(request, response);
			
		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
