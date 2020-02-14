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
 		width: 270px;
 		height: 100%;
 	}
 	
 	section {
 		width: 100%;
 		height: 91%;
 	}
 	
 	#sideMenu {
 		background-color: #4E4E4E;
 		width: 15%;
 		height: 100%;
 	}
 	#contents {
 		width: 85%;
 		height: 100%;
 		background-color: blue;
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
				<td style="text-align: right;"><button>로그아웃</button></td>
			</tr>
		</table>
	</header>
	
	<section>
		<article id="sideMenu">
		</article>
		<article id="contents">
			<hr style="width: 80%; height: 20px;">
		</article>
	</section>
</body>
</html>