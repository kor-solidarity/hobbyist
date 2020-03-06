package com.dh.hobbyist.lesson.model.service;

import static com.dh.hobbyist.common.JDBCTemplate.close;
import static com.dh.hobbyist.common.JDBCTemplate.commit;
import static com.dh.hobbyist.common.JDBCTemplate.getConnection;
import static com.dh.hobbyist.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;

import com.dh.hobbyist.lesson.model.dao.LessonRelatedDao;
import com.dh.hobbyist.lesson.model.vo.Image;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;
import com.dh.hobbyist.lesson.model.vo.MyRegiLesson;
import com.dh.hobbyist.member.model.vo.Member;

public class LessonRelatedService {
	
	//수업 개설시 입력 처리를 위한 메소드
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

	public ArrayList<LessonSchedule> selectScheduleList(int lessonCode) {
		Connection con = getConnection();
		
		ArrayList<LessonSchedule> scheduleList = new LessonRelatedDao().selectScheduleList(con, lessonCode);
		
		if(scheduleList != null) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return scheduleList;
	}

	public ArrayList<Image> selectLessonImageList(int lessonCode) {
		Connection con = getConnection();
		
		ArrayList<Image> lessonImageList = new LessonRelatedDao().selectLessonImageList(con, lessonCode);
		
		if(lessonImageList != null) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return lessonImageList;
	}

	//마이페이지 - 등록한 수업의 수업일정코드를 불러오는 메소드
	public ArrayList selectScheduleCodeList(int memberCode) {
		Connection con = getConnection();
		
		ArrayList lessonCodeList = new LessonRelatedDao().selectScheduleCodeList(con, memberCode);
		
		if(lessonCodeList != null) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return lessonCodeList;
	}
	
	//마이페이지 - 등록한 수업의 제반 정보 리스트 출력을 위한 메소드
	public ArrayList selectRegisteredLesson(int memberCode, ArrayList scheduleCodeList) {
		Connection con = getConnection();
		ArrayList<MyRegiLesson> myList = null;
		MyRegiLesson myLesson = null;
		Lesson lesson = null;
		LessonSchedule schedule = null;
		Image lessonImg = null;
		Image profileImg = null;
		Member artist = null;
		
		ArrayList lessonCodeList = new ArrayList();
		
		for(int i = 0; i < scheduleCodeList.size(); i++) {
			int lessonCode = new LessonRelatedDao().selectLessonCode(con, (Integer) scheduleCodeList.get(i));
			
			lessonCodeList.add(lessonCode);
		}
		
			
		myList = new ArrayList<MyRegiLesson>();

		for(int i = 0; i < lessonCodeList.size(); i++) {
			myLesson = new MyRegiLesson();

			int lessonCode = (Integer) lessonCodeList.get(i);

			lesson = new LessonRelatedDao().selectOneLesson(con, lessonCode);
			lessonImg = new LessonRelatedDao().selectOneLessonImage(con, lessonCode);
			schedule = new LessonRelatedDao().selectOneSchedule(con, (Integer) scheduleCodeList.get(i));

			int artistCode = lesson.getArtistCode();

			profileImg = new LessonRelatedDao().selectProfileImage(con, artistCode);
			artist = new LessonRelatedDao().selectOneArtist(con, artistCode);
			
			Timestamp startDate = new LessonRelatedDao().selectStartDate(con, (Integer) scheduleCodeList.get(i));

			myLesson.setScheduleCode((Integer) scheduleCodeList.get(i));
			myLesson.setLessonImgRoute(lessonImg.getImageRoute());
			myLesson.setLessonImgName(lessonImg.getImageName());
			myLesson.setLessonName(lesson.getLessonName());
			myLesson.setRegion(schedule.getRegion());
			myLesson.setProfileImgRoute(profileImg.getImageRoute());
			myLesson.setProfileImgName(profileImg.getImageName());
			myLesson.setArtistNick(artist.getArtistNick());
			myLesson.setArtistName(artist.getMemberName());
			myLesson.setStartDate(startDate);

			myList.add(myLesson);
		}

		if(myList.size() == lessonCodeList.size()) {
			commit(con);
		} else {
			rollback(con);
		}

		
		return myList;
	}

	public ArrayList<LessonOrder> selectOrderList(Integer scheduleCode) {
		Connection con = getConnection();
		
		ArrayList<LessonOrder> list = new LessonRelatedDao().selectOrderList(con, scheduleCode);
		
		if(list != null) {
			commit(con);
		} else {
			rollback(con);
		}
				
		return list;
	}

}













