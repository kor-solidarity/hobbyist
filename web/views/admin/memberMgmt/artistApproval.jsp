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
    #approvalBtn {
    	background-color:#3D74CD;
    	color:white;
    	padding: 5px;
    	font-size:15px;
    	border-radius:5%;
    	height:30px;
	    border: 1px solid #3D74CD;
    }
    #refuseBtn {
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
    #checkModalBtn, #checkArtistBtn {
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
    #registerText {
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
               		<td id="registerText" style="text-decoration: underline;"><%=aa.getApplyMemberId() %>님의 등록글</td>
               		<td><%=aa.getApplyDate() %></td>
               		<td>
	               		<%
	               			if(aa.getApplyConfirmed() == 0) {
	               		%> 	
	               			<button id="approvalBtn">승인</button> &nbsp;
	                   		<button id="refuseBtn">거절</button>
	               		<%} else {
	               			if(aa.getRejectReason() == null) {
	               			%>
	               				승인 처리됨
	               			<%
	               			} else {
	               			%>
	               				거절 처림됨
	               			<%	
	               			}
	               		} %>
               		</td>
               		<td>
               			<%
               				if(aa.getRejectReason() != null) {
               			%>
               				<a><%=aa.getApplyMemberId() %>님의 거절사유</a>
               			<%
               				} 
               			%>
               		</td>
               	</tr>
               <% } %>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td id="registerText" style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn" class="btn btn-info btn-lg">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	<button id="approvalBtn">승인</button> &nbsp;
                   	<button id="refuseBtn">거절</button>
                   </td>
                   <td></td>
               </tr>
               <tr>
                   <td>3</td>
                   <td>hyeon0705</td>
                   <td style="text-decoration: underline;">hyeon0705님의 등록글</td>
                   <td>2020-01-26<br>18:14:20</td>
                   <td>
                   	거절 처리됨
                   </td>
                   <td style="text-decoration: underline;">hyeon0705님의 거절 사유</td>
               </tr>
               
            </table>
            <script>
            	$("#approvalBtn").click(function() {
					if(confirm("아티스트 승인하시겠습니까?")) {
						
					}
				});
            </script>
         </div>
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
										<textarea rows="5" cols="40" style="resize:none; width:500px; height:300px;" placeholder="입력하신 거절 사유가 회원의 알림으로 보내지게 됩니다."></textarea>
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
			<script>
				$(document).ready(function() {
					$("#refuseBtn").click(function() {
						$("#myModal1").modal();
					});
				});
			</script>
			
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
												<img class="profile" src="/hobbyist/static/images/seolhyun.png">
											</div>
										</td>
										<td>hyeon</td>
									</tr>
									<tr>
										<td colspan="2">안녕하세요 현직 바리스타 hyeon입니다~!! :D 사실 저는 처음부터
											바리스타는 아니었습니다. 주말에 친척 카페에 일손을 도와 드리러 몇 번 간 것이 회사에서는 느껴보지 못했던
											에너지와 활력이 들정도로 매력적이었습니다. 그렇게 시작했고 남들보다 늦었다는 생각에 초반에는 실무를 배우면서도
											따로 공부를 많이 했습니다. 기회가 된다면 이런 것들을 더 많은 분들과 나누고 싶다는 생각에 등록하게
											되었습니다~</td>
									</tr>
									<tr>
										<td>계좌번호</td>
										<td>신한 김설현 11041259260</td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td colspan="2" class="emp">전문분야 및 상세분야</td>
									</tr>
									<tr>
										<td>라이프 스타일</td>
										<td>커피/차</td>
									</tr>
									<tr>
										<td>라이프 스타일</td>
										<td>요리/베이킹</td>
									</tr>
									<tr>
										<td>음악</td>
										<td>기타연주</td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td colspan="2" class="emp">보유 자격증</td>
									</tr>
									<tr>
										<td colspan="2">커피 바리스타 자격증 1급<br>(2019.01.20, 커피협회)
										</td>
									</tr>
									<tr>
										<td colspan="2">베이킹 자격증<br>(2019.07.06, 베이킹협회)
										</td>
									</tr>
									<tr>
										<td>첨부파일</td>
										<td><a href="#">[다운로드]</a></td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td colspan="2" class="emp">학력/전공</td>
									</tr>
									<tr>
										<td colspan="2">경민대학교 호텔조리학과 졸업</td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td colspan="2" class="emp">경력</td>
									</tr>
									<tr>
										<td colspan="2">스타벅스 매니저 / 관리 및 음료 제조 / 3년 2개월</td>
									</tr>
									<tr>
										<td colspan="2">개인카페 사장 / 가게 운영 및 음료 제조 / 8개월</td>
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
			$(document).ready(function() {
				$("#registerText").click(function() {
					var num = $(this).parent().children("input").val();
					//console.log(num);
					$("#myModal2").modal();
				});
			});
			
			</script>
      </article>
   </section>
</body>
</html>