package com.dh.hobbyist.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;
import com.google.gson.Gson;

@WebServlet("/selectList.ar")
public class SelectArtistListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectArtistListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Member> artistList = new MemberService().selectArtistList();
		
//		HashMap hmp = null;
//		for(Member artist : artistList) {
//			hmp.put("pk", artist.getMemberCode());
//			hmp.put("id", artist.getMemberId());
//			hmp.put("name", artist.getMemberName());
//			hmp.put("nick", artist.getArtistNick());
//			hmp.put("phone", artist.getPhone());
//			
//		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(artistList, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
