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
 		color: white;
 		height: 35px;
 		text-align: center;
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
				<label onclick="goList();">내역 조회</label><br>
				<label style="color: #DED842;">환불 신청</label><br>
				<label onclick="goPayList();">금액 정산</label>
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
							<label style="font-weight: bold;">환불신청 내역</label> &nbsp; &nbsp; 
							<label style="font-weight: bold; color: gray;"></label>
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
				<table id="infoT">
					<!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
					
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
   	       			<td>수거할 포인트</td>
   	       			<td id="reCollectPoint"></td>
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
   	       </table>
   	     </div>
   	     <div class="modal-footer">
   	       <button type="button" class="btn btn-default" onclick="refuse();">반려</button>
   	       <button id="approve" type="button" class="btn btn-default">승인</button>
   	     </div>
     		</div>
   	   
   		 </div>
  		</div>
  		
  		<!-- 반려시 뜨는 모달 -->
  		<div class="modal fade" id="myModal1" role="dialog" style="display: none;">
   	 <div class="modal-dialog">
    
   	   <!-- Modal refuse-->
   	   <div class="modal-content">
   	     <div class="modal-header" style="background: #4E4E4E ; color: white;">
   	        <h4 class="modal-title" style="font-family: 'ZCOOL QingKe HuangYou', cursive; font-size: 30px;">hobbyist</h4>
   	       <button type="button" class="close" data-dismiss="modal" style="color: white;">x</button>
   	     </div>
   	     <div class="modal-body">

			 <div>
   			    <div>반려 사유</div>
   	       		<textarea id="refuseArea"></textarea>
   	      	</div>
  		
  		</div>
  		<div class="modal-footer">
   	       <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
   	       <button id="realRefuse" type="button" class="btn btn-default">반려</button>
   	     </div>
   	  	 </div>
   		 </div>
  		</div>
  		
	<script>
	$(function() {
		$.ajax({
			url: "/hobbyist/selectApplyList.ad",
			type: 'post',
			success: function(data) {
				$table = $("#infoT");
				$table.html("");
				console.log(data);
				var $tr = $("<tr>");
				
				$tr.append('<th style="width: 9%;">신청코드</th>' +
							'<th style="width: 9%;">결제코드</th>' +
							'<th style="width: 12%;">회원명</th>' +
							'<th style="width: 12%;">아티스트명</th>' +
							'<th style="width: 13%;">전화번호</th>' +
							'<th style="width: 17%;">결제일</th>' +
							'<th style="width: 17%;">신청일</th>' +
							'<th style="width: 14%;">상세보기</th>');
				
				$table.append($tr);
				
				for(key in data) {
					$tr= $("<tr>");
					var $rcode = $("<td>").text(data[key].refundCode);
					var $pcode = $("<td>").text(data[key].paymentCode);
					var $mName = $("<td>").text(data[key].memberName);
					var $arName = $("<td>").text(data[key].artistName);
					var $phone = $("<td>").text(data[key].phone);
					var $pDate = $("<td>").text(data[key].payDate);
					var $arDate = $("<td>").text(data[key].applyDate);
					var $btn = $("<td>").html("<button class='Btn'>조회</button>");
					
					$tr.append($rcode);
					$tr.append($pcode);
					$tr.append($mName);
					$tr.append($arName);
					$tr.append($phone);
					$tr.append($pDate);
					$tr.append($arDate);
					$tr.append($btn);
					$table.append($tr);
					
				}
			},
			error: function(status) {
				console.log(status);
			}
		});
		
		$(document).on("click", '.Btn', function() {
	   	    	$("#myModal").modal();
	   	    	
		    	var num = Number($(this).parent().parent().children("td:nth-child(2)").text());
		    	var refundCode = Number($(this).parent().parent().children("td:nth-child(1)").text());
		    	console.log(num);
		    	console.log(refundCode);
		    	
		    	$.ajax({
		    		url: "/hobbyist/selectApplyDetail.ad",
					data: {num : num},
					type: "post",
					success: function(data) {
						var orderPercent = Math.round(100 - ((data.finishOrder / data.totalOrder) * 100));
						var refundPoint = Math.round(data.usingPoint - ((data.finishOrder / data.totalOrder) * data.usingPoint));
						
						$("#impNum").text(data.impNum);
						$("#lessonName").text(data.lessonName);
						$("#payCost").text(data.payCost + "원");
						$("#usingPoint").text(data.usingPoint + " point");
						$("#refundCost").text(data.refundCost +"원");
						$("#refundPoint").text(refundPoint + " point");
						$("#reCollectPoint").text(data.givePoint + " point");
						$("#totalOrder").text(data.totalOrder + "회");
						$("#finishOrder").text(data.finishOrder + "회");
						$("#orderPercent").text(orderPercent + "%");
						$("#reason").text(data.reason);
						$("#reasonDetail").text(data.reasonDetail);
						
						//환불 승인 클릭 시
						$("#approve").click(function() {
							var result = confirm("환불 승인 하시겠습니까?");
							
							if(result) {
								/*  $.ajax({
								        url: "http://www.myservice.com/payments/cancel",
								        type: "POST",
								        contentType: "application/json",
								        data: ({
								          merchant_uid: data.impNum, // 주문번호
								          cancel_request_amount: data.refundCost, // 환불금액
								          reason: "테스트 결제 환불" // 환불사유
								        }),
								        dataType: "json"
								      }); */
								      
								      $.ajax({
								    	 url: "<%=request.getContextPath()%>/approveRefund.ad",
								    	 type: "post",
								    	 data: {
								    		 num: num,
								    		 refundCost: data.refundCost,
								    		 refundPoint: refundPoint,
								    		 reCollectPoint: data.givePoint
								    	 },
								    	 success: function(data) {
								    		 alert("환불이 완료되었습니다.");

								    		 $('#myModal').modal("hide");
								    	 },
								    	 error: function(error){
								    		 console.log(error);
								    	 }
								    	 
								      });
							}
						});
						
					},
					error: function(error) {
						console.log(error);
					}
		    		
		    	});
		    	
	   	    	
				//최종 반려 버튼 클릭시
				$(document).on("click", '#realRefuse', function() {
					
					var reasonDetail = $("#refuseArea").val();
					console.log(reasonDetail);
					var result = confirm("반려 처리 하시겠습니까?");
						
					if(result) {
						location.href = "<%=request.getContextPath()%>/refuseRefund.ad?refundCode=" + refundCode + "&reasonDetail=" + reasonDetail;
						
					}
				});
		});
		
	});
		
	function refuse() {
		$("#myModal1").modal();
	}
		
	function goPayList() {
		location.href = "<%=request.getContextPath()%>/calculate.cp";
	}
	
	function goList() {
		location.href = "<%=request.getContextPath()%>/views/admin/payRefundMgmt/payList.jsp";
	}
		
	</script>
	
</body>
</html>