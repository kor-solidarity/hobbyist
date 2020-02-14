<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic|Roboto|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">

    <style>
        body {
            margin:auto;
            position: relative;
            width: 1024px;
            background: #FFFFFF;
            font-size: 16px;
        }
        #title {
            color:darkolivegreen;
            font-family: 'ZCOOL QingKe HuangYou', cursive;
            margin-top: 50px;
            font-size: 60px;
        }
        h2 {
            font-family: 'Do Hyeon', sans-serif;
            font-weight: 100;
            font-size: 25px;
            margin-top: 40px;
            margin-bottom: 25px;
        }
        #contents {
            border: 1.2px solid darkolivegreen;
            width: 600px;
            height: 400px;
            margin: auto;
        }
        #setPwd1 {
            width: 217px;
            height: 30px;
            margin-left: 18px;
            margin-top: 20px;
        }
        #setPwd2 {
            width: 217px;
            height: 30px;
        }
        
        #pwdLabel1 {
            margin-left: 12px;
        }
        
        .btns {
            width:115px;
            height: 40px;
            margin-top: 100px;
            
        }
        
        #loginBtn {
            background: darkolivegreen;
            color:white;
            border: 1px solid darkolivegreen;
        }
        input {
            margin-top: 20px;
        }
        
        p {
        	 /* font-family: 'Roboto', sans-serif; */
        	 font-family: 'Nanum Gothic', sans-serif; 
        	 
        	font-size:16px;
        }

    </style>
</head>
<body id="main">
	 <div id="header">
        <h1 id="title" align="center">hobbyist</h1>
    </div>
    <div id="contents" align="center">
            <h2>비밀번호 재설정</h2>
            <br><br>
            <p>비밀번호 재설정이 <br>
            	완료되었습니다.</p>
           
            <button onclick="goLogin();" class="btns" id="loginBtn">로그인</button>
    </div>
    
    <script>
    	function goLogin() {
    		location.href = "<%=request.getContextPath()%>/views/member/loginForm.jsp";
    	}
    	
    </script>
</body>
</html>