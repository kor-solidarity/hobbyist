package com.dh.hobbyist.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class LoginWrapper extends HttpServletRequestWrapper{
	
	public LoginWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String key) {
		String value = "";
		
		if(key != null && key.equals("memberPwd") || key != null && key.equals("adminPwd")) {
			
			//회원 비밀번호
			if(key.equals("memberPwd")) {
				
				value = getSha512(super.getParameter("memberPwd"));
				
			//관리자 비밀번호
			}else {
				
				value = getSha512(super.getParameter("adminPwd"));
			}
			
		}else {
			value = super.getParameter(key);
		}
		
		return value;
	}
	
	private String getSha512(String pwd) {
		String encPwd = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		
		return encPwd;
	}
}
