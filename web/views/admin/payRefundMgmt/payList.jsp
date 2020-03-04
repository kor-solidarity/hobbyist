<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <style>
 
 	section {
 		width: 100%;
 		height: 91%;
 	}
 	
 	#sideMenuBar {
 		background-color: #4E4E4E;
 		width: 15%;
 		height: 100%;
 		float: left;
 		margin: 0px;
 		text-align: center;
 	}
 	
 	#bigMenu {
 		margin-top: 20px;
 	 	color: #DED842;
 	}
 	
 	#smallMenu {
 		margin-top: 20px;
 		padding-left: 25px;
 		color: white;
 		text-align: left;
 		font-weight: bold;
 		font-size: 19px;
 		line-height: 45px;
 	}
 	
 	#contents {
 		background-color: white;
 		width: 85%;
 		height: 100%;
 		margin: 0px;
 		float: left;
 	}
 	
 	#searchMember {
 		margin-top: 80px;
 		text-align: right;
 	}
 	
 	#searchDetailArea {
 		width: 100%;
 		text-align: right;
 	}
 	
 	#searchT {
 		width: 90%;
 		margin-left: 10%;
 	}
 	
 	#searchBtn {
 		color: white;
 		background-color: #4E4E4E;
 	}
 	
 	#firstLine {
 		width: 90%;
 		height: 1px;
 		background:black;
 		margin: 0px;
	 	margin-left: 115px;
 		margin-top: 10px;
 		align: right;
 	}
 	
 	#infoArea {
 		margin-top: 50px;
 		margin-left: 60px;
 		width: 1100px;
 		height: 500px;
 		overflow-x: hidden;
        overflow-y: auto;
        text-align: center;
 	}
 	
 	th {
 		background: #4E4E4E;
 		color: white;
 		height: 30px;
 	}
 	
 	#infoArea td {
 		border: 1px solid black;
 	}
</style>
</head>

