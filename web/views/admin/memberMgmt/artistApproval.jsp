<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
    body {
       margin: 0px;
       width: 1440px;
       height: 1000px;
       margin: 0 auto;
       background: lightgray;
    }
    
    header {
       background: #DED842;
       width: 100%;
       height: 9%;
    }
    
    #topAreaT {
       width: 70%;
       height: 100%;
       margin: 0 auto;
       float: left;
       margin-left: 20px;
    }
    
    #topAreaT tr > td {
       color: #4E4E4E;
       font-size: 20px;
       font-weight: bold;
       
    }
    
    #topAreaT tr > td:nth-child(1) {
       font-size: 45px;
       font-family: 'ZCOOL QingKe HuangYou', cursive;
    }
    
    #logoutT {
       margin: 0 auto;
       padding-top: 20px;
       width: 340px;
       height: 100%;
    }
    
    #logout {
       border-style: solid;
       color: white;
        border-top-left-radius:50px;
        border-bottom-left-radius: 50px;
        border-top-right-radius: 50px;
        border-bottom-right-radius: 50px; 
        font-size: 17px;
    }
    
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
       padding: 5px;
	   border: 1px solid #4E4E4E;
	   height:30px;
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
    
    #approvalTab {
    	width:100%;
    	text-align:center;
    }
    
    #approvalTab td {
    	border:1px solid black;
    }
    #approvalTab tr:first-child {
    	background-color:#4E4E4E;
    	color:white;
    }
    #approvalBtn {
    	background-color:blue;
    	color:white;
    	padding: 5px;
    	font-size:15px;
    	border-radius:5%;
    	height:30px;
	    border: 1px solid blue;
    }
    #refuseBtn {
    	background-color:red;
    	font-size:15px;
    	color:white;
    	padding: 5px;
    	border-radius:5%;
	    border: 1px solid red;
	    height:30px;
    }
</style>
</head>

<body>
   <header>
      <table id="topAreaT">
         <tr style="text-align: right;">
            <td style="text-align: left;">hobbyist</td>
            <td>회원관리</td>
            <td>게시판관리</td>
            <td>수업관리</td>
            <td>신고/문의</td>
            <td>결제/환불</td>
            <td style="width: 90px;">통계</td>
         </tr>
      </table>
      <table id="logoutT">
         <tr>
            <td style="text-align: right;"><label id="logout">로그아웃</label></td>
         </tr>
      </table>
   </header>
   
   <section>
      <!-- 왼쪽 사이드바 메뉴  -->
      <article id="sideMenuBar">
      
         <!-- 큰 영역의 메뉴 -->
         <div id="bigMenu">
            <label style="font-weight: bold; font-size: 25px;">회원관리</label>
            <hr style="width: 80%; color: #DED842; height: 1px; background: #DED842; margin-top: 17px;">
         </div>
         
         <!-- 큰 메뉴안의 상세 메뉴 여러개 -->
         <div id="smallMenu">
            <label>회원 리스트</label><br>
            <label style="color: #DED842;">아티스트 승인</label><br>
            <label>알림 보내기</label>
         </div>
      </article>
      
      <!-- 관리자 본문 들어갈 공간 -->
      <article id="contents">
      
         <!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
         <div id="searchDetailArea">
            
            <!-- 상세페이지, 정렬, 검색 테이블 -->
            <table id="searchT">
               <tr>
                  <td style="text-align: left; vertical-align: bottom;"><label style="font-weight: bold; font-size:18px;">아티스트 승인</label></td>
                  <td style="padding-right: 20px;">
                     <input type="text" id="searchMember" style="height:25px;">&nbsp;<button id="searchBtn">검색</button>
                  </td>
               </tr>
               
            </table>
         </div>
         
         <!-- 본문 상단 줄 -->
         <hr id="firstLine">
         
         <!-- 정보 추가되는 본문 테이블 -->
         <div id="infoArea">
            <table id="approvalTab">
               <!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
               <tr>
               		<th style="width:80px;">번호</th>
               		<th style="width:150px;">아이디</th>
               		<th style="width:250px;">아티스트 등록</th>
               		<th style="width:120px;">등록일자</th>
               		<th style="width:200px;">승인</th>
               		<th style="width:250px;">거절사유</th>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn" class="btn btn-info btn-lg">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	거절 처리됨
                   </td>
                   <td style="text-decoration: underline;">hyeon0705님의 거절 사유</td>
               </tr>
               
            </table>
         </div>
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Modal Header</h4>
						</div>
						<div class="modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
			<script>
				$(document).ready(function() {
					$("#refuseBtn").click(function() {
						$("#myModal").modal();
					});
				});
			</script>
      </article>
   </section>
</body>
</html>