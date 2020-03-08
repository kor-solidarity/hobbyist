<%@ page import="com.dh.hobbyist.place.model.vo.PlaceCompany" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dh.hobbyist.common.model.vo.PageInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-02-08
  Time: 오후 5:35
  To change this template use File | Settings | File Templates.

  사용자 단 공간대여목록 조회페이지
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    ArrayList<PlaceCompany> companyArrayList = (ArrayList<PlaceCompany>) request.getAttribute("companyArrayList");
    System.out.println("companyArrayList: " + companyArrayList.size());
    PageInfo pi = (PageInfo) request.getAttribute("pi");
    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int maxPage = pi.getMaxPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
%>
<%-- 학생이  --%>
<html>
<head>
    <title>StudyRoomList</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eun-css.css">
</head>
<body>
<%@include file="/views/common/menubar.jsp" %>
<%@include file="/views/common/categorybar.jsp" %>
<%--<%@include file="category.jsp" %>--%>
<div>
    <table border="0" class="do-hyun-font standard-width" style=" margin: 0 auto">
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td class="float-left">
                <select name="location" id="" style="font-family: 'Do Hyeon', sans-serif; font-size: 20px">
                    <option value="all">지역</option>
                </select>&nbsp;
                <select name="placeStyle" id="" style="font-family: 'Do Hyeon', sans-serif; font-size: 20px">
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
    <% for (PlaceCompany p : companyArrayList) {%>
    <% System.out.println(p); %>
    <div class="room-card"
         onclick="location.href='<%=request.getContextPath()%>/place/info.me?pk=<%=p.getCompany_pk()%>&page=<%=pi.getCurrentPage()%>'">
        <img src="<%=request.getContextPath()%>/static/upload/place/<%=p.getMain_image_name()%>"
             style="width: 100%; height: 150px;"
             alt="">
        <div style="margin: 10px">
            <div class="room-card-title" style="margin-bottom: 10px"><%=p.getCompany_name()%>
            </div>
            <div class="room-card-content"><%=p.getAddress()%>
            </div>
            <%
                String[] tags = p.getRoom_size().split(",");
                for (String t : tags) {%>
            <% if (t.equals("1")) { %>
            <div class="room-card-tag">일대일 공간</div>
            <% }
                if (t.equals("2")) { %>
            <div class="room-card-tag">소규모 공간</div>
            <% }
                if (t.equals("3")) { %>
            <div class="room-card-tag">대규모 공간</div>
            <%
                    }
                }
            %>
        </div>
    </div>
    <% } %>

    <%--    <div class="room-card">--%>
    <%--        <img src="<%=request.getContextPath()%>/static/images/studyRoom3.png" style="width: 100%; height: 150px;"--%>
    <%--             alt="">--%>
    <%--        <div style="margin: 10px">--%>
    <%--            <div class="room-card-title" style="margin-bottom: 10px">ABC스터디</div>--%>
    <%--            <div class="room-card-content">서울 서대문구 신촌로 59 하모니마트 3층</div>--%>
    <%--            <div class="room-card-tag">일대일 공간</div>--%>
    <%--            <div class="room-card-tag">소규모 공간</div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
</div>
<%-- 페이징 --%>
<div class="" style="text-align: center; clear:both;">
    <div class="pagination">
        <%--todo 이거 전혀 안꾸며져 있음...--%>
        <a href="<%=request.getContextPath()%>/place/list.me?page=1">&laquo;</a>
        <% for (int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
        <a href="<%=request.getContextPath()%>/place/list.me?page=<%=i%>"
                <% if (i == pi.getCurrentPage()) {%>

                <% } %>
        ><%=i%>
        </a>
        <% } %>
        <a href="<%=request.getContextPath()%>/place/list.me?page=<%=pi.getMaxPage()%>">&raquo;</a>
    </div>
</div>
<br>
</body>
</html>
