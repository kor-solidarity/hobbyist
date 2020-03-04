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
	margin-top: 50px;
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
				<label>내역조회</label><br> <label>환불신청</label><br> <label
					style="color: #DED842;">금액정산</label>
			</div>
		</article>

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
			<div id="infoArea">
				<table id="calPayTab">
					<!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
					<tr>
						<th style="width: 130px;">수업회차코드</th>
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
					</tr>
					<%  int index = 0;
						for(PaySettlement ps : payList) { %>
						<tr>
							<td><%=ps.getLessonOrderCode() %></td>
							<td><%=ps.getLessonOrderTime() %></td>
							<td><%=ps.getMemberId() %></td>
							<td><%=ps.getMemberName() %></td>
							<td><%=ps.getCostPerOrder() %></td>
							<td><%=ps.getListeners() %></td>
							<td><%=ps.getTotalCost() %></td>
							<td><%=ps.getSettleFee() %>%</td>
							<td><%=ps.getTotalPayGiven() %></td>
							<td>
								<%
								index++;
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
									<label class="modalLab" style="color:dimgrey">확인 대기중</label>
								<%} else { %>
									<label class="modalLab" style="color:red">이의 제기</label>
								<%} %>
							</td>
						</tr>
					
					<%} %>
				</table>
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
					<h4 class="modal-title"style="color:white; font-family: Do Hyeon;">이의제기 조회</h4>
				</div>
				<div class="modal-body">
					<table style="margin:auto; border-spacing:15px; border-collapse:separate;">
						<tr>
							<td colspan="3">[2주 과정]내 손으로 만드는 커피 에스프레소, 라떼아트 (수업코드 1159)</td>
						</tr>
						<tr>
							<td>금액(인당) : 20000원</td>
							<td></td>
							<td>총액 : 100000원</td>
						</tr>
						<tr>
							<td>수수료 : 10%</td>
							<td></td>
							<td>계좌번호 : 우리 김설현 1002834795530</td>
						</tr>
						<tr>
							<td style="font-size:17px; font-weight:bold;">총 지급액 : 90000원</td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<div id="artistResponse">
						<table style="border-spacing:10px; border-collapse:separate; width:100%;">
							<tr>
								<td style="font-weight:bold; color:#4E4E4E;">김설현</td>
								<td style="text-align:right;">2020-01-23</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2" style="font-size:15px;">수강학생이 6명이었는데 총액이 120000원 아닌가요?</td>
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
										<table>
											<tr>
												<td style="font-weight:bold; color:#4E4E4E;">관리자1</td>
												<td style="text-align:right;">2020-01-23</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td colspan="2" style="font-size:15px; width:600px;"><textarea id="adminText" placeholder="답변할 내용을 적어주세요."></textarea></td>
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
				</div>
				<div class="modal-footer" style="text-align:center;">
					<button type="button" id="adminResponse" class="btn btn-primary" style="background-color:#4E4E4E; width:150px;">답변하기</button>
					<button type="button" id="adminSend" class="btn btn-primary" style="background-color:#4E4E4E; display:none;">보내기</button>
				</div>
			</div>

		</div>
	</div>
	<script>
	$(document).ready(function(){
    	$(".modalLab").click(function(){
        	$("#myModal").modal();
    	});
	});
	</script>


</body>
</html>