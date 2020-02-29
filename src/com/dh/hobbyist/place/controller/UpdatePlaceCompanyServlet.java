package com.dh.hobbyist.place.controller;

import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.place.model.vo.CompanyAds;
import com.dh.hobbyist.place.model.vo.PlaceCompany;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

// 공간대여업체 수정. (은석)
@WebServlet(name = "UpdatePlaceCompanyServlet", urlPatterns = "/adminUpdateCompany.ad")
public class UpdatePlaceCompanyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdatePlaceCompanyServlet");

        // 여기서 개인적으로 가장 많이 고민했던 점은 지금 사진이 먼져 올라간 다음에야 들어가지는데,
        // 사진을 수정하거나 할 때 이걸 조치할 수 있는거지??

        // 결론: 그냥 순서 하나하나 체크해가면 될듯.


    }
}
