<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dh.hobbyist.calculatePay.model.vo.*"%>
<%
	ArrayList<PaySettlement> payList = (ArrayList<PaySettlement>) request.getAttribute("payList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	background: black;
	margin: 0px;
	margin-left: 115px;
	margin-top: 10px;
	align: right;
}

#infoArea {
	margin-top: 20px;
	margin-left: 60px;
	width: 1100px;
	height: 500px;
	overflow-x: hidden;
	overflow-y: auto;
}

#calPayTab {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
}

#calPayTab th {
	text-align: center;
	height: 35px;
}

#calPayTab td {
	border: 1px solid black;
	height: 45px;
}

#calPayTab tr:first-child {
	background-color: #4E4E4E;
	color: white;
}
#artistResponse {
	width:80%;
	background-color:#F0F0F0;
	margin:auto;
	height:100px;
	border-radius:5%;
}
#adminResponse {
	width:80%;
	margin:auto;
}
#adminResDiv {
	background-color:#F0F0F0;
	margin:auto;
	height:100px;
	border-radius:5%;
}
#adminText {
	width:400px; 
	height:60px; 
	resize:none; 
	background-color:transparent; 
	border:none;

}
#sortDiv {
	margin-top:20px;
	text-align:right;
	margin-right:50px;
}
#sortSelect {
	width: 100px;
	height: 25px;
}
#completeDiv {
	margin-top:20px;
	text-align:right;
	margin-right:60px;
}
.modalLab {
	cursor:pointer;
}
#completeSettlement {
	color: white;
	background-color: #4E4E4E;
	height:35px;
	border-radius:5px;
	font-size:15px;
	font-weight:bold;
	padding:5px;
	border: 1px solid #4E4E4E;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/adminMenubar.jsp"%>
	<section>
		<!-- 왼쪽 사이드바 메뉴  -->
		<article id="sideMenuBar">

			<!-- 큰 영역의 메뉴 -->
			<div id="bigMenu">
				<label style="font-weight: bold; font-size: 25px;">결제/환불</label>
				<hr
					style="width: 80%; color: #DED842; height: 1px; background: #DED842; margin-top: 17px;">
			</div>

			<!-- 큰 메뉴안의 상세 메뉴 여러개 -->
			<div id="smallMenu">
				<label onclick="goPayList();">내역 조회</label><br> 
				<label onclick="goApplyRefund();">환불 신청</label><br> 
				<label style="color: #DED842;">금액 정산</label>
			</div>
		</article>
		<script>
			function goPayList() {
				location.href = "<%=request.getContextPath()%>/views/admin/payRefundMgmt/payList.jsp";
			}
			function goApplyRefund() {
				location.href = "<%=request.getContextPath()%>/views/admin/payRefundMgmt/applyRefundList.jsp";
			}
		</script>
		<!-- 관리자 본문 들어갈 공간 -->
		<article id="contents">

			<!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
			<div id="searchDetailArea">

				<!-- 상세페이지, 정렬, 검색 테이블 -->
				<table id="searchT">
					<tr>
						<td style="text-align: left; vertical-align: bottom;"><label
							style="font-weight: bold;">금액정산</label></td>
						<td style="padding-right: 20px;"><input style=""
							id="searchMember">
						<button id="searchBtn">검색</button></td>
					</tr>

				</table>
			</div>

			<!-- 본문 상단 줄 -->
			<hr id="firstLine">

			<!-- 정보 추가되는 본문 테이블 -->
			<div id="sortDiv">
				<select id="sortSelect">
					<option value="9" selected>--전체선택--</option>
					<option value="0">확인 대기중</option>
					<option value="1">수정 요청</option>
					<option value="2">정산 대기중</option>
					<option value="3">정산 완료</option>
					<option value="4">답변 완료</option>
				</select>
			</div>
			<div id="infoArea">
			<form id="chkForm" action="<%=request.getContextPath()%>/updateCompleteSettlement.cp" method="post">
				<table id="calPayTab">
					<!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
					<tr>
						<th style="width: 110px;">회차코드</th>
						<th style="width: 50px;">회차</th>
						<th style="width: 150px;">아티스트 아이디</th>
						<th style="width: 150px;">아티스트 이름</th>
						<th style="width: 150px;">회차당 수업료</th>
						<th style="width: 90px;">수강인원</th>
						<th style="width: 100px;">총 수업료</th>
						<th style="width: 90px;">수수료</th>
						<th style="width: 100px;">총 지급액</th>
						<th style="width: 100px;">계좌번호</th>
						<th style="width: 120px;">상태</th>
						<th style="width:50px;"><input type="checkbox" id="allCheck"></th>
					</tr>
					<% 
						for(PaySettlement ps : payList) { %>
						<tr>
							<td><%=ps.getLessonOrderCode() %></td>
							<td><%=ps.getLessonOrderTime() %></td>
							<td><%=ps.getMemberId() %></td>
							<td><%=ps.getMemberName() %></td>
							<td><%=ps.getCostPerOrder() %>원</td>
							<td><%=ps.getListeners() %></td>
							<td><%=ps.getTotalCost() %>원</td>
							<td><%=ps.getSettleFee() %>%</td>
							<td><%=ps.getTotalPayGiven() %>원</td>
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
							<td>
								<% if(ps.getStatus() == 0) { %>
									<label style="color:dimgrey">확인 대기중</label>
								<%} else if(ps.getStatus() == 1){ %>
									<label class="modalLab" style="color:red">수정 요청</label>
								<%} else if(ps.getStatus() == 2) { %>
									<label style="color:DodgerBlue">정산 대기중</label>
								<%} else if(ps.getStatus() == 3) { %>
									<label style="color:dimgrey">정산 완료</label>
								<%} else if(ps.getStatus() == 4) { %>
									<label style="color:steelBlue">답변 완료</label>
								<%} %>
							</td>
							<td>
								<input type="checkbox" name="chk" value="<%=ps.getSettleCode()%>">
							</td>
							<input type="hidden" value="<%=ps.getSettleCode() %>">
						</tr>
					
					<%} %>
				</table>
			</form>
			</div>
			<div id="completeDiv">
				<button type="button" id="completeSettlement">정산 완료</button>
			</div>
		</article>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color:#4E4E4E; height:42px;">
					<button type="button" class="close" data-dismiss="modal" style="color:white;">×</button>
					<h4 class="modal-title"style="color:white; font-family: Do Hyeon;">수정요청 조회</h4>
				</div>
				<div class="modal-body">
					<table style="margin:auto; border-spacing:15px; border-collapse:separate;">
						<tr>
							<td colspan="3" style="font-weight:bold; font-size:18px;" id="lessonName"></td>
						</tr>
						<tr>
							<td id="costPer"></td>
							<td></td>
							<td id="totCost"></td>
						</tr>
						<tr>
							<td id="setFee"></td>
							<td></td>
							<td id="artBank"></td>
						</tr>
						<tr>
							<td id="endTime"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td style="font-size:17px; font-weight:bold;" id="totGiven"></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<div id="artistResponse">
						<table style="border-spacing:10px; border-collapse:separate; width:100%;">
							<tr>
								<td style="font-weight:bold; color:#4E4E4E;" id="artistName"></td>
								<td style="text-align:right;"></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2" style="font-size:15px;" id="content"></td>
							</tr>
						</table>
						
					</div>
					<br>
					<div id="adminResponse">
						<form id="adminForm" action="<%=request.getContextPath()%>/insertAdminReply.cp" method="post">
							<table>
								<tr>
									<td><img src="/hobbyist/static/images/arrow.png" style="width:50px;"></td>
									<td rowspan="2">
										<div id="adminResDiv">
											<table>
												<tr>
													<td style="font-weight:bold; color:#4E4E4E;" id="adminName"><%=loginAdmin.getAdminName() %></td>
													<td style="text-align:right;"></td>
												</tr>
												<tr>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td colspan="2" style="font-size:15px; width:600px;"><textarea id="adminText" name="adminText" placeholder="답변할 내용을 적어주세요."></textarea></td>
												</tr>
												<input type="hidden" id="hideSetCode" name="hideSetCode">
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align:center;">
					<button type="button" id="adminSend" class="btn btn-primary" style="background-color:#4E4E4E; width:150px;">답변하기</button>
				</div>
			</div>

		</div>
	</div>
	<script>
	$(function(){
    	
    	$("#sortSelect").change(function(){
    		var val = $("#sortSelect").val();
    		$.ajax({
    			url: "/hobbyist/sortStatus.cp",
    			data: {val:val},
    			type: "post",
    			success: function(data){
    					
    				$table = $("#calPayTab");
    				$table.html('');
    					
    				var $tr = $("<tr>");
    					
    				$tr.append('<th style="width: 110px;">회차코드</th>' + 
    					'<th style="width: 50px;">회차</th>' + 
    					'<th style="width: 150px;">아티스트 아이디</th>' + 
    					'<th style="width: 150px;">아티스트 이름</th>' +
    					'<th style="width: 150px;">회차당 수업료</th>'+
    					'<th style="width: 90px;">수강인원</th>' + 
    					'<th style="width: 100px;">총 수업료</th>' + 
    					'<th style="width: 90px;">수수료</th>' + 
    					'<th style="width: 100px;">총 지급액</th>' + 
    					'<th style="width: 100px;">계좌번호</th>' + 
    					'<th style="width: 120px;">상태</th>' + 
    					'<th style="width:50px;"><input type="checkbox" id="allCheck"></th>');  
    					
    				$table.append($tr);
    					
    				for(var key in data) {
    					$tr = $("<tr>");
    					var $oCode = $("<td>").text(data[key].lessonOrderCode);
    					var $oTime = $("<td>").text(data[key].lessonOrderTime);
    					var $mId = $("<td>").text(data[key].memberId);
    					var $mName = $("<td>").text(data[key].memberName);
    					var $pOrder = $("<td>").text(data[key].costPerOrder +"원");
    					var $listeners = $("<td>").text(data[key].listeners);
    					var $tCost = $("<td>").text(data[key].totalCost +"원");
    					var $sfee = $("<td>").text(data[key].settleFee + "%");
    					var $payGiven = $("<td>").text(data[key].totalPayGiven + "원");
    					var bankName = "";
    					switch(data[key].bankName) {
    					case "SH" : bankName = "신한"; break;
    					case "NH" : bankName = "농협"; break;
    					case "KB" : bankName = "국민"; break;
    					default: bankName = data[key].bankName; break;
    					}
    					var $bank = $("<td>").text(bankName + data[key].bankOwner + data[key].bankNum);
    					var $status;
    					if(data[key].status == 0) {
    						$status = $("<td>").html("<label style='color:dimgrey'>확인 대기중</label>");
    					} else if(data[key].status == 1) {
    						$status = $("<td>").html("<label class='modalLab' style='color:red'>수정 요청</label>");
    					} else if(data[key].status == 2) {
    						$status = $("<td>").html("<label style='color:DodgerBlue'>정산 대기중</label>");
    					} else if(data[key].status == 3) {
    						$status = $("<td>").html("<label style='color:dimgrey'>정산 완료</label>");
    					} else if(data[key].status == 4) {
    						$status = $("<td>").html("<label style='color:steelBlue'>답변 완료</label>");
    					}
    					var $checkbox = $("<td>").html("<input type='checkbox' name='chk' value='" + data[key].settleCode + "'>");
    					var hideIn = '<input type="hidden" value=' + data[key].settleCode + '>';
    						
    					$tr.append($oCode);
    					$tr.append($oTime);
    					$tr.append($mId);
    					$tr.append($mName);
    					$tr.append($pOrder);
    					$tr.append($listeners);
    					$tr.append($tCost);
    					$tr.append($sfee);
    					$tr.append($payGiven);
    					$tr.append($bank);
    					$tr.append($status);
    					$tr.append($checkbox);
    					$tr.append(hideIn);
    						
    					$table.append($tr);
    				}
    					
    				
    			},
    			error : function(error) {
    				console.log(error);
    			}
    		});
    	});
	});
	
	$(document).on("click", '.modalLab', function() {
    	var code = $(this).parent().parent().children("input[type='hidden']").val();
    	
    	$.ajax ({
    		url: "selectSettlementReply.cp",
    		data: {code:code},
    		type: "post",
    		success: function(data) {
    			
    			for(var key in data) {
    				if(key == 'paySettlement') {
    					var ps = data[key];
    					
    					$("#lessonName").text(ps.lessonName + " (" + ps.lessonOrderTime + "회차)");
    					$("#costPer").text("금액(인당) : " + ps.costPerOrder + "원");
    					$("#totCost").text("총액 : " + ps.totalCost + "원");
    					$("#setFee").text("수수료 : " + ps.settleFee + "%");
    					var bankName = "";
    					switch(ps.bankName) {
    					case "SH" : bankName = "신한"; break;
    					case "NH" : bankName = "농협"; break;
    					case "KB" : bankName = "국민"; break;
    					default : bankName = ps.bankName; break;
    					}
    					$("#artBank").text("계좌번호 : " + bankName + " " +ps.bankOwner + " " + ps.bankNum);
    					
    					$("#endTime").text("회차 종료 시간 : " + ps.lessonOrderEnd);
    					$("#totGiven").text("총 지급액 : " + ps.totalPayGiven +"원");
    					
    					$("#hideSetCode").val(ps.settleCode);
    				}
    				
    				if(key == 'inquiryList') {
    					var list = data[key];
    					
    					$("#content").text(list[0].content);
    					$("#artistName").text(list[0].artistName);
    				}
    			}
    			
    		},
    		error: function(error) {
    			console.log(error);
    		}
    	});
    	
	    $("#myModal").modal();
	});
	
	$(document).on("click", '#adminSend', function(){
		if($("#adminText").val() == '') {
			alert("답변할 내용을 적어주세요.");
		} else {
			$("#adminForm").submit();
		}
	});
	
	
	$(document).on("click", "#allCheck", function(){
		if($("#allCheck").prop("checked")){
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
	$("#completeSettlement").click(function(){
		if(confirm("정산 완료하시겠습니까?")){
			$("#chkForm").submit();
		}
	});
	</script>


</body>
</html>