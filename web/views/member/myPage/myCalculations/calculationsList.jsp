<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.Center_button2 {
		color:darkolivegreen;
	}
	#calDiv {
		width:1024px;
		margin:auto;
		margin-top:5px;
	}
	#calDiv label {
		font-family: Do Hyeon;
		font-size: 25px;
		color:darkolivegreen;
	}
	#calTab {
		margin:auto;
		border-collapse:collapse;
	}
	#calTab th {
		font-family: Do Hyeon;
		font-size:20px;
		font-weight:lighter;
	}
	#calTab td {
		border-bottom: 2px solid darkolivegreen;
    	border-top: 2px solid darkolivegreen;
    	padding: 10px 0;
    	text-align:center;
	}
	#calTab tr {
		border-right: 2px solid darkolivegreen;
    	border-left: 2px solid darkolivegreen;
	}
	#calTab tr:first-of-type td, #calTab tr:nth-of-type(1), #calTab tr:nth-of-type(2){
    border-top: none;
    border-bottom: none;
    border-right: none;
    border-left: none;
	}
	#calTab td:nth-child(1) {width:100px;} 
	#calTab td:nth-child(2) {width:300px;}
	#calTab td:nth-child(3) {width:150px;}
	#calTab td:nth-child(4) {width:150px;}
	#calTab td:nth-child(5) {width:100px;}
	#calTab td:nth-child(6) {width:100px;}
	#calTab td:nth-child(7) {width:100px;}
	#calTab td:nth-child(8) {width:130px;}
	#calTab td:nth-child(9) {width:130px;}
	#calTab td:nth-child(10) {width:130px;}
	
	#calSel {
		height:30px;
		width:100px;
	}
	
	#calPagingArea {
		text-align:center;	
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/myPage.jsp"%>
	<div id="calDiv">
		&nbsp;&nbsp;&nbsp;<label>정산 내역</label>
		<hr>
		<br>
		<table id="calTab">
			<tr>
				<td colspan="6"></td>
            	<td colspan="4" style="text-align:right;">
                	<select id="calSel">
                    	<option value="all">전체보기</option>
                	</select>
            	</td>
			</tr>
			<tr>
				<th>수업코드</th>
				<th>수업명</th>
				<th>수업일자</th>
				<th>회차당 수업료</th>
				<th>수강인원</th>
				<th>총수업료</th>
				<th>수수료</th>
				<th>계좌번호</th>
				<th>총지급액</th>
				<th>확인여부</th>
			</tr>
			<tr>
				<td>1159</td>
				<td>[2주 과정]내 손으로 만드는 커피 에스프레소, 라떼아트</td>
				<td>2020/01/30</td>
				<td>20000</td>
				<td>5</td>
				<td>100000</td>
				<td>10%</td>
				<td>우리1102834795530</td>
				<td>90000</td>
				<td>확인대기중</td>
			</tr>
			<tr>
				<td>1159</td>
				<td>[2주 과정]내 손으로 만드는 커피 에스프레소, 라떼아트</td>
				<td>2020/01/30</td>
				<td>20000</td>
				<td>5</td>
				<td>100000</td>
				<td>10%</td>
				<td>우리1102834795530</td>
				<td>90000</td>
				<td>확인대기중</td>
			</tr>
			<tr>
				<td>1159</td>
				<td>[2주 과정]내 손으로 만드는 커피 에스프레소, 라떼아트</td>
				<td>2020/01/30</td>
				<td>20000</td>
				<td>5</td>
				<td>100000</td>
				<td>10%</td>
				<td>우리1102834795530</td>
				<td>90000</td>
				<td>확인대기중</td>
			</tr>
		</table>
		
		<br><br>
		<div id="calPagingArea">
			◀이전 1/2/3/4/5/6/7/8/9/10  다음▶
		</div>
	</div>
	<br><br><br><br>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>