package com.dh.hobbyist.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


@WebServlet("/phoneCertification.ph")
public class PhoneCertificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PhoneCertificationServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
		
			/*System.out.println("tel1 : " + tel1);
			System.out.println("tel2 : " + tel2);
			System.out.println("tel3 : " + tel3);*/
			
			String phone = tel1 + tel2 + tel3;
			
			System.out.println(phone);
			
			//String randomVal = new Coolsms().sms(phone);
			
			String randomVal = phone;
			
			System.out.println("인증번호 : " + randomVal);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(randomVal, response.getWriter());
			
			
		}
		
		

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
