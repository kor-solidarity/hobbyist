package com.dh.hobbyist.member.controller;

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
@WebServlet("/UpdateMember.me")
public class UpdateMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Member> UpdateMemberList = new MemberService().UpdateMemberList();
		
		JSONArray result = new JSONArray();
		JSONObject memberInfo = null;
		
		//에러시 넘겨줄 url주소
		String page ="";
		
		
		//멤버리스트 JSON에 넣어서 보내기
		if(UpdateMemberList != null) {
		for(Member member : UpdateMemberList) {
			memberInfo = new JSONObject();
			memberInfo.put("memberId", URLEncoder.encode(member.getMemberId(),"UTF-8"));
			memberInfo.put("memberName", URLEncoder.encode(member.getMemberName(),"UTF-8"));
			memberInfo.put("email", URLEncoder.encode(member.getEmail(),"UTF-8"));
			memberInfo.put("phone", URLEncoder.encode(member.getPhone(),"UTF-8"));
			memberInfo.put("memberPwd", URLEncoder.encode(member.getMemberPwd(),"UTF-8"));
			
			System.out.println(memberInfo);
			result.add(memberInfo);
			
		}
		
		System.out.println(result);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(result.toJSONString());
		out.flush();
		out.close();
		
	}else {
		page = "views/comon/errorPage.jsp";
		request.setAttribute("msg","회원정보를 불러올수 없습니다.");
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
