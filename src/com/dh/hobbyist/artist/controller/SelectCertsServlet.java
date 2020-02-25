package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dh.hobbyist.artist.model.service.ArtistInfoService;
import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistCerts;
import com.dh.hobbyist.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class CertiSelectServlet
 */
@WebServlet("/selectCerts.ar")
public class SelectCertsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCertsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//System.out.println("loginMember in Session : " + request.getSession().getAttribute("loginMember"));
		
		if(request.getSession().getAttribute("loginMember") != null) {
					
			
			int artistCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
			
			ArrayList<ArtistCerts> certsList = new ArtistInfoService().selectCerts(artistCode);
			
			/*JSON 방식*/
			JSONArray result = new JSONArray();
			JSONObject certsInfo = null;
			
			for(ArtistCerts certs : certsList) {
				certsInfo = new JSONObject();
				certsInfo.put("certCode", certs.getCertCode());
				certsInfo.put("certName", URLEncoder.encode(certs.getCertName(), "UTF-8"));
				certsInfo.put("certDate", URLEncoder.encode(certs.getCertDate().toString(), "UTF-8"));
				certsInfo.put("certOrg", URLEncoder.encode(certs.getCertOrg(), "UTF-8"));
				certsInfo.put("memberPk", certs.getMemberPk());
				
				//System.out.println("certsInfo : " + certsInfo);
				
				result.add(certsInfo);
			}
			
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(result.toJSONString());
			out.flush();
			out.close();
			
			/*GSON 방식*/
			/*response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(certsList, response.getWriter());*/
			
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
