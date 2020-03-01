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
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;

public class LessonRelatedService {

	public int insertLessonRelated(HashMap lessonRelated) {
		Connection con = getConnection();
		
		Lesson lesson = (Lesson) lessonRelated.get("lesson");
		LessonSchedule schedule = (LessonSchedule) lessonRelated.get("schedule");
		
		ArrayList orderList = (ArrayList) lessonRelated.get("orderList");
		
		
		int lessonResult = new LessonRelatedDao().insertLesson(con, lesson);
		int scheduleResult = 0;
		int orderResult = 0;
		
		int totalOrder = lesson.getTotalOrders();
		
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
		
		close(con);

		return orderResult;
	}

}













