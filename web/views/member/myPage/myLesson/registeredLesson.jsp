<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 1024px;
		margin: 0 auto;
	}
	#subMenuArea {
		border-bottom: 1px solid black;
	}
	#subMenu {
		font-family: Do Hyeon;
		font-size: 22px;
	}
	#subMenu td {
		width: 130px;
		text-align: center;
	}
	#subMenu tr {
		height: 67px;
	}
	.Center_button1 {
		color:darkolivegreen;
	}
	#lessonArea tr {
		height: 150px;
		
	}
	#lessonArea td {
		width: 900px;
		/* background: grey; */
		padding: 10px;
		margin: 10px;
	}
	#lessonArea div {
		width: 800px;
		height: 130px;
		background: lightgrey;
		margin: auto;
	}
</style>
</head>
<body>
<%@ include file="/views/common/myPage.jsp" %>	
	<section>
		<!-- 서브메뉴 영역 -->
		<div id="subMenuArea">
			<table id="subMenu">
				<tr>
					<td style="color:darkolivegreen;">수강한 수업</td>
					<td>찜한 수업</td>
					<td>등록한 건의</td>
					<td>찜한 건의</td>
					<td>등록한 수업</td>
				</tr>
			</table>
		</div>
		<!-- 수업 목록 영역 -->
		<table id="lessonArea" align="center">
			<tr>
				<td><div></div></td>
			</tr>
			<tr>
				<td><div></div></td>
			</tr>
			<tr>
				<td><div></div></td>
			</tr>
		</table>
		<!-- 페이징 처리 -->
		<div class="pagingArea" align="center">
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
		</div>
	</section>
</body>
</html>