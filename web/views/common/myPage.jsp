<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.divtop1 {
	top: 30px;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	width: 1024px;
}

#font1 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	line-height: 37px;
	color: darkolivegreen;
	text-align: center;
}

.divtop2 {
	margin-top: 25px;
	margin-left: auto;
	margin-right: auto;
	width: 1024px;
	height: 160px;
	background-color: #EDEDED;
	border-radius: 5px;
	border: 5px solid #EDEDED;
}

.tabletop2 {
	width: 1024px;
	height:160px;
}

.tabletop3 {
	margin: auto;
	float: left;
}

.tabletop4 {
	margin: auto;
	float: right;
	text-align: right;
}

.divtopblock1 {
	height: 25px;
}

.tablecenter1{
	margin-left: auto;
	margin-right: auto; 
	width : 1024px;
	backgorund-color: black;
	border-bottom: 1px solid black;
	height: 70px;
	width: 1024px;
}

.tablecenter1 td {
	width: 14.3%;
}

.Center_button1{
	border: 0;
	outline: 0;
	background-color: #ffffff;
	
	font-family: Do Hyeon;
	font-size: 25px;
	background: #black;
}

.Center_button2{
	border: 0;
	outline: 0;
	background-color: #ffffff; 
	
	font-family: Do Hyeon;
	font-size: 25px;
	background: #black;
}

.Center_button3{
	border: 0;
	outline: 0;
	background-color: #ffffff; 
	
	font-family: Do Hyeon;
	font-size: 25px;
	background: #black;
}

.Center_button4{
	border: 0;
	outline: 0;
	background-color: #ffffff; 
	
	font-family: Do Hyeon;
	font-size: 25px;
	background: #black;
}

.Center_button5{
	border: 0;
	outline: 0;
	background-color: #ffffff; 
	
	font-family: Do Hyeon;
	font-size: 25px;
	background: #black;	
}

.Center_button6{
	border: 0;
	outline: 0;
	background-color: #ffffff; 
	
	font-family: Do Hyeon;
	font-size: 25px;
	background: #black;
	}
	
#profileImg {
	height: 130px;
	width: 130px;
	magin: auto;
	border-radius: 90px;
}

#gearwheel {
	height: 35px;
	width: 35px;
	magin: auto;
}

.profileImgArea {
	text-align: center;
	width: 200px;
}

.td2{
text-align: right;
}

.memberUpdate {
	width: 160px;
	text-align: right;
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 25px;
	line-height: 31px;
}

.td4{
font-family: Do Hyeon;
font-style: normal;
font-weight: normal;
font-size: 22px;
line-height: 27px;

}

.td8{
font-family: Do Hyeon;
font-style: normal;
font-weight: normal;
font-size: 25px;
line-height: 31px;

color: #556B2F;

}

.name{
	font-family: Do Hyeon;
	/* font-weight: bold; */
	font-size: 30px;
	line-height: 40px;
}

#nim {
	font-style: normal;
	/* font-weight: normal; */
	font-size: 25px;
}

.pointArea {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 25px;
	line-height: 31px;
	text-align: center;
 	color: #6F6C6C;
 	text-align: right;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="divtop1">
		<!-- 마이페이지 글씨 -->
		<table class="tabletop1">
			<tr>
				<td span=2><label id="font1">마이페이지</label></td>
			</tr>

		</table>
	</div>


	<!--상단 요소-->
	<div class="divtop2">
		<table class = tabletop2>
			<tr>
				<!--학생사진  -->
				<td rowspan="4" class="profileImgArea" ><img id="profileImg" src="<%=request.getContextPath() %>/static/images/seolhyun.png"></td>
				<td colspan="4" class="td1"></td>
				<!--  설정 사진 -->
				<td colspan="3" class="td2"><img id="gearwheel" src="<%=request.getContextPath() %>/static/images/gearwheel.png"></td>
				<td colspan="1" class="memberUpdate">회원정보 수정&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>	
				<td colspan="4" class="td4">학생</td>
				<td colspan="4" class="td5"></td>
			</tr>
			<tr>
				<td colspan="4" class="name">김설현<em id="nim"> &nbsp;님</em></td>
				<td colspan="4" class="td7"></td>
			</tr>
			<tr>
				<td colspan="4" class="td8">아티스트 심사 대기중입니다.</td>
				<td colspan="4" class="pointArea">보유 포인트&nbsp; :&nbsp; 2500p&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
	</div>

	<!-- 상단요소와 중간 메뉴바 사이의 여백을 위한 div -->
	<div class="divtopblock1"></div>

	<!--중간 메뉴바 -->
	<div class="divcenter1">
		<table align="border" class="tablecenter1">
			<tr>
				<td><button class="Center_button1">나의 수업</button></td>
				<td><button class="Center_button2">나의 정산</button></td>
				<td><button class="Center_button3">나의 결제</button></td>
				<td><button class="Center_button3">나의 리뷰</button></td>
				<td><button class="Center_button4">나의 댓글</button></td>
				<td><button class="Center_button5">나의 문의/신고</button></td>
				<td style="width:9%" align="right"><button class="Center_button6">설정</button></td>
				
			</tr>
		</table>
	</div>

</body>
</html>