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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

#suggestSearchBtn {
	background: darkolivegreen;
	color: white;
	padding: 5px;
	border: 1px solid darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
}

#suggestWriteBtn {
	font-family: 'Do Hyeon', sans-serif;
}

#suggestListArea {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}

.suggest-list {
	width: 220px;
	border: 1px solid white;
	display: inline-block;
	margin: 10px;
}

#suggestListTable {
	border: 1.5px solid darkolivegreen;
	border-radius:5px;
	height: 150px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
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
	<div id="suggestCategory">
		<table style="margin: auto; border-spacing: 15px;">
			<tr>
				<td><select style="height: 30px;">
						<option>카테고리</option>
						<option>음악</option>
				</select></td>
				<td><select style="height: 30px;">
						<option>상세카테고리</option>
						<option>작사/작곡</option>
				</select></td>
				<td><input type="text" placeholder="검색할 건의 키워드를 입력하세요"
					style="height: 25px; width: 350px;"></td>

				<td>
					<button id="suggestSearchBtn" style="height: 30px; width: 70px;">검색</button>
				</td>
				<td>
					<% if(loginMember != null) { %>
					<button id="suggestWriteBtn" style="height: 30px; width: 80px;">글쓰기</button>
					<%} %>
				</td>
			</tr>
		</table>

	</div>
	<div id="suggestListArea">
		<% for(Petition p : suggestList) { %>
			<div class="suggest-list" align="center">
			<input type="hidden" value="<%=p.getPetitionCode() %>">
				<!--4행 3열-->
				<table id="suggestListTable">
					<tr>
						<td colspan="2"><%=p.getTitle()%></td>
						<td style="width:70px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td rowspan="2" style="text-align:right;">
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
					<td><img src="/hobbyist/static/images/dialogicon.png" style="width:20px; height:20px"> (<%=p.getViews() %>)</td>
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
	<div class="SuggestPagingArea" align="center">
		<button onclick="location.href='<%=request.getContextPath() %>/selectList.sg?currentPage=1'"><<<</button>
		
		<%if(currentPage <= 1) { %>
			<button disabled><</button>
		<%} else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.sg?currentPage=<%=currentPage -1%>'"><</button>
		<%} %>
		
		<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage) {	
		%>
				<button disabled><%= p %></button>
		
		<% 		} else {
		%>
				
				<button onclick="location.href='<%=request.getContextPath()%>/selectList.sg?currentPage=<%=p%>'"><%= p %></button>
		
		<%		}
			}
		%>
		<%if(currentPage >= maxPage) { %>
			<button disabled>></button>
		<%} else { %>
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.sg?currentPage=<%=currentPage+1 %>'">></button>
		<% } %>
		<button onclick="location.href='<%=request.getContextPath()%>/selectList.sg?currentPage=<%=maxPage%>'">>>></button>	
	</div>
	<br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
	<script>
		$(function(){
			$(".suggest-list").click(function(){
				var num = $(this).children("input").val();
				console.log(num);
				location.href = "<%=request.getContextPath()%>/selectOne.sg?num=" + num;
			});
	    	$("#suggestWriteBtn").click(function(){
	    		location.href = "<%=request.getContextPath()%>/views/suggest/suggestInsertForm1.jsp";
	    	});
		});
    </script>
</body>
</html>