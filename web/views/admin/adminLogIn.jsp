<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
 <style>
	body {
		background: #4E4E4E;
		text-align: center;
		padding: 0px;
		margin: 0px;
	}
	
	#logInArea {
		position: absolute;
		margin: -200px 0px 0px -280px;
		top : 45%;
		left: 50%;
		height: 50px;
		width: 560px;
		line-height: 80px;
	}
	
	#hobbyist {
		font-size: 125px;
		color: #DED842;
		font-family: 'Do Hyeon', sans-serif;
		text-align: center;
		padding-left: 95px;
		
	}
	
	#id, #password {
		color: #DED842;
		font-weight: bold;
		font-size: 20px;
		text-align: left;
		width: 100px;
	}
		
	#idT, #passwordT {
		height: 50px;
		width: 420px;
		font-size: 25px;
		
	}
	
	#logIn {
		line-height: 100px;
	} 
	
	#logInBtn {
		background-color: #DED842;
		color: #4E4E4E;
		width: 420px;
		height: 50px;
		font-size: 30px;
		font-family: 'Do Hyeon', sans-serif;
		padding: 0px;
	}
	
</style>
</head>
<body>
	<div id="logInArea">
		<table id="logInTable">
			<tr style="line-height: 180px;">
				<td id="hobbyist" colspan="2">hobbyist</td>
			</tr>
			<tr>
				<td id="id">아이디</td>
				<td><input type="text" id="idT"></td>
			</tr>
			<tr>
				<td id="password">비밀번호</td>
				<td><input type="password" id="passwordT"></td>
			</tr>
			<tr>
				<td></td>
				<td id="logIn"><button id="logInBtn">로그인</button></td>
			</tr>
		</table>
	</div>
</body>
</html>