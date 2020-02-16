<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Roboto|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>

	#main {
		width: 1024px;
		margin:auto;
	}
	
	#title {
		 font-size: 30px;
		 font-family: 'Do Hyeon', sans-serif;
		 color:darkolivegreen;
		 font-weight: 100;
		 padding-top: 70px;
		 padding-left:30px;
		
	}
	#content {
		color:gray;
		padding-left:30px;
		margin-top:-20px;
		padding-bottom:100px;
	}
	#category {
		padding-bottom:200px;
		font-family: 'Do Hyeon', sans-serif;
		color:darkolivegreen;
		font-size:22px;
		border-collapse:seperate;
		border-spacing:70px;
	}
	

	
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"  %>
	<div id="main">
	<h2 id="title">관심 카테고리 등록</h2>
	<h3 id="content">관심카테고리를 설정하면 관심수업을 추천해드립니다!</h3>
	<table id="category">
		<tr>
			<td id="category1">카테고리</td>
			<td id="category3">내가 선택한 카테고리</td>
		</tr>
		<tr>
			<td id="category2">상세 카테고리</td>
			<td></td>
		</tr>
	</table>
	
	


	
	</div>
	<%@ include file="/views/common/footer.jsp"  %>
</body>
</html>