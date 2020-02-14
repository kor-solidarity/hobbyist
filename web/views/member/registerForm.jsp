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
            font-size: 14px;
        }
        #title {
            color:darkolivegreen;
            font-family: 'ZCOOL QingKe HuangYou', cursive;
            margin-top: 50px;
            font-size: 60px;
        }
        h2 {
            font-family: 'Do Hyeon', sans-serif;
            font-size: 25px;
            margin-left: 150px;
            font-weight: 100;
        }
        
        #contents {
            border: 1.2px solid darkolivegreen;
            width: 600px;
            height: 580px;
            margin: auto;
        }

        input {

            font-size: 12px;
            padding: auto;
            height: 23px;

        }
        #joinForm {
           margin:auto;
        }
        tr {
            margin: auto;
        }
        .btnz {
            width:90px;
            height: 40px;;
        }
       .btns {
       		font-size: 13px;
       		height:28px;
       		
       }
       
       
        #reset {
            background:lightgray;
            border: 1px solid lightgray;
            margin-right: 20px;
        }
        #submit {
            background: darkolivegreen;
            color:white;
            border: 1px solid darkolivegreen;
        }
        
    </style>
</head>
<body id="main">
	 <div id="header">
        <h1 id="title" align="center">hobbyist</h1>
    </div>
    <div id="contents" align="center">
        <form action="" method="">
            <table id="joinForm" align="center">
                <tr>
                    <td colspan="5"><h2>회원가입</h2></td>
                </tr>
                <tr>
                    <td>아이디</td>&nbsp;
                    <td><input type="text" id="userId" name="userId" maxlength="16" placeholder="ID" size="29"></td>&nbsp;
                    <td><button class="btns" id="idBtn">중복체크</button></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>비밀번호</td>&nbsp;
                    <td><input type="password" id="userPwd" name="userPwd" maxlength="18" placeholder="PASSWORD" size="29"></td>&nbsp;
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" id="userPwd2" name="userPwd2" maxlength="18" placeholder="PASSWORD" size="29"></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" id="userName" name="userName" placeholder="NAME" size="29"></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>휴대전화</td>
                    <td><input type="text" id="tel1" name="tel1" maxlength="3" size="5">
                     - <input type="text" id="tel2" name="tel2" maxlength="4" size="5"> - 
                    <input type="text" id="tel3" name="tel3" maxlength="4" size="5"></td>&nbsp;
                    <td><button class="btns">인증하기</button></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>인증번호</td>
                    <td><input type="text" id="num" name="num" placeholder="인증번호를 입력해주세요" size="29"></td>
                    <td><button class="btns">인증확인</button></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" id="email" name="email" placeholder="EMAIL" size="29"></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
            </table>
            <br><br>
            <button onclick="" class="btnz" id="reset">가입취소</button>&nbsp;&nbsp;
            <button onclick="" class="btnz" id="submit">가입하기</button>
        </form>

</body>
</html>