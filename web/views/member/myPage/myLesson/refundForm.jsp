<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								<td style="width:27%;"><img class="lessonImg" src="<%= request.getContextPath() %>/static/upload/lesson/beauty/beauty02.jpg"></td>
								<td class="lessonText" style="width:50%;">
												<p style="font-weight: bold;">[1:1_청담샵 경력] #선.착.순.이.벤.트 #자존감이 두배 올라가는 메이크업 배우기!</p><br>
												<p>수업시작일 : 2020-02-03 19:00 / 당산</p>
												<p>결제일 : 2020-01-30 12:11:31</p> 
								</td>
								<td class="profile" style="width:15%; padding:0;">
									<div align="center"><img class="profileImg" src="<%= request.getContextPath() %>/static/images/iu.jpg"></div>
									<table class="profileTable">
										<tr>
											<td>
												<div class="nickName">피치핑크</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="realName">아이유</div>
											</td>
										</tr>
									</table>							
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
 
 <form name="goRefund" action="/hobbyist/index.jsp" method="post" style="margin-bottom: 200px;">
 <div id="refundArea">
 	<table id="payInfoT1">
 		<tr>
 			<td>결제 금액 : </td>
 			<td>원</td>
 		</tr>
 		<tr>
 			<td>포인트 사용 : </td>
 			<td> point</td>
 		</tr>
 		<tr>
 			<td>진행회차 / 총회차 : </td>
 			<td> / 회</td>
 		</tr>
 	</table>
 	<table id="payInfoT2">
 		<tr>
 			<td>환불예정 금액 : </td><td>원</td>
 		</tr>
 		<tr>
 			<td>환불예정 포인트 : </td><td>point</td>
 		</tr>
 		<tr>
 			<td>환불 사유 : </td>
 			<td>
 				<select>
 					<option value="me">개인 사유</option>
 					<option value="artist">신청 실수</option>
 					<option value="artist">수업 불만족</option>
 					<option value="artist">수업 폐강</option>
 				</select>
 			</td>
 		</tr>
 	</table><br><br>
 	<div style="text-align: center;">
 		<label style="font-weight: bold; font-size: 17px;">상세 사유</label><br>
	 	<textarea id="refundDetail" rows="7" cols="20" style="width: 40%; height: 80px; text-align: center; font-size: 17px;" placeholder="상세사유를 입력하세요 (선택)";></textarea>
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
			alert("환불신청이 완료되었습니다.");
			goRefund.submit();
		}
	}
</script>
</body>
</html>