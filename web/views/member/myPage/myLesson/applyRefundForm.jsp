<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dh.hobbyist.applyRefund.model.vo.ApplyRefund, com.dh.hobbyist.lesson.model.vo.MyRegiLesson"%>
<%
	ApplyRefund ap = (ApplyRefund) request.getAttribute("ap");
	MyRegiLesson myReg = (MyRegiLesson) request.getAttribute("myReg");
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	#lessonInfo {
		margin: 0 auto;
		background: lightgray;
		width: 1024px;
		height: 200px;
		margin-top: 20px;
	}
	
	#refundText {
		width: 1024px;;
		margin: 0 auto;
		margin-top: 40px;
	
	}
	#refundArea {
		width: 1024px;
		height: 350px;
		margin: 0 auto;
		margin-bottom: 80px;
	}
	
	#payInfoT1 {
		width: 50%;
		float: left;
		font-size: 20px;
		font-weight: bold;
		line-height: 35px;
	}
	
	#payInfoT2 {
		width: 50%;
		font-size: 20px;
		font-weight: bold;
		margin-top: 50px;
		line-height: 35px;
	}
	
	#explainArea {
		width: 100%;
		margin-top: 20px;
		color: gray;
		font-size: 16px;
	}
	
	input[type=reset] {
		background: gray;
		font-size: 25px;
	}
	
	button[type=button] {
		background: darkolivegreen;
		color: white;
		font-size: 25px;
	}
	.lessonArea {
		margin-top: 10px;
		width: 100%;
	}
	.lessonArea tr {
		height: 160px;
	}
	.lessonArea td {
		width: 100px;
		/* background: grey; */
		/* padding: 5px 10px; */
	}
	.eachWrap {
		width: 1024px;
		height: 180px;
		background: #EDEDED;
		margin: auto;
	}
	.eachLesson td {
		padding: 10px 15px;
	}
	.lessonImg {
		height: 160px;
		width: 230px;
	}
	p {
		margin: 0;
		font-size: 18px;
	}
	.profile {
		width: 50px;
		padding: 0;
	}
	.profileTable {
		height: 30%;
		margin: 0 auto;
	}
	.profileTable tr:nth-of-type(1) {
		width: 100%;
		height: 15%;
	}
	.profileTable tr:nth-of-type(2) {
		width: 100%;
		height: 15%;
	}
	.profileTable td {
		padding: 0;
	}
	.profileImgArea {
		height: 50px;
	}
	.profileImg {
		width: 80px;
		height: 80px;
		border-radius: 50px;
		align: center;
	}
	.nickName {
		font-size: 20px;
		font-weight: bold;
		color:darkolivegreen;
		text-align: center;
	}
	.realName {
		font-size: 14px;
		text-align: center;
	}
