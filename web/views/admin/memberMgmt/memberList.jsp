<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, java.util.ArrayList, com.dh.hobbyist.member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
 
 	section {
 		width: 100%;
 		height: 91%;
 	}
 	
 	#sideMenuBar {
 		background-color: #4E4E4E;
 		width: 15%;
 		height: 100%;
 		float: left;
 		margin: 0px;
 		text-align: center;
 	}
 	
 	#bigMenu {
 		margin-top: 20px;
 	 	color: #DED842;
 	}
 	
 	#smallMenu {
 		margin-top: 20px;
 		padding-left: 25px;
 		color: white;
 		text-align: left;
 		font-weight: bold;
 		font-size: 19px;
 		line-height: 45px;
 	}
 	
 	#contents {
 		background-color: white;
 		width: 85%;
 		height: 100%;
 		margin: 0px;
 		float: left;
 	}
 	
 	#searchMember {
 		margin-top: 80px;
 		text-align: right;
 	}
 	
 	#searchDetailArea {
 		width: 100%;
 		text-align: right;
 	}
 	
 	#searchT {
 		width: 90%;
 		margin-left: 10%;
 	}
 	
 	#searchBtn {
 		color: white;
 		background-color: #4E4E4E;
 	}
 	
 	#firstLine {
 		width: 90%;
 		height: 1px;
 		background:black;
 		margin: 0px;
	 	margin-left: 115px;
 		margin-top: 10px;
 		align: right;
 	}
 	
 	#infoArea {
 		margin-top: 50px;
 		margin-left: 60px;
 		width: 1100px;
 		height: 500px;
 		overflow-x: hidden;
        overflow-y: auto;
 	}
 	
 	th {
 		background: #4E4E4E;
 		color: white;
 		height: 35px;
 		text-align: center;
 	}
 	
 	#infoArea td {
 		border: 1px solid black;
 		height: 45px;
 	}
 	
 	#artistDiv {
    	width:500px;
    }
    
    #artistTab {
    	border-collapse:separate;
    	border-spacing:0 10px;
    }
    
    .box {
    	width: 80px;
    	height: 80px;
    	border-radius: 70%;
    	overflow: hidden;
    }
    
    .profile {
    	width: 100%;
    	height: 100%;
    	object-fit : cover;
    }
    
    .emp {
    	font-family: Do Hyeon;
    	color:darkolivegreen;
    	font-size:18px;
    }

    #downloadDiv {
    	color:DodgerBlue;
    	cursor:pointer;
    	width:80px;
    }
</style>
</head>

