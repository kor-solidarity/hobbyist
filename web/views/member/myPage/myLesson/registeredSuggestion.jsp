<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#regSugDiv1 {
		width:1024px;
		margin:auto;
	}
	#regSugTab1 {
		width:100%;
		font-family: Do Hyeon;
		font-size: 25px;
		margin-top:5px;
	}
	#regSubTab1 td {
		width:100px;
	}
	.Center_button1 {
		color:darkolivegreen;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/myPage.jsp" %>
	<div id="regSugDiv1">
		<table id="regSugTab1">
			<tr>
				<td>수강한 수업</td>
				<td>찜한 수업</td>
				<td style="color:darkolivegreen;">등록한 건의</td>
				<td>찜한 건의</td>
				<td>등록한 수업</td>
			</tr>
			<tr>
				<td colspan="5"><hr></td>
			</tr>
		</table>
		<table id="regSubTab2">
			
		</table>
	</div>
</body>
</html>