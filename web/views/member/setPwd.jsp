<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Roboto|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">

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
            height: 440px;
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
            width:125px;
            height: 40px;
            margin-top: 55px;
            font-family: 'Nanum Gothic', sans-serif; 
            font-size:14px;
            
        }
        
        #submit {
            background: darkolivegreen;
            color:white;
            border: 1px solid darkolivegreen;
        }
        input {
            margin-top: 20px;
        }

    </style>
</head>
<body id="main">
	 <div id="header">
        <h1 id="title" align="center" onclick="goHome();">hobbyist</h1>
    </div>
    <div id="contents" align="center">
           <h2>비밀번호 재설정</h2>
            <br><br>
            <label id="pwdLabel1">새 비밀번호</label>&nbsp; <input type="password" id="setPwd1" maxlength="18" size="22">
            <br><br>
            <label id="pwdLabel2">새 비밀번호 확인</label>&nbsp; <input type="password" id="setPwd2" maxlength="18" size="22">
            <br><br>
           
            <button onclick="complete();" class="btns" id="submit">비밀번호 재설정</button>
    </div>
    <script>
    	function complete(){
    		location.href = "<%= request.getContextPath()%>/views/member/setPwdComplete.jsp";
    	}
    	
    	function goHome() {
    		location.href = "<%= request.getContextPath()%>/index.jsp";
    	}
    </script>
</body>
</html>