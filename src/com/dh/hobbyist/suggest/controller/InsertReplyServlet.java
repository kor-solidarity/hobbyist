package com.dh.hobbyist.suggest.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.suggest.model.service.SuggestService;
import com.dh.hobbyist.suggest.model.vo.Reply;
import com.google.gson.Gson;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insertReply.sg")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int writer = Integer.parseInt(request.getParameter("writer"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		String content = request.getParameter("content");
		
		System.out.println("writer : " + writer);
		System.out.println("pid : " + pid);
		System.out.println("content : " + content);
		
		Reply reply = new Reply();
		reply.setLessonPetitionCode(pid);
		reply.setMemberCode(writer);
		reply.setReplyContent(content);
		
		List<Reply> replyList = new SuggestService().insertReply(reply);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(replyList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
