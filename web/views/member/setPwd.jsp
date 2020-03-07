<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dh.hobbyist.member.model.vo.Member"%>
<%
	Member findMember = (Member) session.getAttribute("findMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hobbyist</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
        #memberPwd {
            width: 217px;
            height: 30px;
            margin-left: 18px;
            margin-top: 20px;
        }
        #memberPwd2 {
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
            cursor:pointer;
            line-height: 40px;
        }
        
        #submit {
            background: darkolivegreen;
            color:white;
            /* border: 1px solid darkolivegreen; */
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
    <form action="<%=request.getContextPath() %>/setPwd.me" method="post">
    <div id="contents" align="center">
           <h2>비밀번호 재설정</h2>
            <br><br>
            <label id="pwdLabel1">새 비밀번호</label>&nbsp; <input type="password" name="memberPwd" id="memberPwd" maxlength="18" size="22">
            <br><br>
            <label id="pwdLabel2">새 비밀번호 확인</label>&nbsp; <input type="password" name="memberPwd2" id="memberPwd2" maxlength="18" size="22">
            <br><input type="hidden" name="memberId" value="<%=findMember.getMemberId()%>"><br>
           
            <div class="btns" id="submit" onclick="checkPwd();">비밀번호 재설정</div>
    </div>
    </form>
    <script>
    	
    	function goHome() {
    		location.href = "<%= request.getContextPath()%>/index.jsp";
    	}
    	
    	ckpwd1 = false;
    	ckpwd2 = false;
    	
    	function checkPwd() {
    		
    		if($("#memberPwd").val() != "" && $("#memberPwd2").val() != "") {
    			if(ckpwd1 == true) {
        			if(ckpwd2 == true) {
        				$('form').submit();
        			}else {
        				alert("비밀번호가 일치하지 않습니다.");
        			}
        		}else {
        			alert("영문, 숫자, 특수문자 조합 8~20자 이내로 입력해주세요.");
        		}
    		}else {
    			alert("비밀번호를 입력해주세요.");
    		}
    		
    		
    		
    	}
    	
    	
		
    	$(function() {
    		$("#memberPwd").change(function() {
        		ckpwd1 = checkPassword($('#memberPwd').val());
        	});
        	
        	function checkPassword(password) {
        		 $("#memberPwd").focus(); 
        		if(password != "") {
        			if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(password)) {
            			
            			return false;
            		}
            		
        			return true;
        			
        		}
       			
       			return false; 
        		
        	}
        	
        	
        	$("#memberPwd2").change(function() {
        		ckpwd2 = checkPassword2($('#memberPwd').val(), $('#memberPwd2').val());
        	});
        	
        	var pwd1 = $("#memberPwd").val();
        	var pwd2 = $("#memberPwd2").val();
        	
        	function checkPassword2(pwd1, pwd2) {
        		 $("#memberPwd2").focus(); 
        		if(pwd1 != "" && pwd2 != "") {
        			if(pwd1 != pwd2) {
            			
            			return false;
            		}
            		
        			return true;
        		}
        		
        		return false; 
        		
        		
        	}
    	});
    	
    	
    	
    	
    	   
    </script>
</body>
</html>