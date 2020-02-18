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
		font-weight:lighter;
	}
	#calTab {
		margin:auto;
		border-collapse:collapse;
	}
	#calTab th {
		font-family: Do Hyeon;
		font-size:20px;
		font-weight:lighter;
		text-align:center;
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
	#modifyText {
		width: 400px; 
		height: 200px; 
		text-align: left; 
		color: rgb(49, 49, 49); 
		resize:none; 
		display:none;
	}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>hobbyist</title>
</head>
<body>
	<%@ include file="/views/common/myPage.jsp"%>
	<div id="calDiv">
		&nbsp;&nbsp;&nbsp;<label>정산 내역</label>
		<hr style="border:0.5px solid #3c3c3c; margin-top:-1px;">
		<br>
		<table id="calTab">
			<tr>
				<td colspan="6"></td>
				<td colspan="4" style="text-align: right;"><select id="calSel">
						<option value="all">전체보기</option>
				</select></td>
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
				<td id="className">[2주 과정]내 손으로 만드는 커피 에스프레소, 라떼아트</td>
				<td>2020/01/30</td>
				<td>20000</td>
				<td>5</td>
				<td>100000</td>
				<td>10%</td>
				<td>우리 김설현 1102834795530</td>
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
				<td>우리 김설현 1102834795530</td>
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
				<td>우리 김설현 1102834795530</td>
				<td>90000</td>
				<td>확인대기중</td>
			</tr>
		</table>

		<br>
		<br>
		<div id="calPagingArea">◀이전 1/2/3/4/5/6/7/8/9/10 다음▶</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color:darkolivegreen; height:42px;">
					<button type="button" class="close" data-dismiss="modal" style="color:white;">×</button>
					<h4 class="modal-title" style="color:white; font-family: Do Hyeon;">정산확인</h4>
				</div>
				<div class="modal-body">
					<table style="margin:auto; border-spacing:15px; border-collapse:separate;">
						<tr>
							<td colspan="3">[2주 과정]내 손으로 만드는 커피 에스프레소, 라떼아트 (수업코드 1159)</td>
						</tr>
						<tr>
							<td>금액(인당) : 20000원</td>
							<td></td>
							<td>총액 : 100000원</td>
						</tr>
						<tr>
							<td>수수료 : 10%</td>
							<td></td>
							<td>계좌번호 : 우리 김설현 1002834795530</td>
						</tr>
						<tr>
							<td style="font-size:17px; font-weight:bold;">총 지급액 : 90000원</td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<div style="text-align:center;">
						<textarea id="modifyText" rows="5" cols="40" placeholder="수정 요청 사항을 적어주세요"></textarea>
					</div>
				</div>
				<div class="modal-footer" style="text-align:center;">
					<button type="button" id="modify" class="btn btn-default">수정요청</button>
					<button type="button" id="confirm" class="btn btn-primary" style="background-color:darkolivegreen;">정산확정</button>
					<button type="button" id="calCancel" class="btn btn-default" data-dismiss="modal" style="display:none;">취소</button>
					<button type="button" id="calSubmit" class="btn btn-primary" style="background-color:darkolivegreen; display:none;">제출</button>
				</div>
			</div>

		</div>
	</div>
	<script>
		$(document).ready(function(){
	    	$("#className").click(function(){
	        	$("#myModal").modal();
	    	});
	    	
	    	$("#modify").click(function(){
	    		$("#modifyText").show();
	    		$("#modify").hide();
	    		$("#confirm").hide();
	    		$("#calCancel").show();
	    		$("#calSubmit").show();
	    	});
		});
	</script>

	<br>
	<br>
	<br>
	<br>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>