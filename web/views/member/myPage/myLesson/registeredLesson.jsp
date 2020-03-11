<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.MyRegiLesson" %>
<% 
	ArrayList<MyRegiLesson> myList = (ArrayList) request.getAttribute("myList");

	//System.out.println("refundCode : " + ((MyRegiLesson) myList.get(0)).getRefundCode());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hobbyist</title>
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
	.Center_button1 {
		color:darkolivegreen;
	}
	.lessonArea {
		margin-top: 10px;
	}
	.lessonArea tr {
		height: 160px;
	}
	.lessonArea td {
		width: 900px;
		/* background: grey; */
		/* padding: 5px 10px; */
	}
	.eachWrap {
		width: 800px;
		height: 140px;
		background: #EDEDED;
		margin: auto;
	}
	.eachLesson td:first-of-type {
		/* background: black; */
	}
	.eachLesson td {
		padding: 10px 15px;
	}
	.lessonImg {
		height: 120px;
		width: 210px;
	}
	p {
		margin: 0;
		font-size: 14px;
	}
	.refundImg {
		height: 26px;
		widht: 26px;
		margin-top: 5px;
		cursor:pointer;
		/* display:table-cell;
		vertical-align:middle; */
	}
	.refundBtn {
		font-family: Do Hyeon;
		font-size: 18px;
		color:#DAB554;
		//cursor:pointer;
		/* line-height: 30px; */
	}
	.lessonText {
		
	}
	.profile {
		width: 50px;
		padding: 0;
	}
	.profileTable {
		height: 30%;
	}
	/* .profileTable tr:first-of-type {
		width: 100%;
		height: 70%;
	} */
	.profileTable tr:nth-of-type(1) {
		width: 100%;
		height: 15%;
	}
	.profileTable tr:nth-of-type(2) {
		width: 100%;
		height: 15%;
	}
	.profileTable td {
		padding: 0;
	}
	.profileImgArea {
		height: 50px;
	}
	.profileImg {
		width: 80px;
		height: 80px;
		border-radius: 50px;
		align: center;
	}
	.nickName {
		font-size: 20px;
		font-weight: bold;
		color:darkolivegreen;
		text-align: center;
	}
	.realName {
		font-size: 14px;
		text-align: center;
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
					<td style="color:darkolivegreen;"><label>수강한 수업</label></td>
					<td onclick="goLikedLesson();"><label class="subMenuTitle">찜한 수업</label></td>
					<td onclick="goRegisteredSuggestion();"><label class="subMenuTitle">등록한 건의</label></td>
					<td onclick="goLikedSuggestion();"><label class="subMenuTitle">찜한 건의</label></td>
					<td onclick="goOpenedLesson();"><label class="subMenuTitle">개설한 수업</label></td>
				</tr>
			</table>
		</div>
		<script>
			function goRegisteredLesson() {
				location.href = "<%=request.getContextPath()%>/selectMyRegi.le";
			}
			function goLikedLesson() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/likedLesson.jsp";
			}			
			function goRegisteredSuggestion() {
				location.href = "<%=request.getContextPath()%>/selectMyList.sg";
			}			
			function goLikedSuggestion() {
				location.href = "<%=request.getContextPath()%>/selectMyWishList.sg";
			}
			function goOpenedLesson() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/openedLesson.jsp";
			}
		</script>
		
		<!-- 수업 목록 영역 -->
		<table class="lessonArea" align="center">
			<% for(int i = 0; i < myList.size(); i++) { %>
			
			<tr>
				<td>
					<div class="eachWrap">
						<table class="eachLesson" style="width:100%; height:100%;">
							<tr style="height:100%">
								<td style="width:27%;"><img class="lessonImg" src="<%= request.getContextPath() %>/<%= ((MyRegiLesson) myList.get(i)).getLessonImgRoute() %>/<%= ((MyRegiLesson) myList.get(i)).getLessonImgName() %>"></td>
								<td class="lessonText" style="width:58%;">
												<p><%= ((MyRegiLesson) myList.get(i)).getLessonName() %></p>
												<p>수업시작일 : <%= (((MyRegiLesson) myList.get(i)).getStartDate().toString()).substring(0, 16) %> / <%= ((MyRegiLesson) myList.get(i)).getRegion() %></p>
												<p>결제일 : <%= (((MyRegiLesson) myList.get(i)).getPaymentDate().toString()).substring(0, 16) %></p> 
												<% if(((MyRegiLesson) myList.get(i)).getRefundCode() == 0) { %>
												<img class="refundImg" src="<%= request.getContextPath() %>/static/images/refund.png" onclick="refund(<%= ((MyRegiLesson) myList.get(i)).getScheduleCode() %>);"
													style="vertical-align:bottom;">
												<label class="refundBtn" onclick="refund(<%= ((MyRegiLesson) myList.get(i)).getPaymentCode() %>);" style="cursor:pointer;">환불신청</label>
												<% } else if (((MyRegiLesson) myList.get(i)).getRefundAccepted() == 0){ %>
												<label class="refundBtn" style="color:darkolivegreen">환불 대기중</label>
												<% } else if (((MyRegiLesson) myList.get(i)).getRefundAccepted() == 1) { %>
												<label class="refundBtn" style="color:dimgrey">환불 완료</label>
												<% } else { %>
												<img class="refundImg" src="<%= request.getContextPath() %>/static/images/refund.png" onclick="refund(<%= ((MyRegiLesson) myList.get(i)).getScheduleCode() %>);"
													style="vertical-align:bottom;">
												<label class="refundBtn" onclick="refund(<%= ((MyRegiLesson) myList.get(i)).getPaymentCode() %>);" style="cursor:pointer;">환불신청</label>
												<% } %>
								</td>
								<td class="profile" style="width:15%; padding:0;">
									<div align="center"><img class="profileImg" src="<%= ((MyRegiLesson) myList.get(i)).getProfileImgRoute() %>/<%= ((MyRegiLesson) myList.get(i)).getProfileImgName() %>"></div>
									<table class="profileTable">
										<tr>
											<td>
												<div class="nickName"><%= ((MyRegiLesson) myList.get(i)).getArtistNick() %></div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="realName"><%= ((MyRegiLesson) myList.get(i)).getArtistName() %></div>
											</td>
										</tr>
									</table>							
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			
			<%
			}
			%>
		</table>
		<script>
			function refund(paymentCode){
				location.href = "<%= request.getContextPath() %>/applyRefund.me?paymentCode=" + paymentCode;
			}
		</script>
		
		<!-- 페이징 처리 -->
		<div class="pagingArea" align="center">
			<!-- <button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button> -->
		</div>
	</section>
	
<%@ include file="/views/common/footer.jsp" %>

</body>
</html>