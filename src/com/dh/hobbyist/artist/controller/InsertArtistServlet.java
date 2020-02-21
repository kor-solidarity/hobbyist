package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dh.hobbyist.common.MyFileRenamePolicy;
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
			
			//"01. 자기소개" 에서 받아오는 input
			String nickName = multiRequest.getParameter("nickName");
			String bankName = multiRequest.getParameter("bankName");
			String bankNum = multiRequest.getParameter("bankNum");
			String introduce = multiRequest.getParameter("introduce");
			
			//"02. 전문분야" 에서 받아오는 input
			String categoryName = multiRequest.getParameter("categoryName");
			String detailCategory = multiRequest.getParameter("detailCategory");
			
			String categoryName2 = multiRequest.getParameter("categoryName2");
			String detailCategory2 = multiRequest.getParameter("detailCategory2");
			
			String categoryName3 = multiRequest.getParameter("categoryName3");
			String detailCategory3 = multiRequest.getParameter("detailCategory3");
			
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
			
			
			System.out.println("nickName : " + nickName);
			System.out.println("bankName : " + bankName);
			System.out.println("bankNum : " + bankNum);
			System.out.println("introduce : " + introduce);
			
			System.out.println("categoryName : " + categoryName);
			System.out.println("detailCategory : " + detailCategory);
			
			System.out.println("cateogryName2 : " + categoryName2);
			System.out.println("detailCategory2 : " + detailCategory2);
			
			System.out.println("categoryName3 : " +categoryName3);
			System.out.println("detailCategory3 : " + detailCategory3);
			
			System.out.println("certiName1 : " + certiName1);
			System.out.println("certiDay1 : " + certiDay1);
			System.out.println("certiSpace1 : " + certiSpace1);
			
			System.out.println("certiName2 : " + certiName2);
			System.out.println("certiDay2 : " + certiDay2);
			System.out.println("certiSpace2 : " + certiSpace2);
			
			System.out.println("certiName3 : " + certiName3);
			System.out.println("certiDay3 : " + certiDay3);
			System.out.println("certiSpace3 : " + certiSpace3);
			
			System.out.println("schoolName1 : " + schoolName1);
			System.out.println("major1 : " + major1);
			System.out.println("status1 : " + status1);
			
			System.out.println("schoolName2 : " + schoolName2);
			System.out.println("major2 : " + major2);
			System.out.println("status2 : " + status2);
			
			System.out.println("schoolName3 : " + schoolName3);
			System.out.println("major3 : " + major3);
			System.out.println("status3 : " + status3);
			
			System.out.println("officeName1 : " + officeName1);
			System.out.println("position1 : " + position1);
			System.out.println("workContent1 : " + workContent1);
			System.out.println("workYear1 : " + workYear1);
			System.out.println("workMonth1 : " + workMonth1);
			
			System.out.println("officeName2 : " + officeName2);
			System.out.println("position2 : " + position2);
			System.out.println("workContent2 : " + workContent2);
			System.out.println("workYear2 : " + workYear2);
			System.out.println("workMonth2 : " + workMonth2);
			
			System.out.println("officeName3 : " + officeName3);
			System.out.println("position3 : " + position3);
			System.out.println("workContent3 : " + workContent3);
			System.out.println("workYear3 : " + workYear3);
			System.out.println("workMonth3 : " + workMonth3);
			
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
