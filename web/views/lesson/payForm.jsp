<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.dh.hobbyist.payment.model.vo.Payment"%>
<%
	Payment p = (Payment) request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 아임포트를 실행하기 위한 jquery 아임포트 js 코드 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
section {
	margin: 0 auto;
}

section>hr {
	margin-top: 20px;
	background-color: darkolivegreen;
	height: 1px;
	width: 1024px;
	margin-bottom: 20px;
}

section>div>label:nth-child(1) {
	font-size: 30px;
	font-weight: bold;
	font-family: 'Do Hyeon', sans-serif;
}

section>div>label:nth-child(2) {
	font-size: 17px;
	font-weight: bold;
	color: darkolivegreen;
}

#contentDiv, #payDiv {
	border: solid 1.5px darkolivegreen;
	height: 550px;
	width: 500px;
	float: left;
	margin-left: 5px;
	line-height: 40px;
}

#pay, #content, #howToPay {
	margin: 0 auto;
	margin-top: 20px;
	width: 450px;
}

#content tr>td:nth-child(1) {
	font-weight: bold;
	font-size: 19px;
}

#content tr>td:nth-child(2) {
	text-align: right;
	font-size: 18px;
}

#pay {
	line-height: 50px;
}

#pay tr>td:nth-child(1) {
	font-weight: bold;
	font-size: 19px;
}

#pay tr>td:nth-child(2) {
	text-align: right;
	font-size: 18px;
}

#content tr>td:nth-child(2)>div {
	line-height: 25px;
}

#howToPay {
	margin-top: 10px;
}

#howToPay tr>td:nth-child(1) {
	font-weight: bold;
	font-size: 19px;
}

#howToPay tr>td:nth-child(2) {
	text-align: left;
	font-size: 18px;
}

#checkPay {
	width: 500px;
	text-align: right;
	margin-left: 500px;
	padding-top: 30px;
}

#resultButton {
	margin-top: 50px;
}

input[type="button"], input[type="reset"] {
	height: 45px;
	width: 120px;
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
}

#payTerms, #refundTerms {
	margin-left: 7px;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 25px;
}

