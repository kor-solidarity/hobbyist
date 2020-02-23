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
            cursor:pointer;
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
        #name {
            width: 217px;
            height: 30px;
            margin-left: 18px;
            margin-top: 20px;
        }
        .tel {
            height: 30px;;
        }
        #nameLabel {
            margin-left: 12px;
        }
        
        .btns {
            width:95px;
            height: 40px;
            margin-top: 55px;
            font-family: 'Nanum Gothic', sans-serif; 
            font-size:14px;
            cursor:pointer;
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
        <form action="<%=request.getContextPath()%>/findId.me" method="post">
            <h2>아이디 찾기</h2>
            <br><br>
            <label id="nameLabel">이름</label>&nbsp; <input type="text" name="name" id="name" maxlength="10" size="22">
            <br><br>
            <label id="phoneLabel">휴대전화</label>&nbsp;&nbsp; <input type="text" class=tel name="tel1" id="tel1" maxlength="3" size="5"> - <input type="text" class=tel name="tel2" id="tel2" maxlength="4" size="5"> - <input type="text" class=tel name="tel3" id="tel3" maxlength="4" size="5"> 
            <br><br>
           
            <button type="submit" class="btns" id="submit">아이디 확인</button>
        </form>
    </div>
    <script>
	    function goHome() {
			location.href = "<%= request.getContextPath()%>/index.jsp";
		}
	    
	
    </script>
</body>
</html>