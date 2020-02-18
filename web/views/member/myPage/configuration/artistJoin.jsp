<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
}

.tablecenter2 {
	width: 1024px;
}

.divcenter3 {
	margin-left: auto;
	margin-right: auto;
	width: 1024px;
	height: 500px;
}

.tablecenter3 {
	width: 1024px;
	height: 100px;
	text-align: center;
	margin: auto;
	height: 500px;
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
	color: #556B2F;
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

.show {
	width: 30px;
	height: 30px;
}

.center_button {
	margin-top: auto;
}

.art_td {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 25px;
	line-height: 31px;
	color: #9B9999;
}

#center_button {
	width: 208px;
	height: 52px;
	background: #C4C4C4;
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 25px;
	line-height: 31px;
	color: #000000;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
</head>
<body>
	
	
	<%@ include file="/views/common/myPage.jsp"%>

	<div class="divcenter2">
		<table align="boder" class="tablecenter2">
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

		<table align="border" class="tablecenter3">
			<tr>
				<td class="art_td">현재 아티스트가 아닙니다.<br>아티스트로 등록하시겠습니까?<br>
					<br>
					<button id=center_button>아티스트 등록하기</button></td>
				</td>
		</table>
	</div>

	<br>
	<br>
	<br>
	<br>
	<%@ include file="/views/common/footer.jsp"%>


</body>
</html>