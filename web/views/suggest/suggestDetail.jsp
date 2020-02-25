<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dh.hobbyist.suggest.model.vo.*, java.util.List"%>
<%
	Petition petition = (Petition) request.getAttribute("petition");
	List<Reply> replyList = (List<Reply>) request.getAttribute("replyList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#suggestDiv1 {
	margin-top: 10px;
	margin: auto;
	height: 250px;
	width: 1024px;
	background-image: url("/hobbyist/static/images/suggestback.png");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	}
	#label1 {
	font-family: 'Do Hyeon', sans-serif;
	color: darkolivegreen;
	font-size: 30px;
	}
	#suggestDetailDiv1 {
	width: 900px;
	/* height: 500px; */
	margin-left: auto;
	margin-right: auto;
	}
	#suggestDetaiTab1 {
	width:100%;
	font-family: 'Do Hyeon', sans-serif;
	color:darkolivegreen;
	margin:auto;
	margin-top:30px;
	}
	#suggestTd1 {
	font-size:18px;	
	}
	#suggestTd2 {
	font-family:initial; 
	color:#3c3c3c;
	}
	#addReply {
	height:50px;
	margin-top:-5px;
	}
	#goListBtn {
	width:100px; 
	height:30px;
	background-color:darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
	color:white;
	padding: 5px;
	border: 1px solid darkolivegreen;
	background-color: darkolivegreen;
	}
	#replySelectArea {
		width:850px;
	}
	#replySelectTable {
		width:100%;
	}
	.box {
		width: 70px;
    	height: 70px; 
   	 	border-radius: 70%;
    	overflow: hidden;
	}
	.profile {
		width:100%;
		height:100%;
		object-fit: cover;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>hobbyist</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="suggestDiv1">
		<table>
			<tr style="height: 150px;">
				<td></td>
			</tr>
			<tr>
				<td><label id="label1">지금 하비스트와 함께<br>시작해보세요
				</label></td>
			</tr>
		</table>
	</div>
	<div id="suggestDetailDiv1">
		<table id="suggestDetaiTab1">
			<tr>
				<td colspan="2" style="font-size:22px;">수업건의하기</td>
				<td colspan="2" style="font-size:16px; text-align:right; color:#3c3c3c;"><label><%=petition.getMemberName() %></label>|<label><%=petition.getPetitionedTime() %></label>|조회<label><%=petition.getViews() %></label></td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.5px darkolivegreen;"></td>
			</tr>
			<tr>
				<td style="font-size:20px;">건의 제목</td>
				<td colspan="3" style=" font-family:initial; font-weight:bold; color:#3c3c3c;"><%=petition.getTitle() %></td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td id="suggestTd1">카테고리</td>
				<td id="suggestTd2">
					<% if(petition.getCategoryParentCode() == 1) { %>
							음악
					<%} else if(petition.getCategoryParentCode() == 9) { %>
							댄스
					<%} else if(petition.getCategoryParentCode() == 15) { %>
							영상/사진
					<%} else if(petition.getCategoryParentCode() == 20) { %>
							라이프스타일
					<%} else if(petition.getCategoryParentCode() == 25) { %>
							뷰티
					<%} else if(petition.getCategoryParentCode() == 33) { %>
							디자인
					<%} else if(petition.getCategoryParentCode() == 37) { %>
							스포츠
					<%} %>	
				</td>
				<td id="suggestTd1">상세 카테고리</td>
				<td id="suggestTd2"><%= petition.getCategoryName() %></td>
			</tr>
			<tr>
				<td id="suggestTd1">수업 인원</td>
				<td colspan="3" id="suggestTd2"><%=petition.getNumOfStudents() %></td>
			</tr>
			<tr>
				<td id="suggestTd1">수업료 (회차당)</td>
				<td id="suggestTd2"><%=petition.getCost() %>원</td>
				<td id="suggestTd1">수업회차</td>
				<td id="suggestTd2">
					<% if(petition.getNumOfLessons() == 1) { %>
						다회차
					<%} else {%>
						일회차
					<%} %>
				</td>
			</tr>
			<tr>
				<td id="suggestTd1">희망 지역</td>
				<td id="suggestTd2"><%=petition.getLocation() %></td>
				<td id="suggestTd1">희망일자</td>
				<td id="suggestTd2"><%=petition.getRequestedDate() %></td>
			</tr>
			<tr>
				<td id="suggestTd1">수업 요일</td>
				<td id="suggestTd2">
					<% if(petition.getRequestedDays().equals("weekday")) { %>
						평일
					<%} else if(petition.getRequestedDays().equals("weekend")) { %>
						주말
					<%} else { %>
						무관
					<%} %>
				</td>
				<td id="suggestTd1">수업 시간</td>
				<td id="suggestTd2">
					<% if(petition.getRequestTime().equals("dawn")) { %>
						새벽반
					<%} else if(petition.getRequestTime().equals("am")) { %>
						오전반
					<%} else if(petition.getRequestTime().equals("pm")) { %>
						오후반
					<%} else if(petition.getRequestTime().equals("evening")) { %>
						저녁반
					<%} else { %>
						무관
					<%} %>
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="2" style="font-size:20px;">건의 내용</td>
				<td style="text-align:right;">
					<img src="/hobbyist/static/images/emptyheart.png" style="width:30px; height:30px;">
				</td>
				<td style="color:#3c3c3c;">
					수업 찜하기
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="4" style="font-family:initial; color:black;">
					<p>
						<%=petition.getContents() %>
					</p>
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="4" style="text-align:right;">
					신고
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="4" style="font-size:20px;">이 건의로 개설된 수업</td>
			</tr>
			<tr>
				<td colspan="4" style="font-family:initial; color:black;">
					- 아티스트 : 김혜원 / 제목 : 진짜 야구를 알려줄께요
				</td>
			</tr>
			<tr>
				<td colspan="4" style="font-family:initial; color:black;">
					- 아티스트: 이지호 / 제목 : 한방에 홈런
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="4">댓글 <label id="replyCount"><%=replyList.size() %></label></td>
			</tr>
		</table>
		<div class="replyArea">
      		<div class="replyWriteArea">
         		<table align="center">
      
            		<tr>
              			<td><textArea rows="3" cols="80" id="replyContent" style="resize:none;" placeholder="댓글로 수업에 동참해보세요!(50자 이상 기재)"></textArea></td>
               			<td>
               				<%if(loginMember != null) { %>
               					<button id="addReply">댓글 등록</button>
               				<%} else { %>
               					<button id="noneLogin" onclick="noneLogin();">댓글 등록</button>
               				<%} %>
               			</td>
            		</tr>
         		</table>
     		 </div>
     		 <br>
      		 <div id="replySelectArea">
         		<table id="replySelectTable" align="center">
         			<% for(Reply r : replyList) { %>
         				<tr>
         					<input type="hidden" value="<%=r.getReplyCode() %>">
         					<td rowspan="2">
         						<% if(!r.getImageRoot().equals("null/null")) { %>
         							<div class="box">
	         							<img class="profile" src = "<%=r.getImageRoot() %>">
         							</div>
         						<%} else { %>
         							<div class="box">
         								<img class="profile" src = "/hobbyist/static/images/user.png">
         							</div>
         						<%} %>
         					</td>
         					<td style="color:darkolivegreen; font-family: 'Do Hyeon', sans-serif;"><%=r.getMemberName()%></td>
         					<td style="width:500px;"></td>
         					
         					<td><%=r.getReplyDate() %></td>
         					<td style="color:darkolivegreen;">신고</td>
         				</tr>
         				<tr>
							<td colspan="4"><%=r.getReplyContent() %></td>         				
         				</tr>
         				<tr>
         					<td colspan="5"><hr></td>
         				</tr>
         			<%} %>
         		</table>
      		 </div>
   		</div>
   		<br><br><br>
   		<div style="text-align:center;">
   			<button id="goListBtn" onclick="goList();">목록보기</button>
   		</div>
   		<script>
   			function goList() {
   				location.href = "<%=request.getContextPath()%>/selectList.sg";
   			}
   			
   			function noneLogin() {
   				alert("로그인 후 진행해주세요.");
   			}
   			
   			$(function() {
   				
   				$("#addReply").click(function() {
   					
	   				var writer = <%=loginMember.getMemberCode()%>;
   					var pid = <%= petition.getPetitionCode()%>;
   					var content = $("#replyContent").val();
   					
   					
   					$.ajax({
   						url: "/hobbyist/insertReply.sg",
   						data: {
   							writer: writer,
   							pid: pid,
   							content: content
   						},
   						type : "post",
   						success: function(data) {
   							var $replySelectTable = $("#replySelectTable");
   							$replySelectTable.html('');
   							$("#replyCount").text(data.length);
   							//console.log(data.length);
   							for(var key in data) {
   								var str = "<tr><input type='hidden' value=" + data[key].replyCode + ">";
   								str += "<td rowspan='2'>";
   								if(data[key].imageRoot != "null/null") {
   									str += "<div class='box'><img class='profile' src = " + data[key].imageRoot + "></div>";
   								} else {
   									str += "<div class='box'><img class='profile' src = '/hobbyist/static/images/user.png'></div>";
   								}
   								str += "</td><td style=" + "color:darkolivegreen; font-family: 'Do Hyeon', serif;" + ">" + data[key].memberName + "</td>";
   								str += "<td style='width:500px;'></td>";
   								str += "<td>" + data[key].replyDate + "</td>";
   								str += "<td style='color:darkolivegreen;'>신고</td>";
   								str += "</tr><tr><td colspan='4'>" + data[key].replyContent + "</td></tr>";
   								str += "<tr><td colspan='5'><hr></td></tr>";
   								//var $tr = $("<tr>");
   								/* var $writerTd = $("<td>").text(data[key].memberName).css("width", "100px");
   								var $contentTd = $("<td>").text(data[key].replyContent).css("width", "400px");
   								var $dateTd = $("<td>").text(data[key].replyDate).css("width", "200px");
   								
   								$tr.append($writerTd);
   								$tr.append($contentTd);
   								$tr.append($dateTd);
   								 */
   								
   								$replySelectTable.append(str);
   							} 
   						},
   						error: function(error) {
   							console.log(error);
   						}
   						
   					});
   				});
   			});
   		</script>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>