</style>
</head>
<body>
 <%@ include file="/views/common/menubar.jsp" %>
 <hr style="width: 1024px; height: 1px; background: darkolivegreen;">
 
 <div id="refundText">
 	<label style="float: left; font-size: 25px; font-weight: bold;">환불정보</label>
 </div>
 
 <br clear="both">
 
 <table class="lessonArea" align="center">
			<tr>
				<td>
					<div class="eachWrap">
						<table class="eachLesson" style="width:100%; height:100%;">
							<tr style="height:100%">
								<td style="width:27%;"><img class="lessonImg" src="<%= request.getContextPath() %>/<%=myReg.getLessonImgRoute()%>/<%=myReg.getLessonImgName()%>"></td>
								<td class="lessonText" style="width:50%;">
												<p style="font-weight: bold; font-size: 20px;"><%=myReg.getLessonName() %></p><br>
												<p><%=myReg.getStartDate() %> / <%=myReg.getRegion() %></p>
												<p><%=myReg.getPaymentDate() %></p> 
								</td>
								<td class="profile" style="width:15%; padding:0;">
									<div align="center"><img class="profileImg" src="<%=request.getContextPath() %>/<%=myReg.getProfileImgRoute()%>/<%=myReg.getProfileImgName()%>"></div>
									<table class="profileTable">
										<tr>
											<td>
												<div class="nickName"><%=myReg.getArtistNick()%></div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="realName"><%=myReg.getArtistName() %></div>
											</td>
										</tr>
									</table>							
						</table>
					</div>
				</td>
			</tr>
		</table>
 
 <form name="goRefund" action="<%=request.getContextPath()%>/insertApplyRefund.me" method="post" style="margin-bottom: 200px;">
 <div id="refundArea">
 	<table id="payInfoT1">
 		<tr>
 			<td>결제 금액 : </td>
 			<td><%=ap.getPayCost() %>원</td>
 			<td>
 				<input type="hidden" name="paymentCode" value="<%=ap.getPaymentCode() %>">
 				<input type="hidden" name="refundCost" value="<%=(int) (ap.getPayCost() - (ap.getPayCost() * (ap.getFinishOrder() / (double) ap.getTotalOrder())))%>">
 			</td>
 		</tr>
 		<tr>
 			<td>포인트 사용 : </td>
 			<td><%=ap.getUsingPoint() %> point</td>
 		</tr>
 		<tr>
 			<td>진행회차 / 총회차 : </td>
 			<td><%=ap.getFinishOrder() %> / <%=ap.getTotalOrder() %> 회</td>
 		</tr>
 	</table>
 	<table id="payInfoT2">
 		<tr>
 			<td>환불예정 금액 : </td>
 			<td><%=(int) (ap.getPayCost() - (ap.getPayCost() * (ap.getFinishOrder() / (double) ap.getTotalOrder())))%> 원</td>
 		</tr>
 		<tr>
 			<td>환불예정 포인트 : </td>
 			<td><%= (int) (ap.getUsingPoint() - (ap.getUsingPoint() * (ap.getFinishOrder() / (double) ap.getTotalOrder())))%> point</td>
 		</tr>
 		<tr>
 			<td>환불 사유 : </td>
 			<td>
 				<select id="selectReason" name="selectReason">
 					<option>선택</option>
 					<option value="개인 사유">개인 사유</option>
 					<option value="신청 실수">신청 실수</option>
 					<option value="수업 불만족">수업 불만족</option>
 					<option value="수업 폐강">수업 폐강</option>
 					<option value="기타">기타</option>
 				</select>
 			</td>
 		</tr>
 	</table><br><br>
 	<div id="refundDetailDiv" style="text-align: center; display: none;">
	 	<textarea id="refundDetail" name="refundDetail" rows="7" cols="20" style="width: 40%; height: 80px; text-align: center; font-size: 17px;" placeholder="상세사유를 입력하세요 (선택)";></textarea>
	 	<div><span id="refundDetailCtn">0</span>/100</div>
 	</div>
 	
 
 	<hr style="width: 1024px; height: 1px; background: darkolivegreen; margin-top: 60px;">
 	
 	<div id="explainArea">(!) 개인적인 사유로 인한 환불 신청시 50%이상 75%미만 진행한 수업은 남은 금액의 50%를 환불 받을 수 있으며<br>
 							  75% 이상 진행된 수업에 대한 남은금액은 환불 받을 수 없습니다.</div>
 	
 	<div style="text-align: center; margin-top: 60px;">
 		<input type="reset" value="취소">&nbsp; &nbsp;<button type="button" onclick="go();">환불신청</button>
 	</div>
 </div>
 </form>
 	<br clear="both">
	<%@ include file="/views/common/footer.jsp" %>
<script>
	$(function(){
		
		$("#refundDetail").keyup(function(){
			var inputLength = $(this).val().length;
			$("#refundDetailCtn").html(inputLength);
			
			if(inputLength > 100) {
				$(this).val($(this).val().substring(0, 100));
			} else {
				$("#refundDetailCtn").html(inputLength);
			}
		});
	});
	
	function go() {
		var submit = confirm('정말로 환불신청 하시겠습니까?');
		
		if(submit == true) {
			goRefund.submit();
		}
	}
		
	$("#selectReason").change(function() {
		var state = $("#selectReason option:selected").val();
		
		if(state != null) {
			
			$("#refundDetailDiv").show();
		}else {
			$("#refundDetailDiv").hide();
		}
	});
</script>
</body>
</html>