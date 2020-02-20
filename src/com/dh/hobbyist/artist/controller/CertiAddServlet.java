package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class CertiAddServlet
 */
@WebServlet("/certiAdd.ar")
public class CertiAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CertiAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String certiName = request.getParameter("certiName");
		String certiDay = request.getParameter("certiDay");
		String certiSpace = request.getParameter("certiSpace");
		
		/*System.out.println("certiName : " + certiName);
		System.out.println("certiDay : " + certiDay);
		System.out.println("certiSpace : " + certiSpace);*/
		
		String certiStr = certiName + "/" + certiDay + "/" + certiSpace;
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(certiStr, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
