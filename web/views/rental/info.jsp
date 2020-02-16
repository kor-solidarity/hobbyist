<%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-02-13
  Time: 오후 2:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Room info</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eun-css.css">
</head>
<body>
<%@include file="/views/common/menubar.jsp" %>
<%@include file="category.jsp" %>
<br clear="both">
<div>
    <table class="standard-width " style="margin: 0 auto">
        <%--  --%>
        <tr>
            <td colspan="3">
                <h1 class="do-hyun-font" style="float: left; margin: 0 30px">ABC스터디</h1>
                <div class="room-card-tag" style="margin-top: 5px">일대일 공간</div>
                <div class="room-card-tag" style="margin-top: 5px">소규모 공간</div>
            </td>
        </tr>
        <tr>
            <td rowspan="">◀</td>
            <td style="width: 90%; ">
                <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png"
                     style="width: 100%;" alt="">
            </td>
            <td rowspan="">▶</td>
        </tr>
        <tr>
            <td></td>
            <td>
                <br>
                <%-- 상세설명 직전 개요 --%>
                <table class="room-info-summary" style="float: left">
                    <tr>
                        <th>주소:</th>
                        <td>서울 서대문구 신촌로 59 하모니마트 3층</td>
                    </tr>
                    <tr>
                        <th>전화:</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>사이트:</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>영업:</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>가격:</th>
                        <td></td>
                    </tr>
                </table>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <th style="text-align: left">상세 설명</th>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td style="padding-left: 20px">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque debitis eos illo nulla unde. Dolore
                explicabo neque non rem sit, vel vitae. Accusamus minima molestiae nemo nihil numquam quam sint.
                <br>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi cum, dignissimos, est et eum expedita
                facere, hic illo libero molestias numquam perferendis quae veritatis. Cupiditate distinctio nulla
                pariatur quo reprehenderit.
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: center">
                <br>
                <button style="width: 120px; height: 45px">목록보기</button>
            </td>
            <td></td>
        </tr>
    </table>
</div>
</body>
</html>
