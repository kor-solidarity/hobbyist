<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#middle {
            height:520px;
            top:80px;
            background-image:url("/hobbyist/images/thiago.PNG");
            background-size:100% 100%;
            background-repeat: no-repeat;
        }
 		#middleInfo {
            margin:auto;
            font-family: 'Do Hyeon', sans-serif;
            font-weight: lighter;
            font-size: 40px;
            color:white;
        }
        #middle-mid {
            height:50%;
            width:50%;
            vertical-align: auto;
            margin: auto;
        }
    
        
        #middleInfo td div {
            margin: auto;
            font-family: 'ZCOOL QingKe HuangYou', cursive;
            color:darkolivegreen;
            font-size: 50px;
            background-color: white;
            height:60px;
            text-align: center;
            width:200px;
        }
        
        #middleInfo button {
            height:50px;
            width:300px;
            font-family: 'Do Hyeon', sans-serif;
            font-size: 20px;
            color:white;
            padding: 5px;
            border: 1px solid darkolivegreen;
            background-color: darkolivegreen;
        }
        #bottomInfo {
            width:1024px;
            text-align: center;
            margin:auto;
            border-spacing: 15px;
        }
        #bottomInfo #first {
            font-size:25px;
            font-family: 'Do Hyeon', sans-serif;
            color:darkolivegreen;
        }
        #bottomInfo #second {
            font-size:20px;
            font-family: 'Do Hyeon', sans-serif;
            color:#BE9524;
        }
        #bottomInfo #third {
            font-size:20px;
            font-family: 'Do Hyeon', sans-serif;
            color:darkolivegreen;
        }
        #bottomInfo #fourth {
            font-size:15px;
          
        }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div id="middle">
        <table id="middleInfo">
            <tr>
                <td>
                    &nbsp;<div>hobbyist</div>
                </td>
            </tr>
            <tr>
                <td>
                    하비스트에서 여러분의<br>재능을 공유해주세요.
                </td>
            </tr>
            <tr>
                <td style="height:400px;">
                    <button>아티스트 등록하기</button>  
                </td>
            </tr>
        </table>
          
    </div>
    <div id="bottom">
        <!-- 4행 3열-->
        <table id="bottomInfo">
            <tr>
                <td id="first" colspan="3">아티스트 어떻게 등록하나요?&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td id="second">STEP.01</td>
                <td id="second">STEP.02</td>
                <td id="second">STEP.03</td>
            </tr>
            <tr>
                <td id="third">아티스트등록 및 심사</td>
                <td id="third">수업등록 후 학생매칭</td>
                <td id="third">회차별 수업진행 및 정산</td>
            </tr>
            <tr>
                <td id="fourth">개인정보를 등록해주시면 관리자가 확인 후 아티스트 권한을 부여합니다.</td>
                <td id="fourth">수업정보 등록 후 관리자의 심사가 통과되면 수업이 개시됩니다. 학생매칭되면 수업이 진행됩니다.</td>
                <td id="fourth">회차별 수업 진행 후 2일 이내에 정산비 확인 메일을 보냅니다. 회신 확인 후 수업비를 정산해줍니다.</td>
            </tr>
        </table>
    </div>
</body>
</html>