<body>
	<%@ include file="/views/common/adminMenubar.jsp" %>
	<section>
		<!-- 왼쪽 사이드바 메뉴  -->
		<article id="sideMenuBar">
		
			<!-- 큰 영역의 메뉴 -->
			<div id="bigMenu">
				<label style="font-weight: bold; font-size: 25px;">결제/환불</label>
				<hr style="width: 80%; color: #DED842; height: 1px; background: #DED842; margin-top: 17px;">
			</div>
			
			<!-- 큰 메뉴안의 상세 메뉴 여러개 -->
			<div id="smallMenu">
				<label style="color: #DED842;">내역 조회</label><br>
				<label onclick="goRefundList();">환불 신청</label><br>
				<label onclick="goPayCal();">금액 정산</label>
			</div>
		</article>
		
		<!-- 관리자 본문 들어갈 공간 -->
		<article id="contents">
		
			<!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
			<div id="searchDetailArea">
				
				<!-- 상세페이지, 정렬, 검색 테이블 -->
				<table id="searchT">
					<tr>
						<td style="text-align: left; vertical-align: bottom;">
							<label id="paymentListL" style="font-weight: bold;">결제 내역</label> &nbsp; &nbsp; 
							<label style="font-weight: bold; color: gray;">환불 내역</label>&nbsp; &nbsp; 
							<label style="font-weight: bold; color: gray;">반려 내역</label>
						</td>
						<td style="padding-right: 20px;">
							<input style="text" id="searchMember"><button id="searchBtn">검색</button>
						</td>
					</tr>
					
				</table>
			</div>
			
			<!-- 본문 상단 줄 -->
			<hr id="firstLine">
			
			<!-- 정보 추가되는 본문 테이블 -->
			<div id="infoArea">
				<table id="infoT" style="width: 100%; border-collapse: collapse;">
					<!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
					<tr>
						<th style="width: 7%;">결제코드</th>
						<th style="width: 10%;">수업일정 코드</th>
						<th style="width: 8%;">회원코드</th>
						<th style="width: 9%;">이름</th>
						<th style="width: 11%;">전화번호</th>
						<th style="width: 11%;">결제 금액</th>
						<th style="width: 9%;">사용 포인트</th>
						<th style="width: 15%;">주문번호</th>
						<th style="width: 15%;">결제일</th>
					</tr>
				</table>
			</div>
		</article>
	</section>
	<script>
		$(function() {
			$.ajax({
				url: "/hobbyist/selectPaymentList.pa",
				type: 'post',
				success: function(data) {
					$table = $("#infoT");
					$table.html("");
					console.log(data);
					var $tr = $("<tr>");
					
					$tr.append('<th style="width: 7%;">결제코드</th>' +
								'<th style="width: 10%;">수업일정 코드</th>' +
								'<th style="width: 8%;">회원코드</th>' +
								'<th style="width: 9%;">이름</th>' +
								'<th style="width: 11%;">전화번호</th>' +
								'<th style="width: 11%;">결제 금액</th>' +
								'<th style="width: 9%;">사용 포인트</th>' +
								'<th style="width: 15%;">주문번호</th>' +
								'<th style="width: 15%;">결제일</th>');
					
					$table.append($tr);
					
					for(key in data) {
						$tr= $("<tr>");
						var $pcode = $("<td>").text(data[key].paymentCode);
						var $scheduleCode = $("<td>").text(data[key].scheduleCode);
						var $mCode = $("<td>").text(data[key].memberCode);
						var $mName = $("<td>").text(data[key].memberName);
						var $phone = $("<td>").text(data[key].phone);
						var $cost = $("<td>").text(data[key].payCost);
						var $uPoint = $("<td>").text(data[key].usingPoint);
						var $impNum = $("<td>").text(data[key].impNum);
						var $patDate = $("<td>").text(data[key].payDate);
						
						$tr.append($pcode);
						$tr.append($scheduleCode);
						$tr.append($mCode);
						$tr.append($mName);
						$tr.append($phone);
						$tr.append($cost);
						$tr.append($uPoint);
						$tr.append($impNum);
						$tr.append($patDate);
						$table.append($tr);
					}
				},
				error: function(status) {
					console.log(status);
				}
			});
			
			$("#paymentListL").click(function() {
				$.ajax({
					url: "/hobbyist/selectPaymentList.pa",
					type: 'post',
					success: function(data) {
						$table = $("#infoT");
						$table.html("");
						console.log(data);
						var $tr = $("<tr>");
						
						$tr.append('<th style="width: 7%;">결제코드</th>' +
									'<th style="width: 10%;">수업일정 코드</th>' +
									'<th style="width: 8%;">회원코드</th>' +
									'<th style="width: 9%;">이름</th>' +
									'<th style="width: 11%;">전화번호</th>' +
									'<th style="width: 11%;">결제 금액</th>' +
									'<th style="width: 9%;">사용 포인트</th>' +
									'<th style="width: 15%;">주문번호</th>' +
									'<th style="width: 15%;">결제일</th>');
						
						$table.append($tr);
						
						for(key in data) {
							$tr= $("<tr>");
							var $pcode = $("<td>").text(data[key].paymentCode);
							var $scheduleCode = $("<td>").text(data[key].scheduleCode);
							var $mCode = $("<td>").text(data[key].memberCode);
							var $mName = $("<td>").text(data[key].memberName);
							var $phone = $("<td>").text(data[key].phone);
							var $cost = $("<td>").text(data[key].payCost);
							var $uPoint = $("<td>").text(data[key].usingPoint);
							var $impNum = $("<td>").text(data[key].impNum);
							var $patDate = $("<td>").text(data[key].payDate);
							
							$tr.append($pcode);
							$tr.append($scheduleCode);
							$tr.append($mCode);
							$tr.append($mName);
							$tr.append($phone);
							$tr.append($cost);
							$tr.append($uPoint);
							$tr.append($impNum);
							$tr.append($patDate);
							$table.append($tr);
						}
					},
					error: function(status) {
						console.log(status);
					}
				});
			});
		})
		
		//환불 신청
		function goRefundList() {
			location.href = "<%=request.getContextPath()%>/views/admin/payRefundMgmt/applyRefundList.jsp";
		}
		
		//금액 정산
		function goPayCal() {
			location.href = "<%=request.getContextPath()%>/calculate.cp";
		}
	</script>
</body>
</html>