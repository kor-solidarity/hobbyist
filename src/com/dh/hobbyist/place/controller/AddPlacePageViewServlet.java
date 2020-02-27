package com.dh.hobbyist.place.controller;

import com.dh.hobbyist.place.model.service.PlaceService;
import com.dh.hobbyist.place.model.vo.PlaceCompany;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 공간대여업체 등록/조회/수정페이지 들어가기.

@WebServlet(name = "AddPlacePageViewServlet", urlPatterns = "/addPlaceCompany.ad")
public class AddPlacePageViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pk = request.getParameter("pk");

        String page = "";
        // 만일 pk 없이 들어온 경우 등록임
        if (pk == null) {
            page = "/views/admin/placeMgmt/add.jsp";
        } else {
            // 있으면 이제 불러온다
            PlaceCompany placeCompany = new PlaceService().selectPlaceCompany(Integer.parseInt(pk));
            request.setAttribute("placeCompany", placeCompany);
            page = "/views/admin/placeMgmt/viewAndEdit.jsp";
        }

        request.getRequestDispatcher(page).forward(request, response);
    }
}
