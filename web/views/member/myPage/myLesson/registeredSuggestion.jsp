<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dh.hobbyist.suggest.model.vo.Petition, com.dh.hobbyist.suggest.model.vo.PageInfo" %>
<%
	ArrayList<Petition> suggestList = (ArrayList<Petition>) request.getAttribute("suggestList");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#regSugDiv1 {
		width:1024px;
		margin:auto;
	}
	#regSugTab1 {
		width:100%;
		font-family: Do Hyeon;
		font-size: 22px;
		margin-top:5px;
	}
	#regSubTab1 td {
		width:130px;
	}
	.Center_button1 {
		color:darkolivegreen;
	}
	.regSubList {
		width: 220px;
		border: 1px solid white;
		display: inline-block;
		margin: 10px;
	}
	#regSubTab2 {
		border: 1.5px solid darkolivegreen;
		border-radius:5px;
		height: 160px;
	}
	.regSugLab {
		cursor:pointer;
	}
	#suggestMyListArea {
		width:1000px;
		margin-left: 15px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>hobbyist</title>
</head>
<body>
	<%@ include file="/views/common/myPage.jsp" %>
	<div id="regSugDiv1">
		<table id="regSugTab1">
			<tr>
				<td style="text-align: center;"><label class="regSugLab">수강한 수업</label></td>
				<td style="text-align: center;"><label class="regSugLab">찜한 수업</label></td>
				<td style="text-align: center; color:darkolivegreen;" onclick="goRegSug();"><label class="regSugLab">등록한 건의</label></td>
				<td style="text-align: center;" onclick="goLikedSug();"><label class="regSugLab">찜한 건의</label></td>
				<td style="text-align: center;"><label class="regSugLab">개설한 수업</label></td>
				<td style="width:374px;"></td>
			</tr>
			<tr>
				<td colspan="6"><hr></td>
			</tr>
		</table>
		<script>
			function goLikedSug() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/likedSuggestion.jsp";
			}
			function goRegSug() {
				location.href = "<%=request.getContextPath()%>/views/member/myPage/myLesson/registeredSuggestion.jsp";				
			}
		</script>
		<br>
		<div id="suggestMyListArea">
			<% for(Petition p : suggestList) { %>
				<div class="regSubList">
				<input type="hidden" value="<%=p.getPetitionCode() %>">
					<table id="regSubTab2">
						<tr>
							<td colspan="2"><%=p.getTitle() %></td>
							<td style="width: 70px;"></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td rowspan="2" style="text-align: right;">
								<% if(p.getCategoryParentCode() == 1) { %>
								 	<img src="/hobbyist/static/images/music.png" style="width:50px; height:50px;">
								<%} else if(p.getCategoryParentCode() == 9) { %>
									<img src="/hobbyist/static/images/dance.png" style="width:50px; height:50px;">
								<%} else if(p.getCategoryParentCode() == 15) { %>
									<img src="/hobbyist/static/images/video.png" style="width:50px; height:50px;">
								<%} else if(p.getCategoryParentCode() == 20) { %>
									<img src="/hobbyist/static/images/life.png" style="width:50px; height:50px;">
								<%} else if(p.getCategoryParentCode() == 25) { %>
									<img src="/hobbyist/static/images/beauty.png" style="width:50px; height:50px;">
								<%} else if(p.getCategoryParentCode() == 33) { %>
									<img src="/hobbyist/static/images/design.png" style="width:50px; height:50px;">
								<%} else if(p.getCategoryParentCode() == 37) { %>
									<img src="/hobbyist/static/images/sports.png" style="width:50px; height:50px;">
								<%} %>
							</td>
						</tr>
						<tr>
							<td><img src="/hobbyist/static/images/heart.png" style="width:20px; height:20px;"> (<%=p.getWishlisted() %>)</td>
							<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (<%=p.getReplyCount() %>)</td>
						</tr>
						<tr>
							<td colspan="2"><%=p.getLocation() %>/<%=p.getNumOfStudents() %></td>
							<td style="text-align:right; color:darkolivegreen; font-weight:bold;"><%=p.getMemberName() %></td>
						</tr>
					</table>
				</div>
				<%} %>
		</div>
		
		<br><br>
		<div class="regSugPagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/selectMyList.sg?currentPage=1'"><<<</button>
			
			<%if(currentPage <= 1) { %>
				<button disabled><</button>
			<%} else { %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectMyList.sg?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++) {
					if(p == currentPage) {	
			%>
					<button disabled><%= p %></button>
			
			<% 		} else {
			%>
					
					<button onclick="location.href='<%=request.getContextPath()%>/selectMyList.sg?currentPage=<%=p%>'"><%= p %></button>
			
			<%		}
				}
			%>
			<%if(currentPage >= maxPage) { %>
				<button disabled>></button>
			<%} else { %>
				<button onclick="location.href='<%=request.getContextPath() %>/selectMyList.sg?currentPage=<%=currentPage+1 %>'">></button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectMyList.sg?currentPage=<%=maxPage%>'">>>></button>	
		
		</div>
		
	</div>
	<br><br><br><br>
	<%@ include file="/views/common/footer.jsp"%>
	<script>
		$(function() {
			$(".regSubList").click(function() {
				var num = $(this).children("input").val();
				
				location.href = "<%=request.getContextPath()%>/selectOne.sg?num=" + num;
			});
		});
	</script>
</body>
</html>