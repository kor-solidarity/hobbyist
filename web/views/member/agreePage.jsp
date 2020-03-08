<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hobbyist</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic|Roboto|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
<style>
	  body {
            margin:auto;
            position: relative;
            width: 1024px;
            height: 1600px;
            background: #FFFFFF;
            font-size: 14px;
            font-family: 'Nanum Gothic', sans-serif; 
        }
        #title {
            color:darkolivegreen;
            font-family: 'ZCOOL QingKe HuangYou', cursive;
            margin-top: 50px;
            font-size: 60px;
            cursor:pointer;
        }
        
        #termsArea, #privacyArea {
        	height:500px;
        	margin-top: 150px;
        	margin: auto;
        }
        
        #termsTitle {
        	margin-left: 160px;
        	width:120px;
        	height: 31px;
        	font-family: Do Hyeon;
			font-style: normal;
			font-weight: normal;
			font-size: 25px;
			line-height: 31px;
			color: darkolivegreen;
			
			margin-top: 150px;
        }
        
        #conditions1, #conditions2 {
        	margin: auto;
        	width:700px;
        	height:380px;
        	margin-top: 25px;
        	overflow: scroll;
        	border: 1px solid #9B9999;
        	font-size: 15px;
        	
        }
        
        
        #privacyTitle  {
        	margin-left: 160px;
        	width:200px;
        	height: 31px;
        	font-family: Do Hyeon;
			font-style: normal;
			font-weight: normal;
			font-size: 25px;
			line-height: 31px;
			color: darkolivegreen;
			
			margin-top: 80px;
        
        }
        
        #termsCheckArea {
			margin-left:450px;
			margin-top:30px;        
        }
        
        #privacyCheckArea {
        	margin-left: 340px;
        	margin-top: 30px;
        }
        
       label {
       	font-size: 15px;
       }
       
       #allCheckArea {
       	margin:auto;
       	margin-left:200px;
       	margin-top: 80px;
       	
       }
       
       
       
       
       #btnArea {
       	margin-top: 100px;
       	align:center;
       }
       
       .termsCheck {
       	 display: inline-block;
       }
       
       .privacyCheck {
      	 display: inline-block;
       }
       
       
       .allCheck {
       	 display: inline-block;
       /* 	 margin-top: -40px; */
       	 margin-right:30px;
       }
       #allCheck1 {
       	 margin-left:80px;
       }
       
       #allCheck2 {
       	 margin-left:30px;
       }
       
       .btn {
       	 display: inline-block;
       	 width: 110px;
       	 height: 40px;
       	 text-align:center;
       	 line-height: 40px;
       	 font-size: 15px;
       	 margin: 30px;
       	 margin-top:20px;
       	 cursor: pointer;
       }
       
       #backBtn {
       	background: lightgray;
       	margin-left: 365px;
       	
       }
       
       #agreeBtn {
       background: darkolivegreen;
       color: white;
       }
        
         
</style>
</head>
<body>
	<div id="header">
        <h1 id="title" align="center" onclick="goHome();">hobbyist</h1>
    </div>
    
    <div id="termsArea">
    <div id="termsTitle">이용약관</div>
    <div id="conditions1">
    <br>
   <p style="font-weight:900;"> 제1장 총칙</p><br><br>


제1조 (목적)<br><br>

이 약관은 하비스트(이하 당사)이 제공하는 수업 연결 서비스를 이용함에 있어 당사와 이용자의 권리, 의무 및 책임사항을 규정합니다. 이를 통하여 당사와 이용자는 알아야 할 사항을 숙지, 상호 신뢰의 증진을 목적으로 합니다.<br><br>


제2조 (약관의 효력 및 변경)<br><br>

가. 이 약관은  하비스트 사이트에 회원으로 등록, 조회 등 서비스 이용 순간부터 효력이 발생됩니다.<br>

나. 당사에서는 서비스 이용 수수료 등을 포함하여 각종 약관을 어느 시기에나 변경할 권리를 갖고 있으며 사전 고지 없이 이 약관들의 내용을 변경할 수 있습니다. 변경된 약관은 홈페이지 공지, 회원가입 시 공지 또는 전자우편 등의 기타 방법으로 공지함으로써 효력이 발생됩니다. 당사는 또한 “마지막 수정일”의 날짜를 약관의 가장 상단에 나타낼 것입니다. 이는 서비스 이용약관 뿐만 아니라, 결제서비스약관, 환불규정, 개인정보보호정책 약관 모두가 해당됩니다.<br>

