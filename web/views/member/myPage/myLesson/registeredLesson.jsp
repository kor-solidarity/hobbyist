<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.MyRegiLesson" %>
<% 
	ArrayList<MyRegiLesson> myList = (ArrayList) request.getAttribute("myList");

	System.out.println("regiList : " + myList.size());
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
		height: 30px;
		widht: 30px;
		margin-top: 5px;
		/* display:table-cell;
		vertical-align:middle; */
	}
	.refundMsg {
		font-family: Do Hyeon;
		font-size: 20px;
		color:#DAB554;
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
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/registeredLesson.jsp";
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
												<p>수업시작일 : 2020-02-03 19:00 / 당산</p>
												<p>결제일 : 2020-01-30 12:11:31</p> 
												<img class="refundImg" src="<%=request.getContextPath() %>/static/images/refund.png">
												<span class="refundMsg">환불신청</span>
								</td>
								<td class="profile" style="width:15%; padding:0;">
									<div align="center"><img class="profileImg" src="<%= request.getContextPath() %>/static/images/iu.jpg"></div>
									<table class="profileTable">
										<tr>
											<td>
												<div class="nickName">피치핑크</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="realName">아이유</div>
											</td>
										</tr>
									</table>							
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<% } %>
			<%-- <tr>
				<td>
					<div class="eachWrap">
						<table class="eachLesson" style="width:100%; height:100%;">
							<tr style="height:100%">
								<td style="width:27%;"><img class="lessonImg" src="<%= request.getContextPath() %>/static/upload/lesson/beauty/beauty02.jpg"></td>
								<td class="lessonText" style="width:58%;">
												<p>[1:1_청담샵 경력] #선.착.순.이.벤.트 #자존감이 두배 올라가는 메이크업 배우기!</p>
												<p>수업시작일 : 2020-02-03 19:00 / 당산</p>
												<p>결제일 : 2020-01-30 12:11:31</p> 
												<img class="refundImg" src="<%=request.getContextPath() %>/static/images/refund.png">
												<span class="refundMsg">환불신청</span>
								</td>
								<td class="profile" style="width:15%; padding:0;">
									<div align="center"><img class="profileImg" src="<%= request.getContextPath() %>/static/images/iu.jpg"></div>
									<table class="profileTable">
										<tr>
											<td>
												<div class="nickName">피치핑크</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="realName">아이유</div>
											</td>
										</tr>
									</table>							
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="eachWrap">
						<table class="eachLesson" style="width:100%; height:100%;">
							<tr style="height:100%">
								<td style="width:27%;"><img class="lessonImg" src="<%= request.getContextPath() %>/static/upload/lesson/beauty/beauty02.jpg"></td>
								<td class="lessonText" style="width:58%;">
												<p>[1:1_청담샵 경력] #선.착.순.이.벤.트 #자존감이 두배 올라가는 메이크업 배우기!</p>
												<p>수업시작일 : 2020-02-03 19:00 / 당산</p>
												<p>결제일 : 2020-01-30 12:11:31</p> 
												<img class="refundImg" src="<%=request.getContextPath() %>/static/images/refund.png">
												<span class="refundMsg">환불신청</span>
								</td>
								<td class="profile" style="width:15%; padding:0;">
									<div align="center"><img class="profileImg" src="<%= request.getContextPath() %>/static/images/iu.jpg"></div>
									<table class="profileTable">
										<tr>
											<td>
												<div class="nickName">피치핑크</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="realName">아이유</div>
											</td>
										</tr>
									</table>							
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr> --%>
		</table>
		<!-- 페이징 처리 -->
		<div class="pagingArea" align="center">
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
		</div>
	</section>
</body>
</html>