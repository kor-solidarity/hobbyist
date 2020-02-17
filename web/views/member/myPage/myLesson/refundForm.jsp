<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	input[type=submit] {
		background: darkolivegreen;
		color: white;
		font-size: 25px;
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
 
 <div id="lessonInfo">
 
 </div>
 
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
 			<td>
 				<select>
 					<option value="me">개인 사유</option>
 					<option value="artist">아티스트 불량</option>
 				</select>
 			</td>
 		</tr>
 		<tr>
 			<td><button type="button">계좌인증</button></td>
 		</tr>
 	</table>
 	
 	<br clear="both">
 
 	<hr style="width: 1024px; height: 1px; background: darkolivegreen; margin-top: 60px;">
 	
 	<div id="explainArea">(!) 개인적인 사유로 인한 환불 신청시 50%이상 75%미만 진행한 수업은 남은 금액의 50%를 환불 받을 수 있으며<br>
 							  75% 이상 진행된 수업에 대한 남은금액은 환불 받을 수 없습니다.</div>
 	
 	<div style="text-align: center; margin-top: 60px;">
 		<input type="reset" value="취소">&nbsp; &nbsp;<input type="submit" value="환불신청">
 	</div>
 </div>
 
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>