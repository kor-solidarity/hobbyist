<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<style>
	
		
	
        #contents {
        	/* margin:auto;
        	 width:1024px; */ 
    		margin-top:-40px;
        	background-image:url("static/images/resize_main.jpg");
        	background-size:100% 100%;
        	background-repeat: no-repeat;
        }
       
       p {
       		padding-top:230px;
       		padding-left:50px;
       		color:white;
       		font-family: 'Do Hyeon', sans-serif;
       		font-size:52px;
       } 
       #nav {
       		
       		height:100px;
       		width:1024px;
       		margin:auto;
       		margin-top:-55px;
       		cursor:pointer;
       		
       }
       .icon {
       		width:50px;
       		height:50px;
       		 margin-top:15px; 
       		/* display:inline-block;*/
      		margin:35px;
      		margin-top:15px;
      		margin-bottom:5px;
      		align:center; 
       }
       #line {
       		border-top:2.5px solid darkolivegreen;	
    		height:3px;
       }
       
       .nLabel {
       		font-family: 'Do Hyeon', sans-serif;
       		font-size:15px;
       		color:darkolivegreen;
       		text-align:center;
       		
       }
       
       #section {
       		width:1024px;
       		height:800px;
       		margin:auto;
       		margin-top:40px;
       }
       
       /* #aside {
       		margin-top:-52px;
       		width:170px;
       		border-right:1px solid darkolivegreen;
       		height:300px;
       } */
       #aside {
       	 height:70px;
       	 margin-top:-10px;
       	 margin-right:55px;
       	 margin-bottom:20px;
       	 
       }
       
       
       .aside {
       		display:inline;
			font-family: 'Nanum Gothic', sans-serif;
       		font-size:16px;
       		font-weight:900;
       		color:darkolivegreen;
       		float:right;
       		margin-right:15px;

       }

       #lTitle {
       		/* font-family: 'Do Hyeon', sans-serif; */
       		font-family: 'Nanum Gothic', sans-serif;
       		color:darkolivegreen;
       		font-size:25px;
       		text-align:center;
       		font-weight:900;
       		
       }
       
       #liked, #popular, #interested {
     	cursor:pointer;
       }
       
      	
     
     
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>

	 <div id="contents">
    	<p>2020년 첫 시작,<br>
    	취미는 <label style="color:darkolivegreen; font-family: 'ZCOOL QingKe HuangYou', cursive; font-weight:900">hobbyist  </label> 에서!</p>
    </div>
   

   <div id="nav">
	<table align="center">
   	<tr>
   		<td><img src="static/images/music.png" class="icon" id="music"></td>
   		<td><img src="static/images/dance.png" class="icon" id="dance"></td>
   		<td><img src="static/images/video.png" class="icon" id="video"></td>
   		<td><img src="static/images/life.png" class="icon" id="life"></td>
   		<td><img src="static/images/beauty.png" class="icon" id="beauty"></td>
   		<td><img src="static/images/design.png" class="icon" id="design"></td>
   		<td><img src="static/images/sports.png" class="icon" id="sports"></td>
   		<td><img src="static/images/space.png" class="icon" id="space"></td>
   	</tr>
   	<tr>
   		<td class="nLabel" id="music">음악</td>
   		<td class="nLabel" id="dance">댄스</td>
   		<td class="nLabel" id="video">영상/사진</td>
   		<td class="nLabel" id="life">라이프스타일</td>
   		<td class="nLabel" id="beauty">뷰티</td>
   		<td class="nLabel" id="design">디자인</td>
   		<td class="nLabel" id="sports">스포츠</td>
   		<td class="nLabel" id="space">공간대여</td>
   	</tr>
   </table>
    </div>
  
   
   <div id="line"></div>
   <div id="section">

   	
  
	<div id="aside">
	<div id="lTitle">인기수업</div>
   	<div class="aside" id="liked">추천수업</div>
   	<div class="aside"> | </div>
   	<div class="aside" id="popular">인기수업</div>
   	<div class="aside"> | </div>
   	<div class="aside" id="interested">관심수업</div>
	</div>
	</div>

  
	<%@ include file="views/common/footer.jsp" %>
	
	<script>
		
			$(document).ready(function() {
			location.href = "<%= request.getContextPath()%>/selectPopular.le";
				
			});

	</script>
</body>
</html>