다. 기존 회원들은 당사가 변경된 약관의 수정사항을 홈페이지 또는 이메일 등의 방법을 통해 공지한 경우, 웹사이트 또는 서비스를 지속적으로 이용할 경우에 변경 사항에 대해 동의 한 것으로 간주합니다. 만일 수정 약관에 대해 동의하지 않는 경우에는 사이트와 서비스 이용을 즉시 중단 하거나 탈퇴함으로써 약관의 내용을 거부할 수 있습니다.<br><br>


제3조 (약관 외 사항의 처리)<br><br>

본 약관과 개인정보취급방침에 명시되지 않은 사항에 대해서는 관련 법령 및 회사가 정한 서비스 이용 안내에 따릅니다.<br><br>


제4조 (용어의 정리)<br><br>

이 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.<br>

가. 학생 : 아티스트를 구하기 위해 당사의 약관에 동의하고 일반 회원 양식에 따라 등록한 자.<br>

나. 아티스트 : 학생을 구하기 위해 당사의 약관에 동의하고 일반 회원에서 추가로 아티스트 양식에 따라 등록한 자.<br>

다. 학생과 아티스트가 처음 진행하는 1시간 수업에서 최소 20분간의 OT를 필수로 진행하여야 합니다. 1회 수업은 1시간만 포함하며 이후 진행된 시간은 추가 수업으로 간주됩니다.<br>


제5조 (중개서비스의 성질과 목적)

중개서비스는 회사가 회원 각자의 자기결정에 의하여 회원 상호간에 수업의 거래가 이루어질 수 있도록 사이버 거래장소(marketplace)를 온라인으로 제공하는 것이며, 하비스트 안전결제서비스는 회원 상호간에 수업의 매매에 있어서 안전하고 편리하게 결제가 이루어질 수 있는 수단을 제공하는 것입니다. 회사는 단지 회원간 거래의 안전성 및 신뢰성을 증진시키는 도구만을 제공합니다. 회원간에 성립된 거래와 관련된 책임은 거래당사자인 회원들 스스로가 부담하여야 합니다.
    </div>
    <div id="termsCheckArea">
    <div class="termsCheck" id="termsCheck1"><input type="checkbox" name="termsAgree" id="termsAgree"><label id="agree1" for="termsAgree">이용약관에 동의합니다.</label></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="termsCheck" id="termsCheck2"><input type="checkbox" name="termsDisagree" id="termsDisagree"><label id="disagree1" for="termsDisagree">이용약관에 동의하지 않습니다.</label></div>
    </div>
    </div>
    
    <div id="privacyArea">
    <div id="privacyTitle">개인정보취급방침</div>
    <div id="conditions2">
  <p style="font-weight:900;">하비스트(이하 “회사”)는 회사가 운영하는 인터넷 사이트(www.hobbyist.com, 이하 “사이트”)를 이용하는 이용자님들의 개인정보를 매우 중요하게 생각하며 아래와 같은 개인 정보취급방침을 가지고 있습니다. 이 개인정보취급방침은 개인정보와 관련한 법령 또는 지침의 변경이 있는 경우 갱신되고, 정책의 변화에 따라 달라질 수 있으니 이용자께서는 하비스트를 방문 시 수시로 확인하여 주시기 바랍니다. 회사의 개인정보취급방침은 다음과 같은 내용을 담고 있습니다.

회사는 이용자에게 본인확인, 결제 서비스, 다양하고 편리한 인터넷 서비스를 제공하기 위하여 아래의 방법을 통해 개인정보를 수집하고 있습니다.</p><br><br>


가. 개인정보 수집항목<br><br>

- 성명, 관심재능, 비밀번호, 휴대전화번호, E-Mail, 계좌번호 등<br><br>

나. 서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보의 범위<br><br>

- 서비스 이용기록, 접속 로그, 쿠키, 접속IP정보, 결제기록, 이용정지 기록<br><br>

다. 개인정보의 수집방법<br><br>

- 회사는 이용자가 사이트 가입시 개인정보 보호정책과 이용약관의 각각의 내용에대해 회원가입시 각각의 내용에 대해 동의를 할 수 있는 절차를 고지하여, 회원가입이 진행된 경우 개인정보 수집에 대해 동의한 것으로 봅니다.<br><br>

