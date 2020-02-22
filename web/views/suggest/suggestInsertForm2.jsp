<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String detailCategory = (String) request.getParameter("detailCategory");
	String maxNum = (String) request.getParameter("maxNum");
	String classPay = (String) request.getParameter("classPay");
	String classTimes = (String) request.getParameter("classTimes");
	String area1 = (String) request.getParameter("area1");
	String area2 = (String) request.getParameter("area2");
	String wantDate = (String) request.getParameter("wantDate");
	String day = (String) request.getParameter("day");
	String time = (String) request.getParameter("time");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#suggestDiv1 {
	margin-top: 10px;
	margin: auto;
	/* height: 250px; */
	width: 1024px;
	background-image: url("/hobbyist/static/images/suggestback.png");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	}
	#label1 {
	font-family: 'Do Hyeon', sans-serif;
	color: darkolivegreen;
	font-size: 30px;
	}
	#suggestDiv3 {
	width: 1000px;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
	}
	#suggestInsertTab2 {
	font-family: 'Do Hyeon', sans-serif;
	color:darkolivegreen;
	margin:auto;
	margin-top:30px;
	}
	#suggestBtns {
	text-align:center;
	}
	#suggestBtns button {
	height:30px;
	width:70px;
	}
	#suggestCompleteBtn {
	background: darkolivegreen;
	color: white;
	padding: 5px;
	border: 1px solid darkolivegreen;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>hobbyist</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="suggestDiv1">
		<table>
			<tr style="height: 150px;">
				<td></td>
			</tr>
			<tr>
				<td><label id="label1">지금 하비스트와 함께<br>시작해보세요
				</label></td>
			</tr>
		</table>
	</div>
	<div id="suggestDiv3">
		<form id="sugInsert2" action="<%=request.getContextPath()%>/insert.sg" method="post">
			<div>
				<% if(loginMember != null) { %>
					<input type="hidden" name="loginMemberCode" value="<%=loginMember.getMemberCode()%>">
				<% } %>
				<input type="hidden" name="detailCategory" value="<%=detailCategory%>">
				<input type="hidden" name="maxNum" value="<%=maxNum%>">
				<input type="hidden" name="classPay" value="<%=classPay%>">
				<input type="hidden" name="classTimes" value="<%=classTimes%>">
				<input type="hidden" name="area1" value="<%=area1%>">
				<input type="hidden" name="area2" value="<%=area2%>">
				<input type="hidden" name="wantDate" value="<%=wantDate%>">
				<input type="hidden" name="day" value="<%=day%>">
				<input type="hidden" name="time" value="<%=time%>">
			</div>
			<table id="suggestInsertTab2">
				<tr>
					<td style="font-size:22px;">수업건의하기</td>
					<td style="font-size:16px; text-align:right;">건의할 수업의 내용을 작성해주세요</td>
				</tr>
				<tr>
					<td colspan="2"><hr style="border: solid 1.5px darkolivegreen;"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="sugTitle" placeholder="제목을 입력해주세요" style="width:600px; height:20px;">
					</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="sugContent" rows="5" cols="40" style="width:598px; height:450px; resize:none;" placeholder="내용을 입력해주세요 (200자 이상)"></textarea>
					</td>
				</tr>
			</table>
		</form>
		<br>
		<div id="suggestBtns">
			<button>취소</button> &nbsp;&nbsp; <button id="suggestCompleteBtn">글쓰기</button>
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
	
	<script>
		$("#suggestCompleteBtn").click(function(){
			$("#sugInsert2").submit();
		});
	</script>
</body>
</html>