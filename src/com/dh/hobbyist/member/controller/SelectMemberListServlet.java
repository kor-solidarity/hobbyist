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

@WebServlet("/selectList.ad")
public class SelectMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMemberListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Member> memberList = new MemberService().selectList();
		
		//에러지 넘겨줄 url 주소
		String page = "";
		
		JSONArray result = new JSONArray();
		JSONObject memberInfo = null;
		if(memberList != null) {
			for(Member member : memberList) {
				memberInfo = new JSONObject();
				memberInfo.put("memberCode", member.getMemberCode());
				memberInfo.put("memberId", URLEncoder.encode(member.getMemberId(), "UTF-8"));
				memberInfo.put("memberName", URLEncoder.encode(member.getMemberName(), "UTF-8"));
				memberInfo.put("phone", URLEncoder.encode(member.getPhone(), "UTF-8"));
				memberInfo.put("email", URLEncoder.encode(member.getEmail(), "UTF-8"));
				memberInfo.put("isArtist", member.getIsArtist());
				memberInfo.put("warning", member.getWarnings());
				memberInfo.put("regDate", member.getRegDate().toString());
				
				result.add(memberInfo);
			}
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			
			out.print(result.toJSONString());
			out.flush();
			out.close();
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원정보를 불러올수 없습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}





















