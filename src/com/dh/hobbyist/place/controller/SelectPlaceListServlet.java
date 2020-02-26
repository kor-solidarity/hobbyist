package com.dh.hobbyist.place.controller;

import com.dh.hobbyist.common.model.vo.PageInfo;
import com.dh.hobbyist.place.model.service.PlaceService;
import com.dh.hobbyist.place.model.vo.PlaceCompany;
import com.dh.hobbyist.place.model.vo.PlaceCompanyForList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

// 관리자 공간대여업체 목록조회 (은석)
@WebServlet(name = "SelectPlaceListServlet", urlPatterns = "/place/list.ad")
public class SelectPlaceListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 목록을 불러오는데 필요한 사항들:
        // paging:
        // 총 페이지. 좀 더 정확히는 모든 게시글 수를 파악해야한다.
        // 가려고 하는 페이지, 그리고 현재 위치(페이지)
        // 기본적으로 한페이지에 10개씩 있다고 가정합시다.
        //
        // 그 외 진짜 필요한거:
        // 받아야할 목록

        // start with the paging first.
        // all pages start as 1, unless noted otherwise
        int currentPage = 1;
        // base 10 per page. DONT CHANGE IT.
        int listPerPage = 10;

        int maxPage;            //전체 페이지에서 가장 마지막 페이지
        int startPage;            //한 번에 표시될 페이지가 시작할 페이지
        int endPage;            //한 번에 표시될 페이지가 끝나는 페이지

        //전달받은 페이지가 있다면 전달값으로 currentPage 값 변경
        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

        PlaceService ps = new PlaceService();
        // 총 명단 수
        int listCount = ps.getListCount();

        System.out.println("listCount" + listCount);

        // 총 페이지 수 계산.
        // 소수점을 무조건 다 올림처리 해야함.
        maxPage = (int) Math.ceil(((double) listCount / listPerPage));

        // 페이징 할 시 맨 처음으로 찍힐 페이지
        // 예를들어서 지금 22페이지인 경우 21페이지부터 보이게끔.
        startPage = (((int) Math.ceil(((double) currentPage / listPerPage))) - 1) * 10 + 1;
        // 마지막 페이지
        endPage = startPage + listPerPage - 1;
        // 마지막 페이지는 당연 maxPage 보다 높으면 안됨
        if (maxPage < endPage) {
            endPage = maxPage;
        }

        PageInfo pageInfo = new PageInfo(currentPage, listCount,
                listPerPage, maxPage, startPage, endPage);

        ArrayList<PlaceCompanyForList> companyArrayList = ps.selectList(pageInfo);

        String page = "";
        if (companyArrayList != null) {
            page = "views/admin/place/list.jsp";
            request.setAttribute("list", companyArrayList);
            request.setAttribute("pi", pageInfo);
        } else {
            page = "views/common/errorPage.jsp";
            request.setAttribute("msg", "게시판 목록 조회 실패!");
        }

        request.getRequestDispatcher(page).forward(request, response);

    }
}
