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
	#suggestDiv2 {
	width: 1000px;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
	}
	#suggestInsertTab1 {
	font-family: 'Do Hyeon', sans-serif;
	color:darkolivegreen;
	margin:auto;
	margin-top:30px;
	}
	#suggestInsertTab1 td {
	width:400px;
	}
	#suggestInsertTab1 select {
	height:25px;
	}
	#categoryName, #detailCategory, #minNum, #maxNum, #classPay, #classTimes {
	width:250px;
	}
	#area, #detailArea {
	width:122px;
	}
	#suggestBtns {
	text-align:center;
	}
	#suggestBtns button {
	height:30px;
	width:70px;
	}
	#suggestNextBtn {
	background: darkolivegreen;
	color: white;
	padding: 5px;
	border: 1px solid darkolivegreen;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	<div id="suggestDiv2">
		<table id="suggestInsertTab1">
			<tr>
				<td style="font-size:22px;">수업건의하기</td>
				<td style="font-size:16px; text-align:right;">건의할 수업의 옵션을 선택하세요</td>
			</tr>
			<tr>
				<td colspan="2"><hr style="border: solid 1.5px darkolivegreen;"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>상세 카테고리</td>
			</tr>
			<tr>
				<td>
					<select id="categoryName">
						<option value="">선택</option>
						<option value="music">음악</option>
						<option value="dance">댄스</option>
						<option value="picture">영상/사진</option>
						<option value="life">라이프스타일</option>
						<option value="beauty">뷰티</option>
						<option value="design">디자인</option>
						<option value="sports">스포츠</option>
					</select>
				</td>
				<td>
					<select id="detailCategory">
						<option>선택</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><hr style="border:solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="2">수업인원</td>
			</tr>
			<tr>
				<td>
					<select id="maxNum">
						<option>1:1</option>
						<option>소규모(2인~8인)</option>
						<option>대규모(9인 이상)</option>
					</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><hr style="border:solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td>수업료 (회차당)</td>
				<td>수업회차</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="classPay">
				</td>
				<td>
					<select id="classTimes">
						<option>일회차</option>
						<option>다회차</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><hr style="border:solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td>희망 지역</td>
				<td>희망 일자</td>
			</tr>
			<tr>
				<td>
					<select id="area">
						<option>서울시</option>
					</select>
					<select id="detailArea">
						<option>성북구</option>
					</select>
				</td>
				<td>
					<select id="year">
						<option>2020</option>
						<option>2021</option>
					</select>
					년 &nbsp;
					<select id="month">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select>
					월 &nbsp;
					<select id="day">
						<option>20</option>
					</select>
					일 &nbsp;
				</td>
			</tr>
			<tr>
				<td></td>
				<td style="color:#3c3c3c;">까지 개설되었으면 좋겠습니다.</td>
			</tr>
			<tr>
				<td colspan="2"><hr style="border:solid 1.15px darkolivegreen;"></td>
			</tr>
			<tr>
				<td colspan="2">수업 요일</td>
			</tr>
			<tr>
				<td colspan="2" style="color:#3c3c3c;">
					<input type="radio" name="day" id="weekday" value="weekday"><label for="weekday">평일</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="day" id="weekend" value="weekend"><label for="weekend">주말</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="day" id="irrelevant" value="irrelevant"><label for="irrelevant">무관</label>
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="2">수업 시간</td>
			</tr>
			<tr>
				<td colspan="2" style="color:#3c3c3c;">
					<input type="radio" name="time" id="dawn" value="dawn"><label for="dawn">새벽반</label>&nbsp;&nbsp;
					<input type="radio" name="time" id="am" value="am"><label for="am">오전반</label>&nbsp;&nbsp;
					<input type="radio" name="time" id="pm" value="pm"><label for="pm">오후반</label>&nbsp;&nbsp;
					<input type="radio" name="time" id="evening" value="evening"><label for="evening">저녁반</label>&nbsp;&nbsp;
					<input type="radio" name="time" id="irrelevant" value="irrelevant"><label for="irrelevant">무관</label>
				</td>
			</tr>
			<tr>
				<td colspan="2"><hr style="border:solid 1.15px darkolivegreen;"></td>
			</tr>
		</table>
		<br>
		<div id="suggestBtns">
			<button>취소</button> &nbsp;&nbsp; <button id="suggestNextBtn">다음</button>
		</div>
	</div>
	<script>
		$(function() {
			$("#suggestBtns").click(function(){
				location.href = "<%=request.getContextPath()%>/views/suggest/suggestInsertForm2.jsp";
			});
			
			$("#categoryName").change(function(){
				var categoryName = $("#categoryName").val();
				
				$.ajax({
					url: "/hobbyist/category.su",
					type: "post",
					data: {categoryName	: categoryName},
					success: function(data) {
						//console.log("서버 전송 성공!");
						
						//console.log(data);
						
						$select = $("#detailCategory");
						$select.find("option").remove();
						
						for(var key in data) {
							var $option = $("<option>");
							$option.text(data[key]);
							$select.append($option);
							}
					},
					error: function(error) {
						console.log(error);
					}
				});
			});
		});
	</script>
	<br><br><br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>