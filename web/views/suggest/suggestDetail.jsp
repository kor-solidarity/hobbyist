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
	height: 500px;
	margin-left: auto;
	margin-right: auto;
	}
	#suggestDetaiTab1 {
	font-family: 'Do Hyeon', sans-serif;
	color:darkolivegreen;
	margin:auto;
	margin-top:30px;
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
				<td>건의 제목</td>
				<td colspan="3">야구 클래스</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.5px darkolivegreen;"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>스포츠</td>
				<td>상세 카테고리</td>
				<td>기타</td>
			</tr>
			<tr>
				<td>수업 인원</td>
				<td colspan="3">소규모(2인~8인)</td>
			</tr>
			<tr>
				<td>수업료 (회차당)</td>
				<td>100,000원</td>
				<td>수업회차</td>
				<td>다회차</td>
			</tr>
			<tr>
				<td>희망 지역</td>
				<td>서울시 강남구</td>
				<td>희망일자</td>
				<td>2020년 2월 20일</td>
			</tr>
			<tr>
				<td>수업 요일</td>
				<td>주말</td>
				<td>수업 시간</td>
				<td>오전반</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.5px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="2">건의 내용</td>
				<td style="text-align:right;">
					<img src="/hobbyist/static/images/emptyheart.png" style="width:30px; height:30px;">
				</td>
				<td style="color:#3c3c3c;">
					수업 찜하기
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: solid 1.5px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="4" style="font-family:initial">
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
				<td colspan="4"><hr style="border: solid 1.5px darkolivegreen;"></td>
			</tr>
		</table>
		
	</div>
</body>
</html>