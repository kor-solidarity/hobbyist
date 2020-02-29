package com.dh.hobbyist.lesson.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.sql.Connection;

import com.dh.hobbyist.lesson.model.dao.LessonRelatedDao;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;

public class LessonRelatedService {

	public int insertLesson(Lesson lesson) {
		Connection con = getConnection();
		
		int insertResult = new LessonRelatedDao().insertLesson(con, lesson);
		int lessonCode = 0;
		
		if(insertResult > 0) {
			//lessonCode 조회
			lessonCode = new LessonRelatedDao().selectLessonCurval(con);
			commit(con);
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		return lessonCode;
	}

	public int insertSchedule(LessonSchedule schedule) {
		Connection con = getConnection();
		
		int result = new LessonRelatedDao().insertSchedule(con, schedule);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

}
