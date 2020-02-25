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
import com.dh.hobbyist.artist.model.vo.ApplyArtist;
import com.dh.hobbyist.common.MyFileRenamePolicy;
import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertArtistServlet
 */
@WebServlet("/insert.ar")
public class InsertArtistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertArtistServlet() {
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
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				System.out.println("name : " + name);
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			System.out.println("saveFile : " + saveFiles);
			System.out.println("originFile : " + originFiles);
			
			String memberPk = multiRequest.getParameter("loginMemberPk");

			
			ArrayList<Image> fileList = new ArrayList<Image>();
			
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				if(saveFiles.get(i) != null) {
					
					Image img = new Image();
					img.setImageRoute("/hobbyist/static/upload/artist");
					img.setImageName(saveFiles.get(i));
					if(i == originFiles.size() - 1) {
						img.setImageType("profile");
					} else {
						img.setImageType("artistproof");
					}
					img.setImageFkPk(Integer.parseInt(memberPk));
					
					fileList.add(img);
				}
			}
			
			//아티스트 증멸 파일 과 프로필 사진 처리
			int imageResult = new ArtistService().insertImage(fileList);
			
			if(imageResult > 0) {
				
			} else {
				for(int i = 0; i <saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
			}
			
			
			//"01. 자기소개" 에서 받아오는 input
			String nickName = multiRequest.getParameter("nickName");
			String bankName = multiRequest.getParameter("bankName");
			String bankNum = multiRequest.getParameter("bankNum");
			String introduce = multiRequest.getParameter("introduce");
			
			//"02. 전문분야" 에서 받아오는 input
			String detailCategory = multiRequest.getParameter("detailCategory");
			
			String detailCategory2 = multiRequest.getParameter("detailCategory2");
			
			String detailCategory3 = multiRequest.getParameter("detailCategory3");
			
			String[] details = {detailCategory, detailCategory2, detailCategory3};
			
			//아티스트 전문분야 처리
			int categoryResult 
					= new ArtistService().insertCategory(memberPk, details);
			
			
			
			//"03. 보유 자격증" 에서 받아오는 input
			String certiName1 = multiRequest.getParameter("certiName1");
			String certiDay1 = multiRequest.getParameter("certiDay1");
			String certiSpace1 = multiRequest.getParameter("certiSpace1");
			
			String certiName2 = multiRequest.getParameter("certiName2");
			String certiDay2 = multiRequest.getParameter("certiDay2");
			String certiSpace2 = multiRequest.getParameter("certiSpace2");
			
			String certiName3 = multiRequest.getParameter("certiName3");
			String certiDay3 = multiRequest.getParameter("certiDay3");
			String certiSpace3 = multiRequest.getParameter("certiSpace3");
			
			String[] certiNames = {certiName1, certiName2, certiName3};
			String[] certiDays = {certiDay1, certiDay2, certiDay3};
			String[] certiSpaces = {certiSpace1, certiSpace2, certiSpace3};
			
			HashMap<String, String[]> certsMap = new HashMap<String, String[]>();
			certsMap.put("certiNames", certiNames);
			certsMap.put("certiDays", certiDays);
			certsMap.put("certiSpaces", certiSpaces);
			
			//아티스트 보유 자격증 처리
			int certiResult = new ArtistService().insertCerts(memberPk, certsMap);
			
			
			//"04. 학력/전공" 에서 받아오는 input
			String schoolName1 = multiRequest.getParameter("schoolName1");
			String major1 = multiRequest.getParameter("major1");
			String status1 = multiRequest.getParameter("status1");
			
			String schoolName2 = multiRequest.getParameter("schoolName2");
			String major2 = multiRequest.getParameter("major2");
			String status2 = multiRequest.getParameter("status2");
			
			String schoolName3 = multiRequest.getParameter("schoolName3");
			String major3 = multiRequest.getParameter("major3");
			String status3 = multiRequest.getParameter("status3");
			
			String[] schoolNames = {schoolName1, schoolName2, schoolName3};
			String[] majors = {major1, major2, major3};
			String[] statuses = {status1, status2, status3};
			
			HashMap<String, String[]> eduMap = new HashMap<String, String[]>();
			eduMap.put("schoolNames", schoolNames);
			eduMap.put("majors", majors);
			eduMap.put("statuses", statuses);
			
			//아티스트 학력/전공 처리
			int eduResult = new ArtistService().insertEdu(memberPk, eduMap);
			
			//"05. 경력" 에서 받아오는 input
			String officeName1 = multiRequest.getParameter("officeName1");
			String position1 = multiRequest.getParameter("position1");
			String workContent1 = multiRequest.getParameter("workContent1");
			String workYear1 = multiRequest.getParameter("workYear1");
			String workMonth1 = multiRequest.getParameter("workMonth1");
			
			String officeName2 = multiRequest.getParameter("officeName2");
			String position2 = multiRequest.getParameter("position2");
			String workContent2 = multiRequest.getParameter("workContent2");
			String workYear2 = multiRequest.getParameter("workYear2");
			String workMonth2 = multiRequest.getParameter("workMonth2");
			
			String officeName3 = multiRequest.getParameter("officeName3");
			String position3 = multiRequest.getParameter("position3");
			String workContent3 = multiRequest.getParameter("workContent3");
			String workYear3 = multiRequest.getParameter("workYear3");
			String workMonth3 = multiRequest.getParameter("workMonth3");
			
			String[] officeNames = {officeName1, officeName2, officeName3};
			String[] positions = {position1, position2, position3};
			String[] workContents = {workContent1, workContent2, workContent3};
			String[] workYears = {workYear1, workYear2, workYear3};
			String[] workMonths = {workMonth1, workMonth2, workMonth3};
			
			HashMap<String, String[]> careerMap = new HashMap<String, String[]>();
			careerMap.put("officeNames", officeNames);
			careerMap.put("positions", positions);
			careerMap.put("workContents", workContents);
			careerMap.put("workYears", workYears);
			careerMap.put("workMonths", workMonths);
			
			//아티스트 경력 처리
			int careerResult = new ArtistService().insertCareer(memberPk, careerMap);
			
			Member requestMember = new Member();
			requestMember.setMemberCode(Integer.parseInt(memberPk));
			requestMember.setArtistNick(nickName);
			requestMember.setBankName(bankName);
			requestMember.setBankNum(bankNum);
			requestMember.setArtistIntro(introduce);
			
			//MEMBER 업데이트
			int memberResult = new ArtistService().updateMember(requestMember);
			
			int totalResult = 0;
			
			//모든 사항 등록 시 신청내역 등록
			if(imageResult > 0 && categoryResult > 0 && certiResult > 0 && eduResult > 0 && careerResult > 0 && memberResult > 0) {
				totalResult = new ArtistService().insertApply(memberPk);
			}
			
			String page = "";
			
			if(totalResult > 0) {
				page = "views/common/successPage.jsp";
				request.setAttribute("successCode", "applyArtist");
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "아티스트 등록 실패");
			}
			request.getRequestDispatcher(page).forward(request, response);
			
			
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
