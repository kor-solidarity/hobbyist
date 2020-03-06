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
	.adminAnswer {
		cursor:pointer;
	}
	.completeCal {
		cursor:pointer;
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
		width:405px;
	}
	.borTr {
		border:1px solid darkolivegreen;
	}
	.borTr td {
		width:130px;
		border:1px solid darkolivegreen;
	}
	.seaGreen {
		background-color:#e1f0c2;
		color:darkolivegreen;
		font-weight:bold;
	}
	.oliveGreen {
		background-color:darkolivegreen;
		color:white;
		font-weight:bold;
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
						<p class="completeCal" style="font-weight:bold; color:dimgrey">정산 완료</p>
					<%} else if(ps.getStatus() == 4) {%>
						<p class="adminAnswer" style="font-weight:bold; color:steelBlue">답변 완료</p>
					<%} %>
				</td>
				<input type="hidden" value="<%=ps.getSettleCode()%>"> 
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
	
	<!-- 답변 완료 시 모달 -->
	<div class="modal fade" id="reMyModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-color:darkolivegreen; height:42px;">
						<button type="button" class="close" data-dismiss="modal" style="color:white;">×</button>
						<h4 class="modal-title" style="color:white; font-family: Do Hyeon;">정산확인</h4>
					</div>
						<input type="hidden" id="reHideSetCode">
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
									<td>수수료 : 10%</td>
									<td></td>
									<td id="artBank"></td>
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
								<td colspan="2" style="font-size:15px;" id="artistContent"></td>
							</tr>
						</table>
					</div>
					<br>
					<div id="adminResponse">
						<table>
							<tr>
								<td><img src="/hobbyist/static/images/arrow.png" style="width:50px;"></td>
								<td rowspan="2">
									<div id="adminResDiv">
										<table style="margin-left:10px;">
											<tr>
												<td style="font-weight:bold; color:#4E4E4E;" id="adminName"></td>
												<td style="text-align:right;"></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td colspan="2" style="font-size:15px;" id="adminContent"></td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</div>
					<div style="text-align:center;">
						<br>
						<p style="font-weight:bold;"> 이 후의 수정요청은 운영시간 내의 전화로 문의해주세요.</p>
					</div>
				</div>
				<div class="modal-footer" style="text-align:center;">
					<button type="button" id="reConfirm" class="btn btn-primary" style="background-color:darkolivegreen;">정산확정</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- 정산 완료시 모달 -->
	<div class="modal fade" id="comCalModal" role="dialog">
    	<div class="modal-dialog">
    
      	<div class="modal-content">
        	<div class="modal-header" style="background-color:darkolivegreen; height:42px;">
          	<button type="button" class="close" data-dismiss="modal" style="color:white;">×</button>
          	<h4 class="modal-title" style="color:white; font-family: Do Hyeon;">정산서 발급</h4>
        	</div>
        <div class="modal-body" id="idPrint">
          	<div style="text-align:center; width:500px; margin:auto;">
          		<h3 style="font-weight:bold;">(주) hobbyist 정산서</h3>
          		<br>
          		<table style="margin:auto; font-size:15px; border-collapse:collapse; text-align:center;">
					<tr>
						<td></td>
						<td></td>
						<td style="text-align:right">지급일 :</td>
						<td id="setDate"></td>
					</tr>
					<tr class="borTr">
						<td class="seaGreen">아이디</td>
						<td id="payId"></td>
						<td class="seaGreen">성명</td>
						<td id="payName"></td>
					</tr>
					<tr class="borTr">
						<td class="seaGreen">수업명</td>
						<td colspan="3" id="payTitle"></td>
					</tr>
					<tr class="borTr">
						<td class="seaGreen">회차</td>
						<td id="payTime"></td>
						<td class="seaGreen">수강인원</td>
						<td id="payPeople"></td>
					</tr>
					<tr style="height:10px;">
					</tr>
					<tr>
						<td style="text-align:left;">정산 계좌</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="borTr">
						<td class="seaGreen">은행</td>
						<td id="payBank"></td>
						<td class="seaGreen">계좌번호</td>
						<td id="payNum"></td>
					</tr>
					<tr style="height:10px;">
					</tr>
					<tr>
						<td style="text-align:left;">급여 내역</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="borTr">
						<td class="seaGreen" colspan="4">지급 및 차감 내역</td>
					</tr>
					<tr class="borTr">
						<td class="seaGreen">수업료</td>
						<td id="paylesson" style="text-align:right;"></td>
						<td class="seaGreen">(기타입력2)</td>
						<td>-</td>
					</tr>
					<tr class="borTr">
						<td class="seaGreen">수수료</td>
						<td id="payFee" style="text-align:right;"></td>
						<td class="seaGreen">(기타입력3)</td>
						<td>-</td>
					</tr>
					<tr class="borTr">
						<td class="seaGreen">(기타입력1)</td>
						<td>-</td>
						<td class="seaGreen">(기타입력4)</td>
						<td>-</td>
					</tr>
					<tr style="height:20px;">
					</tr>
					<tr class="borTr">
						<td></td>
						<td></td>
						<td class="oliveGreen">실 수령액</td>
						<td id="payGiven" style="text-align:right;"></td>
					</tr>         
          		</table>
          		<br>
          		<p style="font-weight:bold;" id="payThanks"></p>
          		<br>
          		<p style="text-align:right;">(주) hobbyist</p>
          	</div>
        </div>
        <div class="modal-footer" style="text-align:center;">
          <button type="button" class="btn btn-primary" style="background-color:darkolivegreen;" onclick="printArea();">인쇄</button>
        </div>
      </div>
      
    </div>
  </div>

	<script>
		$(document).ready(function(){
	    	$(".notConfirm").click(function(){
	    		var code = $(this).parent().parent().children("input").val();
	    		
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
	    	
	    	$(".adminAnswer").click(function() {
	    		var code = $(this).parent().parent().children("input").val();
	    		
	    		$.ajax({
	    			url: "/hobbyist/selectMyInquiryList.cp",
	    			data: {code : code},
	    			type: "post",
	    			success: function(data) {

						for(var key in data) {
							if(key == 'paySettlement') {
								var ps = data[key];
		    					
		    					$("#lessonName").text(ps.lessonName + " (" + ps.lessonOrderTime + "회차)");
		    					$("#costPer").text("금액(인당) : " + ps.costPerOrder + "원");
		    					$("#totCost").text("총액 : " + ps.totalCost + "원");
		    					var bankName = "";
		    					switch(ps.bankName) {
		    					case "SH" : bankName = "신한"; break;
		    					case "NH" : bankName = "농협"; break;
		    					case "KB" : bankName = "국민"; break;
		    					default : bankName = ps.bankName; break;
		    					}
		    					$("#artBank").text("계좌번호 : " + bankName + " " +ps.bankOwner + " " + ps.bankNum);
		    					
		    					$("#totGiven").text("총 지급액 : " + ps.totalPayGiven +"원");
		    					
		    					$("#reHideSetCode").val(ps.settleCode);
							}
							
							if(key == 'inquiryList') {
								var list = data[key];
								var len = data[key].length;
								
								for(var i = 0; i < len; i++) {
									if(list[i].LVL == 0) {
										$("#artistName").text(list[i].artistName);
										$("#artistContent").text(list[i].content);
									} else if(list[i].LVL == 1) {
										$("#adminName").text(list[i].adminName);
										$("#adminContent").text(list[i].content);
									}
								}
							}
						}
	    			},
	    			error: function(error) {
	    				console.log(error);
	    			}
	    		});
	    		
	    		$("#reMyModal").modal();
	    	});
	    	
	    	$("#reConfirm").click(function(){
	    		var code = $("#reHideSetCode").val();
				if(confirm("정산 확정 하시겠습니까?")){
		    		location.href = "<%=request.getContextPath()%>/updateConfirmStatus.cp?code=" + code;
				}
	    	});
	    	
	    	$(".completeCal").click(function(){
	    		var code = $(this).parent().parent().children("input").val();
	    		
	    		$.ajax({
	    			url:"/hobbyist/issuePayment.cp",
	    			data: {code:code},
	    			type: "post",
	    			success: function(data) {
	    				
	    				for(var key in data) {
	    					
		    				if(key == "paySettlement") {
		    					$("#payId").text(data[key].memberId);
		    					$("#payName").text(data[key].memberName);
		    					$("#payTitle").text(data[key].lessonName);
		    					$("#payTime").text(data[key].lessonOrderTime + "회차");
		    					$("#payPeople").text(data[key].listeners + "명");
		    					
		    					var bankName = "";
		    					switch(data[key].bankName) {
		    					case "SH" : bankName = "신한"; break;
		    					case "NH" : bankName = "농협"; break;
		    					case "KB" : bankName = "국민"; break;
		    					default: bankName = data[key].bankName; break;
		    					}
		    					
		    					$("#payBank").text(bankName);
		    					$("#payNum").text(data[key].bankNum);
		    					
		    					var payLesson = data[key].totalCost;
		    					var payFee = payLesson * 0.1;
		    					var payGiven = data[key].totalPayGiven;
		    					
		    					payLesson = payLesson.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		    					payFee = payFee.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		    					payGiven = payGiven.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		    					
		    					
		    					$("#paylesson").html(payLesson + "&nbsp;");
		    					$("#payFee").html(payFee + "&nbsp;");
		    					$("#payGiven").html(payGiven + "&nbsp;");
		    					$("#payThanks").text(data[key].memberName +"님의 노고에 감사드립니다.");
		    				}
		    				
		    				if(key == "settleDate") {
		    					$("#setDate").text(data[key]);
		    				}
	    				}
	    			},
	    			error: function(error) {
	    				console.log(error);
	    			}
	    		});
	    		
	    		$("#comCalModal").modal();
	    	});
		});
		
		var win = null;
		
		function printArea() 
		{ 
			/* var initBody;
			window.onbeforeprint = function() {
				initBody = document.body.innerHTML;
				document.bodyinnerHTML = document.getElementById('idPrint').innerHTML;
			};
			window.onafterprint = function() {
				document.body.innerHTML = initBody;
			};
			console.log(document.bodyinnerHTML);
			window.print(); */
			var printThis = document.getElementById('idPrint').innerHTML;
			win = window.open();
			self.focus();
			win.document.open();
			win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
			win.document.write('.borTr { border:1px solid black; } .borTr td { width:130px; border:1px solid black; } .seaGreen {color:black; font-weight:bold; } .oliveGreen {color:black; font-weight:bold; }');
			win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
			win.document.write(printThis);
			win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
			win.document.close();
			win.print();
			win.close();
		}
	</script>

	<br>
	<br>
	<br>
	<br>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>