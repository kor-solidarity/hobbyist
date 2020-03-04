<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dh.hobbyist.calculatePay.model.vo.PaySettlement, com.dh.hobbyist.suggest.model.vo.PageInfo"%>
<%
	ArrayList<PaySettlement> myPayList = (ArrayList<PaySettlement>) request.getAttribute("myPayList");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
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
	.txt_name {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
   		word-wrap:break-word;
   		
	}
	.notConfirm {
		cursor:pointer;
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
				<th>회차코드</th>
				<th>수업명</th>
				<th>수업일자</th>
				<th>회차당 수업료</th>
				<th>수강인원</th>
				<th>총수업료</th>
				<th>수수료</th>
				<th>계좌번호</th>
				<th>총지급액</th>
				<th>상태</th>
			</tr>
			<% for(PaySettlement ps : myPayList) { %>
			<tr>
				<td><%=ps.getLessonOrderCode() %></td>
				<td><p class="txt_name"><%=ps.getLessonName() %></p></td>
				<td><%=ps.getLessonOrderEnd() %></td>
				<td><%=ps.getCostPerOrder() %>원</td>
				<td><%=ps.getListeners() %></td>
				<td><%=ps.getTotalCost() %>원</td>
				<td><%=ps.getSettleFee() %>%</td>
				<td>
					<%
						String sentence = "";
						switch(ps.getBankName()) {
						case "SH" : sentence = "신한"; break;
						case "KB" : sentence = "국민"; break;
						case "NH" : sentence = "농협"; break;
						default: sentence = ps.getBankName(); break;
						}
						sentence += ps.getBankOwner();
						sentence += ps.getBankNum();
					%>
					<%=sentence %>
				</td>
				<td style="font-weight: bold;"><%=ps.getTotalPayGiven() %>원</td>
				<td>
					<% if(ps.getStatus() == 0) { %>
						<p class="notConfirm" style="font-weight:bold; color:dimgrey">미확인</p>
					<%} else if(ps.getStatus() == 1) { %>
						<p style="font-weight:bold; color:red">수정 요청</p>
					<%} else if(ps.getStatus() == 2) {%>
						<p style="font-weight:bold; color:DodgerBlue">정산 대기중</p>
					<%} else if(ps.getStatus() == 3) {%>
						<p style="font-weight:bold; color:dimgrey">정산 완료</p>
					<%} %>
				</td>
			</tr>
			<%} %>
		</table>

		<br>
		<br>
		<div id="calPagingArea">
			<button onclick="location.href='<%=request.getContextPath() %>/selectMycalculationList.cp?currentPage=1'"><<<</button>
			
			<%if(currentPage <= 1) {%>
				<button disabled><</button>
			<%} else { %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectMycalculationList.cp?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage) {
			%>
				<button disabled><%= p %></button>
			<%} else { %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectMycalculationList.cp?currentPage=<%=p%>'"><%= p %></button>
			<% }
			}	
			%>
			<%if(currentPage >= maxPage) { %>
				<button disabled>></button>
			<%} else { %>
				<button onclick="location.href='<%=request.getContextPath() %>/selectMycalculationList.cp?currentPage=<%=currentPage+1 %>'">></button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectMycalculationList.cp?currentPage=<%=maxPage%>'">>>></button>	
		</div>
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
					<form id="settlementForm" action="<%=request.getContextPath()%>/insertSettlementReply.cp" method="post">
						<input type="hidden" id="hideSettleCode" name="hideSettleCode">
						<div class="modal-body">
							<table style="margin:auto; border-spacing:15px; border-collapse:separate;">
								<tr>
									<td colspan="3" style="font-weight:bold; font-size:18px;" id="lesson_title"></td>
								</tr>
								<tr>
									<td id="cost_per_order"></td>
									<td></td>
									<td id="total_cost"></td>
								</tr>
								<tr>
									<td>수수료 : 10%</td>
									<td></td>
									<td id="bank"></td>
								</tr>
								<tr>
									<td style="font-size:17px; font-weight:bold;" id="pay_given"></td>
									<td></td>
									<td></td>
								</tr>
							</table>
							<div style="text-align:center;">
								<textarea id="modifyText" name="modifyText" rows="5" cols="40" placeholder="수정 요청 사항을 적어주세요"></textarea>
							</div>
						</div>
					</form>
				<div class="modal-footer" style="text-align:center;">
					<button type="button" id="modify" class="btn btn-default">수정요청</button>
					<button type="button" id="confirm" class="btn btn-primary" style="background-color:darkolivegreen;">정산확정</button>
					<button type="button" id="calCancel" class="btn btn-default" style="display:none;">취소</button>
					<button type="button" id="calSubmit" class="btn btn-primary" style="background-color:darkolivegreen; display:none;">제출</button>
				</div>
			</div>

		</div>
	</div>
	<script>
		$(document).ready(function(){
	    	$(".notConfirm").click(function(){
	    		var code = $(this).parent().parent().children("td:first-child").text();
	    		
				$.ajax({
					url: "/hobbyist/selectOneCalculation.cp",
					data: {code : code},
					type: "post",
					success: function(data) {
						$("#hideSettleCode").val(data.settleCode);
						$("#lesson_title").text(data.lessonName + " (" + data.lessonOrderTime + "회차)");
						$("#cost_per_order").text("금액(인당) : " + data.costPerOrder + "원");
						$("#total_cost").text("총액 : " + data.totalCost + "원");
						var bankName  = "";
						switch(data.bankName) {
						case "SH" : bankName = "신한"; break;
						case "NH" : bankName = "농협"; break;
						case "KB" : bankName = "국민"; break;
						default : bankName = data.bankName; break;
						}
						$("#bank").text("계좌 번호 : " + bankName + " " + data.bankOwner + " " + data.bankNum);
						$("#pay_given").text("총 지급액 : " + data.totalPayGiven +"원");
					},
					error: function(error) {
						console.log(error);
					}
				});
				
	    		$("#myModal").modal();
	    	});
	    	
	    	$("#modify").click(function(){
	    		$("#modifyText").show();
	    		$("#modify").hide();
	    		$("#confirm").hide();
	    		$("#calCancel").show();
	    		$("#calSubmit").show();
	    	});
	    	
	    	$("#calCancel").click(function() {
	    		$("#modifyText").hide();
	    		$("#modify").show();
	    		$("#confirm").show();
	    		$("#calCancel").hide();
	    		$("#calSubmit").hide();
	    	});
	    	
	    	$("#confirm").click(function() {
	    		var code = $("#hideSettleCode").val();
				if(confirm("정산 확정 하시겠습니까?")){
		    		location.href = "<%=request.getContextPath()%>/updateConfirmStatus.cp?code=" + code;
				}	    		
	    	});
	    	
	    	
	    	$("#calSubmit").click(function() {
	    		if($("#modifyText").val() == ""){
	    			alert("수정 요청 사항을 적어주세요");
	    		} else {
	    			$("#settlementForm").submit();
	    		}
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