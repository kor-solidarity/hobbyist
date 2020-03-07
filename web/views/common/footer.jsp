<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Roboto|Nanum+Gothic|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
			
			#line {
       		border-top:2.5px solid darkolivegreen;	
    		height:3px;
       		}
		
			#footer {
	       		width:1024px;
	       		height:140px;
	       		margin:auto;
	       }
	       
	       
	       
	       	#fTitle td {
	       		font-weight:900;
	       		font-size:15px;
	       		padding-top:10px;
	       		padding-bottom:15px;
	       		/* font-family: 'Roboto', sans-serif; */
	       		font-family: 'Nanum Gothic', sans-serif;
	       }
	      	.fTable td {
	       		padding-left:15px;
	       		padding-right: 35px;
	       		font-size:13px;
	       		/* font-family: 'Roboto', sans-serif; */
	       		font-family: 'Nanum Gothic', sans-serif;
	       		cursor:pointer;
	       }
</style>
</head>
<body>
   <div id="line"></div>
   <div id="footer">
   	<table class="fTable">
   		<tr id="fTitle">
   			<td>COMPANY</td>
   			<td>POLICIES</td>
   			<td>HOW TO USE</td>
   			<td>HOBBYIST CENTER</td>
   			<td>운영시간</td>
   			
   		</tr>
   		<tr>
   			<td>상호 : (주)하비스트 | 주소 : 서울시 강남구 테헤란로14길</td>
   			<td>이용약관</td>
   			<td>이용안내</td>
   			<td id="notice" onclick="goNotice();">공지사항</td>
   			<td>평일 9:00 ~ 21:00</td>
   		</tr>
   		<tr>
   			<td>대표 : 드림하이</td>
   			<td>개인정보 취급방침</td>
   			<td>문의하기</td>
   			<td>신고하기</td>
   			<td>점심 11:20 ~ 12:00</td>
   		</tr>
   		<tr>
   			<td>사업자 등록번호 : 199-61-10101</td>
   			<td></td>
   			<td></td>
   			<td></td>
   			<td></td>
   		</tr>
   		<tr>
   			<td>통신판매업 신고번호 : 2020-서울강남-1101</td>
   			<td></td>
   			<td></td>
   			<td></td>
   			<td></td>
   		</tr>
   		<tr>
   			<td>연락처 : 02-920-5432</td>
   			<td></td>
   			<td></td>
   			<td></td>
   			<td></td>
   		</tr>
   	</table>
   </div>
   
   <script>
   		function goNotice() {
   			location.href = "<%=request.getContextPath()%>/views/common/notice.jsp";
   		}
   </script>
</body>
</html>