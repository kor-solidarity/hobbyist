package com.dh.hobbyist.lesson.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.close;
import static com.dh.hobbyist.common.JDBCTemplate.commit;
import static com.dh.hobbyist.common.JDBCTemplate.getConnection;
import static com.dh.hobbyist.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;

import com.dh.hobbyist.lesson.model.dao.LessonRelatedDao;
import com.dh.hobbyist.lesson.model.vo.Image;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;
import com.dh.hobbyist.member.model.vo.Member;

public class LessonRelatedService {

	public int insertLessonRelated(HashMap lessonRelated) {
		Connection con = getConnection();
		
		Lesson lesson = (Lesson) lessonRelated.get("lesson");
		LessonSchedule schedule = (LessonSchedule) lessonRelated.get("schedule");
		ArrayList orderList = (ArrayList) lessonRelated.get("orderList");
		ArrayList<Image> fileList = (ArrayList) lessonRelated.get("fileList");		
		
		int totalOrder = lesson.getTotalOrders();
		
		int lessonResult = new LessonRelatedDao().insertLesson(con, lesson);
		int scheduleResult = 0;
		int orderResult = 0;
		int fileResult = 0;
		
		//LESSON 테이블에 성공적으로 삽입되었다면
		if(lessonResult > 0) {
			
			//LESSON_SCHEDULE 테이블의 외래키인 LESSON 테이블이 PK 조회
			int lessonCode = new LessonRelatedDao().selectLessonCurrval(con);
			schedule.setLessonCode(lessonCode);
			
			scheduleResult = new LessonRelatedDao().insertSchedule(con, schedule);
			
			//LESSON_SCHEDULE 테이블에 성공적으로 삽입되었다면
			if(scheduleResult > 0) {
				//LESSON_ORDER 테이블의 외래키인 LESSON_SCHEDULE 테이블의 PK 조회
				int scheduleCode = new LessonRelatedDao().selectScheduleCurrval(con);
				
				Iterator it = orderList.iterator();
				
				while(it.hasNext()) {
					LessonOrder order = (LessonOrder) it.next();
					order.setScheduleCode(scheduleCode);
					
					orderResult += new LessonRelatedDao().insertOrder(con, order);
				}
				
				if(orderResult == totalOrder) {
					for(int i = 0; i < fileList.size(); i++) {
						fileList.get(i).setImageFkPk(lessonCode);
						fileResult += new LessonRelatedDao().insertImage(con, fileList.get(i));
					}
					
					if(fileResult == fileList.size()) {
						commit(con);
					} else {
						rollback(con);
					}
					
				} else {
					rollback(con);
				}
				
			} else {
				rollback(con);
			}
			
		} else {
			rollback(con);
		}
		
		close(con);

		System.out.println("fileResult : " + fileResult);
		return fileResult;
	}

	public Image selectProfileImage(int memberCode) {
		Connection con = getConnection();
		
		Image profileImg = new LessonRelatedDao().selectProfileImage(con, memberCode);
		
		if(profileImg != null) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return profileImg;
	}

	public Lesson selectOneLesson(int lessonCode) {
		Connection con = getConnection();
		
		Lesson lesson = new LessonRelatedDao().selectOneLesson(con, lessonCode);
		
		if(lesson != null) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return lesson;
	}

	public Member selectOneArtist(int artistCode) {
		Connection con = getConnection();
		
		Member artist = new LessonRelatedDao().selectOneArtist(con, artistCode);
		
		if(artist != null) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return artist;
	}

}













