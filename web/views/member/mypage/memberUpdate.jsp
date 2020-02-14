<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.dvtop {
	top: 30px;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	width: 1024px;
}

.tbtop {
	
}

#show1 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	line-height: 37px;
	color: darkolivegreen;
	text-align: center;
}

.dvtop1 {
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	width: 1024px;
	height: 160px;
	background-color: #EDEDED;
	border-radius: 5px;
	border: 5px solid #EDEDED;
}

.tbtop1 {
	float: left;
}

.tbtop2 {
	margin: auto;
	float: left;
}

.tbtop3 {
	margin: auto;
	float: right;
}

.tbtop4 {
	
}

.dvtopblock1 {
	height: 70px;
}

.dvtop2 {
	
	
	
}
.tbtop4{
	margin-left: auto;
	margin-right: auto; 
	width : 1024px;
	backgorund-color: black;
	border-bottom: 1px solid black;
	height: 70px;
	width: 1024px;
	
}

.dvtop3 {
	margin-left: auto;
	margin-right: auto; height : 50px;
	border-bottom: 1px solid black;
	width: 1024px;
	height: 50px;
}

.dvtop4{


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






</style>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="dvtop">
		<table class="tbtop">
			<tr>
				<td span=2><label id="show1">마이페이지</label></td>
			</tr>

		</table>
	</div>



	<div class="dvtop1">
		<table class="tbtop1">
<td style="width: 100px; height: 100px;"><img id="config" src="<%request.getContextPath()%>/images/main_mypage" style="height:25px"</label></td> 

		</table>
		<table class="tbtop2">
			<tr>
				<td rowspan="2"><label id="show2">Jae</label></td>
			</tr>
		</table>
		<table class="tbtop3">
			<tr>
				<td rowspan="2"><label id="show3">Sun</label></td>
			</tr>
		</table>
	</div>


	<div class="dvtopblock1"></div>


	<div class="dvtop2">
		<table align="border" class="tbtop4">
			<tr>
				<td><button class="Center_button1">나의 수업</button></td>
				<td><button class="Center_button2">나의 정산</button></td>
				<td><button class="Center_button3">나의 결제</button></td>
				<td><button class="Center_button4">나의 댓글</button></td>
				<td><button class="Center_button5">나의 문의/신고</button></td>
				<td><button class="Center_button6">설정</button></td>
			</tr>
		</table>

	</div>

	<div class="dvtop3">
		<table class="tbtop3">
			
			
			
			
		</table>

	</div>



</body>
</html>