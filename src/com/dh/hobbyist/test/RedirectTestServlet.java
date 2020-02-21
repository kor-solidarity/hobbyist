package com.dh.hobbyist.test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 리다렉트 테스트용..
@WebServlet(name = "RedirectTestServlet", urlPatterns = "/place")
public class RedirectTestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("RedirectTestServlet");
        request.getRequestDispatcher("/views/admin/placeMgmt/add.jsp").forward(request, response);
    }
}
