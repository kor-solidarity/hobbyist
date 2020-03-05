package com.dh.hobbyist.place.controller;

import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.place.model.service.PlaceService;
import com.dh.hobbyist.place.model.vo.PlaceCompany;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MemberSelectPlaceServlet", urlPatterns = "/place/info.me")
public class MemberSelectPlaceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPage = 1;
        String page = "/place/list.me";
        try {
            // 매개변수로 받아왔으면 뽑아오고, 안뽑히면 오류나는걸테니 기본값으로.
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            System.out.println("parseError prolly. set to default of 1.");
        }
        int pk = 0;
        try {
            pk = Integer.parseInt(request.getParameter("pk"));
        } catch (Exception e) {
            page = page + "?page=" + currentPage;
            request.getRequestDispatcher(page).forward(request, response);
        }

        PlaceService placeService = new PlaceService();

        // 회사 불러온다.
        PlaceCompany company = placeService.selectPlaceCompany(pk);
        ArrayList<Image> images = placeService.selectCompanyImage(pk);

        request.setAttribute("company", company);
        request.setAttribute("images", images);

        page = "/views/rental/info.jsp";

        request.getRequestDispatcher(page).forward(request,response);

    }
}
