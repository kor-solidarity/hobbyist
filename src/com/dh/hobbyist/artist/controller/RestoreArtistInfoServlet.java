package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.artist.model.service.ArtistService;
import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistCategory;
import com.dh.hobbyist.artist.model.vo.ArtistCerts;
import com.dh.hobbyist.artist.model.vo.ArtistEducation;
import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class RestoreArtistInfoServlet
 */
@WebServlet("/restoreInfo.ar")
public class RestoreArtistInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestoreArtistInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		List<Image> imgList = new ArtistService().selectImageList(memberCode);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(imgList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
