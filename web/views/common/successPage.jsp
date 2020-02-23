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
				case "applyArtist" :
					alertMessage = "아티스트 등록이 완료되었습니다.\n아티스트 권한은 관리자 심사 후 부여됩니다. 권한부여 심사는 \n약 1~5일 이내에 완료됩니다.";
					movePath = "/hobbyist/views/artist/artistMain.jsp";
					break;
			}
			
			alert(alertMessage);
			location.href = movePath;
		});
	</script>
</body>
</html>