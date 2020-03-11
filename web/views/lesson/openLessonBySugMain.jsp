<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dh.hobbyist.suggest.model.vo.Petition" %>
<%@ page import="com.dh.hobbyist.suggest.model.vo.Category" %>
<%@ page import="java.util.List" %>
<%
	int parentCategoryCode = (Integer) request.getAttribute("parentCategoryCode");
	Petition petition = (Petition) request.getAttribute("petition");
	//System.out.println("list : " + subCategoryList.size());
	
	//건의 최소, 최대 인원 출력을 위한 변수 설정
	int min = 0;
	String max = "";
	
	if(petition.getNumOfStudents().equals("일대일")) {
		min = 1;
		max = "1";
	} else if(petition.getNumOfStudents().equals("소규모")) {
		min = 2;
		max = "8";
	} else {
		min = 9;
		max = "9(+ α)";
	}
	
	//총 회차 출력을 위한 변수 설정
	int nol = petition.getNumOfLessons();
	String nolString = "";
	
	if(nol == 0) {
		nolString = "일회차";
	} else {
		nolString = "다회차";
	}
	
	//지역, 상세지역 출력을 위한 변수 설정
	int region = (Integer) request.getAttribute("region");
	String subRegion = (String) request.getAttribute("subRegion");
	
	//선호요일, 선호시간 출력을 위한 변수 설정
	String requestedDays = (String) request.getAttribute("requestedDays");
	String requestedTime = (String) request.getAttribute("requestedTime");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa120e8648138856b30621abf3ebb591&libraries=services"></script>
<title>hobbyist</title>
<style>
body {
	/* menubar와 "수업건의 게시판", "수업 개설" 글씨 크기 맞추기 */
	font-size: 16px;
}

#middle {
	height: 520px;
	top: 80px;
	background-image: url("/hobbyist/static/images/piano.png");
	background-size: 100% 100%;
	background-repeat: no-repeat;
}

#middleInfo {
	margin: auto;
	font-family: 'Do Hyeon', sans-serif;
	font-weight: lighter;
	font-size: 40px;
	color: white;
}

#middle-mid {
	height: 50%;
	width: 50%;
	vertical-align: auto;
	margin: auto;
}

#middleComment {
	color: white;
	text-shadow:1px 1px black;
}

#middleInfo td div {
	margin: auto;
	font-family: 'ZCOOL QingKe HuangYou', cursive;
	color: darkolivegreen;
	font-size: 50px;
	background-color: white;
	height: 60px;
	line-height: 60px;
	text-align: center;
	width: 200px;
}

#middleInfo button {
	height: 50px;
	width: 300px;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
	color: white;
	padding: 5px;
	border: 1px solid darkolivegreen;
	background-color: darkolivegreen;
}

#bottomInfo {
	width: 1024px;
	text-align: center;
	margin: auto;
	border-spacing: 15px;
	border-collapse: separate;
}

#bottomInfo #first {
	font-size: 25px;
	font-family: 'Do Hyeon', sans-serif;
	color: darkolivegreen;
}

#bottomInfo #second {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	color: #BE9524;
}

#bottomInfo #third {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	color: darkolivegreen;
}

#bottomInfo #fourth {
	font-size: 15px;
}

#LessonTable1 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
	width: 100%;
}

#LessonTable1  td {
	width: 20%;
	color: #A7A1A1;
}

#LessonTable1  td:first-child {
	color: darkolivegreen;
}

#LessonTable2 {
	color: darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 17px;
	border-spacing: 15px;
	border-collapse: separate;
	width: 100%;
	height: 400px;
}

#LessonTable2 td {
	display: table-cell;
	vertical-align: top;
}

#LessonTable2 button {
	background: darkolivegreen;
	color: white;
	padding: 5px;
	border: 1px solid darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
}

#myModalLabel {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

#LessonDiv3 {
	font-size: 30px;
	font-family: 'Do Hyeon', sans-serif;
	color: darkolivegreen;
}

#LessonTable3 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
	width: 100%;
}

.btnAll {
	font-family: 'Helvetica Neue', Hevetica, Arial, sans-serif;
	font-size : 12px;
}

#LessonTable3 td {
	width: 130px;
	color: #A7A1A1;
	width: 20%;
}

#LessonTable3 td:nth-child(2) {
	color: darkolivegreen;
}

#LessonTable4 {
	color: darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
	border-spacing: 30px;
	border-collapse: separate;
}

.item-certs {
    border-radius: 8px;
    background-color: lightgray;
    color: black;
    padding: 5px;
    font-size: 15px;
    margin-right: 15px;
}

.item-career {
    border-radius: 8px;
    background-color: lightgray;
    color: black;
    padding: 5px;
    font-size: 15px;
    margin-right: 15px;
}
.item2 {
	border-radius: 8px;
    background-color: darkolivegreen;
    width: 95%;
    color: white;
    padding: 5px;
    font-size: 15px;
    margin-bottom: 5px;
    margin-left: auto;
    margin-right: auto;
    text-align:center;
}

.item3 {
	border-radius: 8px;
    background-color: darkolivegreen;
    width: 85%;
    color: white;
    padding: 5px;
    font-size: 15px;
    margin-bottom: 5px;
    margin-left: auto;
    margin-right: auto;
}

#LessonTable5 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
	width: 100%;
}

#LessonTable5  td {
	width: 130px;
	color: #A7A1A1;
	width: 20%;
}

#LessonTable5  td:nth-child(3) {
	color: darkolivegreen;
}

#LessonTable6 {
	border-spacing: 15px;
	border-collapse: separate;
}

