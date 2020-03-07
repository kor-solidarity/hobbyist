<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
<title>hobbyist</title>
<style>
	#nav { 
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
/*      border-collapse:separate;
        border-spacing:60px 0px;
        border-style: solid;
        border-color: black; */
       	
	}
	
	#category td {
		padding-left: 30px;
		padding-right: 30px;
		cursor:pointer;
	}
	
	#category td:hover{
		color:darkolivegreen;
		
	}
	
	.nav2 {
		width:512px;
		margin:auto;
		height:30px;
		
	}
	
	.category2 {
		font-family: 'Nanum Gothic', sans-serif;
		font-size:13px;
		font-weight:900;
		border-collapse :separate;
		border-spacing: 10px; 
		display:none;
	}
	
	.category2 td {
		background:lightgray;
		border-radius:10px;
		padding:5px;
		marign-left:5px;
		cursor:pointer;
	}
	
	.category2 td:hover {
		background:darkolivegreen;
		color:white;
	}
	
	#submenuWrap {
		width: 1024px;
		margin: 0 auto;
	}
	
	/* div position이 relative라 겹쳐져 margin-top을 -30px로 통일 */ 
	
	#musicWrap {
		margin-left:0px;
	}
	
	#danceWrap {
		margin-left:70px;
		margin-top:-30px;
	}
	
	#videoWrap {
		margin-left:200px;
		margin-top:-30px;
		/* margin-top:-60px; */
	}
	#lifeWrap {
		margin-left:340px;
		margin-top:-30px;
		/* margin-top:-90px; */
	}
	#beautyWrap {
		margin-left:400px;
		margin-top:-30px;
		/* margin-top:-120px; */
	}
	#designWrap {
		margin-left:580px;
		margin-top:-30px;
		/* margin-top:-150px; */
	}
	#sportsWrap {
		margin-left:670px;
		margin-top:-30px;
		/* margin-top:-180px; */
	}
