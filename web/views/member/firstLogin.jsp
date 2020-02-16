<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
 
<title>Insert title here</title>
<style>

	#main {
		width: 1024px;
		height:900px;
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
		font-family: 'Nanum Gothic', sans-serif;
		color:gray;
		padding-left:30px;
		margin-top:-20px;
		padding-bottom:70px;
		font-size:20px;
	}
	
	.category-list {
		margin-left:50px;
		margin-right:130px;
		float:left;
		display:inline-block;
	}
	.cTitle {
		font-family: 'Do Hyeon', sans-serif;
		color:darkolivegreen;
		font-size:22px;
	}
	#pCategory {
		width:150px;
		height:33px;
		font-family: 'Nanum Gothic', sans-serif;
		font-size:16px;
		
	}
	#cCategory {
		width:150px;
		height:33px;
		font-family: 'Nanum Gothic', sans-serif;
		font-size:16px;
		
	}
	
	#category-list2 {
		
		margin-top:-3px;
		
	}
	
	#selectCategory {
		width:500px;
		height:400px;
		border:1px solid darkolivegreen;
	}
	
	
	#category-list3 {
		margin-top:-300px;
	}
	
	#btn {
		width:100px;
		height:35px;
		color:white;
		background:darkolivegreen;
		border:1px solid darkolivegreen;
		font-family: 'Nanum Gothic', sans-serif;
		font-size:16px;
		float:right;
		margin-top:100px;
		margin-right:50px;
	}
	
	#selectOne {
		width:140px;
		height:33px;
		border-radius:20px;
		background:darkolivegreen;
		color:white;
		font-family: 'Nanum Gothic', sans-serif;
		font-weight:900;
		font-size:17px;
		text-align:center;
		line-height:33px;
		margin-top:20px;
		margin-left:20px;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"  %>
	<div id="main">
	<h2 id="title">관심 카테고리 등록</h2>
	<h3 id="content">관심 카테고리(3개 이하)를 설정하면 관심수업을 추천해드립니다!</h3>
	<form action="<%=request.getContextPath() %>/index.jsp" method="post">
	<div class="category-list" id="category-list1">
		<p class="cTitle">카테고리</p>
		<select id="pCategory">
		<option>음악</option>
		<option>댄스</option>
		<option>영상/사진</option>
		<option>라이프스타일</option>
		<option>뷰티</option>
		<option>디자인</option>
		<option>스포츠</option>
		</select>
	</div>
	
		<div class="category-list" id="category-list2">
		<p class="cTitle">내가 선택한 카테고리</p>
		<div id="selectCategory">
			<div id="selectOne">음악/보컬</div>
		</div>
	</div>
	
	<div class="category-list" id="category-list3">
		<p class="cTitle">상세 카테고리</p>
		<select id="cCategory">
		<option>보컬</option>
		<option>랩</option>
		<option>국악</option>
		<option>작사/작곡</option>
		<option>기타연주</option>
		<option>피아노</option>
		<option>기타</option>
		</select>
	</div>
	<!-- <script>
		$(function() {
			$("#pCategory option:eq(1)").click(function() {
				$("#cCategory option:eq(0)").replaceWith("<option>방송댄스</option>");
				$("#cCategory option:eq(1)").replaceWith("<option>스트릿</option>");
				$("#cCategory option:eq(2)").replaceWith("<option>현대무용</option>");
				$("#cCategory option:eq(3)").replaceWith("<option>한국무용</option>");
				$("#cCategory option:eq(4)").replaceWith("<option>기타</option>");
				$("#cCategory option:eq(5)")remove();
				$("#cCategory option:eq(6)")remove();
			});
		});
		
	</script> -->
	<button type="submit" id="btn">확인</button>
	</form>
	</div>
	<%@ include file="/views/common/footer.jsp"  %>
</body>
</html>