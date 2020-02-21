<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 1024px;
		margin: 0 auto;
	}
	#subMenuArea {
		border-bottom: 1px solid black;
	}
	#subMenu {
		font-family: Do Hyeon;
		font-size: 22px;
	}
	#subMenu td {
		width: 130px;
		text-align: center;
	}
	#subMenu tr {
		height: 50px;
	}
	.subMenuTitle {
		cursor:pointer;
	}
</style>
</head>
<body>
<%@ include file="/views/common/myPage.jsp" %>	
	<section>
		<!-- 서브메뉴 영역 -->
		<div id="subMenuArea">
			<table id="subMenu">
				<tr>
					<td onclick="goRegisteredLesson();"><label class="subMenuTitle">수강한 수업</label></td>
					<td onclick="goLikedLesson();"><label class="subMenuTitle">찜한 수업</label></td>
					<td onclick="goRegisteredSuggestion();"><label class="subMenuTitle">등록한 건의</label></td>
					<td onclick="goLikedSuggestion();"><label class="subMenuTitle">찜한 건의</label></td>
					<td style="color:darkolivegreen;" onclick="goOpenedLesson();"><label>개설한 수업</label></td>
				</tr>
			</table>
		</div>
	</section>
	
	<script>
			function goRegisteredLesson() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/registeredLesson.jsp";
			}
			function goLikedLesson() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/likedLesson.jsp";
			}			
			function goRegisteredSuggestion() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/registeredSuggestion.jsp";
			}			
			function goLikedSuggestion() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/likedSuggestion.jsp";
			}
			function goOpenedLesson() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/openedLesson.jsp";
			}
	</script>
	

</body>
</html>