</style>
</head>
<body>
	<div id="nav">
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
	
	<!-- div가 차곡차곡 세로로 나열되어 있어 hide()로 숨겨도 공간이 벌어짐 -->
	<!-- div에 position:relative 속성을 주어 겹쳐주고, table이 아닌 div에 margine을 적용 -->
	<div id="submenuWrap">
		<div id="musicWrap" class="nav2" style="position: relative;">
			<table class="category2" id="music">
				<tr>
					<td id="vocal">보컬</td>
					<td id="rap">랩</td>
					<td id="koreanMusic">국악</td>
					<td id="songwrite">작사/작곡</td>
					<td id="guitar">기타연주</td>
					<td id="piano">피아노</td>
					<td id="etc1">기타</td>
				</tr>
			</table>
		</div>
		<div id="danceWrap" class="nav2" style="position: relative;">
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
		
		<div id="videoWrap" class="nav2" style="position: relative;">
			<table class="category2" id="video">
				<tr>
					<td>영상편집</td>
					<td>영상촬영</td>
					<td>사진촬영</td>
					<td>기타</td>
				</tr>
			</table>
		</div>
		<div id="lifeWrap" class="nav2" style="position: relative;">
			<table class="category2" id="life">
				<tr>
					<td>핸드메이드</td>
					<td>커피/차</td>
					<td>요리/베이킹</td>
					<td>기타</td>
				</tr>
			</table>
		</div>
		<div id="beautyWrap" class="nav2" style="position: relative;">
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
		<div id="designWrap" class="nav2" style="position: relative;">
			<table class="category2" id="design">
				<tr>
					<td>포토샵/일러스트레이터</td>
					<td>인디자인</td>
					<td>기타</td>
				</tr>
			</table>
		</div>
		<div id="sportsWrap" class="nav2" style="position: relative;">
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
		</div>
	</div>
	
	<script>
	$(function() {
		// hide로 할 경우 처음 창이 열릴 때 나타났다 사라짐.
		// css <style>에서 display:none을 적용해야 함.
		// $(".category2").hide();
		$("#cMusic").mouseenter(function() {
			/* z-index로 겹쳐져 있는 객체가 보여지는 순서를 지정할 수 있음. 숫자가 높을 수록 위에 위치. */
			$("#musicWrap").css({'z-index':'2'});
			$("#danceWrap").css({'z-index':'1'});
			$("#videoWrap").css({'z-index':'1'});
			$("#lifeWrap").css({'z-index':'1'});
			$("#beautyWrap").css({'z-index':'1'});
			$("#designWrap").css({'z-index':'1'});
			$("#sportsWrap").css({'z-index':'1'});
			$("#music").show();
			$("#dance").hide();
			$("#video").hide();
			$("#life").hide();
			$("#beauty").hide();
			$("#design").hide();
			$("#sports").hide();
			/* $("#nav3").css({'margin-top':'-150px'}); */
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
			/* $("#nav3").css({'margin-top':'-150px'}); */
			$(this).css({'color':'darkolivegreen'});
			$("#cDance").css({'color':'black'});
			$("#cVideo").css({'color':'black'});
			$("#cLife").css({'color':'black'});
			$("#cBeauty").css({'color':'black'});
			$("#cDesign").css({'color':'black'});
			$("#cSports").css({'color':'black'});
			$("#cSpace").css({'color':'black'});
			location.href = "<%= request.getContextPath()%>/selectMusic.le";
		});
		
		$("#cDance").mouseenter(function() {
			$("#musicWrap").css({'z-index':'1'});
			$("#danceWrap").css({'z-index':'2'});
			$("#videoWrap").css({'z-index':'1'});
			$("#lifeWrap").css({'z-index':'1'});
			$("#beautyWrap").css({'z-index':'1'});
			$("#designWrap").css({'z-index':'1'});
			$("#sportsWrap").css({'z-index':'1'});
			$("#music").hide();
			$("#dance").show();
			$("#video").hide();
			$("#life").hide();
			$("#beauty").hide();
			$("#design").hide();
			$("#sports").hide();
			/* $("#nav3").css({'margin-top':'-120px'}); */
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
			/* $("#nav3").css({'margin-top':'-120px'}); */
			$(this).css({'color':'darkolivegreen'});
			$("#cMusic").css({'color':'black'});
			$("#cVideo").css({'color':'black'});
			$("#cLife").css({'color':'black'});
			$("#cBeauty").css({'color':'black'});
			$("#cDesign").css({'color':'black'});
			$("#cSports").css({'color':'black'});
			$("#cSpace").css({'color':'black'});
			location.href = "<%= request.getContextPath()%>/selectDance.le";
			
		});
		
		$("#cVideo").mouseenter(function() {
			$("#musicWrap").css({'z-index':'1'});
			$("#danceWrap").css({'z-index':'1'});
			$("#videoWrap").css({'z-index':'2'});
			$("#lifeWrap").css({'z-index':'1'});
			$("#beautyWrap").css({'z-index':'1'});
			$("#designWrap").css({'z-index':'1'});
			$("#sportsWrap").css({'z-index':'1'});
			$("#music").hide();
			$("#dance").hide();
			$("#video").show();
			$("#life").hide();
			$("#beauty").hide();
			$("#design").hide();
			$("#sports").hide();
			/* $("#nav3").css({'margin-top':'-90px'}); */
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
			/* $("#nav3").css({'margin-top':'-90px'}); */
			$(this).css({'color':'darkolivegreen'});
			$("#cMusic").css({'color':'black'});
			$("#cDance").css({'color':'black'});
			$("#cLife").css({'color':'black'});
			$("#cBeauty").css({'color':'black'});
			$("#cDesign").css({'color':'black'});
			$("#cSports").css({'color':'black'});
			$("#cSpace").css({'color':'black'});
			location.href = "<%= request.getContextPath()%>/selectVideo.le";
		});
		
		$("#cLife").mouseenter(function() {
			$("#musicWrap").css({'z-index':'1'});
			$("#danceWrap").css({'z-index':'1'});
			$("#videoWrap").css({'z-index':'1'});
			$("#lifeWrap").css({'z-index':'2'});
			$("#beautyWrap").css({'z-index':'1'});
			$("#designWrap").css({'z-index':'1'});
			$("#sportsWrap").css({'z-index':'1'});
			$("#music").hide();
			$("#dance").hide();
			$("#video").hide();
			$("#life").show();
			$("#beauty").hide();
			$("#design").hide();
			$("#sports").hide();
		/* 	$("#nav3").css({'margin-top':'-60px'}); */
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
			/* $("#nav3").css({'margin-top':'-60px'}); */
			$(this).css({'color':'darkolivegreen'});
			$("#cMusic").css({'color':'black'});
			$("#cDance").css({'color':'black'});
			$("#cVideo").css({'color':'black'});
			$("#cBeauty").css({'color':'black'});
			$("#cDesign").css({'color':'black'});
			$("#cSports").css({'color':'black'});
			$("#cSpace").css({'color':'black'});
			location.href = "<%= request.getContextPath()%>/selectLife.le";
		});
		
		$("#cBeauty").mouseenter(function() {
			$("#musicWrap").css({'z-index':'1'});
			$("#danceWrap").css({'z-index':'1'});
			$("#videoWrap").css({'z-index':'1'});
			$("#lifeWrap").css({'z-index':'1'});
			$("#beautyWrap").css({'z-index':'2'});
			$("#designWrap").css({'z-index':'1'});
			$("#sportsWrap").css({'z-index':'1'});
			$("#music").hide();
			$("#dance").hide();
			$("#video").hide();
			$("#life").hide();
			$("#beauty").show();
			$("#design").hide();
			$("#sports").hide();
			/* $("#nav3").css({'margin-top':'-30px'}); */
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
			/* $("#nav3").css({'margin-top':'-30px'}); */
			$(this).css({'color':'darkolivegreen'});
			$("#cMusic").css({'color':'black'});
			$("#cDance").css({'color':'black'});
			$("#cVideo").css({'color':'black'});
			$("#cLife").css({'color':'black'});
			$("#cDesign").css({'color':'black'});
			$("#cSports").css({'color':'black'});
			$("#cSpace").css({'color':'black'});
			location.href = "<%= request.getContextPath()%>/selectBeauty.le";
		});
		$("#cDesign").mouseenter(function() {
			$("#musicWrap").css({'z-index':'1'});
			$("#danceWrap").css({'z-index':'1'});
			$("#videoWrap").css({'z-index':'1'});
			$("#lifeWrap").css({'z-index':'1'});
			$("#beautyWrap").css({'z-index':'1'});
			$("#designWrap").css({'z-index':'2'});
			$("#sportsWrap").css({'z-index':'1'});
			$("#music").hide();
			$("#dance").hide();
			$("#video").hide();
			$("#life").hide();
			$("#beauty").hide();
			$("#design").show();
			$("#sports").hide();
			/* $("#nav3").css({'margin-top':'0px'}); */
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
			/* $("#nav3").css({'margin-top':'0px'}); */
			$(this).css({'color':'darkolivegreen'});
			$("#cMusic").css({'color':'black'});
			$("#cDance").css({'color':'black'});
			$("#cVideo").css({'color':'black'});
			$("#cLife").css({'color':'black'});
			$("#cBeauty").css({'color':'black'});
			$("#cSports").css({'color':'black'});
			$("#cSpace").css({'color':'black'});
			location.href = "<%= request.getContextPath()%>/selectDesign.le";
		});
		
		$("#cSports").mouseenter(function() {
			$("#musicWrap").css({'z-index':'1'});
			$("#danceWrap").css({'z-index':'1'});
			$("#videoWrap").css({'z-index':'1'});
			$("#lifeWrap").css({'z-index':'1'});
			$("#beautyWrap").css({'z-index':'1'});
			$("#designWrap").css({'z-index':'1'});
			$("#sportsWrap").css({'z-index':'2'});
			$("#music").hide();
			$("#dance").hide();
			$("#video").hide();
			$("#life").hide();
			$("#beauty").hide();
			$("#design").hide();
			$("#sports").show();
			/* $("#nav3").css({'margin-top':'30px'}); */
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
			/* $("#nav3").css({'margin-top':'30px'}); */
			$(this).css({'color':'darkolivegreen'});
			$("#cMusic").css({'color':'black'});
			$("#cDance").css({'color':'black'});
			$("#cVideo").css({'color':'black'});
			$("#cLife").css({'color':'black'});
			$("#cBeauty").css({'color':'black'});
			$("#cDesign").css({'color':'black'});
			$("#cSpace").css({'color':'black'});
			location.href = "<%= request.getContextPath()%>/selectSports.le";
		});
		
		$("#cSpace").mouseenter(function() {
			$("#music").hide();
			$("#dance").hide();
			$("#video").hide();
			$("#life").hide();
			$("#beauty").hide();
			$("#design").hide();
			$("#sports").hide();
			/* $("#nav3").css({'margin-top':'-150px'}); */
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
			/* $("#nav3").css({'margin-top':'-150px'}); */
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
		 	
		 	$("#cSpace").mouseenter(function() {
		 		$(this).css({'color':'darkolivegreen'});
		 	}).click(function() {
		 		$(this).css({'color':'darkolivegreen'});
		 		location.href = "<%= request.getContextPath()%>/place/list.me";
		 	});
	}); 
	</script>
</body>
</html>