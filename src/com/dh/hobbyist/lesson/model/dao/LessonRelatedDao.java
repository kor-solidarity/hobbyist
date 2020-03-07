package com.dh.hobbyist.lesson.model.dao;

import static com.dh.hobbyist.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Properties;

import com.dh.hobbyist.lesson.model.vo.Image;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;
import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.payment.model.vo.Payment;

public class LessonRelatedDao {
	private Properties prop = new Properties();
	
	public LessonRelatedDao() {
		String fileName = LessonRelatedDao.class.getResource("/sql/lesson/lessonRelated-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//수업 개설 후 수업DB에 등록하기 위한 메소드
	public int insertLesson(Connection con, Lesson lesson) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertLesson");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, lesson.getLessonName());
			pstmt.setInt(2, lesson.getMinStudents());
			pstmt.setInt(3, lesson.getMaxStudents());
			pstmt.setInt(4, lesson.getTotalOrders());
			pstmt.setInt(5, lesson.getCostPerOrder());
			pstmt.setInt(6, lesson.getTotalCosts());
			pstmt.setString(7, lesson.getArtistIntro());
			pstmt.setString(8, lesson.getLessonIntro());
			pstmt.setInt(9, lesson.getCategoryCode());
			pstmt.setInt(10, lesson.getArtistCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//lessonCode 조회용 메소드
	public int selectLessonCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int lessonCode = 0;
		
		String query = prop.getProperty("selectLessonCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				lessonCode = rset.getInt("CURRVAL");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return lessonCode;
	}

	public int insertSchedule(Connection con, LessonSchedule schedule) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSchedule");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, schedule.getLessonCode());
			pstmt.setString(2, schedule.getRegion());
			pstmt.setString(3, schedule.getSubRegion());
			pstmt.setString(4, schedule.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//schedule code의 PK 값을 받아오기 위한 메소드
	public int selectScheduleCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int scheduleCode = 0;
		
		String query = prop.getProperty("selectScheduleCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				scheduleCode = rset.getInt("CURRVAL");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return scheduleCode;
	}

	public int insertOrder(Connection con, LessonOrder order) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrder");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, order.getScheduleCode());
			pstmt.setInt(2, order.getOrderTime());
			pstmt.setTimestamp(3, order.getOrderStart());
			pstmt.setTimestamp(4, order.getOrderEnd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertImage(Connection con, Image image) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertImage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, image.getImageRoute());
			pstmt.setString(2, image.getImageName());
			pstmt.setInt(3, image.getImageFkPk());
			pstmt.setInt(4, image.getImageMain());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Image selectProfileImage(Connection con, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Image p = null;
		
		String query = prop.getProperty("selectProfileImage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Image();
				p.setImageCode(rset.getInt("IMAGE_PK"));
				p.setImageRoute(rset.getString("IMAGE_ROUTE"));
				p.setImageName(rset.getString("IMAGE_NAME"));
				p.setImageMain(rset.getInt("IMAGE_MAIN"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public Lesson selectOneLesson(Connection con, int lessonCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Lesson l = null;
		
		String query = prop.getProperty("selectOneLesson");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lessonCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				l = new Lesson();
				l.setLessonCode(rset.getInt("LESSON_PK"));
				l.setLessonName(rset.getString("LESSON_NAME"));
				l.setMinStudents(rset.getInt("MIN_STUDENTS"));
				l.setMaxStudents(rset.getInt("MAX_STUDENTS"));
				l.setTotalOrders(rset.getInt("TOTAL_ORDERS"));
				l.setCostPerOrder(rset.getInt("COST_PER_ORDER"));
				l.setTotalCosts(rset.getInt("TOTAL_COSTS"));
				l.setArtistIntro(rset.getString("ARTIST_INTRO"));
				l.setLessonIntro(rset.getString("LESSON_INTRO"));
				l.setPetitionCode(rset.getInt("PETITION_PK"));
				l.setRegisteredDate(rset.getDate("REGISTERED_DATE"));
				l.setStatus(rset.getInt("STATUS"));
				l.setCategoryCode(rset.getInt("CATEGORY_PK"));
				l.setArtistCode(rset.getInt("ARTIST_PK"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return l;
	}

	public Member selectOneArtist(Connection con, int artistCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member a = null;
		
		String query = prop.getProperty("selectOneArtist");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, artistCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a = new Member();
				a.setMemberName(rset.getString("MEMBER_NAME"));
				a.setArtistNick(rset.getString("ARTIST_NICK"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return a;
	}

	public ArrayList<LessonSchedule> selectScheduleList(Connection con, int lessonCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<LessonSchedule> list = null;
		LessonSchedule s = null;
		
		String query = prop.getProperty("selectSchedule");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lessonCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<LessonSchedule>();
			
			while(rset.next()) {
				s = new LessonSchedule();
				s.setScheduleCode(rset.getInt("SCHEDULE_PK"));
				s.setRegion(rset.getString("REGION"));
				s.setSubRegion(rset.getString("SUB_REGION"));
				s.setAddress(rset.getString("ADDRESS"));
				
				list.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Image> selectLessonImageList(Connection con, int lessonCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Image> list = null;
		Image i = null;
		
		String query = prop.getProperty("selectLessonImage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lessonCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Image>();
			
			while(rset.next()) {
				i = new Image();
				i.setImageCode(rset.getInt("IMAGE_PK"));
				i.setImageRoute(rset.getString("IMAGE_ROUTE"));
				i.setImageName(rset.getString("IMAGE_NAME"));
				i.setImageMain(rset.getInt("IMAGE_MAIN"));
				
				list.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	//등록한 수업의 수업일정코드 조회용 메소드
	public ArrayList selectScheduleCodeList(Connection con, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList list = null;
		
		String query = prop.getProperty("selectScheduleCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList();
			
			while(rset.next()) {
				int lessonCode = rset.getInt("LESSON_SCHEDULE_PK");
				
				list.add(lessonCode);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Image selectOneLessonImage(Connection con, int lessonCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Image i = null;
		
		String query = prop.getProperty("selectOneLessonImage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lessonCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new Image();
				i.setImageRoute(rset.getString("IMAGE_ROUTE"));
				i.setImageName(rset.getString("IMAGE_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return i;
	}


	public int selectLessonCode(Connection con, int scheduleCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int lessonCode = 0;
		
		String query = prop.getProperty("selectLessonCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, scheduleCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				lessonCode = rset.getInt("LESSON_PK");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return lessonCode;
	}

	public LessonSchedule selectOneSchedule(Connection con, Integer scheduleCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		LessonSchedule s = null;
		
		String query = prop.getProperty("selectOneSchedule");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, scheduleCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				s = new LessonSchedule();
				s.setRegion(rset.getString("REGION"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return s;
	}

	public ArrayList<LessonOrder> selectOrderList(Connection con, Integer scheduleCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<LessonOrder> list = null;
		LessonOrder o = null;
		
		String query = prop.getProperty("selectOrder");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, scheduleCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<LessonOrder>();
			
			while(rset.next()) {
				o = new LessonOrder();
				o.setOrderCode(rset.getInt("LESSON_ORDER_PK"));
				o.setScheduleCode(rset.getInt("SCHEDULE_PK"));
				o.setOrderTime(rset.getInt("LESSON_ORDER_TIME"));
				o.setOrderStart(rset.getTimestamp("LESSON_ORDER_START"));
				o.setOrderEnd(rset.getTimestamp("LESSON_ORDER_END"));
				o.setListeners(rset.getInt("LISTENERS"));
				
				list.add(o);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		//System.out.println("list : " + list);
		
		return list;
	}

	public Timestamp selectStartDate(Connection con, Integer scheduleCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Timestamp t = null;
		
		System.out.println("scheduleCode : " + scheduleCode);
		
		String query = prop.getProperty("selectStartDate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, scheduleCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = rset.getTimestamp("LESSON_ORDER_START");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("t : " + t);
		return t;
	}

	public Payment selectOnePayment(Connection con, Integer scheduleCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Payment p = null;
		
		String query = prop.getProperty("selectOnePayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, scheduleCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Payment();
				p.setPaymentCode(rset.getInt("PAYMENT_PK"));
				p.setPayDate(rset.getTimestamp("PAYMENT_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public int insertCert(Connection con, int certsCode, int lessonCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCert");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lessonCode);
			pstmt.setInt(2, certsCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}


}













