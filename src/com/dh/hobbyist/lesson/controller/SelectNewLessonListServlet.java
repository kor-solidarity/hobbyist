package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.lesson.model.service.LessonService;
import com.google.gson.Gson;


@WebServlet("/selectNew.le")
public class SelectNewLessonListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectNewLessonListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HashMap<String, Object>> list = new LessonService().selectNew();
		
		/*for(HashMap<String, Object> hmap : list)
			for(Entry<String, Object> mapEntry : hmap.entrySet()) {
				String key = mapEntry.getKey();
				String value = (String) mapEntry.getValue();
				
			}*/ 
				
		/*System.out.println("new list : " + list);*/
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(list, response.getWriter());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