라. 허위 정보 입력 시 회사의 조치<br><br>

- 고객은 자신의 정보에 대해 정확성 및 적법성을 보장해야 합니다. 만약 이를 위반하여 타인의 정보를 도용하는 등 각종 방법으로 허위 정보를 입력할 경우 회사는 해당
  고객을 관계법령에 따라 신고 할 수 있으며 강제 탈퇴를 시킬 수도 있습니다.<br><br>



[목차]

0. 개인정보 수집에 대한 동의
1. 개인정보의 수집 및 이용 목적
2. 개인정보의 보유 및 이용기간
3. 개인정보의 파기절차 및 방법
4. 개인정보의 제3자 제공 및 공유
5. 개인정보의 처리 위탁
6. 회원의 권리와 그 행사방법
7. 회원의 의무
8. 링크사이트
9. 개인정보 자동수집 장치(쿠키 등)의 설치, 운영 및 그 거부에 관한 사항
10.개인정보의 기술적/관리적 보호 대책
11. 개인정보보호책임자
12. 개인정보처리방침의 개정과 그 공지



0. 개인정보 수집에 대한 동의

회사는 이용자들이 회사의 개인정보 취급방침 또는 이용약관의 내용에 대하여 동의할 수 있는 절차를 고지하여, 회원가입이 진행된 경우 개인정보 수집에 대해 동의한 것으로 봅니다.


1. 개인정보 수집 및 이용 목적

"개인정보"라 함은 생존하는 개인에 관한 정보로, 성명, 이메일 주소, 전화번호 등 개인을 식별할 수 있는 정보를 말합니다. 대부분의 하비스트 서비스는 별도의 사용자 등록 없이 언제든지 볼 수 있습니다. 그러나 회사는 회원서비스(이벤트 생성과 같이 현재 제공 중이거나 향후 제공될 로그인 기반의 서비스)등을 통하여 이용자들에게 맞춤식 서비스를 비롯한 보다 더 향상된 양질의 서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다. 회사는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.

첫째, 이용자들의 개인정보를 기반으로 보다 더 유용한 서비스를 개발할 수 있습니다. 회사는 신규 서비스개발이나 콘텐츠의 확충 시에 기존 이용자들이 회사에 제공한 개인정보를 바탕으로 개발해야 할 서비스의 우선 순위를 보다 더 효율적으로 정하고, 회사는 이용자들이 필요로 할 콘텐츠를 합리적으로 선택하여 제공할 수 있습니다.

둘째, 회사가 제공하는 각종 정보 및 서비스 등은 대부분 무료입니다. 회사는 이러한 무료 서비스를 제공하기 위해 광고를 유치할 수 있으며 이때 이용자들에 대한 정확한 개인정보를 바탕으로 각 서비스나 메뉴 등에 적절하게 광고와 내용들을 전달할 수 있습니다. 회사는 광고주들로부터 광고를 받아 광고주들이 대상으로 하려는 이용자의 유형에 맞게 광고를 보여줄 뿐, 광고주들에게는 절대로 이용자들의 개인정보를 보여주거나 제공하지 않습니다.


셋째, 회원구분에 따라서 다음의 목적을 위해서 회원정보를 수집, 이용하고 있습니다.

가. 모든 회원공통

필수 : 성명, 관심재능, 비밀번호, 휴대전화번호, E-Mail

나. 아티스트 (개인)

필수 : 정산정보 - 결제 정산용 계좌번호, E-MAIL, 휴대전화
기타 : 보유 자격증, 학력, 경력

다. 학생 회원

필수 : 정산정보 - 환불에 필요한 계좌번호(환불시)
기타 : 아티스트가 추가로 요구하는 정보


넷째, 기타 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
  -서비스 이용기록, 접속 로그, 쿠키, 접속IP 정보, 결제기록 : 부정 이용 방지, 비인가 사용 방지 등

다섯째, 회원님의 기본적 인권 침해의 우려가 있는 민감정보(범죄경력, 유전정보 등)를 수집하지 않습니다.

여섯째, 회원님이 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않으며, 수집정보의 범위나 사용목적, 용도가 변경될 시에는 반드시 회원님들께 사전동의를 구할 것 입니다.

위 정보는 가입 당시 정보만 아니라 정보수정으로 변경된 정보를 포함 합니다.


2. 개인정보의 보유 및 이용기간

회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 개인정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.

