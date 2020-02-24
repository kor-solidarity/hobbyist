package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.artist.model.service.ArtistInfoService;
import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistCerts;
import com.dh.hobbyist.member.model.vo.Member;

/**
 * Servlet implementation class CertiSelectServlet
 */
@WebServlet("/artInfoSelect.ar")
public class ArtistInfoSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtistInfoSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("loginMember in Session : " + request.getSession().getAttribute("loginMember"));
		
		if(request.getSession().getAttribute("loginMember") != null) {
			int artistCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
			
			ArrayList<ArtistCerts> certsList = new ArtistInfoService().selectCerts(artistCode);
			//ArrayList<ArtistCareer> careerList = new ArtistInfoService().selectCareer();	
			
			String page = "views/lesson/openLessonMain.sjp";
			request.setAttribute("certsList", certsList);
			//request.setAttribute("careerList", careerList);
			
			System.out.println("certsList : " + certsList);
			
			request.getRequestDispatcher(page).forward(request, response);			
		} else {
			;
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
