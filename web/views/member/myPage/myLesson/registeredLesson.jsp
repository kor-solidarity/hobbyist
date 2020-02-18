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
	}
	.profileImgArea {
		height: 50px;
	}
	.profileImg {
		width: 50px;
		height: 50px;
	}
	.nickName {
	
	}
	.name {
	
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
					<td style="color:darkolivegreen;">수강한 수업</td>
					<td>찜한 수업</td>
					<td>등록한 건의</td>
					<td>찜한 건의</td>
					<td>등록한 수업</td>
				</tr>
			</table>
		</div>
		<!-- 수업 목록 영역 -->
		<table class="lessonArea" align="center">
			<tr>
				<td>
					<div class="eachWrap">
						<table class="eachLesson" style="width:100%; height:100%;">
							<tr style="height:100%">
								<td style="width:27%;"><img class="lessonImg" src="<%= request.getContextPath() %>/static/upload/lesson/beauty/beauty02.jpg"></td>
								<td class="lessonText" style="width:63%;">
												<p>[1:1_청담샵 경력] #선.착.순.이.벤.트 #자존감이 두배 올라가는 메이크업 배우기!</p>
												<p>수업시작일 : 2020-02-03 19:00 / 당산</p>
												<p>결제일 : 2020-01-30 12:11:31</p> 
												<img class="refundImg" src="<%=request.getContextPath() %>/static/images/refund.png">
												<span class="refundMsg">환불신청</span>
								</td>
								<td class="profile" style="width:10%;">
									<div class="profileImgArea"><img class="profileImg" src="<%= request.getContextPath() %>/static/images/iu.jpg"></div>
									<div class="nickName">피치핑크</div>
									<div class="realName">아이유</div>									
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td><div></div></td>
			</tr>
			<tr>
				<td><div></div></td>
			</tr>
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