- 보존 항목 : 쿠키, 세션
- 보존 근거 : 회사의 서비스이용약관 및 개인정보취급방침에 동의
- 보존 기간 : 로그아웃 시 삭제
  그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
- 보존 항목 : 이름, E-MAIL, 휴대전화번호, 비밀번호, 이용정보, 정산정보
- 보존 근거 : 회사의 서비스이용약관 및 개인정보취급방침에 동의
- 보존 기간: 회원으로서의 자격을 유지하는 동안

[기타]

1) 계약 또는 청약철회 등에 관한 기록
  - 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
  - 보존기간: 5년
  (수업 신청 정보는 계약 정보에 해당 합니다. )

2) 대금결제 및 재화 등의 공급에 관한 기록
  - 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
  - 보존기간 : 5년

3) 소비자의 불만 또는 분쟁처리에 관한 기록
  - 보존근거 : 전자상거래등에서의 소비자보호에 관한 법률
  - 보존기간 : 3년

4) 웹사이트 방문기록
  -보존근거 : 통신비밀보호법
  -보존기간 : 3개월


3. 개인정보의 파기절차 및 방법

회원님의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.

가. 파기절차
  - 회원님이 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호
  사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.
  - 별도DB로 옮겨진 개인정보는 법률에 의한 경우를 제외하고는 다른 목적으로 이용되지 않습니다.

나. 파기방법
  - 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
  - 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.


4. 개인정보의 제3자 제공 및 공유

가. 회사는 회원님의 개인정보를 제1조에서 고지한 범위 내에서 사용하며, 회원님의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
- 이용자들이 사전에 공개 또는 제3자 제공에 동의한 경우
- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

나. 회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 상담 등 거래 당사자간 원활한 의사소통과 배송 및 모임 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 당사자에게 제공합니다.


5. 개인정보의 처리 위탁

회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 현재 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 다음과 같습니다.

수탁자	위탁업무	개인정보의 보유 및 이용기간
(주)다날	전자결제대행	회원탈퇴 시 혹은 위탁계약 종료시 까지
(주)청기와랩	SMS 발송	회원탈퇴 시 혹은 위탁계약 종료시 까지


6. 회원의 권리와 그 행사방법

가. 회원님은 언제든지 등록되어 있는 본인의 개인정보를 조회하거나 수정할 수 있으며 회원 탈퇴 절차를 통하여 개인정보 이용에 대한 동의 등을 철회할 수 있습니다.

나. 개인정보의 조회/수정을 위해서는 사이트의 [마이페이지]내의 [회원정보수정] 항목에서 확인 가능하며, 가입 해지(동의철회)는 하비스트센터로 연락하면 회사에서 요청사항에 대해 처리합니다. 이 외에도 회사의 개인정보 보호책임자에게 서면, 전화 또는 이메일로 연락하여 열람/수정/탈퇴를 요청하실 수 있습니다.

다. 회원님이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 회사는 회원님의 요청에 의해 해지 또는 삭제된 개인정보는 제2조에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.


7. 회원의 의무

가. 회원님의 개인정보를 최신의 상태로 정확하게 입력하시기 바랍니다. 회원님의 부정확한 정보입력으로 발생하는 문제의 책임은 회원님 자신에게 있으며, 타인의 주민등록번호 등 개인정보를 도용하여 서비스 이용 시 회원자격 상실과 함께 주민등록법에 의거하여 처벌될 수 있습니다.

나. 회원님은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 아이디, 비밀번호를 포함한 회원님의 개인정보가 유출되지 않도록 조심하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오.

다. 회원님은 『정보통신망이용촉진및정보보호등에관한법률』, 개인정보보호법, 주민등록법 등 기타 개인정보에 관한 법률을 준수하여야 합니다.


8. 링크사이트

회사는 회원님께 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다. 이 경우 회사는 외부웹사이트 및 자료에 대한 아무런 통제권이 없으므로 그로부터 제공받는 서비스나 자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다. 회사가 포함하고 있는 링크를 통하여 타 웹사이트의 페이지로 옮겨갈 경우 해당 웹사이트의 개인정보처리방침은 회사와 무관하므로 새로 방문한 웹사이트의 정책을 검토해보시기 바랍니다.


9. 개인정보 자동수집 장치(쿠키 등)의 설치, 운영 및 그 거부에 관한 사항

가. 쿠키 사용

