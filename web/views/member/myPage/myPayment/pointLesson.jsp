<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eun-css.css">
<title>Insert title here</title>
<style>
	#payListDiv {
		width: 1024px;
		height: 400px;
		text-align: center;
		margin: 0 auto;
	}
	
	#payListTable {
		width: 1024px;;
		margin-top: 30px;
	}
</style>
</head>
<body>
	<%@include file="/views/common/myPage.jsp" %>
	<br clear="both">
	<div id="payListDiv">
		<table id="payListTable">
			<tr>
				<th colspan="4"><hr></th>
			</tr>
			<tr>
				<th>포인트</th>
				<th>적립구분</th>
				<th>적립날짜</th>
			</tr>
			<tr>
				<th colspan="4"><hr></th>
			</tr>
			
		</table>
	</div>
</body>
</html>