<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#suggestDiv1 {
	margin-top: 10px;
	margin: auto;
	height: 250px;
	width: 1024px;
	background-image: url("/hobbyist/static/images/suggestback.png");
	background-size: 100% 100%;
	background-repeat: no-repeat;
}

#label1 {
	font-family: 'Do Hyeon', sans-serif;
	color: darkolivegreen;
	font-size: 30px;
}

#suggestSearchBtn {
	background: darkolivegreen;
	color: white;
	padding: 5px;
	border: 1px solid darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
}

#suggestWriteBtn {
	font-family: 'Do Hyeon', sans-serif;
}

#suggestListArea {
	width: 1000px;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}

.suggest-list {
	width: 220px;
	border: 1px solid white;
	display: inline-block;
	margin: 10px;
}

#suggestListTable {
	border: 1.5px solid darkolivegreen;
	border-radius:5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="suggestDiv1">
		<table>
			<tr style="height: 150px;">
				<td></td>
			</tr>
			<tr>
				<td><label id="label1">지금 하비스트와 함께<br>시작해보세요
				</label></td>
			</tr>
		</table>
	</div>
	<div id="suggestCategory">
		<table style="margin: auto; border-spacing: 15px;">
			<tr>
				<td><select style="height: 30px;">
						<option>카테고리</option>
						<option>음악</option>
				</select></td>
				<td><select style="height: 30px;">
						<option>상세카테고리</option>
						<option>작사/작곡</option>
				</select></td>
				<td><input type="text" placeholder="검색할 건의 키워드를 입력하세요"
					style="height: 25px; width: 350px;"></td>

				<td>
					<button id="suggestSearchBtn" style="height: 30px; width: 70px;">검색</button>
				</td>
				<td>
					<button id="suggestWriteBtn" style="height: 30px; width: 80px;">글쓰기</button>
				</td>
			</tr>
		</table>

	</div>
	<div id="suggestListArea">
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="suggest-list" align="center">
			<!--4행 3열-->
			<table id="suggestListTable">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;"><img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td style="text-align:right; color:darkolivegreen; font-weight:bold;">이지호</td>
				</tr>
			</table>
		</div>	
	</div>
	<div class="SuggestPagingArea" align="center">
		◀이전 1/2/3/4/5/6/7/8/9/10  다음▶
	</div>
	<br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
	<script>
		$(function(){
			$(".suggest-list").click(function(){
				location.href = "<%=request.getContextPath()%>/views/suggest/suggestDetail.jsp";
			});
	    	$("#suggestWriteBtn").click(function(){
	    		location.href = "<%=request.getContextPath()%>/views/suggest/suggestInsertForm1.jsp";
	    	});
		});
    </script>
</body>
</html>