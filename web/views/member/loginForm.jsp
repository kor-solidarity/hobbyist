<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
    <style>
        body {
            margin: auto;
            position: relative;
            width: 1024px;
            
            background: #FFFFFF;
            /*font-family: 'Nanum Gothic', sans-serif;*/
            
        }
        #title {
            color:darkolivegreen;
            font-family: 'ZCOOL QingKe HuangYou', cursive;
            margin-top: 50px;
            font-size: 60px;
            cursor:pointer;
        }
        #contents {

            margin-top: 100px;
        }
        #idLabel{
            margin-left: -310px;
            font-size: 15px;
            
        }
        #pwdLabel {
            margin-left: -295px;
            font-size: 15px;
            

        }
        input {
            width: 350px;
            height: 45px;
            margin-top: 20px;
            
        }
        button {
            width: 350px;
            height: 45px;
            margin-top: 10px;
            font-size: 15px;
            cursor:pointer;
            
        }
        #loginBtn {
            background-color: darkolivegreen;
            color: white;
            padding: 5px;
            border: 1px solid darkolivegreen;
        }
        .find {
            font-size: 13.5px;
        }
    </style>
</head>
<body id="main">
	<div id="header">
        <h1 id="title" align="center" onclick="goHome();">hobbyist</h1>
        
    </div>
    <div id="contents" align="center">
        <form action="<%=request.getContextPath()%>/login.me" method="post">
            <label id="idLabel">아이디</label>
            <br>
            <input type="text" name="memberId" id="memberId">
            <br><br>
            <label id="pwdLabel">비밀번호</label>
            <br>
            <input type="password" name="memberPwd" id="memberPwd">
            <br><br>
            <button type="submit" id="loginBtn">로그인</button>
            <br>
        </form>
        <button id="joinBtn" onclick="register();">회원가입</button>
        <br><br>
        <label class="find" onclick="findId();" style="cursor:pointer;">아이디 찾기</label>&nbsp;&nbsp;
        <label class="find"> | </label>&nbsp;
        <label class="find" onclick="findPwd();" style="cursor:pointer;">비밀번호 찾기</label>
    </div>
	<script>
		function register() {
			location.href = "<%=request.getContextPath()%>/views/member/registerForm.jsp";
		}
		
		function findId() {
			location.href = "<%=request.getContextPath()%>/views/member/findId.jsp";
		}
		
		function findPwd() {
			location.href = "<%=request.getContextPath()%>/views/member/findPwd.jsp";
		}
		
		function goHome() {
    		location.href = "<%= request.getContextPath()%>/index.jsp";
    	}
		
	</script>
</body>
</html>