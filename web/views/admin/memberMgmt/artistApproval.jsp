<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dh.hobbyist.artist.model.vo.*"%>
<%
	ArrayList<ApplyArtist> applyList = (ArrayList<ApplyArtist>) request.getAttribute("applyList");
%>
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
       padding: 5px;
	   border: 1px solid #4E4E4E;
	   height:30px;
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
    
    #approvalTab{
    	width:100%;
    	text-align:center;
    }
    #approvalTab th {
    	text-align:center;
    	height:35px;
    }
    #approvalTab td {
    	border:1px solid black;
    	height:45px;
    }
    #approvalTab tr:first-child {
    	background-color:#4E4E4E;
    	color:white;
    }
    .approvalBtn {
    	background-color:#3D74CD;
    	color:white;
    	padding: 5px;
    	font-size:15px;
    	border-radius:5%;
    	height:30px;
	    border: 1px solid #3D74CD;
    }
    .refuseBtn {
    	background-color:#C72222;
    	font-size:15px;
    	color:white;
    	padding: 5px;
    	border-radius:5%;
	    border: 1px solid #C72222;
	    height:30px;
    }
    #aaModalTab {
    	margin:auto;
    }
    #checkModalBtn, #checkArtistBtn, #checkReasonBtn {
       color: white;
       background-color: #4E4E4E;
       padding: 5px;
	   border: 1px solid #4E4E4E;
	   width:60px;
	   height:40px;  
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
    .registerText {
    	cursor:pointer;
    }
    #downloadDiv {
    	color:DodgerBlue;
    	cursor:pointer;
    	width:80px;
    }
    .reasonDiv {
    	color:DodgerBlue;
    	cursor:pointer;
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
            <label>회원 리스트</label><br>
            <label style="color: #DED842;">아티스트 승인</label><br>
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
                  <td style="text-align: left; vertical-align: bottom;"><label style="font-weight: bold; font-size:18px;">아티스트 승인</label></td>
                  <td style="padding-right: 20px;">
                     <input type="text" id="searchMember" style="height:25px;">&nbsp;<button id="searchBtn">검색</button>
                  </td>
               </tr>
               
            </table>
         </div>
         
         <!-- 본문 상단 줄 -->
         <hr id="firstLine">
         
         <!-- 정보 추가되는 본문 테이블 -->
         <div id="infoArea">
            <table id="approvalTab">
               <!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
               <tr>
               		<th style="width:80px;">번호</th>
               		<th style="width:150px;">아이디</th>
               		<th style="width:250px;">아티스트 등록</th>
               		<th style="width:120px;">등록일자</th>
               		<th style="width:200px;">승인</th>
               		<th style="width:250px;">거절사유</th>
               </tr>
               <% for(ApplyArtist aa : applyList) { %>
               	<tr>
               		<input type="hidden" value="<%=aa.getApplyMember()%>">	
               		<td><%=aa.getApplyCode() %></td>
               		<td><%=aa.getApplyMemberId() %></td>
               		<td class="registerText" style="text-decoration: underline;"><%=aa.getApplyMemberId() %>님의 등록글</td>
               		<td><%=aa.getApplyDate() %></td>
               		<td>
	               		<%
	               			if(aa.getApplyConfirmed() == 0) {
	               		%> 	
	               			<button class="approvalBtn">승인</button> &nbsp;
	                   		<button class="refuseBtn">거절</button>
	               		<%} else {
	               				if(aa.getRejectReason() == null) {
	               		%>
	               				승인 처리됨
	               			<%
	               				} else {
	               			%>
	               				거절 처리됨
	               			<%	
	               			}
	               		} %>
               		</td>
               		<td>
               			<%
               				if(aa.getRejectReason() != null) {
               			%>
               				<div class="reasonDiv"><%=aa.getApplyMemberId() %>님의 거절사유</div>
               				<input type="hidden" id="reasonInput" value="<%=aa.getRejectReason() %>">
               			<%
               				} 
               			%>
               		</td>
               	</tr>
               <% } %>
               
            </table>
            <script>
            	
            </script>
         </div>
         	<!--거절 사유 입력 모달  -->
			<div class="modal fade" id="myModal1" role="dialog">
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
							<table id="aaModalTab">
								<tr>
									<td style="font-size:18px;">
										거절 사유를 입력해주세요.
									</td>
								</tr>
								<tr style="height:20px;">
								</tr>
								<tr>
									<td>
										<textarea id="rejectReason" rows="5" cols="40" style="resize:none; width:500px; height:300px;" placeholder="입력하신 거절 사유가 회원의 알림으로 보내지게 됩니다."></textarea>
									</td>
								</tr>
							</table>
							
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="checkModalBtn">확인</button>
						</div>
					</div>

				</div>
			</div>
			
			<!--  아티스트 신청 내역 상세 보기 모달 -->
			<div class="modal fade" id="myModal2" role="dialog">
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
			
			<!-- 거절사유 보여주는 모달 -->
			<div class="modal fade" id="myModal3" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" style="background-color:#4E4E4E; height:42px;">
							<label style="font-size:18px; color:white;">hobbyist</label>
							<button type="button" class="close" data-dismiss="modal" style="color:white">×</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body">
							<br>
							<table>
								<tr>
									<td style="font-size:18px; font-weight:bold;">
										거절 사유
									</td>
								</tr>
								<tr style="height:20px;">
								</tr>
								<tr>
									<td id="reasonTd">
										
									</td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" data-dismiss="modal" class="btn btn-primary" id="checkReasonBtn">확인</button>
						</div>
					</div>
				</div>
			</div>
			<script>
			$(document).ready(function() {
				$(".registerText").click(function() {
					var num = $(this).parent().children("input").val();

					$.ajax({
						url: "/hobbyist/applyInfo.ar",
						data: {num},
						type: "post",
						success: function(data) {

							for(var key in data) {
								
								//console.log(key + ": " + data[key]);
								//console.log(data[key].length);
								
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
					
					$("#myModal2").modal();
				});
				
				$("#downloadDiv").click(function() {
					var num = $("#fileCode").val();
					
					if(num == "") {
						alert("첨부파일이 존재하지 않습니다.");
					} else {
						location.href = "<%=request.getContextPath()%>/download.ar?num=" + num;
					}
					
				});
				
				var refuseApplyCode = "";
				
				$(".refuseBtn").click(function() {
					refuseApplyCode = $(this).parent().parent().children("td").first().text();
					
					
					$("#myModal1").modal();
				});
				
				$("#checkModalBtn").click(function() {
					var rejectReason = $("#rejectReason").val();
					
					location.href = "<%=request.getContextPath()%>/refuse.ar?applyCode=" + refuseApplyCode + "&rejectReason=" + rejectReason;
				}); 
				
				//승인 버튼 클릭시
				$(".approvalBtn").click(function() {
					if(confirm("아티스트 승인하시겠습니까?")) {
						var num = $(this).parent().parent().children("td").first().text();
						var memCode = $(this).parent().parent().children("input").val();
	
						location.href = "<%=request.getContextPath()%>/permit.ar?num=" + num + "&memCode=" + memCode;
					}
				});
				
				//거절 사유 클릭시
				$(".reasonDiv").click(function() {
					var reason = $(this).parent().children("input").val();
					$("#reasonTd").text('');
					$("#reasonTd").text(reason);
					$("#myModal3").modal();
				});
			});
			
			
			
			</script>
      </article>
   </section>
</body>
</html>