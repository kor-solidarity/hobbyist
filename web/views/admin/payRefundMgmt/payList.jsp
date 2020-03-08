<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
 		text-align: center;
 		color: white;
 		height: 30px;
 	}
 	
 	#infoArea td {
 		border: 1px solid black;
 		height: 45px;
 	}
 	
 	 	#modalT {
  		width: 420px;
  		margin: 0 auto;
 		
 	}
 	#modalT tr td:nth-child(1){
 		font-size: 20px;
 		font-weight: bold;
 		line-height: 40px;
 	}
 	
 	#modalT tr td:nth-child(2){
		text-align: right; 	
		font-size: 15px;
 	}
 	
 	#reasonDetail {
 		height: 80px;
 		border: 1px solid black;
 		overflow-x: hidden;
        overflow-y: auto;
        font-weight: normal;
        font-size: 15px;
        line-height: 20px;
 	}
 	
 	#refuseArea {
 		width: 465px;
 		height: 80px;
 		border: 1px solid black;
 		overflow-x: hidden;
        overflow-y: auto;
        resize: none;
 	}
 	
 	#refuseReason {
 		height: 80px;
 		border: 1px solid black;
 		overflow-x: hidden;
        overflow-y: auto;
        font-weight: normal;
        font-size: 15px;
        line-height: 20px;
 	}
 	
 	#infoT {
 		width:100%;
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
							<label id="refundListL" style="font-weight: bold; color: gray;">환불 내역</label>&nbsp; &nbsp; 
							<label id="refuseListL" style="font-weight: bold; color: gray;">반려 내역</label>
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
	
		 <div class="modal fade" id="myModal" role="dialog">
   	 <div class="modal-dialog">
    
   	   <!-- Modal content-->
   	   <div class="modal-content">
   	     <div class="modal-header" style="background: #4E4E4E; color: white; height: 80px;">
   	       <button type="button" class="close" data-dismiss="modal" style="color: white;">x</button>
   	       <h4 class="modal-title" style="font-family: 'ZCOOL QingKe HuangYou', cursive; font-size: 30px;">hobbyist</h4>
   	     </div>
   	     <div class="modal-body">
   	       <table id="modalT">
   	       		<tr>
   	       			<td>결제 고유번호</td>
   	       			<td id="impNum"></td>
   	       		</tr>
   	       		<tr>
   	       			<td>수업 제목</td>
   	       			<td id="lessonName"></td>
   	       		</tr>
   	       		<tr>
   	       			<td>결제 금액</td>
   	       			<td id="payCost"></td>
   	       		</tr>
   	       		<tr>
   	       			<td>사용 포인트</td>
   	       			<td id="usingPoint"></td>
   	       		</tr>
   	       		<tr>
   	       			<td>환불 금액</td>
   	       			<td id="refundCost"></td>
   	       		</tr>
   	       		<tr>
	   	       		<td>환불 포인트</td>
	   	       		<td id="refundPoint"></td>
   	       		</tr>
   	       		<tr>
   	       			<td>수업 회차</td>
   	       			<td id="totalOrder"></td>
   	       		</tr>
   	       		<tr>
   	       			<td>진행 회차</td>
   	       			<td id="finishOrder"></td>
   	       		</tr>
   	       		<tr>
   	       			<td>진행률</td>
   	       			<td id="orderPercent"></td>
   	       		</tr>
   	       		<tr>
   	       			<td>환불 사유</td>
   	       			<td id="reason"></td>
   	       		</tr>
   	       		<tr>
   	       			<td colspan="2" style="padding-top: 20px;">
   	       				<div id="reasonDetail">
   	       				</div>
   	       			</td>
   	       		</tr>
   	       		<tr>
   	       			<td>반려 사유</td>
   	       		</tr>
   	       		<tr>
   	       			<td colspan="2" style="padding-top: 20px;">
   	       				<div id="refuseReason">
   	       				</div>
   	       			</td>
   	       		</tr>
   	       </table>
   	     </div>
   	     <div class="modal-footer">
   	       <button id="cancelRefuse" type="button" class="btn btn-default">반려 취소</button>
   	     </div>
     		</div>
   	   
   		 </div>
  		</div>
  	
  		
	<script>
		$(function() {
			$.ajax({
				url: "/hobbyist/selectPaymentList.ad",
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
				$("#paymentListL").css("color", "black");
				$("#refundListL").css("color", "gray");
				$("#refuseListL").css("color", "gray");
				
				$.ajax({
					url: "/hobbyist/selectPaymentList.ad",
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
			
			$("#refuseListL").click(function() {
				$("#paymentListL").css("color", "gray");
				$("#refundListL").css("color", "gray");
				$("#refuseListL").css("color", "black");
				
				
				$.ajax({
					url: "/hobbyist/selectRefuseList.ad",
					type: 'post',
					success: function(data) {
						$table = $("#infoT");
						$table.html("");
						console.log(data);
						var $tr = $("<tr>");
						
						$tr.append('<th style="width: 8%;">신청코드</th>' +
								'<th style="width: 10%;">결제코드</th>' +
								'<th style="width: 10%;">회원코드</th>' +
								'<th style="width: 7%;">이름</th>' +
								'<th style="width: 12%;">전화번호</th>' +
								'<th style="width: 17%;">이메일</th>' +
								'<th style="width: 11%;">환불 금액</th>' +
								'<th style="width: 17%;">신청일</th>' +
								'<th style="width: 14%;">상세보기</th>');
					
						$table.append($tr);
					
						for(key in data) {
							$tr= $("<tr>");
							var $rcode = $("<td>").text(data[key].refundCode);
							var $pcode = $("<td>").text(data[key].paymentCode);
							var $mCode = $("<td>").text(data[key].memberCode);
							var $mName = $("<td>").text(data[key].memberName);
							var $phone = $("<td>").text(data[key].phone);
							var $email = $("<td>").text(data[key].email);
							var $acode = $("<td>").text(data[key].artistCode);
							var $rDate = $("<td>").text(data[key].applyDate);
							var $btn = $("<td>").html("<button class='Btn'>조회</button>");
						
							$tr.append($rcode);
							$tr.append($pcode);
							$tr.append($mCode);
							$tr.append($mName);
							$tr.append($phone);
							$tr.append($email);
							$tr.append($acode);
							$tr.append($rDate);
							$tr.append($btn);
							$table.append($tr);
							}
						},
						error: function(status) {
							console.log(status);
						}
				});
			});
			
			$(document).on("click", '.Btn', function() {
		    	var num = Number($(this).parent().parent().children("td:nth-child(2)").text());
		    	var refundCode = Number($(this).parent().parent().children("td:nth-child(1)").text());
		    	console.log(num);
		    	
		    	$.ajax({
		    		url: "/hobbyist/selectApplyDetail.ad",
					data: {num : num},
					type: "post",
					success: function(data) {
						var orderPercent = Math.round(100 - ((data.finishOrder / data.totalOrder) * 100));
						var refundPoint = Math.round(data.usingPoint - ((data.finishOrder / data.totalOrder) * data.usingPoint));
						
						console.log(refundPoint);
						$("#impNum").text(data.impNum);
						$("#lessonName").text(data.lessonName);
						$("#payCost").text(data.payCost + "원");
						$("#usingPoint").text(data.usingPoint + " point");
						$("#refundCost").text(data.refundCost +"원");
						$("#refundPoint").text(refundPoint + " point");
						$("#totalOrder").text(data.totalOrder + "회");
						$("#finishOrder").text(data.finishOrder + "회");
						$("#orderPercent").text(orderPercent + "%");
						$("#reason").text(data.reason);
						$("#reasonDetail").text(data.reasonDetail);
						$("#refuseReason").text(data.refuseReason);
						
					},
					error: function(error) {
						console.log(error);
					}
		    		
		    	});
		    	
	   	    	$("#myModal").modal();
	   	    	
	   	 		//최종 반려 버튼 클릭시
				$(document).on("click", '#cancelRefuse', function() {
					var result = confirm("반려 취소 하시겠습니까?");
					
					if(result) {
						location.href = "<%=request.getContextPath()%>/cancelRefuse.ad?refundCode=" + refundCode;
					}
				});
	   	    	
			});
		});
			
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