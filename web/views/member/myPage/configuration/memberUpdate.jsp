
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
	text-algin: 
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

#update {
font-family: Do Hyeon;
font-style: normal;
font-weight: normal;
font-size: 25px;
line-height: 31px;
color: #FFFFFF;
background: #556B2F;
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
		<form>
			<table align="border" class="tablecenter4">
				<tr>
					<td colspan="1" style="width: 70px; text-align: left;"><label
						id="labelId">아이디</label></td>
					<td colspan="5" class="id" style="text-align: left;"><input
						style="width: 260px;" type="text" name="text" max-length=15
						autofocus placeholder="아이디를 입력하세요."></td>
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
					<td colspan="1"><input type="tel" name="tel3"
						style="text-align: left; width: 75px;"></td>
					<td colspan="1"><button id="button1">인증하기</button></td>
				</tr>





				<tr></tr>

				<tr>
					<td colspan="1" style="width: 70px; text-align: left;"><label
						id="labelAccount">계좌번호</label></td>
					<td colspan="1" style="width: 30px;"><select name="bank"
						style="width: 70px;">
							<option value="">신한</option>
							<option value="">국민</option>
							<option value="">하나</option>
							<option value="">카카오뱅크</option>
							<option value="">케이뱅크</option>
					</select></td>
					<td colspan="1" style="width: 10px;"></td>
					<td colspan="3" style="text-align: center;"><input type="text"
						name="text" style="width: 165px;"></td>
					<td colspan="1"><button id="button2">인증하기</button>
				</tr>
			
			



			</table>

			<script>
				$("#button1").click(function(){
					alert("인증완료");
				});
				</script>

				<script>
				$("#button2").click(function(){
					alert("인증완료");
				});
				</script>

			<br> <br>
			<button id="update">수정하기</button>
		</form>
	</div>



	<br>
	<br>
	<br>
	<br>
	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>