<%@page import="com.dh.hobbyist.memberUpdate.controller.memberUpdateServletM"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.dh.hobbyist.member.model.dao.*"%>

	
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.divcenter2 {
	margin-left: auto;
	margin-right: auto;
	height: 50px;
	border-bottom: 1px solid black;
	width: 1024px;
	height: 50px;
	text-algin: center;  
}

.tablecenter2 {
	height: 55px;
	width: 1024px;
}

.divcenter3 {
	margin-left: auto;
	margin-right: auto;
	width: 1024px;
	text-align: center;
	height: 80px;
}

.divcenter31 {
	margin-left: auto;
	margin-right: auto;
	width: 1024px;
	text-align: center;
}

.tablecenter3 {
	width: 1024px;
	height: 100px;
	text-align: center;
	margin: auto;
}

.userPwd {
	font-weight: normal;
	font-size: 30px;
	line-height: 37px;
	width: 1024px;
	margin: auto;
}
.userPwd2 {
	font-weight: normal;
	font-size: 30px;
	line-height: 37px;
	width: 1024px;
	margin: auto;
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

.center_td8 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	line-height: 37px;
}

.center_td9 {
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	line-height: 26px;
}

.center_td10 {
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	line-height: 26px;
}

#show {
	width: 80px;
	height: 80px;
}

.divcenter4 {
	margin: auto;
	width: 800px;
	text-align: center;
}
.divcenter5 {
	margin: auto;
	width: 800px;
	text-align: center;
	height: 50px;
}

.divdiv {
	position: absolute;
	width: 40px;
	height: 31.33px;
	left: 448px;
	top: 561px;
}

.tablecenter4 {
	text-align: center;
	margin: auto;
	
}

#labelId {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}
#labelPw{
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}
#labelPw2{
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}


#labelName {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}

#LabelEmail {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}

#labelTell {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}

#labelTel2 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}


#labelHyphen1 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}

#labelHyphen2 {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}

#labelAccount {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 25px;
	color: #556B2F;
}

#button1 {
background: #C4C4C4;
}

#button2 {
background: #C4C4C4;
}

#updateBtn {

width: 110px;
height: 40px;
left: 426px;
background: #556B2F;
font-family: Do Hyeon;
font-style: normal;
font-weight: normal;
font-size: 25px;
line-height: 31px;

color: #FFFFFF;

}

