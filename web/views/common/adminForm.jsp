<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
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
 		color: white;
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
 	#firstLine {
 		width: 90%;
 		height: 1px;
 		background:black;
 		margin: 0px;
	 	margin-left: 115px;
 		margin-top: 10px;
 		align: right;
 	}
 	
 	#searchDetailArea {
 		width: 100%;
 		text-align: right;
 	}
 	
 	#searchBtn {
 		color: white;
 		background-color: #4E4E4E;
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
				
			</div>
		</article>
		
		<!-- 관리자 본문 들어갈 공간 -->
		<article id="contents">
		
			<!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
			<div id="searchDetailArea">
				
				<!-- 상세페이지 버튼 -->
				<table style="width: 40%; float: left;">
					
					<tr>
						<td></td>
					</tr>
					
				</table>
				
				<!-- 정렬, 검색 -->
				<table style="width: 60%; float: left;">
					<tr>
						<td></td>
						<td></td>
						<td style="padding-right: 20px;">
							<input style="text" id="searchMember"><button id="searchBtn">검색</button>
						</td>
					</tr>
					
				</table>
			</div>
			
			<!-- 본문 상단 줄 -->
			<hr id="firstLine">
			
		</article>
	</section>
</body>
</html>