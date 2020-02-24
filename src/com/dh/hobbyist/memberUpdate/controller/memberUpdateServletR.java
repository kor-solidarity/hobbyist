package com.dh.hobbyist.memberUpdate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberList
 */
@WebServlet("/UpdateMemberR.me")

public class memberUpdateServletR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberUpdateServletR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Member> UpdateMemberListR = new MemberService().UpdateMemberList();
		
		System.out.println(UpdateMemberListR);
		
	
			String page ="";
			if(UpdateMemberListR != null) {
				page= "/views/member/myPage/configuration/memberUpdate.jsp";
						
				request.setAttribute("UpdateMemberListR", UpdateMemberListR);
			}
		
		request.getRequestDispatcher(page).forward(request, response);
	}
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
