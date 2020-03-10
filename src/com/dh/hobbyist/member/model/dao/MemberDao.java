package com.dh.hobbyist.member.model.dao;

import static com.dh.hobbyist.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.dh.hobbyist.artist.model.vo.ApplyArtist;
import com.dh.hobbyist.lesson.model.vo.LessonPayment;
import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.suggest.model.vo.PetitionWishList;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//회원가입 메소드(유승)
	public int insertMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//로그인 메소드(유승)
	public Member loginCheck(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginMember = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginMember = new Member();
				
				loginMember.setMemberCode(rset.getInt("MEMBER_PK"));
				loginMember.setMemberId(rset.getString("MEMBER_ID"));
				loginMember.setMemberPwd(rset.getString("MEMBER_PWD"));
				loginMember.setMemberName(rset.getString("MEMBER_NAME"));
				loginMember.setPhone(rset.getString("MEMBER_PHONE"));
				loginMember.setEmail(rset.getString("MEMBER_EMAIL"));
				loginMember.setBankName(rset.getString("MEMBER_BANK_NAME"));
				loginMember.setBankOwner(rset.getString("MEMBER_BANK_OWNER"));
				loginMember.setBankNum(rset.getString("MEMBER_BANK_NUM"));
				loginMember.setDel(rset.getInt("MEMBER_DEL"));
				loginMember.setPoint(rset.getInt("MEMBER_POINT"));
				loginMember.setRegDate(rset.getDate("REG_DATE"));
				loginMember.setFirstLogin(rset.getInt("FIRST_LOGIN"));
				loginMember.setWarnings(rset.getInt("WARNINGS"));
				loginMember.setIsArtist(rset.getInt("IS_ARTIST"));
				loginMember.setArtistAccepted(rset.getDate("ARTIST_ACCEPTED"));
				loginMember.setArtistNick(rset.getString("ARTIST_NICK"));
				loginMember.setArtistIntro(rset.getString("ARTIST_INTRO"));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return loginMember;
	}
	//아이디 중복체크 메소드(유승)
	public int idCheck(Connection con, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}
	
	//관리자에서 회원리스트 조회용 메소드 (찬영)
	public List<Member> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		List<Member> memberList = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			memberList = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberCode(rset.getInt("MEMBER_PK"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setPhone(rset.getString("MEMBER_PHONE"));
				m.setEmail(rset.getString("MEMBER_EMAIL"));
				m.setIsArtist(rset.getInt("IS_ARTIST"));
				m.setWarnings(rset.getInt("WARNINGS"));
				m.setRegDate(rset.getDate("REG_DATE"));
				
				memberList.add(m);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return memberList;
	}
	
	//관리자에서 아티스트 정보 조회용 메소드 (찬영)
	public List<Member> selectArtistList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		List<Member> artistList = null;
		
		String query = prop.getProperty("selectArtistList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			artistList = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberCode(rset.getInt("MEMBER_PK"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setArtistNick(rset.getString("ARTIST_NICK"));
				m.setPhone(rset.getString("MEMBER_PHONE"));
				m.setEmail(rset.getString("MEMBER_EMAIL"));
				m.setBankName(rset.getString("MEMBER_BANK_NAME"));
				m.setBankOwner(rset.getString("MEMBER_BANK_OWNER"));
				m.setBankNum(rset.getString("MEMBER_BANK_NUM"));
				m.setArtistAccepted(rset.getDate("ARTIST_ACCEPTED"));
				
				artistList.add(m);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return artistList;
	}
	
	 
	 
	//아이디 찾기 메소드(유승)
	public Member findId(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member findMember = null;
		
		String query = prop.getProperty("findId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getPhone());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				findMember = new Member();
				
				findMember.setMemberId(rset.getString("MEMBER_ID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return findMember;
	}
	
	//비밀번호 찾기 메소드(유승)
	public Member findPassword(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member findMember = null;
		
		String query = prop.getProperty("findPassword");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getPhone());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				findMember = new Member();
				
				findMember.setMemberId(rset.getString("MEMBER_ID"));
				/*findMember.setMemberId(rset.getString("MEMBER_PWD"));*/
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return findMember;
	}
	
	//비밀번호 재설정(유승)
	public int setPassword(Connection con, String memberPwd, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("setPassword");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberPwd);
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//휴대전화 중복 체크(유승)
	public int phoneCheck(Connection con, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("phoneCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}
	
	//첫 로그인 관심 카테고리 설정(유승)
	public int insertCategory(Connection con, int memberCode, int[] categoryCodes) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertCategory");
		
		//int 배열을 Integer 배열로 형변환 시키기
		/*Integer[] cateCode = Arrays.stream(categoryCodes).boxed().toArray(Integer[]::new);*/
		
		try {
			
			for(int i = 0; i < categoryCodes.length; i ++) {
				if(categoryCodes[i] != 0) {       //int형은 null값으로 비교할 수 없으니 Integer로 형변환 뒤 비교 
					
					//Integer를 다시 int로 변환
					/*int categoryCode = (int) cateCode[i].intValue();*/
					
					System.out.println(categoryCodes[i]);
					
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, memberCode);
					pstmt.setInt(2, categoryCodes[i]);
					
					result = pstmt.executeUpdate();
				}
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	//첫 로그인 여부 확인용 로그인 카운트(유승)
	public int loginCount(Connection con, Member member) {
		int result2 = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("loginCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, member.getMemberCode());
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result2;
	}
	
	//회원의 프로필 이미지 경로 조회(지호)
	   public String selectImageRoot(Connection con, int memberCode) {
	      String imageRoot = "";
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String query = prop.getProperty("selectImageRoot");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, memberCode);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            imageRoot += rset.getString("IMAGE_ROUTE");
	            imageRoot += "/";
	            imageRoot += rset.getString("IMAGE_NAME");
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return imageRoot;
	   }

	   //회원의 아티스트 승인 신청내역 조회(지호)
	   public ApplyArtist selectOneApplyArtist(Connection con, int memberCode) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ApplyArtist aa = null;
	      
	      String query = prop.getProperty("selectOneApplyArtist");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, memberCode);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            aa = new ApplyArtist();
	            aa.setApplyCode(rset.getInt("APPLY_PK"));
	            aa.setApplyDate(rset.getDate("APPLY_DATE"));
	            aa.setApplyAttempts(rset.getInt("APPLY_ATTEMPTS"));
	            aa.setApplyConfirmed(rset.getInt("APPLY_CONFIRMED"));
	            aa.setRejectReason(rset.getString("REJECT_REASON"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return aa;
	   }
    //회원의 찜한 건의 목록 내역 조회 (지호)  
	public ArrayList<PetitionWishList> selectPetitionWishList(Connection con, int memberCode) {
		  PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<PetitionWishList> list = null;
	      
	      String query = prop.getProperty("selectPetitionWishList");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, memberCode);
	         
	         rset = pstmt.executeQuery();
	         
	         list = new ArrayList<PetitionWishList>();
	         
	         while(rset.next()) {
	            PetitionWishList p = new PetitionWishList();
	            p.setPetitionCode(rset.getInt("LESSON_PETITION_PK"));
	            p.setMemberCode(rset.getInt("MEMBER_PK"));
	            
	            list.add(p);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      
	      return list;

	}


    // 사용자(Member)의 수업 결재 목록 조회 (은석)
    public ArrayList<LessonPayment> selectLessonPaymentList(Connection con, int member_pk) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<LessonPayment> paymentArrayList = null;

        // 멤버리뷰 목록조회 1단계: 멤버 PK 에 따른 LESSON_PAYMENT, LESSON_SCHEDULE 불러오기.
        String query = prop.getProperty("selectPassedLessonPaymentListByMember");


        return null;
    }

    // 마이페이지 클릭 시 사용자의 포인트 새로 조회 (종현)
	public int selectPoint(Connection con, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int point = 0;
		
		String query = prop.getProperty("selectPoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				point = rset.getInt("MEMBER_POINT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return point;
	}
}
