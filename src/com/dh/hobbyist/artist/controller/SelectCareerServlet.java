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
import com.dh.hobbyist.member.model.vo.Member;

/**
 * Servlet implementation class SelectCareerServlet
 */
@WebServlet("/selectCareer.ar")
public class SelectCareerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCareerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginMember") != null) {
			int artistCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
			
			ArrayList<ArtistCareer> careerList = new ArtistInfoService().selectCareer(artistCode);
			
			JSONArray result = new JSONArray();
			JSONObject careerInfo = null;
			
			for(ArtistCareer career : careerList) {
				careerInfo = new JSONObject();
				careerInfo.put("recCode", career.getRecCode());
				careerInfo.put("orgName", URLEncoder.encode(career.getOrgName(), "UTF-8"));
				careerInfo.put("rank", URLEncoder.encode(career.getRank(), "UTF-8"));
				careerInfo.put("occupation", URLEncoder.encode(career.getOccupation(), "UTF-8"));
				careerInfo.put("occupationTerm", URLEncoder.encode(career.getOccupationTerm(), "UTF-8"));
				careerInfo.put("memberPk", career.getMemberPk());
				
				result.add(careerInfo);
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








