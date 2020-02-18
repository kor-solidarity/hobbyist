<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dh.hobbyist.member.model.vo.Member"%>
<%
	Member loginMember = (Member) session.getAttribute("loginMember"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<style>
        #header {
           height:75px;
            
        }
        #headerInfo {
            margin:auto;
            width:1024px;
        }
       
        #headerInfo td {
            width:80px;
            font-family: 'Do Hyeon', sans-serif;
            color: darkolivegreen;
            text-align: center;
            cursor:pointer;
        }
        #headerLab {
            font-family: 'ZCOOL QingKe HuangYou', cursive;
            font-size: 50px;
            font-weight: bold;
            color: darkolivegreen;
            cursor:pointer;
        }
       
        #searchArea {
            border-style: solid;
            border-color: darkolivegreen;
            width:400px;
            height:30px;
            margin:auto;
            border-top-left-radius:50px;
            border-bottom-left-radius: 50px;
            border-top-right-radius: 50px;
            border-bottom-right-radius: 50px;
        }
        #suggestArea, #registerArea {
            border-style: solid;
            border-color: darkolivegreen;
            border-top-left-radius:50px;
            border-bottom-left-radius: 50px;
            border-top-right-radius: 50px;
            border-bottom-right-radius: 50px; 
            cursor:pointer;
        }
        #suggestArea {
        	height:23px; 
        	line-height:23px;
        }
        #registerArea {
        	margin-left:15px; 
        	margin-right:25px;
        	height:23px; 
        	line-height:23px;
        }
        #jihoImg1 {
        	height:28px; 
        	float:right; 
        	margin-right:10px;
        }
        #jihoSearch {
        	width:300px; 
        	border:none; 
        	height:20px; 
        	text-align: center;
        }
        #jihoSearch:focus {
            outline:none;
        }
        #artistTd {
        	cursor:pointer;
        }
        
        #selectList {
        	border:1px solid white;
        }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
</head>
<body>
 	<div id="header">
        <table id="headerInfo">
            
            <tr>
                <td rowspan="2"><label id="headerLab" onclick="goHome();">hobbyist</label></td>
                <td style="width:500px" rowspan="2"><div id="searchArea">
                    <input type="text" id="jihoSearch" placeholder="듣고싶은 수업을 검색해주세요">
                    <img id="jihoImg1" src="<%=request.getContextPath() %>/static/images/search.png"></div></td>
                <td style="width:40px"><img src="<%=request.getContextPath() %>/static/images/bell.png" style="height:25px"></td>
                <td id="artistTd" onclick="goArtist();" >아티스트신청</td>
                <td onclick="goMyPage();">마이페이지</td>
                <%if(loginMember == null) { %>
                <td onclick="goLogin();">로그인</td>
                <% }else { %>
                <td style="padding-bottom:5px;"><%=loginMember.getMemberName() %>님  <img src="/hobbyist/static/images/logoutIcon3.png" id="logoutBtn" style="width:16px; height:16px; vertical-align:middle;" onclick="goLogout();"> </td>
                <% } %>
                
            </tr>
            <tr>
                <td colspan="2"><div id="suggestArea" onclick="goSuggest();">수업건의 게시판</div></td>
                <td colspan="2"><div id="registerArea" onclick="goClass();">수업개설</div></td>
            </tr>
        </table>
        
    </div>
    <script>
    	function goArtist() {
    		location.href = "<%=request.getContextPath()%>/views/artist/artistMain.jsp";
    	}
    	
    	function goLogin() {
    		location.href = "<%= request.getContextPath()%>/views/member/loginForm.jsp";
    	}
    	
    	function goLogout() {
    		location.href = "<%= request.getContextPath()%>/logout.me";
    	}
    	
    	function goHome() {
    		location.href = "<%= request.getContextPath()%>/index.jsp";
    	}
    	
    	function goSuggest() {
    		location.href = "<%= request.getContextPath()%>/views/suggest/suggestList.jsp";
    	}
    	
    	function goClass() {
    		location.href = "<%= request.getContextPath()%>/views/lesson/openLessonMain.jsp";
    	}
    	function goMyPage() {
    		location.href = "<%= request.getContextPath()%>/views/member/myPage/myLesson/registeredLesson.jsp";
    	}
    	
    </script>
</body>
</html>