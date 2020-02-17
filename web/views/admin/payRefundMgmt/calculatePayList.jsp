<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	  section {
       width: 100%;
       height: 91%;
    }
    
    #sideMenuBar {
       background-color: #4E4E4E;
       width: 15%;
       height: 100%;
       float: left;
       margin: 0px;
       text-align: center;
    }
    
    #bigMenu {
       margin-top: 20px;
        color: #DED842;
    }
    
    #smallMenu {
       margin-top: 20px;
       padding-left: 25px;
       color: white;
       text-align: left;
       font-weight: bold;
       font-size: 19px;
       line-height: 45px;
    }
    
    #contents {
       background-color: white;
       width: 85%;
       height: 100%;
       margin: 0px;
       float: left;
    }
    
    #searchMember {
       margin-top: 80px;
       text-align: right;
    }
    
    #searchDetailArea {
       width: 100%;
       text-align: right;
    }
    
    #searchT {
       width: 90%;
       margin-left: 10%;
    }
    
    #searchBtn {
       color: white;
       background-color: #4E4E4E;
    }
    
    #firstLine {
       width: 90%;
       height: 1px;
       background:black;
       margin: 0px;
       margin-left: 115px;
       margin-top: 10px;
       align: right;
    }
    
    #infoArea {
       margin-top: 50px;
       margin-left: 60px;
       width: 1100px;
       height: 500px;
       border: 1px solid #4E4E4E;
       overflow-x: hidden;
        overflow-y: auto;
    }
	#calPayTab{
    	width:100%;
    	text-align:center;
    	border-collapse:collapse;
    }
    #calPayTab th {
    	text-align:center;
    }
    #calPayTab td {
    	border:1px solid black;
    }
    #calPayTab tr:first-child {
    	background-color:#4E4E4E;
    	color:white;
    }
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/adminMenubar.jsp" %>
	<section>
      <!-- 왼쪽 사이드바 메뉴  -->
      <article id="sideMenuBar">
      
         <!-- 큰 영역의 메뉴 -->
         <div id="bigMenu">
            <label style="font-weight: bold; font-size: 25px;">결제/환불</label>
            <hr style="width: 80%; color: #DED842; height: 1px; background: #DED842; margin-top: 17px;">
         </div>
         
         <!-- 큰 메뉴안의 상세 메뉴 여러개 -->
         <div id="smallMenu">
            <label>내역조회</label><br>
            <label>환불신청</label><br>
            <label style="color:#DED842;">금액정산</label>
         </div>
      </article>
      
      <!-- 관리자 본문 들어갈 공간 -->
      <article id="contents">
      
         <!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
         <div id="searchDetailArea">
            
            <!-- 상세페이지, 정렬, 검색 테이블 -->
            <table id="searchT">
               <tr>
                  <td style="text-align: left; vertical-align: bottom;"><label style="font-weight: bold;">금액정산</label></td>
                  <td style="padding-right: 20px;">
                     <input style="text" id="searchMember"><button id="searchBtn">검색</button>
                  </td>
               </tr>
               
            </table>
         </div>
         
         <!-- 본문 상단 줄 -->
         <hr id="firstLine">
         
         <!-- 정보 추가되는 본문 테이블 -->
         <div id="infoArea">
            <table id="calPayTab">
               <!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
               <tr>
               		<th style="width:130px;">수업일정코드</th>
               		<th style="width:50px;">회차</th>
               		<th style="width:150px;">아티스트 아이디</th>
               		<th style="width:150px;">아티스트 이름</th>
               		<th style="width:150px;">회차당 수업료</th>
               		<th style="width:90px;">수강인원</th>
               		<th style="width:100px;">총 수업료</th>
               		<th style="width:90px;">수수료</th>
               		<th style="width:100px;">총 지급액</th>
               		<th style="width:100px;">계좌번호</th>
               		<th style="width:120px;">상태</th>
               </tr>
               <tr>
                   <td>1159-2</td>
                   <td>1</td>
                   <td>dreamhigh</td>
                   <td>임찬영</td>
                   <td>20000</td>
                   <td>5</td>
                   <td>100000</td>
                   <td>10%</td>
                   <td>90000</td>
                   <td>우리 1002834795530</td>
                   <td>확인대기중</td>
               </tr>
               <tr>
                   <td>1160-3</td>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td>김설현</td>
                   <td>20000</td>
                   <td>5</td>
                   <td>100000</td>
                   <td>10%</td>
                   <td>90000</td>
                   <td>우리 1002834795530</td>
                   <td style="color:red;">이의제기</td>
               </tr>
            </table>
         </div>
      </article>
   </section>
</body>
</html>