#payTermsArea, #refundTermsArea {
	border: 1px solid darkolivegreen;
	height: 200px;
	width: 1000px;
	overflow-x: hidden;
	overflow-y: auto;
	margin-left: 7px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<nav></nav>
	<section style="width: 1024px;">

		<hr>
		<div>
			<label>결제하기</label> &nbsp; <label>결제 방법을 선택해주세요.</label>
		</div>

		<hr>

		<div id="contentDiv" style="overflow-y: auto; overflow-x: hidden;">
			<table id="content">
				<tr>
					<td colspan="4" style="font-weight: bold; font-size: 24px;"><%=p.getLessonName() %></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				
				<tr>
					<td colspan="3">아티스트명</td>
					<td><%=p.getArtistName() %></td>
				</tr>
				<tr>
					<td colspan="3">회차당 수업료</td>
					<td><%=p.getCostPerOrder()%>원</td>
				</tr>
				<tr>
					<td colspan="3">총 회차</td>
					<td><%=p.getTotalOrder() %>회</td>
				</tr>
				<tr>
					<td colspan="3">전체 수업료</td>
					<td><%=p.getTotalCost() %>원</td>
				</tr>
				<tr>
					<td colspan="4">수업 장소</td>
				</tr>
				<tr>
					<td colspan="4" style="font-size: medium; font-weight: normal;">
						<%=p.getRegion() %>  <%=p.getSubRegion() %>  <%=p.getAddress() %>
					</td>
				</tr>
				<tr>
					<td colspan="3">수업회차</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4">
						<div>1회차 | 02.03 (월) 19:00 - 21:00</div>
						<div>2회차 | 02.03 (월) 19:00 - 21:00</div>
						<div>3회차 | 02.03 (월) 19:00 - 21:00</div>
						<div>4회차 | 02.03 (월) 19:00 - 21:00</div>
						<div>5회차 | 02.03 (월) 19:00 - 21:00</div>
						<div>6회차 | 02.03 (월) 19:00 - 21:00</div>
						<div>7회차 | 02.03 (월) 19:00 - 21:00</div>
						<div>8회차 | 02.03 (월) 19:00 - 21:00</div>
					</td>
				</tr>
			</table>
		</div>

		<div id="payDiv" style="overflow-y: auto; overflow-x: hidden;">
			<table id="pay">
				<tr>
					<td colspan="3" style="color: gray; font-size: 16px; line-height: 20px;">(!) 3000 point 이상의 포인트만 사용이 가능합니다.</td>
				</tr>
				<tr>
					<td colspan="3" style="color: gray; font-size: 16px; line-height: 23px;">100point 단위 사용가능</td>
				</tr>
				<tr>
					<td colspan="2">보유 포인트 :</td>
					<td style="font-weight: bold;"><label id="myPoint"><%=p.getTotalPoint() %></label> point</td>
				</tr>
				<tr>
					<td colspan="2">사용 포인트 :</td>
					<td><label><input type="text" id="usingPoint" name="usingPoint"></label> point</td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="3" style="color: gray; font-size: 16px; line-height: 23px;">(!) 포인트를 제외한 결제금액의 1%가 적립되며 적립은 수업일정이 끝난 후 지급됩니다.</td>
				</tr>
				<tr>
					<td colspan="2">적립 예정 포인트 :</td>
					<td style="color: blue; font-weight: bold;"><label id="givePoint"><%=(int) (p.getTotalCost() * 0.01) %></label> point</td>
				</tr>
				<tr>
					<td colspan="2">결제 후 잔여 포인트 :</td>
					<td style="font-weight: bold;"><label id="afterPoint"></label> point</td>
				</tr>
			</table>
			<table id="howToPay">
				<tr style="height: 120px;">
					<td>결제수단 :</td>
					<td style="text-align: right;">
						<div style="line-height: 20px;">
							<label>카드결제</label><br>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="color: darkolivegreen; font-size: 13px; line-height: 15px;">
						입금한 금액은 hobbyist에서 보관 후<br>
						각 회차가 끝난 후 강사에게 입금될 예정입니다.
					</td>
				</tr>
				<tr>
					<td colspan="3" style="color: red; font-size: 17px; text-decoration: underline;">
						환불계좌 등록은 환불 신청하실 때 등록하실 수 있습니다.
					</td>
				</tr>
			</table>
		</div>

		<table style="padding-top: 20px;">
			<tr>
				<td><label id="payTerms">결제 이용 약관</label></td>
			</tr>
			<tr>
				<td>
					<div id="payTermsArea">
						- 환불 규정<br>
						<br> 1. 전체 수업의 50% 미만 시: 남은 회차 전액 환불<br> 2. 전체 수업의 50%
						이상 75% 미만 시: 남은 회차의 50% 환불. 남은 금액 수수료 제외 후 아티스트에게.<br> 3. 전체
						수업의 75% 초과 시: 남은 수업 환불 불가. 남은 금액 수수료 제외 후 아티스트에게.<br> - 아티스트와
						학생 사이에 갈등이 생길 경우<br>
						<br> → 아티스트가 가해자이고 가해 여부를 인정할 경우: 진행 % 정도 관계없이 남은 금액 전액 환불<br>

						→ 가해자와 피해자의 주장이 상충할 경우: 재판 전까지 1달 이내 남은 금액은 사이트가 갖고 있기. 법원 판단 이후
						강사 유죄면 학생에게 남은 금액 환불. 무고죄면 강사에게 남은 금액 강사료로 지급.<br> - 같은 반
						학생들이 다른 학생에게 불만이 있을 경우<br> - 규정대로 환불하고, 피해 보상 여부는 가해학생과 피해학생
						사이에서 해결.<br>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;"><input type="checkbox"
					id="payTermsBox"><label>결제약관 동의</label></td>
			</tr>
			<tr>
				<td><label id="refundTerms">환불 이용 약관</label></td>
			</tr>
			<tr>
				<td>
					<div id="refundTermsArea">
						- 환불 규정<br>
						<br> 1. 전체 수업의 50% 미만 시: 남은 회차 전액 환불<br> 2. 전체 수업의 50%
						이상 75% 미만 시: 남은 회차의 50% 환불. 남은 금액 수수료 제외 후 아티스트에게.<br> 3. 전체
						수업의 75% 초과 시: 남은 수업 환불 불가. 남은 금액 수수료 제외 후 아티스트에게.<br> - 아티스트와
						학생 사이에 갈등이 생길 경우<br>
						<br> → 아티스트가 가해자이고 가해 여부를 인정할 경우: 진행 % 정도 관계없이 남은 금액 전액 환불<br>

						→ 가해자와 피해자의 주장이 상충할 경우: 재판 전까지 1달 이내 남은 금액은 사이트가 갖고 있기. 법원 판단 이후
						강사 유죄면 학생에게 남은 금액 환불. 무고죄면 강사에게 남은 금액 강사료로 지급.<br> - 같은 반
						학생들이 다른 학생에게 불만이 있을 경우<br> - 규정대로 환불하고, 피해 보상 여부는 가해학생과 피해학생
						사이에서 해결.<br>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;"><input type="checkbox"
					id="refundTermsBox"><label>환불약관 동의</label></td>
			</tr>
		</table>


		<table id="checkPay">
			<tr>
				<td style="color: gray; font-size: 20px;">전체 수업료</td>
				<td style="color: gray; font-size: 20px;"><label id="lessonMoney"><%=p.getTotalCost() %></label> 원</td>
			</tr>
			<tr>
				<td style="color: gray; font-size: 20px;">사용 포인트</td>
				<td style="color: gray; font-size: 20px;">(-)<label id="usingPointResult"></label>point</td>
			</tr>

			<tr style="line-height: 50px;">
				<td style="font-size: 25px; font-weight: bold;">결제 금액</td>
				<td style="font-size: 25px; font-weight: bold;"><label id="moneyResult"><%=p.getTotalCost() %></label> 원</td>
			</tr>
		</table>

		<div id="resultButton" style="text-align: center; margin-bottom: 100px;">
			<input type="reset" value="이전" style="background-color: white;">&nbsp; 
			<input id="check_module" type="button" value="결제" style="background-color: darkolivegreen; color: white;">
		</div>
	</section>

	<%@ include file="../common/footer.jsp"%>

	<script>
	$(function() {
			
	   	$("#usingPoint").keyup(function(){
			var lessonMoney = Number($("#lessonMoney").text());	//수업료
			console.log(lessonMoney);
	 	  	var myPoint = Number($("#myPoint").text());			//보유 포인트
	    	var usingPoint = Number($("#usingPoint").val());	//사용 포인트
	    	var givePoint = Number($("#givePoint").text());
  		  
	    	$("#givePoint").text(Math.round((lessonMoney - usingPoint) * 0.01));	//적립예정 포인트
    		$("#afterPoint").text(myPoint - usingPoint);		//잔여포인트
    		$("#usingPointResult").text(usingPoint);			//최종 사용 포인트
    		$("#moneyResult").text(lessonMoney - usingPoint);	//최종 결제 금액
    	
    			if(Number($("#afterPoint").text()) < 0) {
    				alert("안됩니다.");
    				$("#usingPoint").val("");
    				$("#givePoint").text(lessonMoney * 0.01);
    				$("#usingPointResult").text("");
    				$("#afterPoint").text(myPoint);
  	 	 			$("#moneyResult").text(lessonMoney);
    			
  		  		}
    			if(Number($("#givePoint").text()) < 0) {
    				alert("수업료보다 사용하실 포인트가 많습니다.");
    				$("#usingPoint").val("");
    				$("#givePoint").text(lessonMoney * 0.01);
    				$("#usingPointResult").text("");
    				$("#afterPoint").text(myPoint);
  	 	 			$("#moneyResult").text(lessonMoney);
    			}
    			
		});
	
    $("#check_module").click(function() {
    	//결제 정보 불러오기
    	var moneyResult = Number($("#moneyResult").text());		//최종 결제 금액
    	var givePoint = Number($("#givePoint").text());			//지급 예정 금액
    	var usingPoint = Number($("#usingPoint").val());		//사용 금액
    	
   	  	if($("#payTermsBox").prop("checked") && $("#refundTermsBox").prop("checked")/*  && loginUser != null */) {		//로그인 유저가 널이 아닐때 추가하기!!
    	  
	    	if(usingPoint < 100 && usingPoint != 0) {
	    		alert("100포인트 이상 사용 가능합니다.");
	    	}else {
	  			var IMP = window.IMP; // 생략가능
  		 		IMP.init('imp67942527');	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 	   
  		 		IMP.request_pay({
 		 		pg: 'inicis',
 		 		pay_method : 'card',
 	 	 		merchant_uid: 'merchant_' + new Date().getTime(),	/*	merchant_uid에 경우	https://docs.iamport.kr/implementation/payment	*/
 		 		name : '<%=p.getLessonName()%>',
 		 		usingPoint: usingPoint,	//사용포인트
 		 		givePoint: givePoint,	//지금 포인트
 		  		amount: moneyResult,	//가격
		  		buyer_email: '<%=loginMember.getEmail()%>',	
		  		buyer_name: '<%=loginMember.getMemberName()%>',
 		  		buyer_tel: '<%=loginMember.getPhone()%>',
 	 	 
  	  			/* 모바일 결제시, 결제가 끝나고 랜딩되는 URL을 지정
 	  			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐 */
 	  			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	    
			  	}, function (rsp) {
	  		
	  	  			if (rsp.success) {
 		 	  	 		var msg = '결제가 완료되었습니다.';
 	    		
		    			msg += '고유ID : ' + rsp.imp_uid;	
		    			msg += '결제 금액 : ' + rsp.paid_amount;
	    			
		    			console.log(usingPoint);
		    			console.log(givePoint);
	    				$.ajax({
	   	 	  	    	  	url: "<%= request.getContextPath()%>/payment.pa", // 가맹점 서버
	        		    	method: "POST",
	            			data: {
	            				scheduleCode : <%=p.getScheduleCode()%>,		//일정코드
			    				memberCode : <%=loginMember.getMemberCode()%>,		//회원코드
			    				artistCode : <%=p.getArtistCode()%>,	//아티스트 코드
	         	  	 			impUid : rsp.imp_uid,					//고유번호
			    				merchantUid : rsp.merchant_uid,			//머천트 임의 고유번호
			    				productName : rsp.name,					//상품명
			    				price : rsp.paid_amount,				//가격
			    				usingPoint: usingPoint,					//사용포인트
			  		  			givePoint : givePoint,					//적립예정 포인트
			  		  			payDate : rsp.paid_at					//결제 일시
			  		  			
	            			}
	        			});
	    				var msg = "결제가 완료되었습니다.";
	    				alert(msg);
						location.href = "/hobbyist/index.jsp";
  	  			} else {
  	 					var msg = '결제에 실패하였습니다.';
  						msg += '에러내용 : ' + rsp.error_msg;
	  	  				alert(msg);
 	  			}
		  		});
	    	}	//100포인트 이상일때 else문 끝
 	   
     	} else {		//checked if문 끝
    	  
    	  alert("약관에 모두 동의하여 주세요.");
		}
  	});
	
	});
    </script>

</body>
</html>