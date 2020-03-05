package com.dh.hobbyist.memberUpdate.model.dao;

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

import com.dh.hobbyist.memberUpdate.model.vo.*;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/memberUpdate/memberUpdate-query.properties").getPath();
	
		System.out.println(fileName);
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	
	
	
	
		//회원 정보수정
	   public int memberUpdate(Connection con, Member member) {
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   
		   int memberUpdate = 0;
		   
		   String query = prop.getProperty("memberUpdate");
		   
		   System.out.println(member.getMemberId());
		   System.out.println(member.getMemberPwd());
		   System.out.println(member.getMemberName());
		   System.out.println(member.getEmail());
		   System.out.println(member.getPhone());
		   System.out.println(member.getBankName());
		   System.out.println(member.getBankNum());
		   
		   try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getBankName());
			pstmt.setString(6, member.getBankNum());
			pstmt.setString(7, member.getMemberId());
			
			
			memberUpdate = pstmt.executeUpdate();
			
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}  
		   return memberUpdate;  
	   }

	   
	   //패스워드 확인
	public int pwConfirm(Connection con, String member) {
		int result =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("pwConfirm");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member);
						
			rset = pstmt.executeQuery();
		
			if(rset.next()) {
				result =rset.getInt(1);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		return result;
		
	}



	//패스워드 확인
	public int pwCheck(Connection con, String userPw) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset =null;
		
		String query = prop.getProperty("pwCheck");
		
	
			try {
				pstmt =con.prepareStatement(query);
				pstmt.setString(1, userPw);
				rset = pstmt.executeQuery();
				
			
				
				if(rset.next()) {
					result = rset.getInt(1);
				}	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		return result;
	}






	//전화 번호 확인
	public int telCheck(Connection con, String userTel) {
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		int result =0;
		
		String query= prop.getProperty("userTel");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userTel);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
		

	}













	   
}
