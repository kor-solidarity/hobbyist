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
	background-color:lightgray;
}

#wrapper {
	width: 1024px;
	margin: 0 auto;
	background-color:white;
}

#hobbyist {
	color: #556B2F;
	margin: left;
	font-family: 'ZCOOL QingKe HuangYou', cursive;
	font-size: 50px;
	font-weight: vold;
}

.main {
	width: 1024px;
	height: 700px;
	/* border: 1px;
	border-style: solid;
	border-color: #556B2F; */
}

#main-top {
	height: 20%;
	/* background-color: green; */
}

#main-middle {
	height: 70%;
}

#main-bottom {
	height: 10%;
}

.title {
	font-family: 'Do Hyeon', sans-serif;
}

td {
	font-family: 'Do Hyeon';
	font-size: 30px;
	text-align: center;
}

.menu {
	color: #A7A1A1;
	margin-bottom: unset;
}

.hgreen {
	color: #556B2F;
}

.btn {
	display: table-cell;
	vertical-align: middle;
	font-family: Do Hyeon;
	font-size: 25px;
	text-align: center;
}

#prev {
	width: 100px;
	height: 40px;
	background-color: #C4C4C4;
}

#next {
	width: 100px;
	height: 40px;
	background-color: #556B2F;
}

#main-table {
	/* border: 1px solid black; */
	width: 80%;
	height: 90%;
	font-family: Do Hyeon;
	margin: 5px auto;
}

#main-table td {
	/* border: 1px solid black; */
	font-size: 22px;
	color: #556B2F;
	text-align: left;
	display: table-cell;
	vertical-align: top;
}

select {
	height: 30px;
	font-size: 18px;
}

input[type='text'] {
	height: 25px;
	width: 450px;
}
</style>
</head>
<body>
	<section id="wrapper">
        <header>
            <h1 id="hobbyist">hobbyist</h1>
        </header>
        <section>
            <div class="main">
                <div id="main-top">
                    <table height="100%" width="100%">
                        <tr class="hgreen" height="50%">
                            <td>수업개설</td>
                            <td rowspan="4"></td>
                        </tr>
                        <tr class="menu" height="50%">
                            <td class="hgreen">01. 기본정보</td>
                            <td>02. 자격/경력</td>
                            <td>03. 아티스트소개</td>
                            <td>04. 수업소개</td>
                            <td>05. 일정추가</td>
                        </tr>
                    </table>
                </div>
                <div id="main-middle">
                    <table id="main-table">
                        <tr>
                            <td style="width:33%">
                                <div>카데고리</div>
                                <div>
                                <select name="category">
                                    <option value="music">음악</option>
                                    <option>댄스</option>
                                    <option>영상/사진</option>
                                    <option>라이프스타일</option>
                                    <option>뷰티</option>
                                    <option>디자인</option>
                                    <option>스포츠</option>
                                </select>
                                </div>
                            </td>
                            <td colspan="2">
                                <div>수업제목</div>
                                <div><input type="text"></div>
                                <div>0/50</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>상세 카테고리</div>
                                <select name="subCategory">
                                    <option value="music">음악</option>
                                    <option>댄스</option>
                                    <option>영상/사진</option>
                                    <option>라이프스타일</option>
                                    <option>뷰티</option>
                                    <option>디자인</option>
                                    <option>스포츠</option>
                                </select>
                            </td>
                            <td>
                                <div>수업 최소인원</div>
                                <select name="subCategory">
                                    <option value="music">음악</option>
                                    <option>댄스</option>
                                    <option>영상/사진</option>
                                    <option>라이프스타일</option>
                                    <option>뷰티</option>
                                    <option>디자인</option>
                                    <option>스포츠</option>
                                </select>
                            </td>
                            <td>
                                <div>수업 최대인원</div>
                                <select name="subCategory">
                                    <option value="music">음악</option>
                                    <option>댄스</option>
                                    <option>영상/사진</option>
                                    <option>라이프스타일</option>
                                    <option>뷰티</option>
                                    <option>디자인</option>
                                    <option>스포츠</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: bottom;">이미지 업로드</td>
                            <td>
                                <div>총 회차</div>
                                <select name="subCategory">
                                    <option value="music">음악</option>
                                    <option>댄스</option>
                                    <option>영상/사진</option>
                                    <option>라이프스타일</option>
                                    <option>뷰티</option>
                                    <option>디자인</option>
                                    <option>스포츠</option>
                                </select>
                            </td>
                            <td>
                                <div>회차당 비용</div>
                                <select name="subCategory">
                                    <option value="music">음악</option>
                                    <option>댄스</option>
                                    <option>영상/사진</option>
                                    <option>라이프스타일</option>
                                    <option>뷰티</option>
                                    <option>디자인</option>
                                    <option>스포츠</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
								<img src="<%= request.getContextPath() %>/static/images/iphoneCamera.png" width="80px" height="80px">
								<img src="<%= request.getContextPath() %>/static/images/iphoneCamera.png" width="80px" height="80px">
								<img src="<%= request.getContextPath() %>/static/images/iphoneCamera.png" width="80px" height="80px">
								<img src="<%= request.getContextPath() %>/static/images/iphoneCamera.png" width="80px" height="80px">
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="main-bottom" align="right">
                    <div id="prev" class="btn">이전</div>
                    <div class="btn" style="width:8px;"></div>
                    <div id="next" class="btn" style="color:white;">다음</div>
                    <div class="btn" style="width:8px;"></div>
                </div>
            </div>
        </section>
        <footer>

        </footer>
    </section>
</body>
</html>