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
		font-size: 22px;
		margin-top:5px;
	}
	#regSubTab1 td {
		width:130px;
	}
	.Center_button1 {
		color:darkolivegreen;
	}
	.regSubList {
		width: 220px;
		border: 1px solid white;
		display: inline-block;
		margin: 10px;
	}
	#regSubTab2 {
		border: 1.5px solid darkolivegreen;
		border-radius:5px;
	}
	.regSugLab {
		cursor:pointer;
	}
</style>
<title>hobbyist</title>
</head>
<body>
	<%@ include file="/views/common/myPage.jsp" %>
	<div id="regSugDiv1">
		<table id="regSugTab1">
			<tr>
				<td style="text-align: center;"><label class="regSugLab">수강한 수업</label></td>
				<td style="text-align: center;"><label class="regSugLab">찜한 수업</label></td>
				<td style="text-align: center; color:darkolivegreen;" onclick="goRegSug();"><label class="regSugLab">등록한 건의</label></td>
				<td style="text-align: center;" onclick="goLikedSug();"><label class="regSugLab">찜한 건의</label></td>
				<td style="text-align: center;"><label class="regSugLab">등록한 수업</label></td>
				<td style="width:374px;"></td>
			</tr>
			<tr>
				<td colspan="6"><hr></td>
			</tr>
		</table>
		<script>
			function goLikedSug() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/likedSuggestion.jsp";
			}
			function goRegSug() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/registeredSuggestion.jsp";				
			}
		</script>
		<br>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<div class="regSubList">
			<table id="regSubTab2">
				<tr>
					<td colspan="2">의정부시 농구 수업</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align: right;"><img
						src="/hobbyist/static/images/sports.png"
						style="width: 50px; height: 50px;"></td>
				</tr>
				<tr>
					<td><img src="/hobbyist/static/images/heart.png"
						style="width: 20px; height: 20px;"> (10)</td>
					<td><img src="/hobbyist/static/images/dialogicon.png"
						style="width: 20px; height: 20px"> (8)</td>
				</tr>
				<tr>
					<td colspan="2">당산|저녁반|2~4명</td>
					<td
						style="text-align: right; color: darkolivegreen; font-weight: bold;">이지호</td>
				</tr>
			</table>
		</div>
		<br><br>
		<div class="regSugPagingArea" align="center">
		◀이전 1/2/3/4/5/6/7/8/9/10  다음▶
		</div>
		
	</div>
	<br><br><br><br>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>