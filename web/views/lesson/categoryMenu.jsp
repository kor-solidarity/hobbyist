<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	 /* #nav {
		margin-top: 20px;
		width:100%;
		height:60px;
		border-top:2px solid darkolivegreen;
		border-bottom:2px solid darkolivegreen;
		line-height:60px; 
	}
	#category {
		font-family: 'Do Hyeon', sans-serif;
        font-size:22px;
        border-collapse:separate;
        border-spacing:60px 0px;
        cursor:pointer;
       	
	}
	#category td:hover{
		color:darkolivegreen;
		
	}

	
	#nav2 {
		width:1024px;
		margin:auto;
		height:30px;
		clear:both;
	}
	
	.category2 {
		font-family: 'Nanum Gothic', sans-serif;
		font-size:13px;
		font-weight:900;
		border-collapse :separate;
		border-spacing: 10px; 
		
	}
	
	.category2 td {
		background:lightgray;
		border-radius:10px;
		padding:5px;
		
	}
	
	.category2 td:hover {
		background:darkolivegreen;
		color:white;
	}
	
	#dance {
		margin-left:70px;
		margin-top:-30px;
	}
	
	#video {
		margin-left:200px;
		margin-top:-60px;
	}
	#life {
		margin-left:340px;
		margin-top:-90px;
	}
	#beauty {
		margin-left:400px;
		margin-top:-120px;
	}
	#design {
		margin-left:580px;
		margin-top:-150px;
	}
	#sports {
		margin-left:670px;
		margin-top:-180px;
	}  */
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

	<!--  <div id="nav">
		<table id="category" align="center">
			<tr>
				<td id="cMusic">음악</td>
				<td id="cDance">댄스</td>
				<td id="cVideo">영상/사진</td>
				<td id="cLife">라이프스타일</td>
				<td id="cBeauty">뷰티</td>
				<td id="cDesign">디자인</td>
				<td id="cSports">스포츠</td>
				<td id="cSpace">공간대여</td>		
			</tr>
		</table>
	</div>
	
	<div id="nav2">
		<table class="category2" id="music">
			<tr>
				<td>보컬</td>
				<td>랩</td>
				<td>국악</td>
				<td>작사/작곡</td>
				<td>기타연주</td>
				<td>피아노</td>
				<td>기타</td>
			</tr>
		</table>
	</div>
	<div id="nav2">
		<table class="category2" id="dance" >
			<tr>
				<td>방송댄스</td>
				<td>스트릿</td>
				<td>현대무용</td>
				<td>한국무용</td>
				<td>기타</td>
			</tr>
		</table>
	</div>
	
	<div id="nav2">
		<table class="category2" id="video">
			<tr>
				<td>영상편집</td>
				<td>영상촬영</td>
				<td>사진촬영</td>
				<td>기타</td>
			</tr>
		</table>
	</div>
	<div id="nav2">
		<table class="category2" id="life">
			<tr>
				<td>핸드메이드</td>
				<td>커피/차</td>
				<td>요리/베이킹</td>
				<td>기타</td>
			</tr>
		</table>
	</div>
		<div id="nav2">
		<table class="category2" id="beauty">
			<tr>
				<td>메이크업</td>
				<td>네일</td>
				<td>패션</td>
				<td>퍼스널컬러</td>
				<td>스킨케어/마사지</td>
				<td>헤어</td>
				<td>기타</td>
			</tr>
		</table>
	</div>
	<div id="nav2">
		<table class="category2" id="design">
			<tr>
				<td>포토샵/일러스트레이터</td>
				<td>인디자인</td>
				<td>기타</td>
			</tr>
		</table>
	</div>
		<div id="nav2">
		<table class="category2" id="sports">
			<tr>
				<td>축구</td>
				<td>농구</td>
				<td>야구</td>
				<td>수상 레저</td>
				<td>스키/보드</td>
				<td>기타</td>
			</tr>
		</table>
	</div>  -->

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
	
		<!-- <script>
		 $(function() {
			$(".category2").hide();
			$("#cMusic").mouseenter(function() {
				$("#music").show();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-150px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			}).click(function() {
				$("#music").show();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-150px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			});
			
			$("#cDance").mouseenter(function() {
				$("#music").hide();
				$("#dance").show();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-120px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			}).click(function() {
				$("#music").hide();
				$("#dance").show();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-120px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
				
			});
			
			$("#cVideo").mouseenter(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").show();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-90px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			}).click(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").show();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-90px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			});
			
			$("#cLife").mouseenter(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").show();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-60px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			}).click(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").show();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-60px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			});
			
			$("#cBeauty").mouseenter(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").show();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-30px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			}).click(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").show();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-30px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			});
			$("#cDesign").mouseenter(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").show();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'0px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			}).click(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").show();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'0px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cSports").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			});
			
			$("#cSports").mouseenter(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").show();
				$("#nav3").css({'margin-top':'30px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			}).click(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").show();
				$("#nav3").css({'margin-top':'30px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSpace").css({'color':'black'});
			});
			
			$("#cSpace").mouseenter(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-150px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
			}).click(function() {
				$("#music").hide();
				$("#dance").hide();
				$("#video").hide();
				$("#life").hide();
				$("#beauty").hide();
				$("#design").hide();
				$("#sports").hide();
				$("#nav3").css({'margin-top':'-150px'});
				$(this).css({'color':'darkolivegreen'});
				$("#cMusic").css({'color':'black'});
				$("#cDance").css({'color':'black'});
				$("#cVideo").css({'color':'black'});
				$("#cLife").css({'color':'black'});
				$("#cBeauty").css({'color':'black'});
				$("#cDesign").css({'color':'black'});
				$("#cSports").css({'color':'black'});
			});
			
			 	$("#music tr:eq(0) td:eq(0)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#music tr:eq(0) td:eq(1)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			});
			 	$("#music tr:eq(0) td:eq(2)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#music tr:eq(0) td:eq(3)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#music tr:eq(0) td:eq(4)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#music tr:eq(0) td:eq(5)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#music tr:eq(0) td:eq(6)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#music tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#music tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			}); 
			
			 
			 	
			 	$("#dance tr:eq(0) td:eq(0)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
			});
			 	$("#dance tr:eq(0) td:eq(1)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
			});
			 	$("#dance tr:eq(0) td:eq(2)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});

			}); 
			 	$("#dance tr:eq(0) td:eq(3)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});

			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});

			}); 
			 	$("#dance tr:eq(0) td:eq(4)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#dance tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#dance tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
			}); 
			
			 	
		
			 	$("#video tr:eq(0) td:eq(0)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#video tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#video tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});

			});
			 	$("#video tr:eq(0) td:eq(1)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#video tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#video tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
			});
			 	$("#video tr:eq(0) td:eq(2)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#video tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#video tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});

			}); 
			 	$("#video tr:eq(0) td:eq(3)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#video tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});

			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#video tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#video tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});

			}); 
			 	
			 	
			 	
			 	$("#life tr:eq(0) td:eq(0)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#life tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#life tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});

			});
			 	$("#life tr:eq(0) td:eq(1)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#life tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#life tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
			});
			 	$("#life tr:eq(0) td:eq(2)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#life tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#life tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});

			}); 
			 	$("#life tr:eq(0) td:eq(3)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#life tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});

			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#life tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#life tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});

			}); 
			 	
			 	
			 	
			 	
			 	$("#beauty tr:eq(0) td:eq(0)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#beauty tr:eq(0) td:eq(1)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			});
			 	$("#beauty tr:eq(0) td:eq(2)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#beauty tr:eq(0) td:eq(3)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#beauty tr:eq(0) td:eq(4)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#beauty tr:eq(0) td:eq(5)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(6)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#beauty tr:eq(0) td:eq(6)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#beauty tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("beauty tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#beauty tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			}); 
			
			 	
			 	
			 	
			 	$("#design tr:eq(0) td:eq(0)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#design tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#design tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});

			});
			 	$("#design tr:eq(0) td:eq(1)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#design tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#design tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
			});
			 	$("#design tr:eq(0) td:eq(2)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#design tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#design tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#design tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});

			}); 
			 	
			 	
			 	$("#sports tr:eq(0) td:eq(0)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#sports tr:eq(0) td:eq(1)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			});
			 	$("#sports tr:eq(0) td:eq(2)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#sports tr:eq(0) td:eq(3)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#sports tr:eq(0) td:eq(4)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(5)").css({'background':'lightgray', 'color':'black'});
			}); 
			 	$("#sports tr:eq(0) td:eq(5)").mouseenter(function() {
			 		$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
			 	}).click(function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
					$("#sports tr:eq(0) td:eq(0)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(1)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(2)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(3)").css({'background':'lightgray', 'color':'black'});
					$("#sports tr:eq(0) td:eq(4)").css({'background':'lightgray', 'color':'black'});
			});  
			 	
			
		});
	</script> -->
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>