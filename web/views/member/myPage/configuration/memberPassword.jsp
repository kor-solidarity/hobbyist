<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#divtest{
	width: 1024px;
	height: 120px;
	margin-top: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	line-height:100px;
}

.divcenter2 {
	margin-left: auto;
	margin-right: auto;
	height: 50px;
	border-bottom: 1px solid black;
	width: 1024px;
	height: 50px;
}

.tablecenter2 {
	height:55px;
	width: 1024px;
}

center_td0 {
	width: 128px;
}

.center_td1 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	line-height: 27px;
	width: 130px;
	
}

.center_td2 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	line-height: 27px;
	width: 150px;
}

.center_td3 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	line-height: 27px;
	width: 130px;
}

.center_td4 {
	width: 128px;
}

.center_td5 {
	width: 128px;
}

.center_td6 {
	width: 128px;
}

.center_td7 {
	width: 128px;
}

.divbottom1 {
	width: 1024px;
	margin: auto;
	text-align: center;
	height: 80px;
}

.divbottom2 {
	width: 1024px;
	margin: auto;
	text-align: center;
	height: 40px;
}

.divbottom3 {
	width: 1024px;
	margin: auto;
	text-align: center;
	height: 60px;
}

.divbottom4 {
	width: 1024px;
	margin: auto;
	text-align: center;
	hieght: 40px;
}

.label_bottom1 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	line-height: 37px;
	color: #000000;
}

.label_bottom2 {
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	line-height: 26px;
	color: #000000;
}

.label_bottom3 {
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	line-height: 26px;
	color: #000000;
}

.password {
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
	height: 50px;
}

.passclick {
	width: 110px;
	height: 50px;
	background: #C4C4C4;
}

.label_bottom4 {
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	line-height: 26px;
	color: #556B2F;
}


</style>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
</head>
<body>
	 <%@ include file="/views/common/myPage.jsp"%> 
	<%String passCheck = loginMember.getMemberPwd();%> 
	<div class="divcenter2">
		<table align="border" class="tablecenter2">
			<tr>
				<td colspan="1" class="center_td0"></td>
				<td colspan="1" class="center_td1">회원정보수정</td>
				<td colspan="1" class="center_td2">아티스트정보수정</td>
				<td colspan="1" class="center_td3">회원탈퇴</td>
				<td colspan="1" class="center_td4"></td>
				<td colspan="1" class="center_td5"></td>
				<td colspan="1" class="center_td6"></td>
				<td colspan="1" class="center_td7"></td>
			</tr>

		</table>
	</div>
	
	<!-- 비밀번호 확인  -->
	<div class="divbottom1">
	<br>
		<label class="label_bottom1">비밀번호 확인</label>
	</div>

	<div class="divbottom2">
		<label class="label_bottom2">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한
			번 확인합니다.</label>
	</div>
	
	
	<div class="divbottom3">
	<!--  비밀번호 확인 텍스트 -->
		<label class="label_bottom3">비밀번호:&nbsp; </label><input type="text" class="password" id="pw" placeholder="비밀번호를 입력하세요.">
		<button class="passclick" id="passclick" >확인</button>
	</div>
	
	<div id="divtest"> 

		
	</div>
 	 <script>
 	console.log("passCheck");
 
		 //비밀번호 동일 확인 기능
	 	$(function(){
	 		$("#passclick").click(function(){
	 			console.log( 'a1 : ' + $("#pw"));
	 			var passValue = $("#pw").val();
				var passCheck = passCheck;
				
				console.log("passCheck");
				if(passValue == passCheck) {
					console.log("passCheck");
					location.href = "<%=request.getContextPath()%>/views/member/myPage/configuration/memberUpdate.jsp";	
				}else{
					 /* console.log( 'a4' + $("#pw").typeof()); */
					 
					 $("#divtest").text("비밀번호가 정확하지 않습니다.").css("color","gray");
					}
				
				
	 		});
	 	})
	</script>  


<!-- 	<div class="divbottom4">
		<label class="label_bottom4">비밀번호가 정확하지 않습니다.</label>
	</div>
 -->
	<br><br><br><br>
	<!-- footer 요소 포함  -->
	<%@ include file="/views/common/footer.jsp"%>


</body>
</html>