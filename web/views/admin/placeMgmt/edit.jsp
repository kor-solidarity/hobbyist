<%--
  Created by IntelliJ IDEA.
  User : SOY
  Date : 2020-02-18
  Time : 오후 1 :49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/admin-css.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eun-css.css">
    <%@include file="/views/common/boot4-script.jsp" %>
    <%@include file="/views/common/boot4.jsp" %>
</head>
<body>
<%@ include file="/views/common/adminMenubar.jsp" %>

<section>

    <!-- 왼쪽 사이드바 메뉴  -->
    <article id="sideMenuBar">

        <!-- 큰 영역의 메뉴 -->
        <div id="bigMenu">
            <label style="font-weight : bold; font-size : 25px;">게시판관리</label>
            <hr style="width : 80%; color : #DED842; height : 1px; background : #DED842; margin-top : 17px;">
        </div>

        <!-- 큰 메뉴안의 상세 메뉴 여러개 -->
        <div id="smallMenu">
            <label>공간대여광고 관리</label><br>
        </div>
    </article>
    <article id="contents">
        <!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
        <div id="searchDetailArea">

            <!-- 상세페이지, 정렬, 검색 테이블 -->
            <table id="searchT" border="0">
                <tr>
                    <td style="text-align : left; vertical-align : bottom;">
                        <label style="font-weight : bold;">공간대여관리 편집</label></td>
                    <%--                    <td style="padding-right : 20px; text-align : right; vertical-align : bottom;">--%>
                    <%--                        <select name="category" id="category">--%>
                    <%--                            <option value="all" selected>전체</option>--%>
                    <%--                            <option value="all">업체명</option>--%>
                    <%--                            <option value="all">업주명</option>--%>
                    <%--                        </select>--%>
                    <%--                        <input style="" class="" name="searchMember">--%>
                    <%--                        <button id="searchBtn">검색</button>--%>
                    <%--                    </td>--%>
                </tr>
            </table>
        </div>
        <hr id="firstLine">
        <div id="infoArea">
            <table style="width : 95%; float : right" class="place-edit-table">
                <!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
                <tr>
                    <td style="">업체명 :</td>
                    <td style="">
                        <input type="text" name="name" value="Drifterz studio">
                    </td>
                </tr>
                <tr>
                    <td>전화번호 :</td>
                    <td>
                        <input type="text" name="phone" id="" value="010-2868-8080">
                    </td>
                </tr>
                <tr>
                    <td>업체주소 :</td>
                    <td>
                        <input type="text" name="addr" id="" value="경기도 성남시 고등동 1123-1010">
                    </td>
                </tr>
                <tr>
                    <td>사이트 주소</td>
                    <td><input type="text" name="site" id="" value="www.drifterz.com"></td>
                </tr>
                <tr>
                    <td>업체 소개 : <br>(영업일 가격 등)</td>
                    <td>
                        <textarea name="intro" id="" cols="75" rows="10">넓은 공간에서 연습하실 분들 환영합니다~~~
야탑역 도보 10분거리에 위치해 있습니다~
</textarea>
                    </td>
                </tr>
                <tr>
                    <td>영업시간</td>
                    <td>
                        <textarea name="time" id="" cols="75" rows="3"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>공간규모 선택 :</td>
                    <td>
                        <input type="checkbox" name="size" value="big" id="big">&nbsp;<label for="big">대규모</label>
                        <input type="checkbox" name="size" value="big" id="small">&nbsp;<label for="small">소규모</label>
                        <input type="checkbox" name="size" value="big" id="one">&nbsp;<label for="one">일대일</label>
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>Gamblerz studio</td>
                </tr>
            </table>
        </div>
        <%-- 마지막줄에는 삭제버튼 넣기.  --%>
        <div class="" style="width :1100px;text-align : right; margin-left : 60px">
            <button>등록</button>
            <button>삭제</button>
        </div>
    </article>
</section>
</body>
</html>