#bankName {
	width: 100px;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/views/common/myPage.jsp"%>
	<!--dao에있는 전화번호 값을 배열로 -빼고 담아준다 -->
	<% String[] phone = loginMember.getPhone().split("-"); %>
	<% System.out.println(phone); %>
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


	<div class="divcenter3">
		<img id="show"
			src="<%=request.getContextPath()%>/static/images/memberUpdate1.png">
	</div>

	<div class="divcenter5">
	
	</div>

	<div class="divcenter4">
		
		<!-- 회원정보수정 서블릿으로전송 -->
		<form id="updateForm" action="<%=request.getContextPath() %>"/UpdateMemberM.me" method="post">
		
			<table align="border" class="tablecenter4">
		 	
			
				<tr>
		<td colspan="1" style="width: 70px; text-align: left;"><label id="labelId">아이디</label></td>	
		<td colspan="5" class="id" style="text-align: left;"><input style="width: 260px;" type="text" name="userId" id="userId" max-length=15 value="<%=loginMember.getMemberId()%>" autofocus placeholder=""></td>
					<td></td>
				</tr>
		  	 	
				<tr>
				<td colspan="1" style= "height:10px;"></td>
				</tr>		  	 	
		  	 	
				<tr>
					<td colspan="1" style="width: 100px; text-align: left;"><label
						id="labelPw">비밀번호</label></td>	
					<td colspan="5" class="id" style="text-align: left;"><input style="width: 260px;" type="password" name="userPwd" value="" max-length=15 autofocus placeholder="패스워드를 입력하세요."></td>
					<td></td>
				</tr> 
		
					<tr>
				<td colspan="1" style= "height:10px;"></td>
				</tr>

		  		<tr>
					<td colspan="1" style="width: 100px; text-align: left;"><label
						id="labelPw2">비밀번호확인</label></td>	
					<td colspan="5" class="id2" style="text-align: left;"><input style="width: 260px;" type="password" name="userPwd2" value="" max-length=15 autofocus placeholder="패스워드를 입력하세요."></td>
					<td></td>
				</tr>
		  	
		  		<tr>
				<td colspan="1" style= "height:10px;"></td>
				</tr>
		  	
				<tr>
					<td colspan="1" style="width: 100px; text-align: left;"><label
						id="labelName">이름</label></td>
					<td colspan="5" class="nm" style="text-align: left;"><input
						style="width: 260px;" type="name" name="name" max-length=5 placeholder="이름을 입력하세요." value="<%=loginMember.getMemberName()%>"></td>
					<td></td>
				</tr>

				<tr>
				<td colspan="1" style= "height:10px;"></td>
				</tr>

				<tr>
					<td colspan="1" style="width: 100px; text-align: left;"><label
						id="LabelEmail">이메일</label></td>
					<td colspan="5" class="em" style="text-align: left;"><input
						style="width: 260px;" type="email" name="email" placeholder="이메일을 입력하세요." value="<%=loginMember.getEmail() %>"></td>
					<td></td>
				</tr>
		
				<tr>
				<td colspan="1" style= "height:10px;"></td>
				</tr>
		
				<tr>
					<td colspan="1" style="width: 100px; text-align: left;"><label
						id="labelTell">전화번호</label></td>
					<td colspan="1"><input type="tel" name="tel1" id="tel1" value="<%=phone[0]%>"
						style="text-align: left; width: 70px;"></td>
					<td colspan="1" style="width: 3px;"><label id="labelHyphen1">-</label></td>
					<td colspan="1"><input type="tel" name="tel2" id="tel2" value="<%=phone[1]%>"
					
						style="text-align: left; width: 70px;"></td>
					<td colspan="1" style="width: 3px;"><label id="labelHyphen2">-</label></td>
					<td colspan="1"><input type="tel" name="tel3" id="tel3" value="<%=phone[2]%>" style="text-align: left; width: 75px;" value="<%=loginMember.getPhone() %>"></td>
					
					<td colspan="1"><label id="button1">인증하기</label></td>
				</tr>
	
				<tr>
				<td colspan="1" style= "height:10px;"></td>
				</tr>
	
				<tr>
					<td colspan="1" style="width: 100px; text-align: left;" color:><label
						id="labelTel2">인증번호</label></td>
					<td colspan="5" class="em" style="text-align: left;"><input style="width: 260px;" type="text" name="email2" placeholder="인증번호를 입력해주세요"></td>
					<td colspan="1"><button id="button4">인증확인</button></td>
				</tr>
			
				<tr>
				<td colspan="1" style= "height:10px;"></td>
				</tr>

				<tr>
					<td colspan="1" style="width: 90px; text-align: left;"><label id="labelAccount">계좌번호</label></td>
					<td colspan="1" style="width: 30px;"><select name="bankName" style="width: 75px; value="<%=loginMember.getBankName() %>">
							<option value="">신한</option>
							<option value="">국민</option>
							<option value="">하나</option>
							<option value="">카카오뱅크</option>
							<option value="">케이뱅크</option>
					</select></td>
					<td colspan="1" style="width: 10px;"></td>
					<td colspan="3" style="text-align: center;"><input type="text" name="bankNum" style="width: 165px;" value="<%=loginMember.getBankNum() %>"></td>
					<td colspan="1"><button id="button2">인증하기</button></td>
				</tr>
			</table>
			<br>
			<!--수정하기버튼  -->
			<div id="updateBtn" onclick="updateMember();">수정하기</div>
		</form>
	</div>
	
	<script>
	function updateMember(){
		$("#updateForm").sumbit();
	}
	
	
	</script>	
	
	
	
	
	
	
	<script>
	
	//전화번호 인증하기 버튼 클릭시
	
		var randomVal = ""; //유저에게 보낸 문자의 랜덤 숫자를 저장하기 위한 전역변수
		$(document).on('click', '#button1', function () {
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		var phone = {
					tel1: tel1,
					tel2: tel2,
					tel3: tel3
			};
		
		$.ajax({
			url: "/hobbyist/phoneCheck.me",
			type: "post",
			data: phone,
			async: false,
			success: function(data) {
				if(data == "fail") {
					alert("이미 가입한 이력이 있는 번호입니다.\n확인 후 다시 진행해주세요.");
					return false;
				}else {
					 $.ajax({
      		           url: "/hobbyist/phoneCertification.ph",
      		            type: "post",
      		            data: phone, 
      		            async: false,
      		            success: function(data) {
      		            						
      		            randomVal = data; //유저에게 문자로 보낸 랜덤 값을 그대로 리턴 받아서 전역변수로 선언한 randomVal에 넣어줬음
      		            console.log(data);
      		            						
      		            },
      		            error: function(error) {
      		            console.log(error);
      		            } 
      		         }); 
					
					alert("인증번호가 발송되었습니다.");
					return true;
				}
			},
			error: function(error) {
				console.log(error);
			}
		});

	});

		
		

	
	
	</script>
	
	
	<br>
	<br>
	<br>
	<br>
	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>