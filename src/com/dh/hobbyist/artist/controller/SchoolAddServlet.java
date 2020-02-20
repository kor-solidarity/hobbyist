package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class SchoolAddServlet
 */
@WebServlet("/schoolAdd.ar")
public class SchoolAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SchoolAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String schoolName = request.getParameter("schoolName");
		String major = request.getParameter("major");
		String status = request.getParameter("status");
		
		/*System.out.println("certiName : " + certiName);
		System.out.println("certiDay : " + certiDay);
		System.out.println("certiSpace : " + certiSpace);*/
		
		String statusStr = null;
		
		switch(status) {
		case "inSchool" : statusStr = "재학"; break;
		case "graduate" : statusStr = "졸업"; break;
		default: break;
		}
		
		String schoolStr = schoolName + "/" + major + "/" + statusStr;
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(schoolStr, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
