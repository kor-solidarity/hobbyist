<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dh.hobbyist.point.model.vo.Point"%>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<Point> pList = (ArrayList<Point>) request.getAttribute("pointList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eun-css.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	#payListDiv {
		width: 900px;
		height: 400px;
		text-align: center;
		margin: 0 auto;
		margin-bottom: 150px;
		overflow-x: hidden;
        overflow-y: auto;
	}
	
	#payListTable, #payListTable1 {
		width: 900px;;
		margin-top: 10px;
		line-height: 30px;
		text-align: center;
	}
	
	#paySubMenu {
		width: 1024px;
		font-family: Do Hyeon;
		font-size: 22px;
		margin-top:5px;
		margin: 0 auto;
	}
	#paySubMenu tr:nth-child(1) td {
		text-align: left;
		padding-top: 10px;
	}
	
	#payListTable1 {
		border: 1px solid darkolivegreen;
	}
</style>
</head>
<body>
	<%@include file="/views/common/myPage.jsp" %>
	<table id="paySubMenu">
			<tr>
				<td style="padding-left: 30px;"><label id="showPayList">결제 내역</label></td>
				<td><label id="showRefundList">환불 내역</label></td>
				<td><label id="showPointList" style="color:darkolivegreen;">포인트 사용 내역</label></td>
				<td style="width:470px;"></td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
		</table>
	<br clear="both">
	<div id="payListDiv">
		<table id="payListTable1">
			<tr>
				<th style="width: 300px;">적립날짜</th>
				<th style="width: 300px;">포인트</th>
				<th style="width: 300px;">적립구분</th>
			</tr>
		</table>
		<table id="payListTable">
			<% for(Point p : pList) { %>
			<tr>
				<td style="width: 300px;"><%=(p.getPointDate().toString()).substring(0, 16) %></td>
				<td style="width: 300px;"><%=p.getPoint() %> point</td>
			
				<%if(p.getType() == 1) {%>
				<td style="color: green; width: 300px;">적립</td>
				<%}else if(p.getType() == 2) {%>
				<td style="color: red; width: 300px;">사용</td>
				<%}else if(p.getType() == 3) {%>
				<td style="color: green; width: 300px;">반환</td>
				<%}else { %>
				<td style="color: red; width: 300px;">수거</td>
				<%} %>
			</tr>
			<% } %> 
		</table>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
	<script>
		$("#showPayList").click(function() {
			location.href = "<%=request.getContextPath()%>/paymentList.me";
		});
		
		$("#showRefundList").click(function() {
			location.href = "<%=request.getContextPath()%>/refundList.me";
		});
		
	</script>
</body>
</html>