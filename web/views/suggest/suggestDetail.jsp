<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#suggestDiv1 {
	margin-top: 10px;
	margin: auto;
	height: 250px;
	width: 1024px;
	background-image: url("/hobbyist/static/images/suggestback.png");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	}
	#label1 {
	font-family: 'Do Hyeon', sans-serif;
	color: darkolivegreen;
	font-size: 30px;
	}
	#suggestDetailDiv1 {
	width: 1000px;
	/* height: 500px; */
	margin-left: auto;
	margin-right: auto;
	}
	#suggestDetaiTab1 {
	font-family: 'Do Hyeon', sans-serif;
	color:darkolivegreen;
	margin:auto;
	margin-top:30px;
	}
	#suggestTd1 {
	font-size:18px;	
	}
	#suggestTd2 {
	font-family:initial; 
	color:#3c3c3c;
	}
	#addReply {
	height:50px;
	margin-top:-5px;
	}
	#goListBtn {
	width:100px; 
	height:30px;
	background-color:darkolivegreen;
	font-family: 'Do Hyeon', sans-serif;
	color:white;
	padding: 5px;
	border: 1px solid darkolivegreen;
	background-color: darkolivegreen;
	}
</style>
<title>hobbyist</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="suggestDiv1">
		<table>
			<tr style="height: 150px;">
				<td></td>
			</tr>
			<tr>
				<td><label id="label1">지금 하비스트와 함께<br>시작해보세요
				</label></td>
			</tr>
		</table>
	</div>
	<div id="suggestDetailDiv1">
		<table id="suggestDetaiTab1">
			<tr>
				<td colspan="2" style="font-size:22px;">수업건의하기</td>
				<td colspan="2" style="font-size:16px; text-align:right; color:#3c3c3c;"><label>차은우</label>|<label>2020-01-24 11:36</label>|조회<label>2258</label></td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.5px darkolivegreen;"></td>
			</tr>
			<tr>
				<td style="font-size:20px;">건의 제목</td>
				<td colspan="3" style=" font-family:initial; font-weight:bold; color:#3c3c3c;">야구 클래스</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td id="suggestTd1">카테고리</td>
				<td id="suggestTd2">스포츠</td>
				<td id="suggestTd1">상세 카테고리</td>
				<td id="suggestTd2">기타</td>
			</tr>
			<tr>
				<td id="suggestTd1">수업 인원</td>
				<td colspan="3" id="suggestTd2">소규모(2인~8인)</td>
			</tr>
			<tr>
				<td id="suggestTd1">수업료 (회차당)</td>
				<td id="suggestTd2">100,000원</td>
				<td id="suggestTd1">수업회차</td>
				<td id="suggestTd2">다회차</td>
			</tr>
			<tr>
				<td id="suggestTd1">희망 지역</td>
				<td id="suggestTd2">서울시 강남구</td>
				<td id="suggestTd1">희망일자</td>
				<td id="suggestTd2">2020년 2월 20일</td>
			</tr>
			<tr>
				<td id="suggestTd1">수업 요일</td>
				<td id="suggestTd2">주말</td>
				<td id="suggestTd1">수업 시간</td>
				<td id="suggestTd2">오전반</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="2" style="font-size:20px;">건의 내용</td>
				<td style="text-align:right;">
					<img src="/hobbyist/static/images/emptyheart.png" style="width:30px; height:30px;">
				</td>
				<td style="color:#3c3c3c;">
					수업 찜하기
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="4" style="font-family:initial; color:black;">
					<p>
						안녕하세요. 강남구에서 야구 수업을 듣고 싶은 학생입니다. 3명에서 8명 정도로 수업 진행했으면 좋겠습니다. <br>주말 오전 10시쯤 생각하고 있습니다. 수업이 열릴 수 있도록 동참 부탁드려요~!  감사합니다.
					</p>
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="4" style="text-align:right;">
					신고
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="4" style="font-size:20px;">이 건의로 개설된 수업</td>
			</tr>
			<tr>
				<td colspan="4" style="font-family:initial; color:black;">
					- 아티스트 : 김혜원 / 제목 : 진짜 야구를 알려줄께요
				</td>
			</tr>
			<tr>
				<td colspan="4" style="font-family:initial; color:black;">
					- 아티스트: 이지호 / 제목 : 한방에 홈런
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="4">댓글 <label>0</label></td>
			</tr>
		</table>
		<div class="replyArea">
      		<div class="replyWriteArea">
         		<table align="center">
      
            		<tr>
              			<td><textArea rows="3" cols="80" id="replyContent" style="resize:none;" placeholder="댓글로 수업에 동참해보세요!(50자 이상 기재)"></textArea></td>
               			<td><button id="addReply">댓글 등록</button></td>
            		</tr>
         		</table>
     		 </div>
      		 <div id="replySelectArea">
         		<table id="replySelectTable" border="1" align="center">
         		</table>
      		 </div>
   		</div>
   		<br><br><br>
   		<div style="text-align:center;">
   			<button id="goListBtn" onclick="goList();">목록보기</button>
   		</div>
   		<script>
   			function goList() {
   				location.href = "<%=request.getContextPath()%>/views/suggest/suggestList.jsp";
   			}
   		</script>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>