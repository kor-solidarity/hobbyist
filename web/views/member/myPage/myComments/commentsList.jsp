<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.Center_button4 {
		color:darkolivegreen;
	}
	#comDiv {
		width:1024px;
		margin:auto;
	}
	#comTab1 {
		width:100%;
		font-family: Do Hyeon;
		font-size: 25px;
		margin-top:5px;
	}
	.comLab {
		cursor:pointer;
	}
	#comTab2 {
		margin:auto;
		border-collapse:collapse;
	}
	#comTab2 th {
		font-family: Do Hyeon;
		font-size:20px;
		font-weight:lighter;
	}
	#comTab2 td {
		border-bottom: 2px solid darkolivegreen;
    	border-top: 2px solid darkolivegreen;
    	padding: 10px 0;
    	text-align:center;
	}
	#comTab2 tr {
		border-right: 2px solid darkolivegreen;
    	border-left: 2px solid darkolivegreen;
	}
	#comTab2 tr:first-of-type td, #comTab2 tr:nth-of-type(1){
    border-top: none;
    border-bottom: none;
    border-right: none;
    border-left: none;
	}
	#comTab2 td:nth-child(1) {width:80px;} 
	#comTab2 td:nth-child(2) {width:280px;}
	#comTab2 td:nth-child(3) {width:400px;}
	#comTab2 td:nth-child(4) {width:130px;}
	
	#comPagingArea {
		text-align:center;
	}
</style>
<title>hobbyist</title>
</head>
<body>
	<%@ include file="/views/common/myPage.jsp" %>
	<div id="comDiv">
		<table id="comTab1">
			<tr>
				<td width=150px; style="color:darkolivegreen;"><label class="comLab">댓글 내역</label></td>
				<td><label class="comLab">수강문의 댓글 내역</label></td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
		</table>
		<br>
		<table id="comTab2">
			<tr>
				<th>번호</th>
				<th>건의제목</th>
				<th>댓글내용</th>
				<th>날짜</th>
			</tr>
			<tr>
				<td>3</td>
				<td>의정부시 농구 수업</td>
				<td>건의 내용은 좋아서 참여하고 싶은데..</td>
				<td>20/01/28</td>
			</tr>
			<tr>
				<td>2</td>
				<td>!테니스수업!</td>
				<td>테니스 수업에 준비물 공동구매도 진행..</td>
				<td>20/01/20</td>
			</tr>
			<tr>
				<td>1</td>
				<td>글라스 데코 클래스..</td>
				<td>글라스데코 저도 참여하고 싶어요!</td>
				<td>20/01/20</td>
			</tr>
		</table>
		<br><br>
		<div id="comPagingArea">
			◀이전 1/2/3/4/5/6/7/8/9/10  다음▶
		</div>
	</div>
	<br><br><br><br>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>