회사는 회원님들에게 보다 적절하고 유용한 서비스를 제공하기 위하여 회원님의 정보를 수시로 저장하고 불러오는 ‘쿠키(cookie)’를 사용합니다. 쿠키란 회사의 웹사이트를 운영하는데 이용되는 서버가 회원님의 컴퓨터로 전송하는 아주 작은 텍스트 파일로서 회원님의 컴퓨터 하드디스크에 저장됩니다. 회원님께서는 쿠키의 사용여부에 대하여 선택하실 수 있습니다. 단, 쿠키를 사용하지 않아 생기는 서비스 사용의 문제 및 제한은 회사가 책임 지지 않습니다.

나. 쿠키 설정 거부 방법

회원님은 사용하시는 웹 브라우저의 옵션을 설정함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 단, 쿠키의 저장을 거부할 경우 로그인이 필요한 일부 서비스의 이용에 제한이 생길 수 있음을 양지하시기 바랍니다.

- 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)

1) [도구] 메뉴에서[인터넷 옵션]을 선택

2) [개인정보]를 클릭

3) [고급]을 클릭

4) 쿠키 허용여부를 선택


10. 개인정보의 기술적/관리적 보호 대책

회사는 회원님의 개인정보를 보호하기 위하여 다음과 같은 보호 대책을 시행하고 있습니다.

가. 비밀번호의 암호화

회원님의 비밀번호는 암호화되어 저장 및 관리되고 있습니다. 비밀번호는 오직 회원 본인만이 알 수 있으며 개인정보를 확인 및 변경할 경우에도 비밀번호를 알고 있는 본인에 의해서만 가능합니다. 따라서 회원님의 비밀번호가 타인에게 알려지지 않도록 각별히 주의하시기 바랍니다.

나. 해킹 및 컴퓨터 바이러스 등에 대비

회사는 해킹이나 컴퓨터 바이러스에 의하여 회원님들의 개인정보가 유출되거나 훼손되는 것을 막기 위하여 필요한 보안조치를 이용하고 있으며, 더욱 향상된 보안조치를 확보할 수 있도록 가능한 모든 기술적 방법을 구비하기 위하여 노력하고 있습니다.

다. 개인정보 처리자의 제한 및 교육 회사는 개인정보를 처리하는 직원을 최소한으로 제한하고 있으며, 관련 직원들에 대한 교육을 수시로 실시하여 본 방침의 이행 및 준수여부를 확인하고 있습니다.


11. 개인정보보호책임자

회원님의 개인정보를 보호하고 개인정보와 관련된 불만 등을 처리하기 위하여 회사는 고객서비스담당 부서 및 개인정보보호책임자를 두고 있습니다. 회원님의 개인정보와 관련한 문의사항은 아래의 고객서비스담당 부서 또는 개인정보보호책임자에게 연락하여 주시기 바랍니다.

□ 고객서비스담당 부서: 하비스트센터

