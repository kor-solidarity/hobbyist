<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        }
        #headerLab {
            font-family: 'ZCOOL QingKe HuangYou', cursive;
            font-size: 50px;
            font-weight: bold;
            color: darkolivegreen;
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
    </style>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
</head>
<body>
 	<div id="header">
        <table id="headerInfo">
            
            <tr>
                <td rowspan="2"><label id="headerLab">hobbyist</label></td>
                <td style="width:500px" rowspan="2"><div id="searchArea"><input type="text" id="jihoSearch" placeholder="듣고싶은 수업을 검색해주세요"><img id="jihoImg1" src="<%=request.getContextPath() %>/images/search.png"></div></td>
                <td style="width:40px"><img src="<%=request.getContextPath() %>/images/bell.png" style="height:25px"></td>
                <td id="artistTd" onclick="goArtist();" >아티스트신청</td>
                <td>마이페이지</td>
                <td onclick="login();">로그인</td>
            </tr>
            <tr>
                <td colspan="2"><div id="suggestArea">수업건의 게시판</div></td>
                <td colspan="2"><div id="registerArea">수업개설</div></td>
            </tr>
        </table>
        
    </div>
    <script>
    	function goArtist() {
    		location.href = "<%=request.getContextPath()%>/views/artist/artistMain.jsp";
    	}
    	
    	function login() {
    		location.href = "<%= request.getContextPath()%>/views/member/loginForm.jsp";
    	}
    </script>
</body>
</html>