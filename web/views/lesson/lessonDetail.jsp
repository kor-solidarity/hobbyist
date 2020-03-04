<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.Image" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.Lesson" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.LessonSchedule" %>
<%
	Image pImg = (Image) request.getAttribute("profileImg");
	Lesson lesson = (Lesson) request.getAttribute("lesson");
	String lessonIntro = lesson.getLessonIntro();
	Member artist = (Member) request.getAttribute("artist");
	ArrayList sList = (ArrayList) request.getAttribute("scheduleList");
	
	
	System.out.println("ArrayList : " + sList.get(0));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<style>
	section {
		width: 100%;
		margin-top: 12px;
		background-color:  #E2E2E2;
	
	}
	
	#wrapTable {
		margin: 0 auto 12px auto;
		border-collapse: separate;
		border-spacing: 25px 0px;
		/* border-left: 2px dashed darkolivegreen;
		border-right: 2px dashed darkolivegreen; */
		background-color: white;
	}

	#firstTable {
		/* border: 1px solid black; */
		margin: 0px auto 0px auto;
		font-family: 'Do Hyeon', sans-serif;
		font-size: 22px;
	}
	
	#firstTable td {
		/* border: 1px solid black; */
	}
	
	#secondTable {
		margin: 0px auto 24px auto;
		font-family: 'Do Hyeon', sans-serif;
		font-size: 22px;
		width: 1024px;
	}
	
	#secondTable td {
		/* border: 1px solid black; */
	}

	/* carousel 관련 CSS 시작 */	 
	.container {
		width: 638px;
		height: 460px;
	}
	
	.slide {
		width: 608px;
	}

	.carousel-inner {
		width: 608px;
	}

	.carousel-inner > .item > img,
	.carousel-inner > .item > a > img {
    	/* width: 70%; */
    	width: 608px;
		height: 400px;
    	margin: auto;
	}
	
	.active {
		width: 608px;
	}
	
	.left {
		z-index: 15;
	}
	
	.right {
		z-index: 15;
	}
	/* carousel 관련 CSS 끝 */
	
	/* 최소최대 수강학생 인원 */
	.stNum {
		background-color: #DAB554;
		border-radius: 90px;
		padding: 10px;
		color: white;
	}
	
	#mapImg {
		width: 50px;
		height: 50px;
	}
	
	#detailMenu {
		border-collapse: separate;
		border-spacing: 25px 0px;
		font-size: 27px;
		color: darkolivegreen;
	}
	
	#detailMenu td {
		text-align: center;
	}
	
	#detailMenu span {
		margin-left: 10px;
		cursor: pointer;
	}
	
	#scheduleSelect {
		height: 30px;
		font-family: 'Helvetica Neue', Hevetica, Arial, sans-serif; 
		font-size:20px;
	}
	
	.profileImgArea {
		text-align: center;
		width: 150px;
	}
	
	#profileImg {
		height: 130px;
		width: 130px;
		border-radius: 90px;
	}
	
	#nickname {
		font-size: 27px;
		color: darkolivegreen;
		text-align: center;
	}
	
	#detailTitle {
		height: 100px;
		vertical-align: bottom;
		font-size: 35px;
		color: darkolivegreen;
	}
	
	#registerBtn {
		width: 150px;
		border: 1.5px solid darkolivegreen;
		border-radius: 10px;
		font-size: 27px;
		color: darkolivegreen;
	}
	
	#heartImg {
		width: 40px;
		hegith: 40px;
	}
	
	#reportImg {
		width: 35px;
		hegith: 35px;	
	}
	
	#suggestTable {
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	#suggestTable td {
		padding: 10px 20px;
		background-color: #E2E2E2;
	}
	
	.nanum {
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<%@ include file="../common/categorybar.jsp" %>

<section>
	<!-- 수업 상테 테이블 위의 회색 영역 -->
	<div style="width:100%; height:25px; background-color:#E2E2E2;"></div>		
	
	<!-- 수업 상세 상단 테이블 -->
	<table id="wrapTable">
		<tr>
			<td>

				<table id="firstTable">
					<tr style="height:15%;">
						<td id="carouselTd" colspan="2" rowspan="4">
						
							<!-- carousel 영역 -->
							<div class="container">
							  <br>
							  <div id="myCarousel" class="carousel slide" data-ride="carousel">
							    <!-- Indicators -->
							    <ol class="carousel-indicators">
							      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							      <li data-target="#myCarousel" data-slide-to="1"></li>
							      <li data-target="#myCarousel" data-slide-to="2"></li>
							      <li data-target="#myCarousel" data-slide-to="3"></li>
							    </ol>
							
							    <!-- Wrapper for slides -->
							    <div class="carousel-inner" role="listbox">
							
							      <div class="item active">
							        <img src="<%=request.getContextPath() %>/static/images/beauty02.jpg" alt="Chania" width="460" height="345">
							        <!-- <div class="carousel-caption">
							          <h3>Chania</h3>
							          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
							        </div> -->
							      </div>
							
							      <div class="item">
							        <img src="<%=request.getContextPath() %>/static/images/beauty03.PNG" alt="Chania" width="460" height="345">
							      </div>
							    
							      <div class="item">
							        <img src="<%=request.getContextPath() %>/static/images/beauty04.PNG" alt="Flower" width="460" height="345">
							      </div>
							
							      <div class="item">
							        <img src="<%=request.getContextPath() %>/static/images/beauty05.PNG" alt="Flower" width="460" height="345">
							      </div>
							  
							    </div>
							
							    <!-- Left and right controls -->
							    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							      <span class="sr-only">Previous</span>
							    </a>
							    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							      <span class="sr-only">Next</span>
							    </a>
							  </div>
							</div>
							<!-- carousle 영영 끝 -->
							
						</td>
						<td style="width:193px;"><span class="stNum">최소 <%= lesson.getMinStudents() %>명</span></td>
						<td style="width:193px;"><span class="stNum">최대 <%= lesson.getMaxStudents() %>명</span></td>
					</tr>
					<tr style="height:45%;">
						<td colspan="2" id="scheduleArea">
							<% for(int i = 0; i < sList.size(); i++) { %>
							<div>
							<img src="<%= request.getContextPath() %>/static/images/map.png" id="mapImg">
							<%= ((LessonSchedule) sList.get(i)).getRegion() %> | 
							</div>
							<% } %>
							<%-- <div><img src="<%= request.getContextPath() %>/static/images/map.png" id="mapImg">강남 | 1회차 | 02.03(월) 19:00-21:00▼</div>
							<div><img src="<%= request.getContextPath() %>/static/images/map.png" id="mapImg">강남 | 1회차 | 02.10(월) 19:00-21:00▼</div>
							<div><img src="<%= request.getContextPath() %>/static/images/map.png" id="mapImg">강남 | 1회차 | 02.17(월) 19:00-21:00▼</div> --%>			
						</td>
					</tr>
					<tr style="height:20%;">
						<td colspan="2" style="text-align:center;">+ 추가 일정 보기</td>
					</tr>
					<tr style="height:20%; text-align:center;">
						<td colspan="2" style="vertical-align:bottom;">원하시는 수업일정을 선택해주세요</td>
					</tr>
				</table>
						
						</td>
					<tr>
					<tr>
						<td>
				
				<!-- 수업 상세 하단 테이블 -->
				<table id="secondTable">
					<tr>
						<td colspan="2">
							<table id="detailMenu">
								<tr>
									<td><span id="dMenu1">아티스트</span></td>
									<td><span id="dMenu2">수업소개</span></td>
									<td><span id="dMenu3">리뷰</span></td>
									<td><span id="dMenu4">문의</span></td>
								</tr>
								<script>
									$(function(){
										//처음 로딩 시에는 수업소개는 숨기기
										$("#lessonIntroArea").hide();
										
										$("#dMenu1").click(function(){
											$("#detailTitle").text("아티스트 소개");
											$("#certsCareer").show();
											$("#artistIntroArea").show();
											$("#lessonIntroArea").hide();
										});
																				
										$("#dMenu2").click(function(){
											$("#detailTitle").text("수업 소개");
											/* $("#certsCareer").text(""); */
											$("#certsCareer").hide();
											$("#artistIntroArea").hide();
											$("#lessonIntroArea").show();
										});
									});
								</script>
							</table>
						</td>
						<td></td>
						<td colspan="2" style="width:37.5%; text-align:center;">
							<select id="scheduleSelect" >
								<option>수업 일정 선택</option>
								<% for(int i = 0; i < sList.size(); i++) { %>
								<option value="<%= ((LessonSchedule) sList.get(i)).getScheduleCode() %>">
								<%= ((LessonSchedule) sList.get(i)).getRegion() %> |
								</option>
								<% } %>
								
								<!-- <option>강남 | 1회차 | 02.03(월) 19:00-21:00</option>
								<option>강남 | 1회차 | 02.10(월) 19:00-21:00</option>
								<option>강남 | 1회차 | 02.17(월) 19:00-21:00</option> -->
							</select>
						</td>
					</tr>
					<tr>
						<td class="nanum" colspan="2" style="font-weight:bold;">
							<div style="margin: 15px 0px;"><%= lesson.getLessonName() %></div>
						</td>
						<td></td>
						<td colspan="2" style="text-align:center;"><button id="registerBtn" type="button" onclick="openLesson();">수업 신청</button></td>
						<script>
							function openLesson() {
								console.log("$('#scheduleSelect').val() : " + $("#scheduleSelect").val());
								location.href = "<%= request.getContextPath() %>/readyToInsert.pa?scheduleCode=" + $("#scheduleSelect").val();
							}
						</script>
					<tr>
						<td id="profileImgArea" rowspan="3">
							<img src="<%= pImg.getImageRoute() %>/<%= pImg.getImageName() %>" id="profileImg">	
						</td>
						<td style="width:380px; color:darkolivegreen;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;★★★★☆ <label style="color:black; font-weight:normal;">(3)</label></td>
						<td></td>
						<td colspan="2" style="text-align:right;">
							<label id="perCost" style="font-weight: normal; color: grey;"></label><label style="font-weight: normal; color: grey;">원 / 회</label><br>
							<label id="totalCosts" style="font-weight: normal;"></label>원 / 총 <%= lesson.getTotalOrders() %>회
						</td>
						<script>
							//천 단위 , 표시 위한 메소드
							$(function(){
								var per = <%= lesson.getCostPerOrder() %>;
								var perM = per.toLocaleString();								
								
								var total = <%= lesson.getTotalCosts() %>;
								var totalM = total.toLocaleString();
								
								$("#perCost").text(perM);
								$("#totalCosts").text(totalM);
							});
						</script>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td colspan="2" style="text-align:right;">
							<img id="heartImg" src="<%= request.getContextPath() %>/static/images/emptyheart.png">&nbsp;수업 찜하기
						</td>
					</tr>
					<tr>
						<td id="nickname"><%= artist.getArtistNick() %></td>
						<td></td>
						<td></td>
						<td colspan="2" style="text-align:right;">
							<img id="reportImg" src="<%= request.getContextPath() %>/static/images/report.jpg">&nbsp;신고하기
						</td>
					</tr>
					<tr>
						<td style="text-align:center;"><%= artist.getMemberName() %></td>
						<td></td>
						<td></td>
						<td rowspan="4" colspan="2">
							<% if(lesson.getPetitionCode() != 0) { %>
							<table id="suggestTable" align="center">
								<tr>
									<td style="color:#DAB554">건의된 학생 정원</td>
									<td class="nanum" style="width:130px; font-size:20px;">2~4명</td>
								</tr>
								<tr>
									<td style="color:#DAB554">건의된 수업 비용</td>
									<td class="nanum" style="font-size:20px;">30,000원</td>
								</tr>
								<tr>
									<td style="color:#DAB554">건의된 수업 장소</td>
									<td class="nanum" style="font-size:20px;">강남</td>
								</tr>
								<tr>
									<td style="color:#DAB554">건의된 수업 요일</td>
									<td class="nanum" style="font-size:20px;">주말</td>
								</tr>
								<tr>
									<td style="color:#DAB554">건의된 수업 시간</td>
									<td class="nanum" style="font-size:20px;">오후</td>
								</tr>
								<tr>
									<td style="color:#DAB554">건의된 수업 회차</td>
									<td class="nanum" style="font-size:20px;">1회</td>
								</tr>
								
							</table>
							<div align="center">건의 게시물 바로가기</div>
							<% } %>
						</td>
					</tr>
					<tr>
						<td id="detailTitle" colspan="2"><br>아티스트 소개</td>
						<td></td>
					</tr>
					<tr>
						<td id="certsCareer" colspan="2"><br>
							[자격 & 경력 사항]<br>
							커피 바리스타 자격증 1급 보유<br>
							스타벅스 매니저 3년 2개월 경력
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="nanum" colspan="2" style="width:50%; font-size:20px;"><br>
						<label id="artistIntroArea" style="font-weight: normal;"><%= lesson.getArtistIntro() %></label>
						<label id="lessonIntroArea" style="font-weight: normal;"><%= lesson.getLessonIntro() %></label>
						</td>
						<td></td>
						<!-- <td colspan="2" style="text-align:center; vertical-align:top;">건의 게시물 바로가기</td> -->
					</tr>
				</table>

			</td>
		</tr>
	</table>
	
	<div style="width:100%; height:25px; background-color:#E2E2E2;"></div>	
	
</section>

<%@ include file="../common/footer.jsp" %>

</body>
</html>











