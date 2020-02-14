<%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-02-08
  Time: 오후 5:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%-- 학생이  --%>
<html>
<head>
    <title>StudyRoomList</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/students.css">
</head>
<body>
<%@include file="/views/common/menubar.jsp" %>
<%@include file="rental_category.jsp"%>
<div>
    <table border="0" class="do-hyun-font standard-width" style=" margin: 0 auto">
        <tr>
            <td class="float-left">
                <select name="location" id="" style="font-family: 'Do Hyeon', sans-serif; font-size: 20px">
                    <option value="all">지역</option>
                </select>&nbsp;
                <select name="" id="" style="font-family: 'Do Hyeon', sans-serif; font-size: 20px">
                    <option value="all">공간스타일</option>
                </select>
            </td>
        </tr>
        <tr class="float-left" style="font-size: 25px;">
            <td>등록된 공간 10개</td>
        </tr>
    </table>
</div>
<div class="standard-width" style="margin: auto">
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
    <div class="room-card">
        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;" alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>
            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>
            <div class="room-card-tag">일대일 공간</div>
            <div class="room-card-tag">소규모 공간</div>
        </div>
    </div>
</div>
<div class="" style="text-align: center; clear:both;">
    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a href="#" class="active">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">&raquo;</a>
    </div>
</div>
<br>
</body>
</html>
