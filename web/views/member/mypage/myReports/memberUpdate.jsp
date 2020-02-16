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

.tabletop1 {
	
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
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	width: 1024px;
	height: 160px;
	background-color: #EDEDED;
	border-radius: 5px;
	border: 5px solid #EDEDED;
}

.tabletop2 {
	float: left;
}

.tabletop3 {
	margin: auto;
	float: left;
}

.tabletop4 {
	margin: auto;
	float: right;
}

.divtopblock1 {
	height: 70px;
}

.divcenter1 {
		
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

.divcenter2 {
	margin-left: auto;
	margin-right: auto; height : 50px;
	border-bottom: 1px solid black;
	width: 1024px;
	height: 50px;
}

.tablecenter2{


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
	
#memberUpdate1{

height: 100px;
width: 100px;
magin: auto;

}

#show1{

position: absolute;
width: 37px;
height: 25px;
left: 220;
top: 230px;


}

#show2{
position: absolute;
width: 141px;
height: 36px;
left: 220;
top: 300px;



}

#show3{
position: absolute;
width: 141px;
height: 36px;
left: 260;
top: 300px;



}
#show4{
position: absolute;
width: 323px;
height: 38px;
left: 220px;
top: 350px;

font-family: Do Hyeon;
font-style: normal;
font-size: 23px;
line-height: 29px;

font-color: "#556B2F";

}



</style>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="divtop1">
		<table class="tabletop1">
			<tr>
				<td span=2><label id="font1">마이페이지</label></td>
			</tr>

		</table>
	</div>



	<div class="divtop2">
		<table class="tabletop2">
	<td><img id="memberUpdate1" src="<%=request.getContextPath() %>/static/images/memberUpdate1.png"></td>  
		</table>
		<table class="tabletop3">
			<label id="show1">학생&nbsp;학생</label>
			<label id="show2">김설현&nbsp;김설현</label>
			<label id="show3">님&nbsp;님</label>
			<label id="show4">아티스트&nbsp;심사&nbsp;대기&nbsp;중입니다.</label>
		
			
		</table>
		<table border="1" class="tabletop4">
			<tr>
				<td rowspan="2"><label id="show2">김설현</label></td>
			</tr>
		</table>
		
		
		
	</div>


	<div class="divtopblock1"></div>


	<div class="divcenter1">
		<table align="border" class="tablecenter1">
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

	<div class="divcenter2">
		<table class="tablecenter2">
			
			
			
			
		</table>

	</div>



</body>
</html>