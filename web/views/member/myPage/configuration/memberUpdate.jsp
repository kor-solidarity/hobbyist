
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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

.password {
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

#bt_update {

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

#bank {
	width: 100px;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/views/common/myPage.jsp"%>


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



	<div class="divcenter4">
		<form action="<%=request.getContextPath() %>/register.me mthod ="post">
			<table align="border" class="tablecenter4">
				<tr>
		<td colspan="1" style="width: 70px; text-align: left;"><label id="labelId">아이디</label></td>	
		<td colspan="5" class="id" style="text-align: left;"><input style="width: 260px;" type="text" name="text" max-length=15
						autofocus placeholder="아이디를 입력하세요."></td>
					<td></td>
				</tr>
				
				<tr>
					<td colspan="1" style="width: 70px; text-align: left;"><label
						id="labelId">패스워드</label></td>	
					<td colspan="5" class="id" style="text-align: left;"><input
						style="width: 260px;" type="password" name="password" max-length=15
						autofocus placeholder="패스워드를 입력하세요."></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="1" style="width: 70px; text-align: left;"><label
						id="labelName">이름</label></td>
					<td colspan="5" class="nm" style="text-align: left;"><input
						style="width: 260px;" type="name" name="name" max-length=5
						placeholder="이름을 입력하세요."></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="1" style="width: 70px; text-align: left;"><label
						id="LabelEmail">이메일</label></td>
					<td colspan="5" class="em" style="text-align: left;"><input
						style="width: 260px;" type="email" name="email"
						placeholder="이메일을 입력하세요."></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="1" style="width: 70px; text-align: left;"><label
						id="labelTell">전화번호</label></td>
					<td colspan="1"><input type="tel" name="tel1"
						style="text-align: left; width: 70px;"></td>
					<td colspan="1" style="width: 3px;"><label id="labelHyphen1">-</label></td>
					<td colspan="1"><input type="tel" name="tel2"
						style="text-align: left; width: 70px;"></td>
					<td colspan="1" style="width: 3px;"><label id="labelHyphen2">-</label></td>
					<td colspan="1"><input type="tel" name="tel3" style="text-align: left; width: 75px;"></td>
					<td colspan="1"><button id="button1">인증하기</button></td>
				</tr>

				<tr></tr>

				<tr>
					<td colspan="1" style="width: 70px; text-align: left;"><label id="labelAccount">계좌번호</label></td>
					<td colspan="1" style="width: 30px;"><select name="bank"
						style="width: 70px;">
							<option value="">신한</option>
							<option value="">국민</option>
							<option value="">하나</option>
							<option value="">카카오뱅크</option>
							<option value="">케이뱅크</option>
					</select></td>
					<td colspan="1" style="width: 10px;"></td>
					<td colspan="3" style="text-align: center;"><input type="text" name="text" style="width: 165px;"></td>
					<td colspan="1"><button id="button2">인증하기</button></td>
				</tr>
			</table>
			<br><br><br><br>
			<input type="submit" value="수정하기" class="bt_update" id="bt_update">  
		
		
		</form>
	</div>
		
	<!-- 	  -->
	
	<script>
	function checkPassword(password){
	if(password != ""){
		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(password)){
		$("#pwdCheck1").html("영문, 숫자, 특수문자 조합으로 8자리 이상 입력해주세요.");	
		$("#pwdCheck1").css({'color':'red','font-size':'11.5px'});
		return false;
		}
		$("#pwdCheck1").html("사용 가능한 비밀번호입니다.");
		$("#pwdCheck1").css({'color':'green','font-size':'11.5px'});
		return true;
	}
	$("#pwdCheck1").html("비밀번호를 입력해주세요.");
	$("#pwdCheck1").css({'color':'red', 'font-size': '11.5px'});
	return false;
	}

	$("#email").change(function(){
		checkEmail($('#email').val());
	});
	
	var email = $("#email").val();
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	function checkEmail(email){
	if(email != ""){
		if(!regEmail.test(email)){
		$("#emailCheck").html("올바른 이메일 형식으로 입력해주세요")	;
		$("#emailCheck").css({'color':'red', 'font-size':'11.5px'});
		return false;		
		}
		$("#emailCheck").html(" ");
		return true;
	}
	$("#emailCheck").html("이메일을 입력해주세요");	
	$("#emailCheck").css({'color':'red', 'font-size': '11.5px'});
	}
	//인증하기 버튼 클릭시
	$("#phoneBtn").click(function(){
	var randomVal =""; //유저에게 보낸 문자의 랜덤 숫자를 저장하기 위한 전역변수
	var tel1 = $("#tel1").val();
	var tel2 = $("#tel2").val();
	var tel3 = $("#tel3").val();
	var phone = {
			tel1: tel1,
			tel2: tel2,
			tel3: tel3
	};
	$.ajax({
		url:"/hobbyist/member/controller/UpdateMemberListServlet.java"
		type: "post",
		data: phone,
		success: function(data){
		randomVal = data;//유저에게 문자로 보낸 랜던 값을 그대로 리턴받아서 전역변수로 선언한 randomVal에 넣어줫음
		console.log(data);
		}, 
		error: function(error){
			console.log(error);
		}
	});
	});
	$("#checkBtn").click(function() {
		var userSms = $("#num").val(); // 회원가입 폼에서 유저가 문자를 보고 입력한 숫자를 가져옴
    	
         if(userSms == randomVal){  //인증번호가 같은 경우 행동
           		alert("인증이 완료되었습니다.");
         		return true;
           }else{		    //인증번호가 다른 경우 행동
            	alert("인증번호가 일치하지 않습니다. 확인 후 다시 입력하세요.");
           		return false;
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