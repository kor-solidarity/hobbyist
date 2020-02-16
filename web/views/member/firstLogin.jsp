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
	
	.category-list {
		margin-left:100px;
		display:inline-block;
	}
	#cTitle {
		font-family: 'Do Hyeon', sans-serif;
		color:darkolivegreen;
		font-size:22px;
	}
	#category {
		width:120px;
		height:30px;
		font-family: 'Nanum Gothic', sans-serif;
		font-size:16px;
		border-collapse:seperate;
		border-spacing:120px;
		text-align:center;
	}
	

	
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"  %>
	<div id="main">
	<h2 id="title">관심 카테고리 등록</h2>
	<h3 id="content">관심카테고리를 설정하면 관심수업을 추천해드립니다!</h3>
	
	<div class="category-list">
		<p id="cTitle">카테고리</p>
		<select id="category">
		<option>음악</option>
		<option>댄스</option>
		<option>영상/사진</option>
		<option>라이프스타일</option>
		<option>뷰티</option>
		<option>디자인</option>
		<option>스포츠</option>
		
		</select>
	</div>



	
	</div>
	<%@ include file="/views/common/footer.jsp"  %>
</body>
</html>