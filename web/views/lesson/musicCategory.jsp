<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
			#nav3 {
			width:1024px;
			height:50px;
			margin:auto;
			margin-top:30px; 
			
		}
		.selection {
			height:30px;
			margin-right:15px;
			font-family: 'Nanum Gothic', sans-serif;
		}
		
		#section{
			width:1024px;
			height:750px;
			margin:auto;
			margin-top:30px;
		}
		
		.lesson-list {
			display:inline-block;
			width:250px;
			height:300px;
			margin:auto;
			margin-right:85px;
			margin-bottom:30px;
		
		}
		#lessonTable {
			border:1px solid darkolivegreen;
			font-family: 'Nanum Gothic', sans-serif;
			font-size:13px;
			border-collapse:separate;
			border-spacing: 5px;
			
		}
		#lessonLabel {
			font-family: 'Nanum Gothic', sans-serif;
			font-size:13px;
			color:darkolivegreen;
			font-weight:900;
			margin-bottom:20px;
		}
		
		#lessonImg {
			width:250px;
			height:130px;
		}
		
		#artistImg {
			width:60px;
			height:60px;
			border-radius:50px 50px 50px 50px;
			
		}
		#lessonTable td:nth-of-type(2n) {
			float:right;
			margin-right:10px;
		}
		
		 #artistNick {
	       		font-size: 15px;
	       		color:darkolivegreen;
	       		font-weight:900;
	       		padding-right:11px;
	    }
	       
	       #artistName {
	       		padding-right:14px;
	    }
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<%@ include file="/views/common/categorybar.jsp" %>
	
	<div id="nav3">
		<select class="selection" id="area">
			<option>지역</option>
			<option>서울</option>
			<option>경기/인천</option>
			<option>강원</option>
			<option>충청/대전</option>
			<option>전라/광주</option>
			<option>경북/대구</option>
			<option>경남/울산</option>
			<option>부산</option>
			<option>제주</option>
		</select>
		
		<select class="selection" id="area2">
			<option>강남구</option>
		</select>
		
		<select class="selection" id="lessonType">
			<option>수업 유형</option>
			<option>1:1</option>
			<option>소규모</option>
			<option>대규모</option>
			
		</select>
	</div>
	
	
	<div id="section">
	<p id="lessonLabel">등록된 수업 15개</p>
		<div class="lesson-list">
			<table id="lessonTable"algin="center">
				<tr>
					<td colspan="2"><img src="/hobbyist/static/images/lessonImg1.jpg"  id="lessonImg"></td>
				</tr>
				<tr>
					<td colspan="2">[1:1][원데이]서울 출장 메이크업! 우니쌤과 함께 내 이미지 맞춤형 메이크업 배우기</td>
				</tr>
				<tr>
					<td></td>
					<td><img src="/hobbyist/static/images/iu.jpg" id="artistImg"></td>
				</tr>
				<tr>
					<td>별(15)</td>
					<td id="artistNick">우니쌤</td>
				</tr>
				<tr>
					<td>당산</td>
					<td id="artistName">신고운</td>
				</tr>
			</table>
		</div>
		<div class="lesson-list">
			<table id="lessonTable"algin="center">
				<tr>
					<td colspan="2"><img src="/hobbyist/static/images/lessonImg1.jpg"  id="lessonImg"></td>
				</tr>
				<tr>
					<td colspan="2">[1:1][원데이]서울 출장 메이크업! 우니쌤과 함께 내 이미지 맞춤형 메이크업 배우기</td>
				</tr>
				<tr>
					<td></td>
					<td><img src="/hobbyist/static/images/iu.jpg" id="artistImg"></td>
				</tr>
				<tr>
					<td>별(15)</td>
					<td id="artistNick">우니쌤</td>
				</tr>
				<tr>
					<td>당산</td>
					<td id="artistName">신고운</td>
				</tr>
			</table>
		</div>
		<div class="lesson-list">
			<table id="lessonTable"algin="center">
				<tr>
					<td colspan="2"><img src="/hobbyist/static/images/lessonImg1.jpg"  id="lessonImg"></td>
				</tr>
				<tr>
					<td colspan="2">[1:1][원데이]서울 출장 메이크업! 우니쌤과 함께 내 이미지 맞춤형 메이크업 배우기</td>
				</tr>
				<tr>
					<td></td>
					<td><img src="/hobbyist/static/images/iu.jpg" id="artistImg"></td>
				</tr>
				<tr>
					<td>별(15)</td>
					<td id="artistNick">우니쌤</td>
				</tr>
				<tr>
					<td>당산</td>
					<td id="artistName">신고운</td>
				</tr>
			</table>
		</div>
		<div class="lesson-list">
			<table id="lessonTable"algin="center">
				<tr>
					<td colspan="2"><img src="/hobbyist/static/images/lessonImg1.jpg"  id="lessonImg"></td>
				</tr>
				<tr>
					<td colspan="2">[1:1][원데이]서울 출장 메이크업! 우니쌤과 함께 내 이미지 맞춤형 메이크업 배우기</td>
				</tr>
				<tr>
					<td></td>
					<td><img src="/hobbyist/static/images/iu.jpg" id="artistImg"></td>
				</tr>
				<tr>
					<td>별(15)</td>
					<td id="artistNick">우니쌤</td>
				</tr>
				<tr>
					<td>당산</td>
					<td id="artistName">신고운</td>
				</tr>
			</table>
		</div>
		<div class="lesson-list">
			<table id="lessonTable"algin="center">
				<tr>
					<td colspan="2"><img src="/hobbyist/static/images/lessonImg1.jpg"  id="lessonImg"></td>
				</tr>
				<tr>
					<td colspan="2">[1:1][원데이]서울 출장 메이크업! 우니쌤과 함께 내 이미지 맞춤형 메이크업 배우기</td>
				</tr>
				<tr>
					<td></td>
					<td><img src="/hobbyist/static/images/iu.jpg" id="artistImg"></td>
				</tr>
				<tr>
					<td>별(15)</td>
					<td id="artistNick">우니쌤</td>
				</tr>
				<tr>
					<td>당산</td>
					<td id="artistName">신고운</td>
				</tr>
			</table>
		</div>
		<div class="lesson-list">
			<table id="lessonTable"algin="center">
				<tr>
					<td colspan="2"><img src="/hobbyist/static/images/lessonImg1.jpg"  id="lessonImg"></td>
				</tr>
				<tr>
					<td colspan="2">[1:1][원데이]서울 출장 메이크업! 우니쌤과 함께 내 이미지 맞춤형 메이크업 배우기</td>
				</tr>
				<tr>
					<td></td>
					<td><img src="/hobbyist/static/images/iu.jpg" id="artistImg"></td>
				</tr>
				<tr>
					<td>별(15)</td>
					<td id="artistNick">우니쌤</td>
				</tr>
				<tr>
					<td>당산</td>
					<td id="artistName">신고운</td>
				</tr>
			</table>
		</div>
	</div>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>