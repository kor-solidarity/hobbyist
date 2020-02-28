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
            height: 480px;
            margin: auto;
        }
        
        #memberName, #num {
            width: 250px;
            height: 30px;
           /*  margin-left: 18px; */
           
        }
       
        
        .btns {
            width:95px;
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
            border: 1px solid darkolivegreen;
        }
        input {
            height:27px;
            font-family: 'Nanum Gothic', sans-serif; 
        }
        
        .btns2 {
       		width:70px;
       		font-size: 13px;
       		background:whitesmoke;
       		border:1px solid gray;
       		height:32px;
       		text-align:center;
       		line-height:32px;
       		cursor:pointer;
       		margin-left:-15px;
       }
       
       #findIdTable {
       		margin: 20px;
       }
       
       #findIdTable td {
       		padding: 10px;
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
            <!-- <label id="nameLabel">이름</label>&nbsp; <input type="text" name="name" id="name" maxlength="10" size="22">
            <br><br>
            <label id="phoneLabel">휴대전화</label>&nbsp;&nbsp; <input type="text" class=tel name="tel1" id="tel1" maxlength="3" size="5"> - <input type="text" class=tel name="tel2" id="tel2" maxlength="4" size="5"> - <input type="text" class=tel name="tel3" id="tel3" maxlength="4" size="5"> 
            <br><br> -->
            
            <table align="center" id="findIdTable">
            	<tr>
            		<td><label id="nameLabel">이름</label></td>
            		<td colspan="2"><input type="text" name="memberName" id="memberName" maxlength="10" size="22" placeholder="NAME"></td>
            	</tr>
            	<tr>
            		<td><label id="phoneLabel">휴대전화</label></td>
            		<td><input type="text" class="tel" name="tel1" id="tel1" maxlength="3" size="6"> - <input type="text" class="tel" name="tel2" id="tel2" maxlength="4" size="8"> - <input type="text" class="tel" name="tel3" id="tel3" maxlength="4" size="8"></td>
            		<td><div class="btns2" id="phoneBtn">인증하기</div> </td>
            	</tr>
            	<tr>
            		<td><label id="numLabel">인증번호</label></td>
            		<td><input type="text" id="num" name="num" placeholder="인증번호를 입력해주세요" size="29"></td>
            		<td><div class="btns2" id="checkBtn">인증확인</div></td>
            	</tr>
            </table>
           
            <div class="btns" id="submit" onclick="checkAll();">아이디 확인</div>
        </form>
    </div>
    <script>
	    function goHome() {
			location.href = "<%= request.getContextPath()%>/index.jsp";
		}
	    
	    ckNum = false;
	    
	    function checkAll () {
	    	if($("#memberName").val() != "") {
	    		if($("#tel1").val() != "" && $("#tel2").val() != "" && $("#tel3").val() != "") {
	    			if($("#num").val() != "") {
	    				if(ckNum == true) {
	    					$('form').submit();
	    				}else {
	    					alert("인증번호가 일치하지 않습니다.");
	    				}
	    			}else {
	    				alert("인증번호를 입력해주세요.");
	    			}
	    		}else {
	    			alert("휴대전화를 입력해주세요.");
	    		}
	    	}else {
	    		alert("이름을 입력해주세요.");
	    	}
	    }
	    
	    $(function() {
       		var randomVal = ""; 
    		$(document).on('click', '#phoneBtn', function() {
				var tel1 = $("#tel1").val();
				var tel2 = $("#tel2").val();
				var tel3 = $("#tel3").val();
        		var phone = {
        					tel1: tel1,
        					tel2: tel2,
        					tel3: tel3
        			};
        		
        		$.ajax({
        			url: "/hobbyist/phoneCheck.me",
        			type: "post",
        			data: phone,
        			async: false,
        			success: function(data) {
        				if(data == "success") {
        					alert("가입한 이력이 없는 번호입니다.\n다시 확인 후 진행해주세요.");
        					return false;
        				}else {
        					 $.ajax({
  	        		           url: "/hobbyist/phoneCertification.ph",
  	        		            type: "post",
  	        		            data: phone, 
  	        		            async: false,
  	        		            success: function(data) {
  	        		            						
  	        		            randomVal = data; 
  	        		            console.log(data);
  	        		            						
  	        		            },
  	        		            error: function(error) {
  	        		            console.log(error);
  	        		            } 
  	        		         }); 
        					
        					alert("인증번호가 발송되었습니다.");
        					return true;
        				}
        			},
        			error: function(error) {
        				console.log(error);
        			}
        		});

        		  

        	});

    		
			$(document).on('click', '#checkBtn', function() {
				var userSms = $("#num").val(); // 회원가입 폼에서 유저가 문자를 보고 입력한 숫자를 가져옴
            	
                 if(userSms == randomVal){  //인증번호가 같은 경우 행동
                   		alert("인증이 완료되었습니다.");
                 		ckNum = true;
                   }else{		    //인증번호가 다른 경우 행동
                    	alert("인증번호가 일치하지 않습니다. 확인 후 다시 입력하세요.");
                   		ckNum = false;
                    }
   			 });
	    	
	    });
	    
	
    </script>
</body>
</html>