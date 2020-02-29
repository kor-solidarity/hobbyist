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
      	.lesson-list {
      		display:inline-block;
      		width:250px;
       		height:300px;
       		margin:auto;
       		margin-right: 65px;
       		margin-bottom:30px;
       		margin-left:20px;
      	}
       
       #lessonTable {
       		font-family: 'Nanum Gothic', sans-serif;
       		font-size:13px;
       		border:1px solid darkolivegreen;
       		border-collapse:separate;
			border-spacing: 5px;
       		
       }
       
       
       #lessonTable td:nth-of-type(2n) {
       		float:right;	
       		margin-right:10px;
       }
       
       #artistNick {
       		font-size: 15px;
       		color:darkolivegreen;
       		font-weight:900;
       		padding-right:11px;
       }
       
       #artistName {
       		padding-right:20px;
       }
       
       #lLabel {
       		margin-top:500px;
       		margin-left:550px;
       		font-family: 'Do Hyeon', sans-serif;
       		/* font-weight:900; */
       		font-size:25px;
       		color:darkolivegreen;
       		align:center;
       }
       
       #lessonImg {
       		width:250px;
       		height:130px;
       }
       #artistImg {
       		width:60px;
       		height:60px;
       		border-radius:50px 50px 50px 50px;
       }
     
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>
	<div id="main">
	 <div id="contents">
    	<p>2020년 첫 시작,<br>
    	취미는 <label style="color:darkolivegreen; font-family: 'ZCOOL QingKe HuangYou', cursive; font-weight:900">hobbyist  </label> 에서!</p>
    </div>
   
  <%--  <form action="<%=request.getContextPath() %>/selectCategory.le" method="post"> --%>
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
  <!--  <label id="lLabel">인기수업</label>
   	<div id="aside">
   		<ul style="list-style:none; line-height:300%; font-family: 'Do Hyeon', sans-serif; font-size:18px; color:darkolivegreen; padding-top:20px;">
   			<li>관심수업</li>
   			<li>인기수업</li>
   			<li>신규아티스트수업</li>
   		</ul>
   	</div> -->
   	
  
	<div id="aside">
	<div id="lTitle">인기수업</div>
   	<div class="aside" id="liked">추천수업</div>
   	<div class="aside"> | </div>
   	<div class="aside" id="popular">인기수업</div>
   	<div class="aside"> | </div>
   	<div class="aside" id="recommended">관심수업</div>
	</div>
	
	
   
    <div class="lesson-list">
   <table id="lessonTable">
   <tr>
   		<td colspan="2"><img src="static/images/coffee.jpg" id="lessonImg"></td>
   </tr>
   	<tr>
   		<td colspan="2">[카페,커피] 2시간이면 나도 바리스타!</td>
   	</tr>
   	<tr>
   		<td></td>
   		<td><img src="static/images/jae.png" id="artistImg"></td>
   	</tr>
   	<tr>
   		<td>(15)</td>
   		<td id="artistNick">재현쌤</td>
   	</tr>
   	<tr>
   		<td>평택</td>
   		<td id="artistName">재현</td>
   	</tr>
   </table>    
   </div> 
    <div class="lesson-list">
   <table id="lessonTable">
   <tr>
   		<td colspan="2"><img src="static/images/coffee.jpg" id="lessonImg"></td>
   </tr>
   	<tr>
   		<td colspan="2">[카페,커피] 2시간이면 나도 바리스타!</td>
   	</tr>
   	<tr>
   		<td></td>
   		<td><img src="static/images/jae.png" id="artistImg"></td>
   	</tr>
   	<tr>
   		<td>(15)</td>
   		<td id="artistNick">재현쌤</td>
   	</tr>
   	<tr>
   		<td>평택</td>
   		<td id="artistName">재현</td>
   	</tr>
   </table>    
   </div> 
    <div class="lesson-list">
   <table id="lessonTable">
   <tr>
   		<td colspan="2"><img src="static/images/coffee.jpg" id="lessonImg"></td>
   </tr>
   	<tr>
   		<td colspan="2">[카페,커피] 2시간이면 나도 바리스타!</td>
   	</tr>
   	<tr>
   		<td></td>
   		<td><img src="static/images/jae.png" id="artistImg"></td>
   	</tr>
   	<tr>
   		<td>(15)</td>
   		<td id="artistNick">재현쌤</td>
   	</tr>
   	<tr>
   		<td>평택</td>
   		<td id="artistName">재현</td>
   	</tr>
   </table>    
   </div> 
    <div class="lesson-list">
   <table id="lessonTable">
   <tr>
   		<td colspan="2"><img src="static/images/coffee.jpg" id="lessonImg"></td>
   </tr>
   	<tr>
   		<td colspan="2">[카페,커피] 2시간이면 나도 바리스타!</td>
   	</tr>
   	<tr>
   		<td></td>
   		<td><img src="static/images/jae.png" id="artistImg"></td>
   	</tr>
   	<tr>
   		<td>(15)</td>
   		<td id="artistNick">재현쌤</td>
   	</tr>
   	<tr>
   		<td>평택</td>
   		<td id="artistName">재현</td>
   	</tr>
   </table>    
   </div> 
    <div class="lesson-list">
   <table id="lessonTable">
   <tr>
   		<td colspan="2"><img src="static/images/coffee.jpg" id="lessonImg"></td>
   </tr>
   	<tr>
   		<td colspan="2">[카페,커피] 2시간이면 나도 바리스타!</td>
   	</tr>
   	<tr>
   		<td></td>
   		<td><img src="static/images/jae.png" id="artistImg"></td>
   	</tr>
   	<tr>
   		<td>(15)</td>
   		<td id="artistNick">재현쌤</td>
   	</tr>
   	<tr>
   		<td>평택</td>
   		<td id="artistName">재현</td>
   	</tr>
   </table>    
   </div> 
    <div class="lesson-list">
   <table id="lessonTable">
   <tr>
   		<td colspan="2"><img src="static/images/coffee.jpg" id="lessonImg"></td>
   </tr>
   	<tr>
   		<td colspan="2">[카페,커피] 2시간이면 나도 바리스타!</td>
   	</tr>
   	<tr>
   		<td></td>
   		<td><img src="static/images/jae.png" id="artistImg"></td>
   	</tr>
   	<tr>
   		<td>(15)</td>
   		<td id="artistNick">재현쌤</td>
   	</tr>
   	<tr>
   		<td>평택</td>
   		<td id="artistName">재현</td>
   	</tr>
   </table>    
   </div> 
   
   
   </div>
   </div>
  
	<%@ include file="views/common/footer.jsp" %>
	
	<script>
		<%-- function category() {
			location.href = "<%=request.getContextPath()%>/views/lesson/categoryMenu.jsp";
			
		} --%>
		

			 $(function() {
				
				$("#music").click(function() {
					location.href = "<%= request.getContextPath()%>/selectMusic.le";
				});
				
				$("#dance").click(function() {
					location.href = "<%= request.getContextPath()%>/selectDance.le";
				});
				
				$("#video").click(function() {
					location.href = "<%= request.getContextPath()%>/selectVideo.le";
				});
				
				$("#life").click(function() {
					location.href = "<%= request.getContextPath()%>/selectLife.le";
				});
				
				$("#beauty").click(function() {
					location.href = "<%= request.getContextPath()%>/selectBeauty.le";
				});
				
				$("#design").click(function() {
					location.href = "<%= request.getContextPath()%>/selectDesign.le";
				});
				
				$("#sports").click(function() {
					location.href = "<%= request.getContextPath()%>/selectSports.le";
				});
				
				
				/* 
				var $parent = $("#parentCode");
				
				
				if($("#music").data('clicked')) {
					$parent.val('1');
				}else if($("#dance").data('clicked')) {
					$parent.val('9');
				}else if($("#video").data('clicked')) {
					$parent.val('15');
				}else if($("#life").data('clicked')) {
					$parent.val('20');
				}else if($("#beauty").data('clicked')) {
					$parent.val('25');
				}else if($("#design").data('clicked')) {
					$parent.val('33');
				}else if($("#sports").data('clicked')) {
					$parent.val('37');
				}
				
				
				console.log($("#parentCode").val());
				console.log(typeof $("#parentCode").val()); */
			}); 
		
			
	
	</script>
</body>
</html>