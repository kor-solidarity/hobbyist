<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hobbyist</title>
<style>
#middle {
	height: 520px;
	top: 80px;
	background-image: url("/hobbyist/static/images/thiago.PNG");
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

#middleInfo td div {
	margin: auto;
	font-family: 'ZCOOL QingKe HuangYou', cursive;
	color: darkolivegreen;
	font-size: 50px;
	background-color: white;
	height: 60px;
	text-align: center;
	width: 200px;
	line-height: 60px;
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

#ArtistTable1 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
}

#ArtistTable1  td {
	width: 130px;
	color: #A7A1A1;
}

#ArtistTable1  td:first-child {
	color: darkolivegreen;
}

#ArtistTable2 {
	color: darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 15px;
	border-collapse: separate;
}

#ArtistTable2 button {
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

#ArtistDiv3 {
	font-size: 30px;
	font-family: 'Do Hyeon', sans-serif;
	color: darkolivegreen;
}

#ArtistTable3 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
}

#ArtistTable3  td {
	width: 130px;
	color: #A7A1A1;
}

#ArtistTable3  td:nth-child(2) {
	color: darkolivegreen;
}

#ArtistTable4 {
	color: darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 30px;
	border-collapse: separate;
}

#ArtistTable4 select {
	width: 300px;
	height: 30px;
}

#ArtistTable5 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
}

#ArtistTable5  td {
	width: 130px;
	color: #A7A1A1;
}

#ArtistTable5  td:nth-child(3) {
	color: darkolivegreen;
}

#ArtistTable6 {
	/* border: 1px solid black; */
	border-spacing: 15px;
	border-collapse: separate;
}

#ArtistTable6 td {
	width: 30px;
	/* font-family: 'Do Hyeon', sans-serif; */
	/* border:1px solid black; */
}

#ArtistTable7 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
}

#ArtistTable7  td {
	width: 130px;
	color: #A7A1A1;
}

#ArtistTable7  td:nth-child(4) {
	color: darkolivegreen;
}

#ArtistTable8 {
	/* border: 1px solid black; */
	border-spacing: 15px;
	border-collapse: separate;
}

#ArtistTable8 td {
	width: 30px;
	/* font-family: 'Do Hyeon', sans-serif; */
	/* border:1px solid black; */
}

#ArtistTable9 {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	border-spacing: 20px;
}

#ArtistTable9  td {
	width: 130px;
	color: #A7A1A1;
}

#ArtistTable9  td:nth-child(5) {
	color: darkolivegreen;
}

#ArtistTable10 {
	/* border: 1px solid black; */
	border-spacing: 15px;
	border-collapse: separate;
}

#ArtistTable10 td {
	width: 30px;
	/* font-family: 'Do Hyeon', sans-serif; */
	/* border:1px solid black; */
}

#modifyIcon {
	cursor: pointer;
}

#userIcon {
	float: left;
	position: relative;
	width: 90px;
	height: 90px;
	border-radius: 70%;
	overflow: hidden;
}

#artistprofile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#certiBtn, #schoolBtn, #careerBtn {
	width: 352px;
	border-color: darkolivegreen;
	color: darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
}

.inDiv {
	text-align: center;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 16px;
	color: white;
	/* height:40px; */
	border-radius: 15px;
	/* line-height:40px; */
	background-color: darkolivegreen;
}

