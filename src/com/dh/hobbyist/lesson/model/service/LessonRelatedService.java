package com.dh.hobbyist.lesson.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;

import com.dh.hobbyist.lesson.model.dao.LessonRelatedDao;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;

public class LessonRelatedService {

	public int insertLessonRelated(HashMap lessonRelated) {
		Connection con = getConnection();
		
		Lesson lesson = (Lesson) lessonRelated.get("lesson");
		LessonSchedule schedule = (LessonSchedule) lessonRelated.get("schedule");
		
		System.out.println("lesson : " + lesson);
		System.out.println("lessonName : " + lesson.getLessonName());
		
		int lessonResult = new LessonRelatedDao().insertLesson(con, lesson);
		int scheduleResult = 0;
		
		//LESSON_SCHEDULE 테이블의 외래키인 LESSON 테이블이 PK 조회용 변수
		int lessonCode = 0;
		
		if(lessonResult > 0) {
			
			lessonCode = new LessonRelatedDao().selectLessonCurval(con);
			schedule.setLessonCode(lessonCode);
			
			scheduleResult = new LessonRelatedDao().insertSchedule(con, schedule);
			
			if(scheduleResult > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		close(con);

		return scheduleResult;
	}

}













