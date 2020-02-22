package com.dh.hobbyist.suggest.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.suggest.model.vo.Petition;

/**
 * Servlet implementation class InsertSuggestServlet
 */
@WebServlet("/insert.sg")
public class InsertSuggestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSuggestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String detailCategory = request.getParameter("detailCategory");
		String maxNum = request.getParameter("maxNum");
		String classPay = request.getParameter("classPay");
		String classTimes = request.getParameter("classTimes");
		String area1 = request.getParameter("area1");
		String area2 = request.getParameter("area2");
		String wantDate = request.getParameter("wantDate");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		String sugTitle = request.getParameter("sugTitle");
		String sugContent = request.getParameter("sugContent");
		String loginMemberCode = request.getParameter("loginMemberCode");
		
		Petition petition = new Petition();
		petition.setNumOfStudents(maxNum);
		petition.setCost(Integer.parseInt(classPay));
		petition.setRequestedDays(day);
		petition.setRequestTime(time);
		petition.setPetitionedMember(Integer.parseInt(loginMemberCode));
		
		
		System.out.println("detailCategory : " + detailCategory);
		System.out.println("maxNum : " + maxNum);
		System.out.println("classPay : " + classPay);
		System.out.println("classTimes : " + classTimes);
		System.out.println("area1 : " + area1);
		System.out.println("area2 : " + area2);
		System.out.println("wantDate : " + wantDate);
		System.out.println("day : " + day);
		System.out.println("time : " + time);
		System.out.println("sugTitle : " + sugTitle);
		System.out.println("sugContent : " + sugContent);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
