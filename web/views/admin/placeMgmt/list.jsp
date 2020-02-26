<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dh.hobbyist.place.model.vo.PlaceCompany" %><%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-02-18
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.

  관리자페이지 - 공간대여광고업체목록 관리
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
<%
    // ArrayList<PlaceCompany> list =
%>
<section>

    <!-- 왼쪽 사이드바 메뉴  -->
    <article id="sideMenuBar">

        <!-- 큰 영역의 메뉴 -->
        <div id="bigMenu">
            <label style="font-weight: bold; font-size: 25px;">게시판관리</label>
            <hr style="width: 80%; color: #DED842; height: 1px; background: #DED842; margin-top: 17px;">
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
                    <td style="padding-right: 20px; text-align: right; vertical-align: bottom;">
                        <select name="category" id="category">
                            <option value="all" selected>전체</option>
                            <option value="all">업체명</option>
                            <option value="all">업주명</option>
                        </select>
                        <input style="" class="" name="searchMember">
                        <button id="searchBtn">검색</button>
                    </td>
                </tr>
            </table>
        </div>
        <hr id="firstLine">
        <div id="infoArea">
            <table style="width: 100%;text-align: center;" class="admin-table">
                <!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
                <tr>
                    <th style="">번호</th>
                    <th style="">업체명</th>
<%--                    <th style="">업주명</th>--%>
                    <th style="">전화번호</th>
                    <th style="">등록일</th>
                    <th style="">종료일</th>
                    <th style="">조회</th>
                    <%--이건 이제 조회창 안에서 건든다--%>
<%--                    <th style="">편집</th>--%>
                    <th style="">선택</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Gamblerz studio</td>
<%--                    <td>임찬영</td>--%>
                    <td>010-6747-1107</td>
                    <td>2020/01/30</td>
                    <td>2020/02/06</td>
                    <td>
                        <%-- 추후 코드 본격적으로 넣을때 id 부분도 손봐야함. --%>
                        <button class="inquery-btn"
                                onclick="location.href='<%=request.getContextPath()%>/admin/seePlace.adm?id=1'">조회
                        </button>
                    </td>
<%--                    <td>--%>
<%--                        위와동일--%>
<%--                        <button class="inquery-btn"--%>
<%--                                onclick="location.href='<%=request.getContextPath()%>/admin/editPlace.adm?id=1'">편집--%>
<%--                        </button>--%>
<%--                    </td>--%>
                    <td>
                        <input type="checkbox" class="place-checkbox" name="placeId" id="" value="(업체번호)">
                    </td>
                </tr>
            </table>
        </div>
        <%-- 마지막줄에는 삭제버튼 넣기.  --%>
        <div class="" style="width:1100px;text-align: right; margin-left: 60px">
            <button>등록</button>
            <button>삭제</button>
        </div>
    </article>
</section>

</body>
</html>
