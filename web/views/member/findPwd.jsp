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
            font-size: 15px;
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
            height: 500px;
            margin: auto;
        }
        #findName, #findId {
            width: 217px;
            height: 30px;
        }
        .tel {
            height: 30px;;
        }
        #nameLabel {
            margin-left: 10px;
        }
        #findName {
            margin-left: 15px;
            margin-top: 20px;
        }
        .btns {
            width:120px;
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
        #findId {
        	margin-left:9px;
        }

    </style>
</head>
<body id="main">
	<div id="header">
        <h1 id="title" align="center" onclick="">hobbyist</h1>
    </div>
    <div id="contents" align="center">
        <form action="<%=request.getContextPath()%>/views/member/setPwd.jsp" method="post">
            <h2>비밀번호 찾기</h2>
            <br><br>
            <label id="idLabel">아이디</label>&nbsp; <input type="text" id="findId" maxlength="10" size="22">
            <br><br>
            <label id="nameLabel">이름</label>&nbsp; <input type="text" id="findName" maxlength="10" size="22">
            <br><br>
            <label id="phoneLabel">휴대전화</label>&nbsp;&nbsp; <input type="text" class=tel id="tel1" maxlength="3" size="5"> - <input type="text" class=tel id="tel2" maxlength="4" size="5"> - <input type="text" class=tel id="tel3" maxlength="4" size="5"> 
            <br><br>
           
            <button class="btns" id="submit">비밀번호 재설정</button>
        </form>
    </div>
    
    <script>
	    function goHome() {
			location.href = "<%= request.getContextPath()%>/index.jsp";
		}
    </script>
</body>
</html>