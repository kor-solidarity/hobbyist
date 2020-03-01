<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dh.hobbyist.suggest.model.vo.Reply, com.dh.hobbyist.suggest.model.vo.PageInfo"%>
<%
	ArrayList<Reply> replyList = (ArrayList<Reply>) request.getAttribute("replyList");
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
	.Center_button4 {
		color:darkolivegreen;
	}
	#comDiv {
		width:1024px;
		margin:auto;
	}
	#comTab1 {
		width:100%;
		font-family: Do Hyeon;
		font-size: 25px;
		margin-top:5px;
	}
	.comLab {
		cursor:pointer;
	}
	#comTab2 {
		margin:auto;
		border-collapse:collapse;
	}
	#comTab2 th {
		font-family: Do Hyeon;
		font-size:20px;
		font-weight:lighter;
	}
	#comTab2 td {
		border-bottom: 2px solid darkolivegreen;
    	border-top: 2px solid darkolivegreen;
    	padding: 10px 0;
    	text-align:center;
	}
	#comTab2 tr {
		border-right: 2px solid darkolivegreen;
    	border-left: 2px solid darkolivegreen;
	}
	#comTab2 tr:first-of-type td, #comTab2 tr:nth-of-type(1){
    border-top: none;
    border-bottom: none;
    border-right: none;
    border-left: none;
	}
	#comTab2 td:nth-child(1) {width:80px;} 
	#comTab2 td:nth-child(2) {width:280px;}
	#comTab2 td:nth-child(3) {width:400px;}
	#comTab2 td:nth-child(4) {width:130px;}
	
	#comPagingArea {
		text-align:center;
	}
	.replyContent {
		width:380px;
		padding:0.5px;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	.petitionTitle {
		cursor:pointer;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>hobbyist</title>
</head>
<body>
	<%@ include file="/views/common/myPage.jsp" %>
	<div id="comDiv">
		<table id="comTab1">
			<tr>
				<td width=150px; style="color:darkolivegreen;"><label class="comLab">댓글 내역</label></td>
				<td><label class="comLab">수강문의 댓글 내역</label></td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
		</table>
		<br>
		<table id="comTab2">
			<tr>
				<th>번호</th>
				<th>건의제목</th>
				<th>댓글내용</th>
				<th>날짜</th>
			</tr>
			<% for(Reply r : replyList) { %>
			<tr>
				<td><%=r.getRowNum() %></td>
				<td class="petitionTitle"><%=r.getPetitionTitle() %></td>
				<td><div class="replyContent"><%=r.getReplyContent() %></div></td>
				<td><%=r.getReplyDate() %></td>
				<input type="hidden" value="<%=r.getLessonPetitionCode()%>">
			</tr>
			<%}%>
		</table>
		<br><br>
		<div id="comPagingArea">
			<button onclick="location.href='<%=request.getContextPath() %>/selectMyReplyList.sg?currentPage=1'"><<<</button>
		
			<%if(currentPage <= 1) { %>
				<button disabled><</button>
			<%} else { %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectMyReplyList.sg?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++) {
					if(p == currentPage) {	
			%>
					<button disabled><%= p %></button>
			
			<% 		} else {
			%>
					
					<button onclick="location.href='<%=request.getContextPath()%>/selectMyReplyList.sg?currentPage=<%=p%>'"><%= p %></button>
			
			<%		}
				}
			%>
			<%if(currentPage >= maxPage) { %>
				<button disabled>></button>
			<%} else { %>
				<button onclick="location.href='<%=request.getContextPath() %>/selectMyReplyList.sg?currentPage=<%=currentPage+1 %>'">></button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectMyReplyList.sg?currentPage=<%=maxPage%>'">>>></button>	
		</div>
	</div>
	<br><br><br><br>
	<%@ include file="/views/common/footer.jsp"%>
	<script>
		$(function() {
			$(".petitionTitle").click(function() {
				var num = $(this).parent().children("input").val();
				
				location.href = "<%=request.getContextPath()%>/selectOne.sg?num=" + num;
			});
		});
	</script>
</body>
</html>