전화번호: 1877-1233
    </div>
    
    <div id="privacyCheckArea">
    <div class="privacyCheck" id="privacyCheck1"><input type="checkbox" name="privacyAgree" id="privacyAgree"><label id="agree2" for="privacyAgree">개인정보 취급방침에 동의합니다.</label></div>&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="privacyCheck" id="privacyCheck2"><input type="checkbox" name="privacyDisagree" id="privacyDisagree"><label id="disagree2" for="privacyDisagree">개인정보 취급방침에 동의하지 않습니다.</label></div>
    </div>
    </div>
    
    <div id="allCheckArea">
    <div class="allCheck" id="allCheck1"><input type="checkbox" name="allAgree" id="allAgree"><label id="agree2" for="allAgree">약관에 모두 동의합니다.</label></div>&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="allCheck" id="allCheck2"><input type="checkbox" name="allDisagree" id="allDisagree"><label id="disagree2" for="allDisagree">약관에 모두 동의하지 않습니다.</label></div>
    </div>
    
    <div id="btnArea">
    <div class="btn" id="backBtn">이전으로</div>
    <div class="btn" id="agreeBtn" onclick="goRegister();">다음으로</div>
    </div>
    
    
    <script>
    
    	function goHome() {
    		location.href = "<%= request.getContextPath()%>/index.jsp";
    	}
    	
    	ck = false;
    	
    	function goRegister() {
    		if(ck == true) {
    			location.href = "<%=request.getContextPath()%>/views/member/registerForm.jsp";
    		}else {
    			alert("약관에 모두 동의 하셔야 가입을 진행할 수 있습니다.");
    		}
    	}
    
    
    
    	$(function() {
    		
    		$("#backBtn").click(function() {
    			location.href = "<%=request.getContextPath()%>/views/member/loginForm.jsp";
    		});
    		

    		$("#allAgree").click(function() {
        		if($("#allAgree").is(':checked')) {
        			$("#termsAgree").prop('checked', true);
            		$("#privacyAgree").prop('checked', true);
            		$("#termsDisagree").prop('checked', false);
            		$("#privacyDisagree").prop('checked', false);
            		$("#allDisagree").prop('checked', false);
            		ck = true;
        		}else {
        			$("#termsAgree").prop('checked', false);
            		$("#privacyAgree").prop('checked', false);
            		/* $("#termsDisagree").attr('checked', true);
            		$("#privacyDisagree").attr('checked', true);
            		$("#allDisagree").attr('checked', false);  */
        		}
        	});	
    		
    		$("#allDisagree").click(function() {
        		if($("#allDisagree").is(':checked')) {
        			$("#termsDisagree").prop('checked', true);
            		$("#privacyDisagree").prop('checked', true);
            		$("#termsAgree").prop('checked', false);
            		$("#privacyAgree").prop('checked', false);
            		$("#allAgree").prop('checked', false);
            		ck =false;
        		}else {
        			$("#termsDisagree").prop('checked', false);
            		$("#privacyDisagree").prop('checked', false);
            		/* $("#termsAgree").attr('checked', true);
            		$("#privacyAgree").attr('checked', true);
            		$("#allAgree").attr('checked', true); */
        		}
        	});	
    		
    		$("#termsAgree").click(function() {
    			if($("#termsAgree").is(':checked')) {
    				$("#termsDisagree").prop('checked', false);
    				$("#allAgree").prop('checked', false);
    				$("#allDisagree").prop('checked', false);
    				if($("#termsAgree").is(':checked') && $("#privacyAgree").is(':checked')) {
    	    			$("#allAgree").prop('checked', true);
    	    			$("#allDisagree").prop('checked', false);
    	    		}
    			}else {
    				$("#allAgree").prop('checked', false);
    				$("#allDisagree").prop('checked', false);
    			}
    			
    		});
    		
    		$("#termsDisagree").click(function() {
    			if($("#termsDisagree").is(':checked')) {
    				$("#termsAgree").prop('checked', false);
    				$("#allAgree").prop('checked', false);
    				$("#allDisagree").prop('checked', false);
    				if($("#termsDisagree").is(':checked') && $("#privacyDisagree").is(':checked')) {
    	    			$("#allDisagree").prop('checked', true);
    	    			$("#allAgree").prop('checked', false);
    	    		}
    				ck =false;
    			}else {
    				$("#allAgree").prop('checked', false);
    				$("#allDisagree").prop('checked', false);
    			}
    		});
    		
    		$("#privacyAgree").click(function() {
    			if($("#privacyAgree").is(':checked')) {
    				$("#privacyDisagree").prop('checked', false);
    				$("#allAgree").prop('checked', false);
    				$("#allDisagree").prop('checked', false);
    				if($("#termsAgree").is(':checked') && $("#privacyAgree").is(':checked')) {
    	    			$("#allAgree").prop('checked', true);
    	    			$("#allDisagree").prop('checked', false);
    	    			ck = true;
    	    		}
    				
    			}else {
    				$("#allAgree").prop('checked', false);
    				$("#allDisagree").prop('checked', false);
    			}
    		});
    		
    		$("#privacyDisagree").click(function() {
    			if($("#privacyDisagree").is(':checked')) {
    				$("#privacyAgree").prop('checked', false);
    				$("#allAgree").prop('checked', false);
    				$("#allDisagree").prop('checked', false);
    				if($("#termsDisagree").is(':checked') && $("#privacyDisagree").is(':checked')) {
    	    			$("#allDisagree").prop('checked', true);
    	    			$("#allAgree").prop('checked', false);
    	    			ck = true;
    	    		}
    				ck =false;
    			}else {
    				$("#allAgree").prop('checked', false);
    				$("#allDisagree").prop('checked', false);
    			}
    		});
    		
    		
    		if($("#allAgree").is(':checked')) {
    			ck = true;
    		}
    		
    		
    		
    	});
    	
    	
    	
    </script>
    
    
    
</body>
</html>