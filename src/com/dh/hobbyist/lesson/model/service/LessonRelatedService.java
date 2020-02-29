package com.dh.hobbyist.lesson.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.sql.Connection;

import com.dh.hobbyist.lesson.model.dao.LessonRelatedDao;
import com.dh.hobbyist.lesson.model.vo.Lesson;

public class LessonRelatedService {

	public int insertLesson(Lesson lesson) {
		Connection con = getConnection();
		
		int result = new LessonRelatedDao().insertLesson(con, lesson);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
