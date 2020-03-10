<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.HashMap, com.dh.hobbyist.common.model.vo.PageInfo"%>
<%
	ArrayList<HashMap<String, Object>> list
			= (ArrayList<HashMap<String, Object>>) request.getAttribute("list");

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hobbyist</title>
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
       		border-top:1.5px solid darkolivegreen;	
    		/* height:1px; */
       }
       
       .nLabel {
       		font-family: 'Do Hyeon', sans-serif;
       		font-size:15px;
       		color:darkolivegreen;
       		text-align:center;
       		
       }
       
       #section {
       		width:1024px;
       		height:1300px;
       		margin:auto;
       		margin-top:40px;
       }
       
      
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
       
       #new, #popular, #interested {
     	cursor:pointer;
       }
       
      	.lesson-list {
			display:inline-block;
			width:265px;
			height:315px;
			border:1px solid black;
			margin:auto;
			margin-right:70px;
			margin-bottom:60px;
			margin-top:5px;

		
		}
		#lessonTable {
			font-family: 'Nanum Gothic', sans-serif;
			width:265px;
			height:315px;
			display: block;
			font-size:13px;
			border-collapse:separate;
			border-spacing: 5px;
			/* display:block;  */
			table-layout:fixed;
			cursor:pointer;
			
			
		}
		#lessonName {
			width:250px;	
			font-family: 'Nanum Gothic', sans-serif;
			font-size:14px;
			font-weight:900;
			/* margin-bottom:10px; */
			white-space: nomal;
			 overflow: hidden;
			text-overflow: ellipsis;
			text-align: left;
			display: -webkit-box;
			-webkit-line-clamp: 2;
			 -webkit-box-orient: vertical; 
			word-wrap: break-all;
			word-wrap:break-word;
			/* height:3.6em; */
			margin-bottom: 75px;
			margin-top:5px;
			
		}
		#lessonImgArea {
			display:block;
			width:265px;
			height:140px;
			margin-left: -5.5px; 
			margin-top: -5px; 
		}
		
		
		
		
		#lessonImg {
			width:265px;
			height:140px;
			
		}
		
		.lesson-list:eq(0) #lessonImg {
			margin-left: -5px;
		}
		
		#artistImg {
			postion: absolute;
			width:65px;
			height:65px;
			border-radius:50px 50px 50px 50px;
			float:right;
			 margin-left: -300px; 
			
			
			
		}
		
		
		 #artistNick {
				
	       		font-size: 15.5px;
	       		color:darkolivegreen;
	       		font-weight:900;
	       		
	    }
	       
	       #artistName {
	       	
	       		padding-bottom:5px;
	       		
	    }
	    
	    #artistNick, #artistName {
	    	
	    	display:block;
	    	text-align:center;
	    	width:100px;
	    	margin-left: 60px;
	    }
	    
	   /*  #lessonCount {
	    	font-family: 'Nanum Gothic', sans-serif;
			font-size:15.5px;
			font-weight:900;
			margin-bottom:20px;
			color:darkolivegreen;
	    } */
	    #artistImgArea {
	    	display:block; 
			 margin-top: 20px; 
			 margin-left:-110px;
	    	
	    }  
	    
	    #star {
	    	color:darkolivegreen;
	    	font-size:17px;
	    }
	    
	    #star, #lessonArea {
	    	display: block;
	    	text-align:center;
	    	width:90px;
	    	 
	    }
	    #lessonArea {
	    	margin-bottom:5px;
	    }
	    
	    #lessonTable tr:eq(5) {
	    	padding-top: -5px;
	    }
	   
	    
	    #lessonTable:eq(4) #lessonImgArea {
	    	margin-top: -10px;
	    }
	    
	    #newImg {
	    	z-index: 2;
	    	width:45px;
	    	height:45px;
	    	
	    }
	   	#newImgArea {
	   		margin-top:-143px;
	    	margin-left:220px;
	   	}
	   	
     
     
     
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>

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
   	
  <% if(loginMember != null) { %>
	<div id="aside">
	<div id="lTitle">인기수업</div>
   	<div class="aside" id="new">신규수업</div>
   	<div class="aside"> | </div>
   	<div class="aside" id="interested">관심수업</div>
   	<div class="aside"> | </div>
   	<div class="aside" id="popular">인기수업</div>
	</div>
	<% }else { %>
	<div id="aside">
	<div id="lTitle">인기수업</div>
   	<div class="aside" id="new">신규수업</div>
   	<div class="aside"> | </div>
   	<div class="aside" id="popular">인기수업</div>
	</div>
	<% } %>
		
		<div class="lesson-area">
		<% for(int i = 0; i < list.size(); i++) {
				HashMap<String, Object> hmap = list.get(i);
		%>
				<div class="lesson-list">
				<form action="<%=request.getContextPath()%>/selectOne.le" method="get">
					<table id="lessonTable" align="center">
						<tr>
							<td colspan="2">
							<div id="lessonImgArea">
							<img src="<%=hmap.get("imageRoute") %>/<%=hmap.get("imageName") %>" id="lessonImg">
							<div id="newImgArea">
							<% if((int) (hmap.get("isNew")) == 0) { %>
							<img src="static/images/newIcon.png" id="newImg">
							<% } %>
							</div> 
							</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" rowspan="3"><div id="lessonName"><%=hmap.get("lessonName") %></div></td>
						</tr>
						 <tr>
							<td><br></td>
							<td><input type="hidden" name="lessonCode" value="<%=hmap.get("lessonCode")%>"></td>
						</tr>

						<tr>
							<td></td>
							<td>
							<div id="artistImgArea" style="width:75px;">
							<img src="<%=hmap.get("imageRoute2") %>/<%=hmap.get("imageName2") %>" id="artistImg">
							</div>
							</td>
						</tr>
						<tr>
							<td style="word-break:break-all"><div id="star">★★★★☆</div></td>
							<td style="word-break:break-all"><div id="artistNick"><%= hmap.get("artistNick") %></div></td>
						</tr>
						<tr>
							<td style="word-break:break-all"><div id="lessonArea"><%= hmap.get("region") %></div></td>
							<td style="word-break:break-all"><div id="artistName"><%=hmap.get("memberName") %></div></td>
						</tr>
					</table>
				 </form>
				</div>
		<% } %>
		</div>
   </div>
  
	<%@ include file="/views/common/footer.jsp" %>
	
	<script>
		

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
				
				$("#space").click(function() {
			 		location.href = "<%= request.getContextPath()%>/place/list.me";
			 	});
				
				
				
				 $("#interested").click(function() {
					
						
						$.ajax({
							url: "/hobbyist/selectInterest.le",
							type: "get", 
							success: function(data) {
									$("#lTitle").text("관심수업");
									
										
									if(data[0] != null) {
										
										var $list = $(".lesson-list");
										$list.remove();
										
										for(var key in data) {
											
											
											var str = "";
											
											str += '<tr><td colspan="2"><div id="lessonImgArea"><img src="' + data[key].imageRoute + '/' + data[key].imageName + '"' + 'id="lessonImg" />';
											if(data[key].isNew == 0) {
												str += '<div id="newImgArea"><img src="static/images/newIcon.png" id="newImg"></div></div></td></tr>';
											}else {
												str += '</div></div></td></tr>';
											}
											str += '<tr><td colspan="2" rowspan="3"><div id="lessonName">' + data[key].lessonName + '</div></td></tr>';
											str += '<tr><td><br></td><td><input type="hidden" name="lessonCode" value="' + data[key].lessonCode + '"</td></tr>';
											str += '<tr><td></td><td><div id="artistImgArea" style="width:75px;"><img src="' + data[key].imageRoute2 + '/' + data[key].imageName2 + '"' + 'id="artistImg" /><div></td></tr>';
											str += '<tr><td style="word-break:break-all"><div id="star">★★★★☆</div></td>';
											str += '<td style="word-break:break-all"><div id="artistNick">' + data[key].artistNick + '</div></td></tr>';
											str += '<tr><td style="word-break:break-all"><div id="lessonArea">' + data[key].region + '</div></td>';
											str += '<td style="word-break:break-all"><div id="artistName">' + data[key].memberName + '</div></td></tr>';
											
											
											$(".lesson-area").append('<div class="lesson-list"><form action="/hobbyist/selectOne.le" method="get"><table id="lessonTable">' + str + '</table></form></div>');
											
											
											$(".lesson-list").click(function() {
												$(this).find($('form')).submit(); 
											 });
										}
									}else {
										alert("먼저 관심 카테고리를 설정해주세요.");
										location.href="<%=request.getContextPath()%>/views/member/firstLogin.jsp"; 
									}
								
								
							},
							error: function(error) {
								conosole.log(error);
							}
						});
					
						
					
					
				}); 
				 
				 
				 
				 $("#new").click(function() {
						
						
						$.ajax({
							url: "/hobbyist/selectNew.le",
							type: "get", 
							success: function(data) {
									$("#lTitle").text("신규수업");
									
										
									if(data[0] != null) {
										
										var $list = $(".lesson-list");
										$list.remove();
										
										for(var key in data) {
											
											
											var str = "";
											
											str += '<tr><td colspan="2"><div id="lessonImgArea"><img src="' + data[key].imageRoute + '/' + data[key].imageName + '"' + 'id="lessonImg" /><div id="newImgArea"><img src="static/images/newIcon.png" id="newImg"></div></div></td></tr>';
											str += '<tr><td colspan="2" rowspan="3"><div id="lessonName">' + data[key].lessonName + '</div></td></tr>';
											str += '<tr><td><br></td><td><input type="hidden" name="lessonCode" value="' + data[key].lessonCode + '"</td></tr>';
											str += '<tr><td></td><td><div id="artistImgArea" style="width:75px;"><img src="' + data[key].imageRoute2 + '/' + data[key].imageName2 + '"' + 'id="artistImg" /><div></td></tr>';
											str += '<tr><td style="word-break:break-all"><div id="star">★★★★☆</div></td>';
											str += '<td style="word-break:break-all"><div id="artistNick">' + data[key].artistNick + '</div></td></tr>';
											str += '<tr><td style="word-break:break-all"><div id="lessonArea">' + data[key].region + '</div></td>';
											str += '<td style="word-break:break-all"><div id="artistName">' + data[key].memberName + '</div></td></tr>';
								
											
											$(".lesson-area").append('<div class="lesson-list"><form action="/hobbyist/selectOne.le" method="get"><table id="lessonTable">' + str + '</table></form></div>');
											
											console.log($("#artistImg"));
											
											$(".lesson-list").click(function() {
												$(this).find($('form')).submit(); 
											 });
										}
									}
								
								
							},
							error: function(error) {
								conosole.log(error);
							}
						});
					
						
					 
					
				}); 
				 
				 
				 
				 $("#popular").click(function() {
					 location.href = "<%= request.getContextPath()%>/selectPopular.le";
				 }); 
				 
				 $(".lesson-list").click(function() {
						$(this).find($('form')).submit(); 
					 });

				
			}); 
		
			
	
	</script>
</body>
</html>