#LessonTable6 td {
	width: 30px;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

#LessonTable7 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
	width: 100%;
}

#LessonTable7  td {
	width: 130px;
	color: #A7A1A1;
	width: 20%;
}

#LessonTable7  td:nth-child(4) {
	color: darkolivegreen;
}

#LessonTable8 {
	/* border: 1px solid black; */
	border-spacing: 15px;
	border-collapse: separate;
}

#LessonTable8 td {
	width: 30px;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

#LessonTable9 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
	width: 100%;
}

#LessonTable9  td {
	width: 20%;
	color: #A7A1A1;
}

#LessonTable9  td:nth-child(5) {
	color: darkolivegreen;
}

#LessonTable10 {
	border-spacing: 15px;
	border-collapse: separate;
}

#LessonTable10 td {
 	font-family: 'Do Hyeon', sans-serif;
	font-size: 17px;
	padding: 3px;
}

#LessonTable11 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
	width: 100%;
}

#LessonTable11  td {
	width: 20%;
	color: #A7A1A1;
}

#LessonTable11  td:nth-child(5) {
	color: darkolivegreen;
}

#LessonTable12 {
	border-spacing: 15px;
	border-collapse: separate;
}

#LessonTable12 td {
 	font-family: 'Do Hyeon', sans-serif;
	font-size: 17px;
	padding: 5px;
}

.nanum {
	font-family: 'Nanum Gothic', sans-serif;
}

