<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/common/boot4-script.jsp" %>
<%@ include file="/views/common/boot4.jsp" %>
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
 		background:black;
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
 	
 	th {
 		background: #4E4E4E;
 		color: white;
 		height: 35px;
 	}
 	
 	#infoArea td {
 		border: 1px solid black;
 		height: 45px;
 	}
 	
 	#modalT {
  		width: 465px;
 		
 	}
 	#modalT tr td:nth-child(1){
 		font-size: 20px;
 		font-weight: bold;
 		line-height: 40px;
 	}
 	
 	#modalReason {
 		height: 80px;
 		border: 1px solid lightgray;
 		overflow-x: hidden;
        overflow-y: auto;
 	}
 	
 	#refuseReason {
 		height: 80px;
 		border: 1px solid lightgray;
 		overflow-x: hidden;
        overflow-y: auto;
 	}
</style>
</head>

<body>
	<%@ include file="/views/common/adminMenubar.jsp" %>
	<section>
		<!-- 왼쪽 사이드바 메뉴  -->
		<article id="sideMenuBar">
		
			<!-- 큰 영역의 메뉴 -->
			<div id="bigMenu">
				<label style="font-weight: bold; font-size: 25px;">결제/환불</label>
				<hr style="width: 80%; color: #DED842; height: 1px; background: #DED842; margin-top: 17px;">
			</div>
			
			<!-- 큰 메뉴안의 상세 메뉴 여러개 -->
			<div id="smallMenu">
				<label style="color: #DED842;">내역 조회</label><br>
				<label>환불 신청</label><br>
				<label>금액 정산</label>
			</div>
		</article>
		
		<!-- 관리자 본문 들어갈 공간 -->
		<article id="contents">
		
			<!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
			<div id="searchDetailArea">
				
				<!-- 상세페이지, 정렬, 검색 테이블 -->
				<table id="searchT">
					<tr>
						<td style="text-align: left; vertical-align: bottom;">
							<label style="font-weight: bold; color: gray">결제 내역</label> &nbsp; &nbsp; 
							<label style="font-weight: bold; color: gray;">환불 내역</label> &nbsp; &nbsp; 
							<label style="font-weight: bold;">반려 내역</label>
						</td>
						<td style="padding-right: 20px;">
							<input style="text" id="searchMember"><button id="searchBtn">검색</button>
						</td>
					</tr>
					
				</table>
			</div>
			
			<!-- 본문 상단 줄 -->
			<hr id="firstLine">
			
			<!-- 정보 추가되는 본문 테이블 -->
			<div id="infoArea">
				<table style="width: 100%; border-collapse: collapse; text-align: center;">
					<!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
					<tr>
						<th style="width: 8%;">결제코드</th>
						<th style="width: 11%;">수업일정 코드</th>
						<th style="width: 11%;">아이디</th>
						<th style="width: 7%;">이름</th>
						<th style="width: 13%;">전화번호</th>
						<th style="width: 11%;">담당 아티스트</th>
						<th style="width: 11%;">환불 금액</th>
						<th style="width: 14%;">환불일</th>
						<th style="width: 17%;">환불계좌</th>
					</tr>
					<tr>
						<td style="width: 8%;">결제코드</td>
						<td style="width: 11%;">수업일정 코드</td>
						<td style="width: 11%;">아이디</td>
						<td style="width: 7%;">이름</td>
						<td style="width: 13%;">전화번호</td>
						<td style="width: 11%;">담당 아티스트</td>
						<td style="width: 11%;">환불 금액</td>
						<td style="width: 14%;">환불일</td>
						<td><button id="Btn">조회</button></td>
					</tr>
				</table>
			</div>
		</article>
	</section>
	
  	 <div class="modal fade" id="myModal" role="dialog">
   	 <div class="modal-dialog">
    
   	   <!-- Modal content-->
   	   <div class="modal-content">
   	     <div class="modal-header"  style="background: #4E4E4E ; color: white;">
   	       <h4 class="modal-title">신청내역 조회</h4>
   	       <button type="button" class="close" data-dismiss="modal" style="color: white;">×</button>
   	     </div>
   	     <div class="modal-body">
   	       <table id="modalT">
   	       		<tr>
   	       			<td>수업이름</td>
   	       			<td></td>
   	       		</tr>
   	       		<tr>
   	       			<td>가격</td>
   	       			<td></td>
   	       		</tr>
   	       		<tr>
   	       			<td>수업회차</td>
   	       			<td></td>
   	       		</tr>
   	       		<tr>
   	       			<td>진행회차</td>
   	       			<td></td>
   	       		</tr>
   	       		<tr>
   	       			<td>잔여회차</td>
   	       			<td></td>
   	       		</tr>
   	       		<tr>
   	       			<td>환불사유</td>
   	       			<td></td>
   	       		</tr>
   	       		<tr>
   	       			<td colspan="2">
   	       				<div id="modalReason">
   	       				</div>
   	       			</td>
   	       		</tr>
   	       		<tr>
   	       			<td>반려사유</td>
   	       			<td></td>
   	       		</tr>
   	       		<tr>
   	       			<td colspan="2">
   	       				<div id="refuseReason">
   	       				</div>
   	       			</td>
   	       		</tr>
   	       </table>
   	     </div>
   	     <div class="modal-footer">
   	       <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
   	     </div>
     		</div>
   	   
   		 </div>
  		</div>
  		
	<script>
		$(document).ready(function(){
		    $("#Btn").click(function(){
	   	    	 $("#myModal").modal();
		    });
		});
		
	</script>
</body>


</html>