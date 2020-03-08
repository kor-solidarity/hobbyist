package com.dh.hobbyist.lesson.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dh.hobbyist.common.MyFileRenamePolicy;
import com.dh.hobbyist.lesson.model.service.LessonRelatedService;
import com.dh.hobbyist.lesson.model.vo.Image;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;
import com.dh.hobbyist.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertLessonServlet
 */
@WebServlet("/insert.le")
public class InsertLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLessonServlet() {
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
			//카데고리별로 폴더를 구분하는 것도 향후 고려
			String savePath = root + "static/upload/lesson";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//수업 이미지 관련 사항
			ArrayList<String> saveFiles = new ArrayList<String>();
			//ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			//System.out.println("files : " + files);
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				//System.out.println("name : " + name);
				//System.out.println("multiRequest.getFilesystemName(name) : " + multiRequest.getFilesystemName(name));
				
				//사진 입력을 4개 모두 하지 않아도 에러가 나지 않도록 검사하는 조건문
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					//originFiles.add(multiRequest.getOriginalFileName(name));
				}
				
			}
			
			//System.out.println("saveFiles.size() : " + saveFiles.size());
			
			ArrayList<Image> fileList = new ArrayList<Image>();
			
			for(int i = saveFiles.size() - 1; i >= 0; i--) {
				Image img = new Image();
				img.setImageRoute("static/upload/lesson");
				img.setImageName(saveFiles.get(i));
				
				if(i == saveFiles.size() - 1) {
					//대표사진
					img.setImageMain(0);
				} else {
					img.setImageMain(1);
				}
				
				fileList.add(img);
			}
			
			//수업 관련 사항
			String lessonName = multiRequest.getParameter("lessonTitle");
			int minStudents = Integer.parseInt(multiRequest.getParameter("min"));
			int maxStudents = Integer.parseInt(multiRequest.getParameter("max"));
			int totalOrders = Integer.parseInt(multiRequest.getParameter("inputOrder"));
			int costPerOrder = Integer.parseInt(multiRequest.getParameter("cost"));
			int totalCosts = totalOrders * costPerOrder;
			String artistIntro = multiRequest.getParameter("artIntro");
			String lessonIntro = multiRequest.getParameter("lessonIntro");
			int categoryCode = Integer.parseInt(multiRequest.getParameter("subCategory"));
			int artistCode = ((Member) (request.getSession().getAttribute("loginMember"))).getMemberCode();
			
			Lesson lesson = new Lesson();
			lesson.setLessonName(lessonName);
			lesson.setMinStudents(minStudents);
			lesson.setMaxStudents(maxStudents);
			lesson.setTotalOrders(totalOrders);
			lesson.setCostPerOrder(costPerOrder);
			lesson.setTotalCosts(totalCosts);
			lesson.setArtistIntro(artistIntro);
			lesson.setLessonIntro(lessonIntro);
			lesson.setCategoryCode(categoryCode);
			lesson.setArtistCode(artistCode);
			
			//수업일정 관련 사항
			int region = Integer.parseInt(multiRequest.getParameter("region"));
			//System.out.println("region :  " + region);
			
			String[] cat_name = {"서울","부산","대구","인천","광주","대전","울산","강원","경기","경남","경북","전남","전북","제주","충남","충북"};
			String koreanRegion = "";
			String subRegion = "";
			
			if(region <= 16) {
				koreanRegion = cat_name[region - 1];
				subRegion = multiRequest.getParameter("subRegion");
			} else if(region == 261){
				koreanRegion = "세종";
				subRegion = "_";
			}
			//System.out.println("subRegion :  " + subRegion);
			
			String address = multiRequest.getParameter("address");
			
			LessonSchedule schedule = new LessonSchedule();
			schedule.setRegion(koreanRegion);
			schedule.setSubRegion(subRegion);
			schedule.setAddress(address);
			
			//수업회차 관련 사항
			int orderTime = 0;
			int orderStart = 0;
			int orderEnd = 0;
			
			ArrayList orderList = new ArrayList();
			for(int i = 1; i <= totalOrders; i++) {
				Long start = Long.parseLong(multiRequest.getParameter("start" + i));
				Long end = Long.parseLong(multiRequest.getParameter("end" + i));
				
				LessonOrder order = new LessonOrder();
				order.setOrderTime(i);
				order.setOrderStart(new Timestamp(start));
				order.setOrderEnd(new Timestamp(end));
				
				orderList.add(order);
			}
			
			//보유한 자격 관련 사항
			String[] certs = multiRequest.getParameterValues("selectedCerts");
			ArrayList certsList = new ArrayList();
			
			if(certs != null) {
				
				for(int i = 0; i < certs.length; i++) {
					int c = Integer.parseInt(certs[i]);
					
					System.out.println("c : " + c);
					
					certsList.add(c);
				}
			}
			//보유한 경력 관련 사항
			String[] career = multiRequest.getParameterValues("selectedCareer");
			ArrayList careerList = new ArrayList();
			
			if(career != null) {
				
				for(int i = 0; i < career.length; i++) {
					int c = Integer.parseInt(career[i]);
					
					careerList.add(c);
				}
			}
			
			
			//각 vo들을 하나로 담을 HashMap 선언
			HashMap lessonRelated = new HashMap();
			lessonRelated.put("lesson", lesson);
			lessonRelated.put("schedule", schedule);
			lessonRelated.put("orderList", orderList);
			lessonRelated.put("fileList", fileList);
			lessonRelated.put("certsList", certsList);
			lessonRelated.put("careerList", careerList);
			
			boolean result = new LessonRelatedService().insertLessonRelated(lessonRelated);
			
			String page = "";
			if(result == true) {
				page = "views/common/successPage.jsp";
				request.setAttribute("successCode", "insertLesson");
			} else {
				
				//실패시 저장된 사진 삭제
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "수업 등록에 실패하였습니다");
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