/* 카카오맵 관련 style */
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:264px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp"%>

	<table style="border:1px solid black;">
		<tr>
			<td colspan="2" rowspan="4">
			
			</td>
			<td>
			</td>
			<td>
			</td>
		</tr>
		<tr>
			
		</tr>	
	</table>
	<div id="middle">
		<table id="middleInfo">
			<tr>
				<td>&nbsp;
					<div>hobbyist</div>
				</td>
			</tr>
			<tr>
				<td id="middleComment">갖고계신 재능을 공유할<br>수업을 개설해주세요.
				</td>
			</tr>
			<tr>
				<td id="middleBtnArea" style="height: 400px;">
					<button type="button" class="btn btn-primary btn-lg"
						id="openModalBtn" style="margin-left:15px;">수업 개설하기</button>
				</td>
			</tr>
		</table>

	</div>
	<div id="bottom">
		
		<table id="bottomInfo">
			<tr>
				<td id="first" colspan="3">수업 개설 어떻게 진행되나요?</td>
			</tr>
			<tr>
				<td id="second" width="33%">STEP.01</td>
				<td id="second" width="33%">STEP.02</td>
				<td id="second">STEP.03</td>
			</tr>
			<tr>
				<td id="third">수업 기본정보 입력</td>
				<td id="third">아티스트 정보 확인</td>
				<td id="third">수업 소개 및 일정등록</td>
			</tr>
			<tr>
				<td id="fourth">카데고리, 수업제목, 인원, 수업료, 이미지 등을 등록합니다.</td>
				<td id="fourth">기존 등록하신 자격, 경력, 아티스트 소개를 확인하고 수업에 맞게 수정합니다.</td>
				<td id="fourth">수업 소개를 작성하시고, 원하시는 일정을 회차에 맞게 등록해주시면 신청이 완료됩니다.</td>
			</tr>
		</table>
	</div>

	<!-- modalBox 시작 부분 -->
	<div id="modalBox" class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width: 780px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">건의 받아 수업개설하기</h4>
				</div>
				<div class="modal-body">
					<form id="LessonForm"
						action="<%= request.getContextPath() %>/insert.le" method="post" encType="multipart/form-data">
						<div id="show1">
							<table id="LessonTable1">
								<tr>
									<td>01. 기본정보</td>
									<td>02. 자격/경력</td>
									<td>03. 아티스트소개</td>
									<td>04. 수업소개</td>
									<td>05. 일정등록</td>
								</tr>
							</table>
							<table id="LessonTable2">
								<tr>
									<td style="width: 33%">
										<input type="hidden" name="petitionCode" value=<%= petition.getPetitionCode() %>>
										<div>카데고리</div>
										<div>
											<select id="category" class="nanum" style="color:black;">
												<option value="">선택</option>
												<option id="c1" value="1">음악</option>
												<option id="c2" value="9">댄스</option>
												<option id="c3" value="15">영상/사진</option>
												<option id="c4" value="20">라이프스타일</option>
												<option id="c5" value="25">뷰티</option>
												<option id="c6" value="33">디자인</option>
												<option id="c7" value="37">스포츠</option>
											</select>
										</div>
										<script>
											$(function(){
												console.log("카데고리코드 : " + <%= petition.getCategoryCode() %>);
												
												//건의내용으로 카데고리 선택을 위한 처리
												if(<%= petition.getCategoryCode() %> < 9) {
													
												}
												switch(<%= parentCategoryCode %>) {
												case 1 : $("#c1").attr("selected", "true"); break;
												case 9 : $("#c2").attr("selected", "true"); break;
												case 15 : $("#c3").attr("selected", "true"); break;
												case 20 : $("#c4").attr("selected", "true"); break;
												case 25 : $("#c5").attr("selected", "true"); break;
												case 33 : $("#c6").attr("selected", "true"); break;
												case 37 : $("#c7").attr("selected", "true"); break;
												}
												
												//건의내용으로 서브카데고리 선택을 위한 처리
												var categoryName = <%= parentCategoryCode %>;
												var defaultCode = <%= petition.getCategoryCode() %>
												
												$.ajax({
													url: "/hobbyist/category.su",
													type: "get",
													data: {categoryName : categoryName},
													success: function(data) {
														
														$select = $("#subCategory");
														$select.find("option").remove();
														
														for(var i = 0; i < data.length; i++) {
															var $option = $("<option>");
															$option.val(data[i].categoryCode);
															$option.text(data[i].nodeName);
															
															if(data[i].categoryCode == defaultCode) {
																$option.attr("selected", true);
															}
															
															$select.append($option);
														}
														
													},
													error: function(error) {
														console.log(error);
													}
												});
												
											});
										</script>
									</td>
									<td colspan="2">
										<div>수업제목</div>
										<div>
											<textarea id="lessonTitle" name="lessonTitle" rows="2" cols="45" placeholder="[건의제목] <%= petition.getTitle() %>" 
												style="text-align: left; font-family: 'Nanum Gothic', sans-serif; font-size: 16px; resize:none;"></textarea>
										</div>
										<div align="right" style="margin-right:50px;"><span id="titleCounter">0</span><span>/55</span></div>
										<script>
											$(function(){
												$("#lessonTitle").keyup(function(){
													var inputLength = $(this).val().length;
													
													if(inputLength > 55) {
														$(this).val($(this).val().substring(0, 55));
													} else {														
														$("#titleCounter").html(inputLength);
													}
												})
											});
										</script>
									</td>
								</tr>
								<tr>
									<td>
										<div>상세 카테고리</div> 
										<select id="subCategory" class="nanum" name="subCategory" style="color: black;">
										</select>
										<script>
											$(function(){
												$("#category").change(function(){
													$("#subCategory").show();
													var categoryName = $("#category").val();
													
													$.ajax({
														url: "/hobbyist/category.su",
														type: "get",
														data: {categoryName : categoryName},
														success: function(data) {
															
															$select = $("#subCategory");
															$select.find("option").remove();
															
															for(var i = 0; i < data.length; i++) {
																var $option = $("<option>");
																$option.val(data[i].categoryCode);
																$option.text(data[i].nodeName);
																$select.append($option);
															}
															
														},
														error: function(error) {
															console.log(error);
														}
													});
												});
											});
										</script>
									</td>
									<td>
										<div>수업 최소인원</div> 
										<input id="min" class="nanum" name="min" type="number" style="width:115px" placeholder="[건의] <%= min %>">
										<label style="font-weight:normal; color:black;">&nbsp;명</label>
										<script>
											$(function() {
												$("#min").change(function() {
													var min = Number($(this).val());
													var max = Number($("#max").val());
													
													if (min < 0) {
														alert("음수는 입력하실 수 없습니다.");
														$(this).val("");
													} else if (max > 0 && min > max) {
														alert("최대인원은 최소인원보다 같거나 많아야 합니다.");
														$(this).val("");
													}
												});
											});
										</script>
									</td>
									<td>
										<div>수업 최대인원</div> 
										<input id="max" class="nanum" name="max" type="number" style="width:115px" placeholder="[건의] <%= max %>">
										<label style="font-weight:normal; color:black;">&nbsp;명</label>
										<script>
											$(function() {
												$("#max").change(function() {
													var max = Number($(this).val());
													
													if (max < 0) {
														alert("음수는 입력하실 수 없습니다.");
														$(this).val("");
													} 
												});
											});
										</script>
									</td>
								</tr>
								<tr>
									<td style="vertical-align: bottom;">이미지 업로드</td>
									<td>
										<div>총 회차</div> 
										<input id="inputOrder" class="nanum" name="inputOrder" type="number" style="width:115px" placeholder="[건의] <%= nolString %>">
										<label style="font-weight:normal; color:black;">&nbsp;회</label>
										<script>
											$(function() {
												$("#inputOrder").change(function() {
													var inputOrder = $(this).val();
													
													if (inputOrder <= 0) {
														alert("1회 이상을 입력해주세요");
													} 
												});
											});
										</script>
									</td>
									<td>
										<div>회차당 수업료<label style="font-weight:normal; color:#A7A1A1;">&nbsp;(최소 1만원 이상)</label></div> 
										<input id="cost" class="nanum" name="cost" type="number" style="width:130px" placeholder="[건의] <%= petition.getCost() %>">
										<label style="font-weight:normal; color:black;">&nbsp;원</label>
										<script>
											$(function() {
												$("#cost").change(function() {
													var cost = $(this).val();
													
													if (cost < 10000) {
														alert("회차당 수업료는 최소 10000원 이상이어야 합니다.");
														$(this).val("");
													} 
												});
											});
										</script>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<span id="contentImgArea3" style="margin:0 5px">
											<img id="contentImg3" width="120" height="80" src="<%= request.getContextPath() %>/static/images/iphoneCameraW.png">
										</span>
										<span id="contentImgArea4" style="margin:0 5px">
											<img id="contentImg4" width="120" height="80" src="<%= request.getContextPath() %>/static/images/iphoneCameraW.png">
										</span>
										<span id="contentImgArea1" style="margin:0 5px">
											<img id="contentImg1" width="120" height="80" src="<%= request.getContextPath() %>/static/images/iphoneCameraW.png">
										</span>
										<span id="contentImgArea2" style="margin:0 5px">
											<img id="contentImg2" width="120" height="80" src="<%= request.getContextPath() %>/static/images/iphoneCameraW.png">
										</span>
									</td>
								</tr>
								<tr>
									<td><div align="left" style="color:#A7A1A1; margin-left:39px;">대표사진<div style="margin-left:8px;">(필수)</div></div></td>
								</tr>
							</table>
							<div id="fileArea">
								<input type="file" id="lessonImg1" name="lessonImg1" onchange="loadImg(this, 1);">
								<input type="file" id="lessonImg2" name="lessonImg2" onchange="loadImg(this, 2);">
								<input type="file" id="lessonImg3" name="lessonImg3" onchange="loadImg(this, 3);">
								<input type="file" id="lessonImg4" name="lessonImg4" onchange="loadImg(this, 4);">
							</div>
							<!-- 이미지 전송을 위한 JavaScript -->
							<script>
								$(function() {
									$("#fileArea").hide();
									
									$("#contentImgArea1").click(function(){
										$("#lessonImg1").click();
									})
									$("#contentImgArea2").click(function(){
										$("#lessonImg2").click(); 
									})
									$("#contentImgArea3").click(function(){
										$("#lessonImg3").click();
									})
									$("#contentImgArea4").click(function(){
										$("#lessonImg4").click();
									})
								});
								
								function loadImg(value, num) {
									if(value.files && value.files[0]) {
										var reader = new FileReader();
										
										reader.onload = function(e) {
											console.log(e.target.result);
											
											switch(num) {
											case 1 : $("#contentImg1").attr("src", e.target.result); break;
											case 2 : $("#contentImg2").attr("src", e.target.result); break;
											case 3 : $("#contentImg3").attr("src", e.target.result); break;
											case 4 : $("#contentImg4").attr("src", e.target.result); break;
											}
										}
									}
									
									reader.readAsDataURL(value.files[0]);
								}
							</script>
						</div>
						<div id="show2" style="display: none;">
					
							<table id="LessonTable3">
								<tr>
									<td>01. 기본정보</td>
									<td>02. 자격/경력</td>
									<td>03. 아티스트소개</td>
									<td>04. 수업소개</td>
									<td>05. 일정등록</td>
								</tr>
							</table>
							<table id="LessonTable4">
		                        <tr height="20px">
		                            <td colspan="2" style="width:90%">
		                                <span style="color:black">보유한 자격</span>&nbsp;&nbsp;<span style="color:#A7A1A1">(해당 수업정보에 노출시킬 자격증 을 선택하세요)</span>
		                            </td>
		                            <td style="width:10%">
		                                <button type="button" class="btn btn-primary btnAll" onclick="certsAll();">전체선택</button>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td id="certsArea" colspan="3">
		                            </td>
		                        </tr>
		                        <tr height="20px">
		                            <td colspan="2">
		                                <span style="color:black">등록한 경력</span>&nbsp;&nbsp;<span style="color:#A7A1A1">(해당 수업정보에 노출시킬 기술을 선택하세요)</span>
		                            </td>
		                            <td>
		                                <button type="button" class="btn btn-primary btnAll" onclick="careerAll();">전체선택</button>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td id="careerArea" colspan="3">
		                            </td>
		                        </tr>
		                    </table>
						</div>
						<div id="show3" style="display: none;">
							<table id="LessonTable5">
								<tr>
									<td>01. 기본정보</td>
									<td>02. 자격/경력</td>
									<td>03. 아티스트소개</td>
									<td>04. 수업소개</td>
									<td>05. 일정등록</td>
								</tr>
							</table>
							<table id="LessonTable6">
								<tr>
		                            <td>
		                                <span style="color:black">아티스트소개</span>&nbsp;&nbsp;<span style="color:#A7A1A1">수정이 필요하면 수정해주세요</span>
		                            </td>
								</tr>
								<tr>
									<td>
										
										<textarea id="artIntro" name="artIntro" rows="4" cols="40"
												style="width: 600px; height: 250px; text-align: left; font-family: 'Nanum Gothic', sans-serif; font-size: 18px; color: rgb(49, 49, 49); 
												resize:none;"><%if(loginMember != null) {%><%= loginMember.getArtistIntro() %><% }%></textarea>
										<div><span id="artIntroCtn">0</span><span>/255</span></div>
										<script>
											$(function(){
												
												inputLength = $("#artIntro").val().length;
												
												$("#artIntroCtn").html(inputLength); 
												
												//글자수 제한 메소드
												$("#artIntro").keyup(function(){
													
													var inputLength = $(this).val().length;
													
													if(inputLength > 255) {
														$(this).val($(this).val().substring(0, 255));
													} else {														
														$("#artIntroCtn").html(inputLength);
													}
													
												});
											});
										</script>
									</td>
								</tr>
							</table>
						</div>
						<div id="show4" style="display: none;">
							<table id="LessonTable7">
								<tr>
									<td>01. 기본정보</td>
									<td>02. 자격/경력</td>
									<td>03. 아티스트소개</td>
									<td>04. 수업소개</td>
									<td>05. 일정등록</td>
								</tr>
							</table>
							<table id="LessonTable8">
								<tr>
		                            <td style="width:100%;">
		                                <span style="color:black">수업소개</span>&nbsp;&nbsp;<span style="color:#A7A1A1">수업에 대한 소개와 커리큘럼을 적어주세요</span>
		                            </td>
								</tr>
								<tr>
									<td>
										<textarea id="lessonIntro" name="lessonIntro" rows="5" cols="40"
												style="width: 600px; height: 300px; text-align: left; font-family: 'Nanum Gothic', sans-serif; font-size: 18px; 
												color: rgb(49, 49, 49); resize:none;"  placeholder="[건의내용] <%= petition.getContents() %>"></textarea>
										<div><span id="lessonIntroCtn">0</span>/400</div>
										<script>
											$(function(){
												$("#lessonIntro").keyup(function(){
													var inputLength = $(this).val().length;
													
													if(inputLength > 400) {
														$(this).val($(this).val().substring(0, 400));
													} else {
														$("#lessonIntroCtn").html(inputLength);
													}
												});
											});
										</script>
									</td>
								</tr>
							</table>
						</div>
						<div id="show5" style="display: none;">
							<table id="LessonTable9">
								<tr>
									<td>01. 기본정보</td>
									<td>02. 자격/경력</td>
									<td>03. 아티스트소개</td>
									<td>04. 수업소개</td>
									<td>05. 일정등록</td>
								</tr>
							</table>
							<table id="LessonTable10" style="width:100%; height:500px;">
								<tr>
									<td style="width: 80px;">지역</td>
									<td style="width: 135px;">상세지역</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<select id="region" class='nanum' name="region" onChange="regionChange(this.value, subRegion);" style="color: black;">
											<option value="">-선택-</option>
											<option value='1'>서울</option>
											<option value='2'>부산</option>
											<option value='3'>대구</option>
											<option value='4'>인천</option>
											<option value='5'>광주</option>
											<option value='6'>대전</option>
											<option value='7'>울산</option>
											<option value='261'>세종</option>
											<option value='8'>강원</option>
											<option value='9'>경기</option>
											<option value='10'>경남</option>
											<option value='11'>경북</option>
											<option value='12'>전남</option>
											<option value='13'>전북</option>
											<option value='14'>제주</option>
											<option value='15'>충남</option>
											<option value='16'>충북</option>
										</select>
									</td>
									<td>
										<select id="subRegion" class='nanum' name="subRegion" style="color: black;">
											<option><%= subRegion %></option>
										</select>
									</td>
									<script>
										$(function(){
											$("#region").find("option[value=<%= region %>]").prop("selected", true);
										});
									</script>
									<td></td>
								</tr>
								<tr>
									<td>상세주소</td>
									<td colspan="2"></td>
								</tr>
								<tr style="height: 300px;">
									<td colspan="3" style="border: 1px solid darkolivegreen; padding:0px;">
										<div class="map_wrap" style="height:100%">
											<div id="map" style="width:100%;height:300px;"></div>
											
											<div id="menu_wrap" class="bg_white">
												<div class="option">
													<div>
														<!-- form으로 전송할 경우 상위의 form이 전달되어 NumberFormatException 발생 -->
														<!-- <form onsubmit="searchPlaces(); return false;"> -->
															키워드 : <input type="text" id="keyword" size="15" placeholder="검색어">
															<button type="button" onclick="searchPlaces(); return false;">검색하기</button>
														<!-- </form> -->
													</div>
												</div>
												<hr>
												<ul id="placesList"></ul>
												<div id="pagination"></div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">
									전체 주소 입력 : <input id="address" type="text" class="nanum" name="address" placeholder="전체 주소를 복사 또는 직접 입력해주세요." style="width:600px">
									</td>
								</tr>
							</table>
						</div>
						<!-- 등록된 수업일정 목록 화면 -->
						<div id="show6" style="display: none;">
							<table id="LessonTable11">
								<tr>
									<td>01. 기본정보</td>
									<td>02. 자격/경력</td>
									<td>03. 아티스트소개</td>
									<td>04. 수업소개</td>
									<td>05. 일정등록</td>
								</tr>
							</table>
							<table id="LessonTable12" style="width:100%">
								<tr>
									<td style="width:275px;"><label class="currOrder">1</label>회차 시작시간</td>
									<td style="width:145px;"><label class="currOrder">1</label>회차 종료시간
									<button id="insertOrderBtn" type="button" class="btn btn-primary btnAll" style="padding: 5px 8px"onclick="insertOrder();">▼</button>
									</td>
									<td>등록된 회차목록 / 총 <label id="showOrder"></label>회차&nbsp;</td>
								</tr>
								<tr height="10px">
									<td style="vertical-align:top;"><input id="startTime" class="nanum" type="datetime-local"></td>
									<td style="vertical-align:top;"><input id="endTime" class="nanum" type="time"></td>
									<td id= "orderListArea" rowspan="2" colspan="2" style="height:270px; border: 1px solid darkolivegreen; padding:4px; vertical-align:top; font-size:15px"></td>
								</tr>
								<tr height="10px">
									<td colspan="2" style="color:grey; vertical-align:middle;">[건의] <%= petition.getRequestedDate().toString().substring(0, 10) %>까지 개설 희망<br>
										<label style="font-weight:normal; margin-left: 42px;">선호요일 : <%= requestedDays %> / 선호시간 : <%= requestedTime %></label>
									</td>
								</tr>
								<tr>
		                            <td colspan="3">등록된 수업일정 목록
		                            </td>
								</tr>
								<tr>
									<td colspan="3" id="scheduleListArea"></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="closeModalBtn">이전</button>
					<button type="button" class="btn btn-primary" id="nextModalBtn">다음</button>
					<button type="button" class="btn btn-primary" id="saveModalBtn"
						style="display: none;">저장</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 카카오맵 관련 처리 -->
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 기존 키워드로 장소를 검색합니다8
//searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

	
	<script>
		$(function(){
			var num = 1;
		
			//이 페이지에 도착하자마자 Popup을 띄운다
			<% if(request.getSession().getAttribute("loginMember")  == null ) { %>
			alert("로그인 후 진행해주세요.");
			<% } else if (((Member) (request.getSession().getAttribute("loginMember"))).getArtistAccepted() == null) { %>
			alert("아티스트 승인 이후에 가능합니다.")
			<% } else { %>
			$('#modalBox').modal('show');
			<% } %>
			
			// 모달 버튼에 이벤트를 건다.
			$('#openModalBtn').on('click', function() {
					
				<% if(request.getSession().getAttribute("loginMember")  == null ) { %>
				alert("로그인 후 진행해주세요.");
				<% } else if (((Member) (request.getSession().getAttribute("loginMember"))).getArtistAccepted() == null) { %>
				alert("아티스트 승인 이후에 가능합니다.")
				<% } else { %>
				$('#modalBox').modal('show');
				<% } %>
			});
			
			// 모달 안의 취소 버튼에 이벤트를 건다.
			$('#closeModalBtn').on('click', function() {
				/* $('#modalBox').modal('hide'); */
				if(num > 1) {
					$("#show"+ num).hide();
					console.log(num);
					num--;
					$("#show"+ num).show();
					console.log(num);
					
				}
				if(num < 6) {
					$("#nextModalBtn").show();
					$("#saveModalBtn").hide();
				}
			});
			
			//모든 회차를 입력했는지 확인하는 변수. 모든 회차를 입력하면 1로 변경되는 변수
			orderCheck = 0;
			
			// 모달 안의 다음 버튼에 이벤트를 건다.
			$('#nextModalBtn').on('click', function() {
				
				//"01. 기본정보" 항목
				var lessonTitle = document.getElementById("lessonTitle").value;
				var min = document.getElementById("min").value;
				var max = document.getElementById("max").value;
				var inputOrder = document.getElementById("inputOrder").value;
				var cost = document.getElementById("cost").value;
				var subCategory = document.getElementById("subCategory").value;
				var mainFile = $("#contentImg3").attr("src");
				var iphoneImg = "<%= request.getContextPath() %>/static/images/iphoneCameraW.png";
				//"03. 아티스트소개" 항목
				var artIntro = document.getElementById("artIntro").value;
				//"04. 수업소개" 항목
				var lessonIntro = document.getElementById("lessonIntro").value;
				//"05. 일정추가" 항목
				var reg = document.getElementById("region").value;
				var subReg = document.getElementById("subRegion").value;
				var addr = document.getElementById("address").value;
				
				

				//"01.기본정보"에서 모든 항목을 입력해야 다음으로 넘어갈 수 있는 메소드
				if(lessonTitle == "" || min == "" || max == "" || inputOrder == "" || cost == "" || subCategory == "" || mainFile == iphoneImg) {
					alert("모든 항목을 입력해주세요");
				} else if (max < min) {
					alert("최대인원은 최소인원보다 같거나 많아야 합니다.");
					$(this).val("");
				} else {
					
					if(num == 3 && artIntro == "") {
						alert("아티스트 소개를 입력해주세요");
					} else if (num == 4 && lessonIntro == "") {
						alert("수업소개를 입력해주세요");
					} else if (num == 5 && (reg == "" || subReg == "")) {
						alert("지역 카데고리를 설정해주세요");
					} else if (num == 5 && addr == "") {
						alert("상세주소를 입력해주세요");
					} else if (num == 6 && orderCheck == 0) {
						alert("모든 회차 일정을 입력해주세요");
					} else {
						$("#show"+ num).hide();
						console.log(num);
						num++;
						$("#show"+ num).show();
						console.log(num);
					}
				}
				
				
				//"02. 자격/경력" 페이지로 가기 위한 "다음" 버튼 클릭 시
				if(num == 2) {
					//아티스트 자격 조회
					$.ajax({
						url: "/hobbyist/selectCerts.ar",
						type: "get",
						success: function(data) {
							
							$certsArea = $("#certsArea");
							$certsArea.find("span").remove();
							$certsArea.find("input").remove();
							
							for(var i = 0; i < data.length; i++) {
								var certName = decodeURIComponent(data[i].certName);
								
								$certsArea.append("<span class='item-certs' data-clicks='false'>" + certName + "</span>");
								$certsArea.append("<input type='hidden' class='item-certs-input' data-clicks='false' value='" + data[i].certCode + "'>");
							}
						},
						error: function(error) {
							console.log("error 진입");
							console.log(error);
						}
					});
					
					//아티스트 경력 조회
					$.ajax({
						url: "/hobbyist/selectCareer.ar",
						type: "get",
						success: function(data) {
							
							$careerArea = $("#careerArea");
							$careerArea.find("span").remove();
							$careerArea.find("input").remove();
							
							for(var i = 0; i < data.length; i++) {
								var orgName = decodeURIComponent(data[i].orgName);
								var rank = decodeURIComponent(data[i].rank);
								var term = decodeURIComponent(data[i].occupationTerm);
								
								$careerArea.append("<span class='item-career' data-clicks='false'>" + orgName + " / " + rank + " / " + term + "</span>");
								$careerArea.append("<input type='hidden' class='item-career-input' data-clicks='false' value='" + data[i].recCode + "'>")
							}
						},
						error: function(error) {
							console.log(error);
						}
						
					});
				}
				
				if(num == 5) {
					//카카오맵 크기 재설정
					map.relayout(); 
					
					//"01기본정보" 화면에서 사용자가 입력한 총 회차
					var inputOrder = $("#inputOrder").val();
						
					//"05일정등록" 화면에서 보여지는 총 회차
					var showOrder = $("#showOrder");
					showOrder.text(inputOrder);
				}
				
				
				if(num == 6) {
					$("#nextModalBtn").hide();
					$("#saveModalBtn").show();
				} 
	
			});
			// 모달 안의 저장 버튼에 전송 기능을 건다.
			$('#saveModalBtn').on('click', function() {
				$("#LessonForm").submit();
			});
			
			//보유한 자격 클릭할 때마다 번갈아가며 css 다르게 적용하는 함수
			$(document).on("click", '.item-certs', function(){
					var clicks = $(this).data('clicks');
					
					if(clicks) {
						$(this).css({'background':'lightgrey', 'color':'black'});
						$(this).next().removeAttr('name');
					} else {
						$(this).css({'background':'darkolivegreen', 'color':'white'});
						$(this).next().attr('name', 'selectedCerts');
					}
					
					$(this).data("clicks", !clicks);
			});
			
			//등록한 경력 클릭할 때마다 번갈아가며 css 다르게 적용하는 함수
			$(document).on("click", '.item-career', function(){
					var clicks = $(this).data('clicks');
					
					if(clicks) {
						$(this).css({'background':'lightgrey', 'color':'black'});
						$(this).next().removeAttr('name');
					} else {
						$(this).css({'background':'darkolivegreen', 'color':'white'});
						$(this).next().attr('name', 'selectedCareer');
					}
					
					$(this).data("clicks", !clicks);
			});
			
		});		
		
		//보유한 자격 '전체선택' 버튼
		function certsAll() {
			var clicks = $(this).data('clicks');
			
			if(clicks) {
				$("#certsArea").find('span').css({'background':'lightgrey', "color":'black'});
				$('.item-certs-input').removeAttr('name');
			} else {
				$("#certsArea").find('span').css({'background':'darkolivegreen', 'color':'white'});
				$('.item-certs-input').attr('name', 'selectedCerts');
			}
			
			$(this).data("clicks", !clicks);
		}
		
		//등록한 경력 '전체선택' 버튼
		function careerAll() {
			var clicks = $(this).data('clicks');
			
			if(clicks) {
				$("#careerArea").find('span').css({'background':'lightgrey', 'color':'black'});
				$('.item-career-input').removeAttr('name');
			} else {
				$("#careerArea").find('span').css({'background':'darkolivegreen', 'color':'white'});
				$('.item-career-input').attr('name', 'selectedCareer');
			}
			
			$(this).data("clicks", !clicks);
		}
	
		//지역 시군구 선택 메소드
		var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,261);
		var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북','세종');

		var cat2_num = new Array();
		var cat2_name = new Array();
		 
		cat2_num[1] = new Array(17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
				29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41);
		cat2_name[1] = new Array('강남구', '강동구', '강북구', '강서구', '관악구', '광진구',
				'구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구',
				'서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구',
				'중구', '중랑구');

		cat2_num[2] = new Array(42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
				54, 55, 56, 57);
		cat2_name[2] = new Array('강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구',
				'사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구', '기장군');

		cat2_num[3] = new Array(58, 59, 60, 61, 62, 63, 64, 65);
		cat2_name[3] = new Array('남구', '달서구', '동구', '북구', '서구', '수성구', '중구',
				'달성군');

		cat2_num[4] = new Array(66, 67, 68, 69, 70, 71, 72, 73, 74, 75);
		cat2_name[4] = new Array('계양구', '남구', '남동구', '동구', '부평구', '서구', '연수구',
				'중구', '강화군', '옹진군');

		cat2_num[5] = new Array(76, 77, 78, 79, 80);
		cat2_name[5] = new Array('광산구', '남구', '동구', '북구', '서구');

		cat2_num[6] = new Array(81, 82, 83, 84, 85);
		cat2_name[6] = new Array('대덕구', '동구', '서구', '유성구', '중구');

		cat2_num[7] = new Array(86, 87, 88, 89, 90);
		cat2_name[7] = new Array('남구', '동구', '북구', '중구', '울주군');

		cat2_num[8] = new Array(91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101,
				102, 103, 104, 105, 106, 107, 108);
		cat2_name[8] = new Array('강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시',
				'태백시', '고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군',
				'홍천군', '화천군', '횡성군');

		cat2_num[9] = new Array(109, 110, 111, 112, 113, 114, 115, 116, 117,
				118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129,
				130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141,
				142, 143, 144, 145, 146, 147, 148);
		cat2_name[9] = new Array('고양시 덕양구', '고양시 일산구', '과천시', '광명시', '광주시',
				'구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시 소사구', '부천시 오정구',
				'부천시 원미구', '성남시 분당구', '성남시 수정구', '성남시 중원구', '수원시 권선구',
				'수원시 장안구', '수원시 팔달구', '시흥시', '안산시 단원구', '안산시 상록구', '안성시',
				'안양시 동안구', '안양시 만안구', '오산시', '용인시', '의왕시', '의정부시', '이천시',
				'파주시', '평택시', '하남시', '화성시', '가평군', '양주군', '양평군', '여주군', '연천군',
				'포천군');

		cat2_num[10] = new Array(149, 150, 151, 152, 153, 154, 155, 156, 157,
				158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168);
		cat2_name[10] = new Array('거제시', '김해시', '마산시', '밀양시', '사천시', '양산시',
				'진주시', '진해시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군',
				'창녕군', '하동군', '함안군', '함양군', '합천군');

		cat2_num[11] = new Array(169, 170, 171, 172, 173, 174, 175, 176, 177,
				178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189,
				190, 191, 192);
		cat2_name[11] = new Array('경산시', '경주시', '구미시', '김천시', '문경시', '상주시',
				'안동시', '영주시', '영천시', '포항시 남구', '포항시 북구', '고령군', '군위군', '봉화군',
				'성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군',
				'칠곡군');

		cat2_num[12] = new Array(193, 194, 195, 196, 197, 198, 199, 200, 201,
				202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214);
		cat2_name[12] = new Array('광양시', '나주시', '목포시', '순천시', '여수시', '강진군',
				'고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군',
				'완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군');

		cat2_num[13] = new Array(215, 216, 217, 218, 219, 220, 221, 222, 223,
				224, 225, 226, 227, 228, 229);
		cat2_name[13] = new Array('군산시', '김제시', '남원시', '익산시', '전주시 덕진구',
				'전주시 완산구', '정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군',
				'장수군', '진안군');

		cat2_num[14] = new Array(230, 231, 232, 233);
		cat2_name[14] = new Array('서귀포시', '제주시', '남제주군', '북제주군');

		cat2_num[15] = new Array(234, 235, 236, 237, 238, 239, 240, 241, 242,
				243, 244, 245, 246, 247, 248);
		cat2_name[15] = new Array('공주시', '논산시', '보령시', '서산시', '아산시', '천안시',
				'금산군', '당진군', '부여군', '서천군', '연기군', '예산군', '청양군', '태안군', '홍성군');

		cat2_num[16] = new Array(249, 250, 251, 252, 253, 254, 255, 256, 257,
				258, 259, 260);
		cat2_name[16] = new Array('제천시', '청주시 상당구', '청주시 흥덕구', '충주시', '괴산군',
				'단양군', '보은군', '영동군', '옥천군', '음성군', '진천군', '청원군');
		
		//지역 select를 선택했을 경우 상세지역 처리
		function regionChange(key, sel) {
			if(key=='') return;
			
			var name = cat2_name[key];
			var val = cat2_num[key];
			
			for(i = sel.length - 1; i >= 0; i--) {
				sel.options[i] = null;
			}
			
			//세종시를 선택할 경우 subRegion 선택 못하도록 return
			if(key=='261') {
				$("#subRegion").hide();
				return;
			}
			
			sel.options[0] = new Option('-선택-', '', '', 'true');
			
			for(i = 0; i < name.length; i++) {
				sel.options[i+1] = new Option(name[i], name[i]);
			}
		}
		
		//n회차 수를 나타내는 변수. insertOrder() 안에서는 계속 +되어야 하여 전역변수로 바깥에 선언.
		orderNum = 1;
		
		//수업 회차 등록 메소드
		function insertOrder() {
			//"01기본정보" 화면에서 사용자가 입력한 총 회차
			var inputOrder = $("#inputOrder").val();
				
			//"05일정등록" 화면에서 보여지는 총 회차
			var showOrder = $("#showOrder");
			showOrder.text(inputOrder);
			
			//"05일정등록" 화면에서 현재입력 회차
			var currOrder = $(".currOrder");
			
			startTime = $("#startTime").val();
			endTime = $("#endTime").val();
			
			//사용자에게 입력받은 날짜값을 Date 형식으로 변환
			var st = startTime.split(/[-T:]/);
			var sd = new Date(st[0], st[1]-1, st[2], st[3], st[4]);
			var sl = sd.getTime();
			
			var et = endTime.split(/[:]/);
			var ed = new Date(st[0], st[1]-1, st[2], et[0], et[1]);
			var el = ed.getTime();
			
			var insertOrderBtn = document.getElementById('insertOrderBtn');
			
			if(startTime == "" || endTime == "") {
				alert("시간을 모두 입력해주세요");
			} else {
				if(orderNum < inputOrder) {
					$orderListArea = $("#orderListArea");
					$orderListArea.append("<div id='order" + orderNum + "' class='item2'>" + orderNum + "회차 | " + startTime.substring(2, 10) + " | " + startTime.substring(11, 16) + "~" + endTime + "</div>");
					$orderListArea.append("<input type='hidden' name='start" + orderNum + "' value='" + sl + "'>");
					$orderListArea.append("<input type='hidden' name='end" + orderNum + "' value='" + el + "'>");
					orderNum++;
				} else {
					$orderListArea = $("#orderListArea");
					$orderListArea.append("<div id='order" + orderNum + "' class='item2'>" + orderNum + "회차 | " + startTime.substring(2, 10) + " | " + startTime.substring(11, 16) + "~" + endTime + "</div>");
					$orderListArea.append("<input type='hidden' name='start" + orderNum + "' value='" + sl + "'>");
					$orderListArea.append("<input type='hidden' name='end" + orderNum + "' value='" + el + "'>");
					alert("모든 회차를 입력하셨습니다");
					orderCheck = 1;
					insertOrderBtn.disabled = 'disabled';
					
					var order1 = $("#order1").text();
					var regionVal = Number($("#region").val()) - 1;
					var subRegion = $("#subRegion").val();
					
					console.log("regionVal : " + regionVal);
					console.log("cat1_name[regionVal] : " + cat1_name[regionVal]);
					
					var region = cat1_name[regionVal];
					
					$scheduleListArea = $("#scheduleListArea");
					//이전 버튼을 눌렀다 다음을 누렀을 때 remove를 하지 않으면 수얼 일정 추가에 대한 힌트를 얻을 수도 있다.
					$scheduleListArea.find("span").remove();
					
					//추가로 넣은 세종시 처리를 별도로 해주기 위한 조건문
					if(regionVal < 16) {
						$scheduleListArea.append("<span class='item2'>" + region + " " + subRegion + " | " + order1 + "</span>");
					} else {
						$scheduleListArea.append("<span class='item2'> 세종 " + subRegion + " | " + order1 + "</span>");
					}

					//console.log("orderNum : " + orderNum);
					//console.log("startTime : " + startTime);
					//console.log("endTime : " + endTime);
				} 
			}
			
			currOrder.text(orderNum);
		};
		
	</script>
	
	<!-- 하단 회색 영역 -->
	<div style="height:30px;"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>