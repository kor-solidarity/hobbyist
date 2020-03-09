package com.dh.hobbyist.review.model.service;

import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonPayment;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;
import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.review.model.dao.ReviewDao;

import java.sql.Connection;
import java.util.ArrayList;

import static com.dh.hobbyist.common.JDBCTemplate.close;
import static com.dh.hobbyist.common.JDBCTemplate.getConnection;

public class ReviewService {
	// 사용자(Member)의 수업 결재 목록 조회 (은석) - LessonPayment 를 반환함.
	public ArrayList<LessonPayment> selectLessonPaymentList_lessonPayment(int member_pk) {
		Connection con = getConnection();
		
		ArrayList<LessonPayment> paymentArrayList = new ReviewDao().selectLessonPaymentList_lessonPayment(con, member_pk);
		
		close(con);
		
		return paymentArrayList;
	}
	
	// 위에 selectLessonPaymentList_lessonPayment 와 개념적으로 동일. 반환값이 다를뿐. (은석)
	public ArrayList<LessonSchedule> selectLessonPaymentList_LessonSchedule(int member_pk) {
		Connection con = getConnection();
		
		ArrayList<LessonSchedule> paymentArrayList = new ReviewDao().selectLessonPaymentList_LessonSchedule(con, member_pk);
		
		close(con);
		
		return paymentArrayList;
	}
	
	// 레슨정보 가져오기.
	public Lesson selectLesson(int pk) {
		Connection con = getConnection();
		Lesson lesson = new ReviewDao().selectLesson(con, pk);
		
		close(con);
		
		return lesson;
	}
	
	public Image selectImage(String img_type, int pk, int image_main) {
		Connection con = getConnection();
		
		Image image = new ReviewDao().selectImage(con, img_type, pk, image_main);
		
		close(con);
		
		return image;
	}
	
	// 회원 뽑아오기. (은석)
	public Member selectMember(int pk) {
		Connection con = getConnection();
		
		Member member = new ReviewDao().selectMember(con,  pk);
		
		close(con);
		
		return member;
	}
	
	//
	public LessonOrder selectLessonOrder(int schedulePk, int lessonOrderTime) {
		Connection con = getConnection();
		
		LessonOrder lessonOrder =
				new ReviewDao().selectLessonOrder(con, schedulePk, lessonOrderTime);
		
		close(con);
		
		return lessonOrder;
	}
}
