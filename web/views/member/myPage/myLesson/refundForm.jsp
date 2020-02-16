<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#refundArea {
		width: 1024px;
		margin: 0 auto;
	}
	
	#payInfoT {
		width: 50%;
	}
</style>
</head>
<body>
 <%@ include file="/views/common/menubar.jsp" %>
 <hr style="width: 1024px; height: 1px; background: darkolivegreen;">
 
 <div id="refundArea">
 	<table id="payInfoT">
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
 </div>
 
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>