<body>
	<%@ include file="/views/common/adminMenubar.jsp" %>
	<section>
		<!-- 왼쪽 사이드바 메뉴  -->
		<article id="sideMenuBar">
		
			<!-- 큰 영역의 메뉴 -->
			<div id="bigMenu">
				<label style="font-weight: bold; font-size: 25px;">회원관리</label>
				<hr style="width: 80%; color: #DED842; height: 1px; background: #DED842; margin-top: 17px;">
			</div>
			
			<!-- 큰 메뉴안의 상세 메뉴 여러개 -->
			<div id="smallMenu">
				<label style="color: #DED842;">회원 리스트</label><br>
				<label onclick="goArtistApproval();">아티스트 승인</label><br>
				<label>알림 보내기</label>
			</div>
		</article>
		
		<!-- 관리자 본문 들어갈 공간 -->
		<article id="contents">
			<!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
			<div id="searchDetailArea">
				
				<!-- 상세페이지, 정렬, 검색 테이블 -->
				<table id="searchT">
					<tr>
						<td style="text-align: left; vertical-align: bottom;">
							<label id="memberListL" style="font-weight: bold;">회원정보 조회</label> &nbsp; &nbsp;
							<label id="artistListL" style="font-weight: bold; color: gray;">아티스트 조회</label>
						</td>
						<td style="padding-right: 20px;">
							<input style="text" id="searchMember"><button id="searchBtn">검색</button>
						</td>
					</tr>
					
				</table>
			</div>
			
			<!-- 본문 상단 줄 -->
			<hr id="firstLine">
			
			<!-- 정보 추가되는 본문 테이블 -->
			<div id="infoArea">
				<table id="infoT" style="width: 100%; border-collapse: collapse; text-align: center;">
					<!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
				</table>
			</div>
			
			
		</article>
	</section>
	<!--  아티스트 신청 내역 상세 보기 모달 -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color:#4E4E4E; height:42px;">
							<label style="font-size:18px; color:white;">hobbyist</label>
							<button type="button" class="close" data-dismiss="modal" style="color:white">×</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body">
							<br>
							<div id="artistDiv">
								<table id="artistTab">
									<tr>
										<td colspan="2" class="emp">아티스트 소개</td>
									</tr>
									<tr>
										<td>
											<div class="box" style="background: #BDBDBD;">
												<img class="profile" id="profileImg" src="/hobbyist/static/images/user.png">
											</div>
										</td>
										<td id="arNick"></td>
									</tr>
									<tr>
										<td id="arContent" colspan="2"></td>
									</tr>
									<tr>
										<td>계좌번호</td>
										<td id="arBank"></td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td colspan="2" class="emp">전문분야 및 상세분야</td>
									</tr>
									<tr>
										<td id="cat1"></td>
										<td id="detailCat1"></td>
									</tr>
									<tr>
										<td id="cat2"></td>
										<td id="detailCat2"></td>
									</tr>
									<tr>
										<td id="cat3"></td>
										<td id="detailCat3"></td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td colspan="2" class="emp">보유 자격증</td>
									</tr>
									<tr>
										<td colspan="2"><label id="certs1"></label><br><p id="certsDetail1"></p>
										</td>
									</tr>
									<tr>
										<td colspan="2"><label id="certs2"></label><br><p id="certsDetail2"></p>
										</td>
									</tr>
									<tr>
										<td colspan="2"><label id="certs3"></label><br><p id="certsDetail3"></p>
										</td>
									</tr>
									<tr>
										<td>첨부파일</td>
										<td><div id="downloadDiv">[다운로드]</div></td>
									</tr>
									<tr style="display:none;">
										<td><img id="proofFile" src=""></td>
										<td><input type="hidden" id="fileCode" name="fileCode"></td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td colspan="2" class="emp">학력/전공</td>
									</tr>
									<tr>
										<td colspan="2" id="edu1"></td>
									</tr>
									<tr>
										<td colspan="2" id="edu2"></td>
									</tr>
									<tr>
										<td colspan="2" id="edu3"></td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td colspan="2" class="emp">경력</td>
									</tr>
									<tr>
										<td colspan="2" id="career1"></td>
									</tr>
									<tr>
										<td colspan="2" id="career2"></td>
									</tr>
									<tr>
										<td colspan="2" id="career3"></td>
									</tr>
								</table>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" data-dismiss="modal"class="btn btn-primary" id="checkArtistBtn">확인</button>
						</div>
					</div>
				</div>
			</div>
	
	
	<script>
		$(function() {
			$.ajax({
				url: "/hobbyist/selectList.ad",
				type: 'post',
				success: function(data) {
					console.log(data);
					$table = $("#infoT");
					$table.html('');
					
					var $tr = $("<tr>");
					
					$tr.append('<th style="width: 8%;">회원코드</th>' +
								'<th style="width: 15%;">아이디</th>' +
								'<th style="width: 10%;">이름</th>' +
								'<th style="width: 15%;">전화번호</th>' +
								'<th style="width: 20%;">이메일</th>' +
								'<th style="width: 8%;">아티스트 </th>' +
								'<th style="width: 7%;">경고</th>' +
								'<th style="width: 17%;">가입일</th>');  
					
					$table.append($tr);
					
					$.each(data, function(index, value) {
						
						$tr = $("<tr>");
						var $mcode = $("<td>").text(value.memberCode);
						var $mId = $("<td>").text(decodeURIComponent(value.memberId));
						var $mName = $("<td>").text(decodeURIComponent(value.memberName));
						var $phone = $("<td>").text(decodeURIComponent(value.phone));
						var $email = $("<td>").text(decodeURIComponent(value.email));
						var $isArtist = $("<td>").text(value.isArtist);
						var $warning = $("<td>").text(value.warning);
						var $regDate = $("<td>").text(value.regDate);
						
						$tr.append($mcode);
						$tr.append($mId);
						$tr.append($mName);
						$tr.append($phone);
						$tr.append($email);
						$tr.append($isArtist);
						$tr.append($warning);
						$tr.append($regDate);
						$table.append($tr);
					});
				},
				error: function(status) {
					console.log(status);
				}
			});
			$("#memberListL").click(function() {
				$("#artistListL").css("color", "gray");
				$("#memberListL").css("color", "black");
				
				$.ajax({
					url: "/hobbyist/selectList.ad",
					type: 'post',
					success: function(data) {
						console.log(data);
						$table = $("#infoT");
						$table.html('');
						
						var $tr = $("<tr>");
						
						$tr.append('<th style="width: 8%;">회원코드</th>' +
									'<th style="width: 15%;">아이디</th>' +
									'<th style="width: 10%;">이름</th>' +
									'<th style="width: 15%;">전화번호</th>' +
									'<th style="width: 20%;">이메일</th>' +
									'<th style="width: 8%;">아티스트 </th>' +
									'<th style="width: 7%;">경고</th>' +
									'<th style="width: 17%;">가입일</th>');  
						
						$table.append($tr);
						
						$.each(data, function(index, value) {
							
							$tr = $("<tr>");
							var $mcode = $("<td>").text(value.memberCode);
							var $mId = $("<td>").text(decodeURIComponent(value.memberId));
							var $mName = $("<td>").text(decodeURIComponent(value.memberName));
							var $phone = $("<td>").text(decodeURIComponent(value.phone));
							var $email = $("<td>").text(decodeURIComponent(value.email));
							var $isArtist = $("<td>").text(value.isArtist);
							var $warning = $("<td>").text(value.warning);
							var $regDate = $("<td>").text(value.regDate);
							
							$tr.append($mcode);
							$tr.append($mId);
							$tr.append($mName);
							$tr.append($phone);
							$tr.append($email);
							$tr.append($isArtist);
							$tr.append($warning);
							$tr.append($regDate);
							$table.append($tr);
						});
					},
					error: function(status) {
						console.log(status);
					}
				});
			});
		
		
			$("#artistListL").click(function() {
				$("#artistListL").css("color", "black");
				$("#memberListL").css("color", "gray");
				
				$.ajax({
					url: "/hobbyist/selectArtistList.ad",
					method: "post",
					success: function(data) {
						$table = $("#infoT");
						$table.html('');
					
						var $tr = $("<tr>");
					
						$tr.append('<th style="width: 8%;">회원코드</th>' +
									'<th style="width: 12%;">아이디</th>' +
									'<th style="width: 8%;">이름</th>' +
									'<th style="width: 9%;">닉네임</th>' +
									'<th style="width: 12%;">전화번호</th>' +
									'<th style="width: 16%;">이메일</th>' +
									'<th style="width: 14%;">계좌번호 </th>' +
									'<th style="width: 13%;">등록일</th>' +
									'<th style="width: 8%">프로필</th>');
						
						$table.append($tr);
						
						for(var key in data) {
							
							$tr = $("<tr>");
							var $acode = $("<td>").text(data[key].memberCode);
							var $aId = $("<td>").text(data[key].memberId);
							var $aName = $("<td>").text(data[key].memberName);
							var $aNick = $("<td>").text(data[key].artistNick);
							var $phone = $("<td>").text(data[key].phone);
							var $email = $("<td>").text(data[key].email);
							var $bank = $("<td>").text(data[key].bankName + " " + data[key].bankOwner + "\n" + data[key].bankNum);
							var $accept = $("<td>").text(data[key].artistAccepted);
							var $profile = $("<td>").html("<button class='showArtist'>조회</button>");
							
							$tr.append($acode);
							$tr.append($aId);
							$tr.append($aName);
							$tr.append($aNick);
							$tr.append($phone);
							$tr.append($email);
							$tr.append($bank);
							$tr.append($accept);
							$tr.append($profile);
							$table.append($tr);
						}
					},
					error: function(status) {
						console.log(status);
					}
				});
			});
			
			$(document).on("click", '.showArtist', function() {
				var num = Number($(this).parent().parent().children("td:nth-child(1)").text());
				$.ajax({
					url: "/hobbyist/applyInfo.ar",
					data: {num : num},
					type: "post",
					success: function(data) {

						for(var key in data) {
							
							if(key == 'member') {
								var list = data[key];
								var mem = list[0];
								$("#arNick").text(mem.artistNick);
								$("#arContent").text(mem.artistIntro);
								
								var bankName = "";
								switch(mem.bankName) {
								case "SH" : bankName = "신한"; break;
								case "NH" : bankName = "농협"; break;
								case "KB" : bankName = "국민"; break;
								}
								$("#arBank").text(bankName + " " + mem.bankOwner + " " + mem.bankNum);
							}
							
							if(key == 'arCatList') {
								var list = data[key];
								var len = data[key].length;
								
								$("#cat1").text('');
								$("#cat2").text('');
								$("#cat3").text('');
								$("#detailCat1").text('');
								$("#detailCat2").text('');
								$("#detailCat3").text('');
								
								for(var i = 0; i < len; i++) {
									var category = list[i];
									
									var parentName = "";
									
									switch(category.categoryParentCode) {
									case 1: parentName = "음악"; break;
									case 9: parentName = "댄스"; break;
									case 15: parentName = "영상/사진"; break;
									case 20: parentName = "라이프스타일"; break;
									case 25: parentName = "뷰티"; break;
									case 33: parentName = "디자인"; break;
									case 37: parentName = "스포츠"; break;
									}
									var catId = "#cat" + (i + 1);
									var detailCatId = "#detailCat" + (i + 1);
									$(catId).text(parentName);
									$(detailCatId).text(category.categoryName);
									
								}
								
								
							}
							
							if(key == 'arCertsList') {
								var list = data[key];
								var len = data[key].length;
								
								$("#certs1").text('');
								$("#certs2").text('');
								$("#certs3").text('');
								$("#certsDetail1").text('');
								$("#certsDetail2").text('');
								$("#certsDetail3").text('');
								
								for(var i = 0; i < len; i++) {
									var cert = list[i];
									
									var certsId = "#certs" + (i + 1);
									var certsDetailId = "#certsDetail" + (i + 1);
									
									var str = "(" + cert.certDate + ", " + cert.certOrg + ")";
									
									$(certsId).text(cert.certName);
									$(certsDetailId).text(str);
									
								}
							}
							
							if(key == 'arCareerList') {
								var list = data[key];
								var len = data[key].length;
								
								$("#career1").text('');
								$("#career2").text('');
								$("#career3").text('');
								
								for(var i = 0; i < len; i++) {
									var career = list[i];
									
									var careerId = "#career" + (i + 1);
									
									var str = career.orgName + "  " + career.rank + " / " + career.occupation + " / " + career.occupationTerm;
									
									$(careerId).text(str);
								}
							}
							
							if(key == 'arEduList') {
								var list = data[key];
								var len = data[key].length;
								
								$("#edu1").text('');
								$("#edu2").text('');
								$("#edu3").text('');
								
								for(var i = 0; i < len; i++) {
									var edu = list[i];
									
									var eduId = "#edu" + (i + 1);
									
									var status = "";
									
									switch(edu.status) {
									case 0 : status = "재학"; break;
									case 1 : status = "졸업"; break;
									}
									
									var str = edu.eduInsitituteName + " / " + edu.eduMajor + " / " + status;
									
									$(eduId).text(str);
								}
							}
							
							if(key == 'imgList') {
								var list = data[key];
								var len = data[key].length;
								
								for(var i = 0; i < len; i++) {
									var img = list[i];
									
									var root = img.imageRoute + "/" + img.imageName;
									
									if(img.imageType == 'profile' && len == 1) {
										$("#profileImg").attr("src", root);
										$("#fileCode").val("");
									} else if(img.imageType == 'profile' && len != 1) {
										$("#profileImg").attr("src", root);
									}
									
									if(img.imageType == 'artistproof') {
										$("#proofFile").attr("src", root);
										$("#fileCode").val(img.imageCode);
									}
								}
							}
							
						}
					},
					error: function(error) {
						console.log(error);
					}
				});
		    	
	   	    	$("#myModal").modal();
		});
		});
		
		function goArtistApproval() {
			location.href = "<%=request.getContextPath()%>/approvalList.ar";
		}
	</script>
</body>
</html>