<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.HashMap, com.dh.hobbyist.common.model.vo.PageInfo"%>
<%
	ArrayList<HashMap<String, Object>> list
			= (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>hobbyist</title>
<style>
			#nav3 {
			width:1024px;
			height:50px;
			margin:auto;
			margin-top:30px; 
			
		}
		.selection {
			width:100px;
			height:30px;
			margin-right:15px;
			font-family: 'Nanum Gothic', sans-serif;
		}
		#area2 {
			width:110px;
		}
		
		#section{
			width:1024px;
			height:1250px;
			margin:auto;
			margin-top:30px;
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
		
		#lessonImg {
			width:265px;
			height:140px;
			margin-left: -5.5px; 
			margin-top: -5px; 
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
		/*#lessonTable td:nth-of-type(2n) {
			 float:right;  
			
		}*/
		
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
	    
	    #lessonCount {
	    	font-family: 'Nanum Gothic', sans-serif;
			font-size:15.5px;
			font-weight:900;
			margin-bottom:20px;
			color:darkolivegreen;
	    }
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
	    
	    .pagingArea {
	    	margin-bottom: 30px;
	    }
	   
	   
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<%@ include file="/views/common/categorybar.jsp" %>
	
	
	
	
	<div id="nav3">
	
		<select name="area1" class="selection" id="area" onChange="cat_change(this.value,area2)">
			<option>----지역----</option>
			<option value='1'>서울</option>
			<option value='2'>부산</option>
			<option value='3'>대구</option>
			<option value='4'>인천</option>
			<option value='5'>광주</option>
			<option value='6'>대전</option>
			<option value='7'>울산</option>
			<option value='8'>강원</option>
			<option value='9'>경기</option>
			<option value='10'>경남</option>
			<option value='11'>경북</option>
			<option value='12'>전남</option>
			<option value='13'>전북</option>
			<option value='14'>제주</option>
			<option value='15'>충남</option>
			<option value='16'>충북</option>
			<option value='261'>세종</option>
		</select>
		<select name="area2" class="selection" id="area2">
			<option>--상세 지역--</option>
		</select>			
		
		<select class="selection" id="lessonType">
			<option>--수업 유형--</option>
			<option>1:1</option>
			<option>소규모</option>
			<option>대규모</option>
			
		</select>
	</div>
	<script>
		 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,261);
		 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북','세종');
		 
		 
		 var cat2_num = new Array();
		 var cat2_name = new Array();

		 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
		 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');

		 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
		 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');

		 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);
		 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');

		 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
		 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');

		 cat2_num[5] = new Array(76,77,78,79,80);
		 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');

		 cat2_num[6] = new Array(81,82,83,84,85);
		 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');

		 cat2_num[7] = new Array(86,87,88,89,90);
		 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');

		 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
		 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');

		 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
		 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');

		 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
		 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');

		 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
		 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');

		 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
		 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');

		 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
		 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');

		 cat2_num[14] = new Array(230,231,232,233);
		 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');

		 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
		 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');

		 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
		 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');

		 
		 function cat_change(key,sel){
			 if(key == '') return;
			 var name = cat2_name[key];
			 var val = cat2_num[key];

			 for(i = sel.length - 1; i >= 0; i--)
			  sel.options[i] = null;
			  sel.options[0] = new Option('--상세 지역--','', '', 'true');
			 
			  for(i = 0; i < name.length; i++){
			  sel.options[i+1] = new Option(name[i],val[i]);
			 }
			  
			}
	</script>
	
	
	<div id="section">
	<p id="lessonCount">등록된 수업 <%=list.size() %>개</p>
		
		<div class="lesson-area">
		<% for(int i = 0; i < list.size(); i++) {
				HashMap<String, Object> hmap = list.get(i);
		%>
				<div class="lesson-list">
				<form action="<%=request.getContextPath()%>/selectOne.le" method="get">
					<table id="lessonTable" align="center">
						<tr>
							<td colspan="2">
							<div>
							 <% if(hmap.get("imageType").equals("lesson")) { %>
							<img src="<%=hmap.get("imageRoute") %>/<%=hmap.get("imageName") %>" id="lessonImg"> 
							<% } %> 
							<!-- <img src="/hobbyist/static/images/lessonImg1.jpg"  id="lessonImg"> -->
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
							<% if(hmap.get("imageType2").equals("profile")) { %>
							<img src="<%=hmap.get("imageRoute2") %>/<%=hmap.get("imageName2") %>" id="artistImg">
							<% } %>
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
	 <div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/selectMusic.le?currentPage=1'"><<</button>	
			<% if(currentPage <= 1) { %>
				<button disabled><</button>	
			<% }else { %>
				<button onclick="location.href='<%= request.getContextPath()%>/selectMusic.le?currentPage=<%=currentPage - 1%>'"><</button>	
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage) {	
			%>
					<button disabled><%= p %></button>
			<%
				}else {
			%>	
					<button onclick="location.href='<%= request.getContextPath()%>/selectMusic.le?currentPage=<%=p%>'"><%= p %></button>
			<%	}
			  }	
			%>		
			
			<% if(currentPage >= maxPage) { %>
				<button disabled>></button>
			<% }else { %>
				<button onclick="location.href='<%= request.getContextPath()%>/selectMusic.le?currentPage=<%=currentPage + 1%>'">></button>
			<% } %>
			<button onclick="location.href='<%= request.getContextPath()%>/selectMusic.le?currentPage=<%=maxPage%>'">>></button>	
		</div>
	<script>
		$(function() {
			$("#cMusic").css({'color':'darkolivegreen'});
			$("#music").show();	
			
			
			$(".lesson-list").click(function() {
				$(this).find($('form')).submit();
			});
		});
		
		
	</script>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>