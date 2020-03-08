package com.dh.hobbyist.member.controller;

import com.dh.hobbyist.lesson.model.vo.LessonPayment;
import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

// web/views/member/myPage/myReviews/writeList.jsp
// 마이페이지 - 나의 수강 수업 목록 조회 및 리뷰 작성 페이지
@WebServlet(name = "MemberReviewTodoListViewServlet", urlPatterns = "/mypage/writeReviews.me")
public class MemberReviewTodoListViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 정확히 가져와야 하는 사안:
        // 0. 대상 회원정보(PK 확인용도)      - MEMBER
        // 1. 등록한 레슨과 그 정보.          - LESSON 테이블
        // 2. 등록한 레슨의 대표사진          - IMAGE table
        // 3. 등록한 레슨의 강사.             - MEMBER
        // 3-1. 강사의 사진                   - IMAGE
        // 4. 등록한 레슨 중 받은 수업일정    - LESSON_SCHEDULE
        // 5. 결재일자.                       - LESSON_PAYMENT


        // 1단계, 멤버의  불러온다. 여기서 LESSON_PAYMENT, LESSON_SCHEDULE 불러오기.
        // 2단계, 레슨, 여기서 관련이미지 불러온다.
        // 3단계, 강사이름과 이미지 불러온다.

        // 0번: 회원 가져오기.
        int member_pk = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();

        MemberService memberService = new MemberService();


        // 1단계 진입. 멤버의 결제내역 불러오기.

        // 결재내역 목록
        ArrayList<LessonPayment> lessonPaymentArrayList = memberService.selectLessonPaymentList(member_pk);






    }
}
