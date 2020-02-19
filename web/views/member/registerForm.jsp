<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
            height: 620px;
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
       		width:70px;
       		font-size: 13px;
       		background:whitesmoke;
       		border:1px solid gray;
       		height:26px;
       		text-align:center;
       		line-height:26px;
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
        
        #checkPwd1, #checkPwd2 {
        	text-align:center;
        }
        
    </style>
</head>
<body id="main">
	 <div id="header">
        <h1 id="title" align="center" onclick="goHome();">hobbyist</h1>
    </div>
    <div id="contents" align="center">
        <form action="<%=request.getContextPath()%>/register.me" method="post">
            <table id="joinForm" align="center">
                <tr>
                    <td colspan="5"><h2>회원가입</h2></td>
                </tr>
                <tr>
                    <td>아이디</td>&nbsp;
                    <td><input type="text" id="memberId" name="memberId" maxlength="16" placeholder="ID" size="29"></td>&nbsp;
                    <td><div class="btns" id="idBtn">중복체크</div></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>비밀번호</td>&nbsp;
                    <td><input type="password" id="memberPwd" name="memberPwd" maxlength="18" placeholder="PASSWORD" size="29"></td>&nbsp;
                </tr>
                <tr>
                	<td>&nbsp;</td>
                    <td colspan="2"><div id="pwdCheck1"><br></div></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" id="memberPwd2" name="memberPwd2" maxlength="18" placeholder="PASSWORD" size="29"></td>
                </tr>
                <tr>
                	<td>&nbsp;</td>
                    <td colspan="2"><div id="pwdCheck2"><br></div></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" id="memberName" name="memberName" placeholder="NAME" size="29"></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>휴대전화</td>
                    <td><input type="text" id="tel1" name="tel1" maxlength="3" size="5">
                     - <input type="text" id="tel2" name="tel2" maxlength="4" size="5"> - 
                    <input type="text" id="tel3" name="tel3" maxlength="4" size="5"></td>&nbsp;
                    <td><div class="btns" id="phoneBtn">인증하기</div></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>인증번호</td>
                    <td><input type="text" id="num" name="num" placeholder="인증번호를 입력해주세요" size="29"></td>
                    <td><div class="btns" id="checkBtn">인증확인</div></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" id="email" name="email" placeholder="EMAIL" size="29"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2"><div id="emailCheck"><br></div></td>
                </tr>
                <tr>
                <td><br></td>
                </tr>
            </table>
            <br><br>
            <input type="reset" value="가입취소" class="btnz" id="reset" onclick="goLogin();">&nbsp;&nbsp;
            <input type="submit" value="가입하기" class="btnz" id="submit">
        </form>
        
        <script>
	        function goHome() {
	    		location.href = "<%= request.getContextPath()%>/index.jsp";
	    	}
	        
	        function goLogin() {
	        	location.href = "<%= request.getContextPath()%>/views/member/loginForm.jsp";
	        }
	        
	        $(function() {
	        	$("#idBtn").click(function() {
	        		var memberId = $("#memberId").val();
	        		var idRegExp = /^[a-zA-z0-9]{4,12}$/;

	        		$.ajax({
	        			url: "/hobbyist/idCheck.me",
	        			type: "post",
	        			data: {memberId: memberId},
	        			success: function(data) {
	        				if(!idRegExp.test(memberId)) {
	        					alert("영문, 숫자만으로 4~12자 이내로 입력하세요.");
	        				}else {
	        					if(data == "fail") {
		        					alert("이미 존재하는 아이디입니다.");
		        				}else {
		        					alert("사용 가능한 아이디입니다.");
		        				}
	        				}
	        				
	        				
	        			},
	        			error: function(error) {
	        				console.log(error);
	        			}
	        		});
	        	});
	        	
	        	$("#memberPwd").change(function() {
	        		checkPassword($('#memberPwd').val());
	        	});
	        	
	        	function checkPassword(password) {
	        		if(password != "") {
	        			if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(password)) {
		        			$("#pwdCheck1").html("영문, 숫자, 특수문자 조합으로 8자리 이상 입력해주세요.");
		        			$("#pwdCheck1").css({'color':'red', 'font-size':'11.5px'});
		        			return false;
		        		}
		        		$("#pwdCheck1").html("사용 가능한 비밀번호입니다.");
		        		$("#pwdCheck1").css({'color':'green', 'font-size':'11.5px'});
		        		return true;
	        			
	        		}
	        		$("#pwdCheck1").html("비밀번호를 입력해주세요.");
        			$("#pwdCheck1").css({'color':'red', 'font-size':'11.5px'});
        			return false;
	        		
	        	}
	        	
	        	
	        	$("#memberPwd2").change(function() {
	        		checkPassword2($('#memberPwd').val(), $('#memberPwd2').val());
	        	});
	        	
	        	var pwd1 = $("#memberPwd").val();
	        	var pwd2 = $("#memberPwd2").val();
	        	
	        	function checkPassword2(pwd1, pwd2) {
	        		if(pwd1 != "" && pwd2 != "") {
	        			if(pwd1 != pwd2) {
		        			$("#pwdCheck2").html("비밀번호가 일치하지 않습니다.");
		        			$("#pwdCheck2").css({'color':'red', 'font-size':'11.5px'});
		        			return false;
		        		}
		        		$("#pwdCheck2").html("비밀번호가 일치합니다.");
		        		$("#pwdCheck2").css({'color':'green', 'font-size':'11.5px'});
		        		return true;
	        		}
	        		$("#pwdCheck2").html(" ");
	        		return false;
	        		
	        	}
	        	
	        	
	        	$("#email").change(function() {
	        		checkEmail($('#email').val());
	        	});
	        	
	        	var email = $("#email").val();
	        	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	        	
	        	function checkEmail(email) {
	        		if(email != "") {
	        			if(!regEmail.test(email)) {
	        				$("#emailCheck").html("올바른 이메일 형식으로 입력해주세요.");
		        			$("#emailCheck").css({'color':'red', 'font-size':'11.5px'});
		        			return false;
	        			}
	        			$("#emailCheck").html(" ");
		        		return true;
	        		}
	        		$("#emailCheck").html("이메일을 입력해주세요.");
        			$("#emailCheck").css({'color':'red', 'font-size':'11.5px'});
        			return false;
	        	}
	        });
	        
        </script>

</body>
</html>