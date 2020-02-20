package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


/**
 * @author 이지호
 *
 */

@WebServlet("/careerAdd.ar")
public class CareerAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareerAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String officeName = request.getParameter("officeName");
		String position = request.getParameter("position");
		String workContent = request.getParameter("workContent");
		String workYear = request.getParameter("workYear");
		String workMonth = request.getParameter("workMonth");
		
	
		
		String workStr = officeName + "/" + position + "/" + workContent + "/" + workYear + "년" + workMonth + "개월";
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(workStr, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
