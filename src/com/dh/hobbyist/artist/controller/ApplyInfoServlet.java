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
 * Servlet implementation class ApplyInfoServlet
 */
@WebServlet("/applyInfo.ar")
public class ApplyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Member m = new ArtistService().selectOneArtist(num);
		
		List<Member> memList = new ArrayList<Member>();
		memList.add(m);
		//System.out.println(memList);
		
		List<Image> imgList = new ArtistService().selectImageList(num);
		
		//System.out.println(imgList);
		
		List<ArtistCategory> arCatList = new ArtistService().selectArtistCategoryList(num);
		
		//System.out.println(arCatList);
		
		List<ArtistCerts> arCertsList = new ArtistService().selectArtistCertsList(num);
		
		//System.out.println(arCertsList);
		
		List<ArtistEducation> arEduList = new ArtistService().selectArtistEduList(num);
		
		//System.out.println(arEduList);
		
		List<ArtistCareer> arCareerList = new ArtistService().selectArtistCareerList(num);
		
		//System.out.println(arCareerList);
		
		Map<String, Object> applyInfo = new HashMap<>();
		
		applyInfo.put("member", memList);
		applyInfo.put("imgList", imgList);
		applyInfo.put("arCatList", arCatList);
		applyInfo.put("arCertsList", arCertsList);
		applyInfo.put("arEduList", arEduList);
		applyInfo.put("arCareerList", arCareerList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(applyInfo, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
