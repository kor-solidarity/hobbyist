package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		request.setCharacterEncoding("UTF-8");
		String nickName = request.getParameter("nickName");
		System.out.println("nickName : " + nickName);
		String bankNum = request.getParameter("bankNum");
		System.out.println("bankNum : " + bankNum);
		String introduce = request.getParameter("introduce");
		System.out.println("introduce : " + introduce);
		String category1 = request.getParameter("category1");
		System.out.println("category1 : " + category1);
		
		String certiName1 = request.getParameter("certiName1");
		System.out.println("certiName1 : " + certiName1);
		String certiName2 = request.getParameter("certiName2");
		System.out.println("certiName2 : " + certiName2);
		String certiName3 = request.getParameter("certiName3");
		System.out.println("certiName3 : " + certiName3);
		String certiDay1 = request.getParameter("certiDay1");
		System.out.println("certiDay1 : " + certiDay1);
		String certiDay2 = request.getParameter("certiDay2");
		System.out.println("certiDay2 : " + certiDay2);
		String certiDay3 = request.getParameter("certiDay3");
		System.out.println("certiDay3 : " + certiDay3);
		String certiSpace1 = request.getParameter("certiSpace1");
		System.out.println("certiSpace1 : " + certiSpace1);
		String certiSpace2 = request.getParameter("certiSpace2");
		System.out.println("certiSpace2 : " + certiSpace2);
		String certiSpace3 = request.getParameter("certiSpace3");
		System.out.println("certiSpace3 : " + certiSpace3);
		
		String schoolName1 = request.getParameter("schoolName1");
		System.out.println("schoolName1 : " + schoolName1);
		String schoolName2 = request.getParameter("schoolName2");
		System.out.println("schoolName2 : " + schoolName2);
		String schoolName3 = request.getParameter("schoolName3");
		System.out.println("schoolName3 : " + schoolName3);
		String major1 = request.getParameter("major1");
		System.out.println("major1 : " + major1);
		String major2 = request.getParameter("major2");
		System.out.println("major2 : " + major2);
		String major3 = request.getParameter("major3");
		System.out.println("major3 : " + major3);
		String status1 = request.getParameter("status1");
		System.out.println("status1 : " + status1);
		String status2 = request.getParameter("status2");
		System.out.println("status2 : " + status2);
		String status3 = request.getParameter("status3");
		System.out.println("status3 : " + status3);
		
		String officeName1 = request.getParameter("officeName1");
		System.out.println("officeName1 : " + officeName1);
		String officeName2 = request.getParameter("officeName2");
		System.out.println("officeName2 : " + officeName2);
		String officeName3 = request.getParameter("officeName3");
		System.out.println("officeName3 : " + officeName3);
		
		String position1 = request.getParameter("position1");
		System.out.println("position1 : " + position1);
		String position2 = request.getParameter("position2");
		System.out.println("position2 : " + position2);
		String position3 = request.getParameter("position3");
		System.out.println("position3 : " + position3);
		
		String workContent1 = request.getParameter("workContent1");
		System.out.println("workContent1 : " + workContent1);
		String workContent2 = request.getParameter("workContent2");
		System.out.println("workContent2 : " + workContent2);
		String workContent3 = request.getParameter("workContent3");
		System.out.println("workContent3 : " + workContent3);
		
		String workYear1 = request.getParameter("workYear1");
		System.out.println("workYear1 : " + workYear1);
		String workYear2 = request.getParameter("workYear2");
		System.out.println("workYear2 : " + workYear2);
		String workYear3 = request.getParameter("workYear3");
		System.out.println("workYear3 : " + workYear3);
		
		String workMonth1 = request.getParameter("workMonth1");
		System.out.println("workMonth1 : " + workMonth1);
		String workMonth2 = request.getParameter("workMonth2");
		System.out.println("workMonth2 : " + workMonth2);
		String workMonth3 = request.getParameter("workMonth3");
		System.out.println("workMonth3 : " + workMonth3);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
