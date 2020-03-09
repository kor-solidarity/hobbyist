package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dh.hobbyist.artist.model.service.ArtistInfoService;
import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistEducation;
import com.dh.hobbyist.member.model.vo.Member;

/**
 * Servlet implementation class SelectEducationServlet
 */
@WebServlet("/selectEducation.ar")
public class SelectEducationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectEducationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginMember") != null) {
			int artistCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
			
			ArrayList<ArtistEducation> eduList = new ArtistInfoService().selectEducation(artistCode);
			
			JSONArray result = new JSONArray();
			JSONObject eduInfo = null;
			
			
			for(ArtistEducation edu : eduList) {
				eduInfo = new JSONObject();
				eduInfo.put("eduCode", edu.getEduCode());
				eduInfo.put("eduInsitituteName", URLEncoder.encode(edu.getEduInsitituteName(), "UTF-8"));
				eduInfo.put("eduMajor", URLEncoder.encode(edu.getEduMajor(), "UTF-8"));
				eduInfo.put("status", edu.getStatus());
				
				result.add(eduInfo);
			}
			
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(result.toJSONString());
			out.flush();
			out.close();

		} else {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.getRequestDispatcher("/hobbyist/common/errorPage.jsp").forward(request, response);
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
