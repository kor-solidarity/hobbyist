package com.dh.hobbyist.review.controller;

import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonPayment;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;
import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.review.model.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

// web/views/member/myPage/myReviews/writeList.jsp
// 마이페이지 - 나의 수강 수업 목록 조회 및 리뷰 작성 페이지 (은석)
@WebServlet(name = "MemberReviewTodoListViewServlet", urlPatterns = "/mypage/writeReviews.me")
public class MemberReviewTodoListViewServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberReviewTodoListViewServlet");
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
		
		ReviewService reviewService = new ReviewService();
		
		
		// 1단계 진입. 멤버의 결제내역 불러오기.
		
		// 결재내역 목록
		ArrayList<LessonPayment> lessonPaymentArrayList = reviewService.selectLessonPaymentList_lessonPayment(member_pk);
		// 위와 같이 딸려나오는 수업일정 목록
		ArrayList<LessonSchedule> scheduleArrayList = reviewService.selectLessonPaymentList_LessonSchedule(member_pk);
		
		
		int[] lessonPkList = new int[scheduleArrayList.size()];
		for (int i = 0; i < scheduleArrayList.size(); i++) {
			// 스케쥴 객체에 있는 레슨 PK 를 추출한다.
			lessonPkList[i] = scheduleArrayList.get(i).getLessonCode();
			
		}
		
		// 2단계, 레슨정보와 해당 레슨의 첫 수업정보, 그리고 관련이미지(수업 대표사진) 불러온다.
		ArrayList<Lesson> lessonArrayList = new ArrayList<>();
		
		// 대표사진만 부르면 됨
		ArrayList<Image> lessonImageArrayList = new ArrayList<>();
		ArrayList<LessonOrder> lessonOrderArrayList = new ArrayList<>();
		for (int i = 0; i < lessonPkList.length; i++) {
			int pk = lessonPkList[i];
			// 레슨정보 추가
			Lesson lesson = reviewService.selectLesson(pk);
			lessonArrayList.add(lesson);
			// 대표사진 추가
			Image image = reviewService.selectImage("lesson", pk, 0);
			lessonImageArrayList.add(image);
			// 레슨의 첫 수업시간정보 추가
			LessonOrder lessonOrder = reviewService.selectLessonOrder(scheduleArrayList.get(i).getScheduleCode(), 1);
		}
		
		// 3단계, 아티스트 이름과 이미지 불러온다.
		
		// 먼저 아티스트 명단부터.
		int[] artistPkList = new int[lessonArrayList.size()];
		ArrayList<Member> artistList = new ArrayList<>();
		for (int pk : artistPkList) {
			Member artist = reviewService.selectMember(pk);
			artistList.add(artist);
		}
		
		// 아티스트 이미지
		ArrayList<Image> artistImageList = new ArrayList<>();
		for (int pk : artistPkList) {
			Image image = reviewService.selectImage("profile", pk, -1);
			artistImageList.add(image);
		}
		
		System.out.println("lessonPaymentArrayList: " + lessonPaymentArrayList.size());
		System.out.println("scheduleArrayList: " + scheduleArrayList.size());
		System.out.println("lessonArrayList: " + lessonArrayList.size());
		System.out.println("lessonImageArrayList: " + lessonImageArrayList.size());
		System.out.println("artistList: " + artistList.size());
		System.out.println("artistImageList: " + artistImageList.size());
		
		// 이제 이거 들고 위에 목록 뽑아온다.
		request.setAttribute("lessonPaymentArrayList", lessonPaymentArrayList);
		request.setAttribute("scheduleArrayList", scheduleArrayList);
		request.setAttribute("lessonArrayList", lessonArrayList);
		request.setAttribute("lessonImageArrayList", lessonImageArrayList);
		request.setAttribute("artistList", artistList);
		request.setAttribute("artistImageList", artistImageList);
		
		String page = "/views/member/myPage/myReviews/writeList.jsp";
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}
}
