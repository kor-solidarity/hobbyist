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
					alertMessage = "아티스트 등록이 완료되었습니다.\n아티스트 권한은 관리자 심사 후 부여됩니다. 권한부여 심사는 \n5영업일 이내에 완료됩니다.";
					movePath = "/hobbyist/views/artist/artistMain.jsp";
					break;
				case "insertPayment" :
					alertMessage = "결제완료 되었습니다.";
					movePath = "/hobbyist/index.jsp";
					break;
				case "insertCategory" :
					alertMessage = "관심 카테고리 설정이 완료되었습니다.";
					movePath = "/hobbyist/index.jsp";
					break;
				case "updateMember" :
					alertMessage = "회원 정보 수정이 완료되었습니다.";
					movePath = "/hobbyist/index.jsp";
					break;
				case "insertLesson" :
					alertMessage = "수업 개설 신청이 완료되었습니다.\n수업 개설 승인은 5영업일 이내에 완료됩니다"
					movePath = "/hobbyist/views/lesson/openLessonMain.jsp";
					break;
			}
			
			alert(alertMessage);
			location.href = movePath;
		});
	</script>
</body>
</html>