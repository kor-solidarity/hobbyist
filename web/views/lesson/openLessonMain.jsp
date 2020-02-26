<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>Insert title here</title>
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

.item {
    border-radius: 8px;
    background-color: lightgray;
    color: black;
    padding: 5px;
    font-size: 15px;
    margin-right: 15px;
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
	padding: 5px;
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
						id="openModalBtn" style="margin-left:15px; /* border: 1px solid white; */">수업 개설하기</button>
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
					<h4 class="modal-title" id="myModalLabel">수업개설하기</h4>
				</div>
				<div class="modal-body">
					<form id="LessonForm"
						action="<%= request.getContextPath() %>/insert.ar" method="post">
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
										<div>카데고리</div>
										<div>
											<select id="category" class="nanum" style="color:black;">
												<option>선택</option>
												<option value="1">음악</option>
												<option value="9">댄스</option>
												<option value="15">영상/사진</option>
												<option value="20">라이프스타일</option>
												<option value="25">뷰티</option>
												<option value="33">디자인</option>
												<option value="37">스포츠</option>
											</select>
										</div>
									</td>
									<td colspan="2">
										<div>수업제목</div>
										<div>
											<textarea id="lessonTitle" name="lessonTitle" rows="2" cols="45" placeholder="수업제목을 입력하세요" 
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
										<select id="subCategory" class="nanum" style="color: black;"></select>
										<script>
											$(function(){
												$("#category").change(function(){
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
										<input id="min" class="nanum" name="min" type="number" style="width:100px">
										<label style="font-weight:normal; color:black;">&nbsp;명</label>
										<script>
											$(function() {
												$("#min").change(function() {
													var min = $(this).val();
													if (min < 0) {
														alert("음수는 입력하실 수 없습니다.");
													}
												});
											});
										</script>
									</td>
									<td>
										<div>수업 최대인원</div> 
										<input id="max" class="nanum" name="max" type="number" style="width:100px">
										<label style="font-weight:normal; color:black;">&nbsp;명</label>
										<script>
											$(function() {
												$("#max").change(function() {
													var max = $(this).val();
													var min = $("#min").val();
													
													if (max < 0) {
														alert("음수는 입력하실 수 없습니다.");
													} else if (max < min) {
														alert("최대인원은 최소인원보다 같거나 많아야 합니다.")
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
										<input id="rounds" class="nanum" name="rounds" type="number" style="width:100px">
										<label style="font-weight:normal; color:black;">&nbsp;회</label>
										<script>
											$(function() {
												$("#rounds").change(function() {
													var rounds = $(this).val();
													
													if (rounds <= 0) {
														alert("1회 이상을 입력해주세요");
													} 
												});
											});
										</script>
									</td>
									<td>
										<div>회차당 비용</div> 
										<input id="cost" class="nanum" name="rounds" type="number" style="width:100px">
										<label style="font-weight:normal; color:black;">&nbsp;원</label>
										<script>
											$(function() {
												$("#cost").change(function() {
													var cost = $(this).val();
													
													if (cost <= 0) {
														alert("양수를 입력해주세요");
													} 
												});
											});
										</script>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<span id="contentImgArea1" style="margin:0 5px">
											<img id="contentImg1" width="120" height="80" src="<%= request.getContextPath() %>/static/images/iphoneCameraW.png">
										</span>
										<span id="contentImgArea2" style="margin:0 5px">
											<img id="contentImg2" width="120" height="80" src="<%= request.getContextPath() %>/static/images/iphoneCameraW.png">
										</span>
										<span id="contentImgArea3" style="margin:0 5px">
											<img id="contentImg3" width="120" height="80" src="<%= request.getContextPath() %>/static/images/iphoneCameraW.png">
										</span>
										<span id="contentImgArea4" style="margin:0 5px">
											<img id="contentImg4" width="120" height="80" src="<%= request.getContextPath() %>/static/images/iphoneCameraW.png">
										</span>
									</td>
								</tr>
							</table>
							<div id="fileArea">
								<input type="file" id="lessonImg1" name="lessonImg1" onchange="loadImg(this, 1);">
								<input type="file" id="lessonImg2" name="lessonImg2" onchange="loadImg(this, 2);">
								<input type="file" id="lessonImg3" name="lessonImg3" onchange="loadImg(this, 3);">
								<input type="file" id="lessonImg4" name="lessonImg4" onchange="loadImg(this, 4);">
							</div>
							<script>
								$(function() {
									$("#fileArea").hide();
									
									$("#contentImgArea1").click(function(){
										/* console.log("click이 작동하는지 여부"); */
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
										<textarea id="artIntro" name="artIntro" rows="5" cols="40"
												style="width: 600px; height: 300px; text-align: left; font-family: 'Nanum Gothic', sans-serif; font-size: 18px; color: rgb(49, 49, 49); resize:none;"></textarea>
										<div><span id="artIntroCtn">0</span><span>/400</span></div>
										<script>
											$(function(){
												$("#artIntro").keyup(function(){
													var inputLength = $(this).val().length;
													
													if(inputLength > 400) {
														$(this).val($(this).val().substring(0, 400));
													} else {														
														$("#artIntroCtn").html(inputLength);
													}
													
												})
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
												color: rgb(49, 49, 49); resize:none;"></textarea>
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
							<table id="LessonTable10" style="width:100%; height:450px;">
								<tr>
									<td style="width:67%">
										<table style="height:100%">
											<tr>
												<td style="width:25%;">지역</td>
												<td style="width:25%;">상세지역</td>
												<td style="width:25%;">N회차 시작시간</td>
												<td style="width:25%;">N회차 종료시간</td>
											</tr>
											<tr>
												<td>
													<select name="subCategory" style="color:black;">
														<option value="music">서울</option>
														<option>댄스</option>
														<option>영상/사진</option>
														<option>라이프스타일</option>
														<option>뷰티</option>
														<option>디자인</option>
														<option>스포츠</option>
													</select>
												</td>
												<td>
													<select name="subCategory" style="color:black;">
														<option value="music">강남</option>
														<option>댄스</option>
														<option>영상/사진</option>
														<option>라이프스타일</option>
														<option>뷰티</option>
														<option>디자인</option>
														<option>스포츠</option>
													</select>
												</td>
												<td>
													<select name="subCategory" style="color:black;">
														<option value="music">15:00</option>
														<option>댄스</option>
														<option>영상/사진</option>
														<option>라이프스타일</option>
														<option>뷰티</option>
														<option>디자인</option>
														<option>스포츠</option>
													</select>
												</td>
												<td>
													<select name="subCategory" style="color:black;">
														<option value="music">20:00</option>
														<option>댄스</option>
														<option>영상/사진</option>
														<option>라이프스타일</option>
														<option>뷰티</option>
														<option>디자인</option>
														<option>스포츠</option>
													</select>
												</td>
											</tr>
											<tr>
												<td colspan="2">상세주소</td>
												<td colspan="2">N회차 일자 / 총 4회차</td>
											</tr>
											<tr style="height:65%;">
												<td colspan="2" style="border:1px solid black;"></td>
												<td colspan="2" style="border:1px solid black;"></td>
											</tr>
											<tr style="height:15%;">
												<td colspan="2" style="border:1px solid black;">강남구 테헤란로 14길 남도빌딩 5F</td>
												<td colspan="2"></td>
											</tr>
										</table>
									</td>
									<td style="width:33%;">
										<table style="height:100%; width:100%;">
											<tr style="height: 25%;"></tr>
											<tr style="border:1px solid black;">
												<td style="width: 100%;">
													
												</td>
											</tr>
										</table>
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
							<table id="LessonTable12">
								<tr>
		                            <td style="width:100%;">
		                            </td>
								</tr>
								<tr>
									<td>
										<span class="item">강남 | 1회차 | 02.03(월)19:00-21:00</span>
									</td>
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
	<script>
		$(function(){
			var num = 1;
		
			// 모달 버튼에 이벤트를 건다.
			$('#openModalBtn').on('click', function() {
				
				<% if(request.getSession().getAttribute("loginMember")  == null ) { %>
				alert("로그인 후 진행해주세요.");
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
			
			// 모달 안의 다음 버튼에 이벤트를 건다.
			$('#nextModalBtn').on('click', function() {

				$("#show"+ num).hide();
				console.log(num);
				num++;
				$("#show"+ num).show();
				console.log(num);
				
				//"02. 자격/경력" 페이지로 가기 위한 "다음" 버튼 클릭 시
				if(num == 2) {
					//console.log("num == 2 일때 진입");
					
					//아티스트 자격 조회
					$.ajax({
						url: "/hobbyist/selectCerts.ar",
						type: "get",
						success: function(data) {
							
							$certsArea = $("#certsArea");
							$certsArea.find("span").remove();
							
							for(var i = 0; i < data.length; i++) {
								var certName = decodeURIComponent(data[i].certName);
								
								$certsArea.append("<span class='item' value='" + data[i].certCode + "'>" + certName + "</span>");
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
							
							for(var i = 0; i < data.length; i++) {
								var orgName = decodeURIComponent(data[i].orgName);
								var rank = decodeURIComponent(data[i].rank);
								var term = decodeURIComponent(data[i].occupationTerm);
								
								$careerArea.append("<span class='item' value='" + data[i].recCode + "'>" + orgName + " " + rank + " / " + term + "</span>");
							}
						},
						error: function(error) {
							console.log(error);
						}
						
					});
					
					
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
			
			/* $(document).on("toggle", '.item', 
					
				function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
				},
				function(){
					$(this).css({'backgro7nd':'lightgray', 'color':'black'});
			}); */
			
			$(document).on("click", '.item', function(){
					$(this).css({'background':'darkolivegreen', 'color':'white'});
			});
			
		});		
		
		function certsAll() {
			$("#certsArea").find('span').css({'background':'darkolivegreen', 'color':'white'});
		}
		
		function careerAll() {
			$("#careerArea").find('span').css({'background':'darkolivegreen', 'color':'white'});
		}
		
	</script>
	
	<!-- 하단 회색 영역 -->
	<div style="height:30px;"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>