#schoolDiv {
	width: 250px;
	height: 200px;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="middle">
		<table id="middleInfo">
			<tr>
				<td>&nbsp;
					<div>hobbyist</div>
				</td>
			</tr>
			<tr>
				<td>하비스트에서 여러분의<br>재능을 공유해주세요.
				</td>
			</tr>
			<tr>
				<td style="height: 400px;">
					<button type="button" class="btn btn-primary btn-lg"
						id="openModalBtn" style="margin-left: 15px;">아티스트 신청하기</button>
				</td>
			</tr>
		</table>
	</div>
	<div id="bottom">
		<!-- 4행 3열-->
		<table id="bottomInfo">
			<tr>
				<td id="first" colspan="3">아티스트 어떻게 신청하나요?</td>
			</tr>
			<tr>
				<td id="second" width="33%">STEP.01</td>
				<td id="second" width="33%">STEP.02</td>
				<td id="second" width="33%">STEP.03</td>
			</tr>
			<tr>
				<td id="third">아티스트신청 및 심사</td>
				<td id="third">수업개설 후 학생매칭</td>
				<td id="third">회차별 수업진행 및 정산</td>
			</tr>
			<tr>
				<td id="fourth">개인정보를 등록해주시면 관리자가 확인 후 아티스트 권한을 부여합니다.</td>
				<td id="fourth">수업정보 개설 후 관리자의 심사가 통과되면 수업이 개시됩니다. 학생매칭되면 수업이
					진행됩니다.</td>
				<td id="fourth">회차별 수업 진행 후 2일 이내에 정산비 확인 메일을 보냅니다. 회신 확인 후
					수업비를 정산해줍니다.</td>
			</tr>
		</table>
	</div>
	
	<!-- modalBox 시작 부분 -->
	<div id="modalBox" class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width: 700px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">아티스트 신청</h4>
				</div>
				<div class="modal-body">
					<form id="artistForm"
						action="<%=request.getContextPath()%>/insert.ar" method="post">
						<div id="show1">
							<table id="ArtistTable1">
								<tr>
									<td>01. 자기소개</td>
									<td>02. 전문분야</td>
									<td>03. 보유 자격증</td>
									<td>04. 학력/전공</td>
									<td>05. 경력</td>
								</tr>
							</table>
							<table id="ArtistTable2">
								<tr>
									<td>
										<div id="userIcon">
											<img src="/hobbyist/static/images/user.png"
												id="artistprofile">
										</div>
										<div id="modifyIcon"
											style="float: left; position: absolute; top: 123px; left: 90px;">
											<img src="/hobbyist/static/images/modifyIcon.png"
												style="height: 30px;">
										</div>
									</td>
									<td>
										<p>아티스트 닉네임</p> <input type="text" name="nickName"
										id="nickName" style="height: 30px">
										<button type="button" id="checkNick" style="height: 30px;">중복확인</button>
									</td>
									<td colspan="2">
										<p>계좌번호</p> <select style="height: 32px">
											<option>은행명</option>
											<option>신한은행</option>
											<option>국민은행</option>
											<option>농협은행</option>
									</select> <input type="text" name="bankNum" style="height: 30px">
										<button style="height: 30px">계좌인증</button>
									</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="3">
										<div id="div2div" style="width: 400px;">
											<p>자기소개</p>
											<textarea id="introduce" name="introduce" rows="5" cols="40"
												placeholder="자기소개 부분을 채워주세요."
												style="width: 380px; height: 200px; text-align: left; color: rgb(49, 49, 49); resize: none;"></textarea>
											<p style="text-align: right;">
												<label id="counter">0</label>/255
											</p>
										</div>
										<div id="fileArea">
											<input type="file" id="artistImg1" name="artistImg1"
												onchange="loadImg(this)">
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div id="show2" style="display: none;">
							<table id="ArtistTable3">
								<tr>
									<td>01. 자기소개</td>
									<td>02. 전문분야</td>
									<td>03. 보유 자격증</td>
									<td>04. 학력/전공</td>
									<td>05. 경력</td>
								</tr>
							</table>
							<table id="ArtistTable4">
								<tr>
									<td style="vertical-align: top; color: black;">전문분야 및
										상세분야를 선택해주세요.<label style="color: darkolivegreen;">(복수
											선택)</label><br> <br> <select id="categoryName">
											<option value="">선택</option>
											<option value="music">음악</option>
											<option value="dance">댄스</option>
											<option value="picture">영상/사진</option>
											<option value="life">라이프스타일</option>
											<option value="beauty">뷰티</option>
											<option value="design">디자인</option>
											<option value="sports">스포츠</option>
									</select> <br> <select id="detailCategory">
											<option>선택</option>

									</select> <br> <br> <select id="categoryName2">
											<option value="">선택</option>
											<option value="music">음악</option>
											<option value="dance">댄스</option>
											<option value="picture">영상/사진</option>
											<option value="life">라이프스타일</option>
											<option value="beauty">뷰티</option>
											<option value="design">디자인</option>
											<option value="sports">스포츠</option>
									</select> <br> <select id="detailCategory2">
											<option>선택</option>
											<option>음악</option>
											<option>댄스</option>
											<option>영상/사진</option>
											<option>라이프스타일</option>
											<option>뷰티</option>
											<option>디자인</option>
											<option>스포츠</option>
									</select> <br> <br> <select id="categoryName3">
											<option value="">선택</option>
											<option value="music">음악</option>
											<option value="dance">댄스</option>
											<option value="picture">영상/사진</option>
											<option value="life">라이프스타일</option>
											<option value="beauty">뷰티</option>
											<option value="design">디자인</option>
											<option value="sports">스포츠</option>
									</select> <br> <select id="detailCategory3">
											<option>선택</option>
											<option>음악</option>
											<option>댄스</option>
											<option>영상/사진</option>
											<option>라이프스타일</option>
											<option>뷰티</option>
											<option>디자인</option>
											<option>스포츠</option>
									</select>


									</td>
									<!-- <td>
										<div
											style="border: 1px solid darkolivegreen; width: 300px; height: 400px;"></div>
									</td>  -->
								</tr>

							</table>
							
						</div>
						<div id="show3" style="display: none;">
							<table id="ArtistTable5">
								<tr>
									<td>01. 자기소개</td>
									<td>02. 전문분야</td>
									<td>03. 보유 자격증</td>
									<td>04. 학력/전공</td>
									<td>05. 경력</td>
								</tr>
							</table>
							<table id="ArtistTable6">
								<tr>
									<td colspan="2" style="font-family: 'Do Hyeon', sans-serif;">보유한
										자격증을 작성해주세요. (3개 이하로 작성)&nbsp;&nbsp; <label
										style="color: darkolivegreen; font-size: 13px;">선택 사항</label>
									</td>
									<td rowspan="6">
										<div id="certiDiv" style="width: 250px; height: 300px;"></div>
									</td>
								</tr>
								<tr>
									<td colspan="2"><input type="text" placeholder="자격증명" name="certiName"
										id="certiName" style="width: 350px; height: 30px;">
										<input type="hidden" id="certiName1" name="certiName1">
										<input type="hidden" id="certiName2" name="certiName2">
										<input type="hidden" id="certiName3" name="certiName3"></td>
								</tr>
								<tr>
									<td><input type="date" placeholder="발급일" id="certiDay"
										style="width: 125px; height: 30px;">
										<input type="hidden" id="certiDay1" name="certiDay1">
										<input type="hidden" id="certiDay2" name="certiDay2">
										<input type="hidden" id="certiDay3" name="certiDay3">
										</td>
									<td style="width: 220px;"><input type="text"
										placeholder="발급 기관" id="certiSpace"
										style="width: 215px; height: 30px;">
										<input type="hidden" id="certiSpace1" name="certiSpace1">
										<input type="hidden" id="certiSpace2" name="certiSpace2">
										<input type="hidden" id="certiSpace3" name="certiSpace3">
										</td>
								</tr>
								<tr>
									<td colspan="2"><button type="button" id="certiBtn">확인</button></td>
								</tr>
								<tr>
									<td colspan="2" style="font-size: 14px;">자격증 소유 시 취득 확인서를
										첨부해주세요.
										<p style="color: red; font-size: 10px;">취득 확인서가 여러 개일시 한
											파일로 압축해서 첨부해주세요</p>
									</td>
								</tr>
								<tr>
									<!-- <td><button>파일선택</button></td>
									<td style="font-size: 13px;">선택된 파일 없음</td> -->
									<td colspan="2"><input type="file" id="certiFile">
									</td>
								</tr>
							</table>
						</div>

						<div id="show4" style="display: none;">
							<table id="ArtistTable7">
								<tr>
									<td>01. 자기소개</td>
									<td>02. 전문분야</td>
									<td>03. 보유 자격증</td>
									<td>04. 학력/전공</td>
									<td>05. 경력</td>
								</tr>
							</table>
							<table id="ArtistTable8">
								<tr>
									<td colspan="2" style="font-family: 'Do Hyeon', sans-serif;">학력
										전공을 작성해주세요. (3개 이하로 작성)&nbsp;&nbsp; <label
										style="color: darkolivegreen; font-size: 13px;">선택 사항</label>
									</td>
									<td rowspan="4">
										<div id="schoolDiv"></div>
									</td>
								</tr>
								<tr>
									<td colspan="2"><input type="text" id="schoolName"
										placeholder="학교명(ex. 서울대학교)"
										style="width: 350px; height: 30px;">
										<input type="hidden" name="schoolName1" id="schoolName1">
										<input type="hidden" name="schoolName2" id="schoolName2">
										<input type="hidden" name="schoolName3" id="schoolName3">
									</td>
								</tr>
								<tr>
									<td><input type="text" placeholder="전공(ex. 컴퓨터공학과)"
										id="major" style="width: 210px; height: 30px;">
										<input type="hidden" name="major1" id="major1">
										<input type="hidden" name="major2" id="major2">
										<input type="hidden" name="major3" id="major3">
									</td>
									<td><select style="height: 30px; width: 125px;"
										id="status">
											<option value="">상태</option>
											<option value="inSchool">재학</option>
											<option value="graduate">졸업</option>
									</select>
									<input type="hidden" name="status1" id="status1">
									<input type="hidden" name="status2" id="status2">
									<input type="hidden" name="status3" id="status3">
									</td>
								</tr>
								<tr>
									<td colspan="2"><button id="schoolBtn" type="button">확인</button></td>
								</tr>
							</table>
						</div>
						<div id="show5" style="display: none;">
							<table id="ArtistTable9">
								<tr>
									<td>01. 자기소개</td>
									<td>02. 전문분야</td>
									<td>03. 보유 자격증</td>
									<td>04. 학력/전공</td>
									<td>05. 경력</td>
								</tr>
							</table>
							<table id="ArtistTable10">
								<tr>
									<td colspan="2" style="font-family: 'Do Hyeon', sans-serif;">경력사항을
										작성해주세요. (3개 이하로 작성)&nbsp;&nbsp; <label
										style="color: darkolivegreen; font-size: 13px;">선택 사항</label>
									</td>
									<td rowspan="7">
										<div id="careerDiv"
											style="width: 250px; height: 250px;"></div>
									</td>
								</tr>
								<tr>
									<td><input type="text" placeholder="기관명" id="officeName"
										style="width: 170px; height: 30px;">
										<input type="hidden" name="officeName1" id="officeName1">	
										<input type="hidden" name="officeName2" id="officeName2">	
										<input type="hidden" name="officeName3" id="officeName3">	
									</td>
									<td><input type="text" placeholder="직위" id="position"
										style="width: 170px; height: 30px;">
										<input type="hidden" name="position1" id="position1">
										<input type="hidden" name="position2" id="position2">
										<input type="hidden" name="position3" id="position3">
									</td>
								</tr>
								<tr>
									<td colspan="2"><input type="text" placeholder="근무내용"
										id="workContent" style="width: 352px; height: 30px;">
										<input type="hidden" name="workContent1" id="workContent1">
										<input type="hidden" name="workContent2" id="workContent2">
										<input type="hidden" name="workContent3" id="workContent3">
									</td>

								</tr>
								<tr>
									<td colspan="2" style="font-family: 'Do Hyeon', sans-serif;">근무기간</td>
								</tr>
								<tr>
									<td><select id="workYear"
										style="width: 170px; height: 30px;">
											<option value="">년</option>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="10년이상">10년 이상</option>
										</select>
										<input type="hidden" name="workYear1" id="workYear1">									
										<input type="hidden" name="workYear2" id="workYear2">									
										<input type="hidden" name="workYear3" id="workYear3">									
									</td>
									<td><select id="workMonth"
										style="width: 170px; height: 30px;">
											<option value="">개월</option>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
										</select>
										<input type="hidden" name="workMonth1" id="workMonth1">
										<input type="hidden" name="workMonth2" id="workMonth2">
										<input type="hidden" name="workMonth3" id="workMonth3">
									</td>
								</tr>
								<tr>
									<td colspan="2">프리랜서인 경우, 기관명, 직위에 '없음'이라고 적어주세요.</td>
								</tr>
								<tr>
									<td colspan="2"><button type="button" id="careerBtn">확인</button></td>
								</tr>
							</table>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="closeModalBtn">이전</button>
					<button type="button" class="btn btn-primary" id="nextModalBtn">다음</button>
					<button type="button" class="btn btn-primary" id="saveModalBtn"
						style="display: none; background-color: darkolivegreen;">저장</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		
		$(function() {
			//자기소개 부분 textarea에서 255자가 넘지 못하게
			$("#introduce").keydown(
				function() {
					var inputLength = $(this).val().length;
	
						if (inputLength > 255) {
							$(this).val($(this).val().substring(0,255));
							
						} else {
							$("#counter").html(inputLength);
						}
				});
	
			//닉네임 중복체크
			$("#checkNick").click(function() {
				var nick = $("#nickName").val();
				//console.log(nick);
				$.ajax({
					url : "/hobbyist/checkNick.ar",
					type : "post",
					data : {nick : nick},
					success : function(data) {
						//console.log("서버 전송 성공");
						if (data == "fail") {
							alert("닉네임이 중복됩니다.");
						} else {
							alert("사용 가능한 닉네임입니다.");
						}
					},
					error : function(error) {
						console.log(error);
					}
				});
			});
	
			// file input 태그 숨기기 
			$("#fileArea").hide();
	
			//수정 아이콘 클릭시 파일 첨부할 수 있께
			$("#modifyIcon").click(function() {
				$("#artistImg1").click();
			});
	
		});
	
		// 파일 첨부해서 선택했을 경우 아티스트 프로필 변경
		function loadImg(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					$("#artistprofile").attr("src",e.target.result);
				}
	
				reader.readAsDataURL(value.files[0]);
			}
		}
		/*카테고리 1에서 전문분야와 상세분야 선택 스크립트 */
		$("#categoryName").change(function() {
				var categoryName = $("#categoryName").val();
	
				$.ajax({
					url : "/hobbyist/category.su",
					type : "post",
					data : {categoryName : categoryName},
					success : function(data) {
						$select = $("#detailCategory");
						$select.find("option").remove();
	
						for ( var key in data) {
							var $option = $("<option>");
							$option.text(data[key]);
							$select.append($option);
						}
					},
					error : function(error) {
						console.log(error);
					}
				});
		});
	
		/*카테고리 2에서 전문분야와 상세분야 선택 스크립트 */
		$("#categoryName2").change(function() {
			var categoryName = $("#categoryName2").val();
	
			$.ajax({
				url : "/hobbyist/category.su",
				type : "post",
				data : {categoryName : categoryName},
				success : function(data) {
					$select = $("#detailCategory2");
					$select.find("option").remove();
	
					for (var key in data) {
						var $option = $("<option>");
						$option.text(data[key]);
						$select.append($option);
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	
		/*카테고리 3에서 전문분야와 상세분야 선택 스크립트 */
		$("#categoryName3").change(function() {
			var categoryName = $("#categoryName3").val();
	
			$.ajax({
				url : "/hobbyist/category.su",
				type : "post",
				data : {categoryName : categoryName},
				success : function(data) {
					$select = $("#detailCategory3");
					$select.find("option").remove();
	
					for (var key in data) {
						var $option = $("<option>");
						$option.text(data[key]);
						$select.append($option);
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		//자격증 확인 버튼 클릭시 동적으로 div 추가
		$(function() {
			var certiIndex = 1;
			
			$("#certiBtn").click(function() {
				var certiName = $("#certiName").val();
				var certiDay = $("#certiDay").val();
				var certiSpace = $("#certiSpace").val();
	
				if (certiIndex <= 3){
					
					if (certiName != '' && certiDay != '' && certiSpace != '') {
						
						var certiInfo = {
								certiName : certiName,
								certiDay : certiDay,
								certiSpace : certiSpace
						};
						/* certiSend[index++] = certiInfo; */
							
						$("#certiName" + certiIndex).val(certiName);
						$("#certiDay" + certiIndex).val(certiDay);
						$("#certiSpace" + certiIndex).val(certiSpace);
						certiIndex++;
						
					
		
						$.ajax({
							url : "/hobbyist/certiAdd.ar",
							type : "post",
							data : certiInfo,
							success : function(data) {
								console.log(data);
		
								$div = $("#certiDiv");
								var $inDiv = $("<div class='inDiv'>").text(data);
								$div.append($inDiv);
								$div.append("<br>")
		
							},
							error : function(status) {
								console.log(status);
							}
		
						});
						
					} else {
						alert("모든 입력을 완료해 주세요.");
					}
					
				} else {
					alert("자격증은 최대 3개까지만 입력 가능합니다.");
				}
	
			});
		});
		//학력 전공 입력후 "확인" 버튼 클릭 시 동적으로 div 추가
		$(function() {
			var schoolIndex = 1;
			
			$("#schoolBtn").click(function() {
				var schoolName = $("#schoolName").val();
				var major = $("#major").val();
				var status = $("#status").val();
	
				if(schoolIndex <= 3) {
					
					if (schoolName != '' && major != '' && status != '') {
						
						var schoolInfo = {
							schoolName : schoolName,
							major : major,
							status : status
						};
						
						$("#schoolName" + schoolIndex).val(schoolName);
						$("#major" + schoolIndex).val(major);
						$("#status" + schoolIndex).val(status);
						schoolIndex++;
		
						$.ajax({
							url : "/hobbyist/schoolAdd.ar",
							type : "post",
							data : schoolInfo,
							success : function(data) {
								console.log(data);
		
								$div = $("#schoolDiv");
								var $inDiv = $("<div class='inDiv'>").text(data);
								$div.append($inDiv);
								$div.append("<br>");
		
							},
							error : function(status) {
								console.log(status);
							}
						});
						
					} else {
						alert("모든 입력을 완료해 주세요.");
					}
					
				} else {
					alert("학력/전공은 최대 3개까지만 입력 가능합니다.");
				}
			});
		});
		
		//경력사항 입력시 동적으로 div 추가
		$(function() {
			var careerIndex = 1;
			
			$("#careerBtn").click(function() {
				var officeName = $("#officeName").val();
				var position = $("#position").val();
				var workContent = $("#workContent").val();
				var workYear = $("#workYear").val();
				var workMonth = $("#workMonth").val();
	
				if(careerIndex <= 3) {
					
					if (officeName != '' && position != '' && workContent != '' && workMonth != '') {
						
						var careerInfo = {
								officeName : officeName,
								position : position,
								workContent : workContent,
								workYear : workYear,
								workMonth : workMonth
						};
						
						$("#officeName" + careerIndex).val(officeName);
						$("#position" + careerIndex).val(position);
						$("#workContent" + careerIndex).val(workContent);
						$("#workYear" + careerIndex).val(workYear);
						$("#workMonth" + careerIndex).val(workMonth);
						careerIndex++;
		
						$.ajax({
							url : "/hobbyist/careerAdd.ar",
							type : "post",
							data : careerInfo,
							success : function(data) {
								console.log(data);
		
								$div = $("#careerDiv");
								var $inDiv = $("<div class='inDiv'>").text(data);
								$div.append($inDiv);
								$div.append("<br>");
							},
							error : function(status) {
								console.log(status);
							}
						});
						
					} else {alert("모든 입력을 완료해 주세요.");}
					
				} else {
					alert("경력은 최대 3개까지만 입력 가능합니다.");
				}
			});
		});
		$(function() {
			var num = 1;
			// 모달 버튼에 이벤트를 건다.
			$('#openModalBtn').on('click', function() {
				$('#modalBox').modal('show');
			});
			// 모달 안의 취소 버튼에 이벤트를 건다.
			$('#closeModalBtn').on('click', function() {
				/* $('#modalBox').modal('hide'); */
				if (num > 1) {
					$("#show" + num).hide();
					console.log(num);
					num--;
					$("#show" + num).show();
					console.log(num);

				}
				if (num < 5) {
					$("#nextModalBtn").show();
					$("#saveModalBtn").hide();
				}
			});
			$('#nextModalBtn').on('click', function() {

				$("#show" + num).hide();
				console.log(num);
				num++;
				$("#show" + num).show();
				console.log(num);
				if (num == 5) {
					$("#nextModalBtn").hide();
					$("#saveModalBtn").show();
				}

			});
			$('#saveModalBtn').on('click', function() {
				$("#artistForm").submit();
			});
		});
	</script>
	<div style="height: 30px;"></div>
	<%@ include file="../common/footer.jsp"%>
	
</body>
</html>