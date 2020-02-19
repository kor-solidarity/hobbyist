<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String successCode = (String) request.getAttribute("successCode"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<script>
		$(function() {
			var successCode = '<%=successCode%>';
			var alertMessage = "";
			var movePath = "";
			
			switch(successCode) {
				case "insertMember" :
					alertMessage = "회원 가입이 완료되었습니다.";
					movePath = "/hobbyist/views/member/loginForm.jsp";
					break;
			}
			
			alert(alertMessage);
			location.href = movePath;
		});
	</script>
</body>
</html>