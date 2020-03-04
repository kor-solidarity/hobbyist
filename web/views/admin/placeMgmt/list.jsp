<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dh.hobbyist.place.model.vo.PlaceCompany" %>
<%@ page import="com.dh.hobbyist.place.model.vo.PlaceCompanyAndAdsList" %>
<%@ page import="com.dh.hobbyist.common.model.vo.PageInfo" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-02-18
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.

  관리자페이지 - 공간대여광고업체목록 관리
  진입주소: /adminPlaceList.ad
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
    ArrayList<PlaceCompanyAndAdsList> list = (ArrayList<PlaceCompanyAndAdsList>) request.getAttribute("list");
    PageInfo pi = (PageInfo) request.getAttribute("pi");
    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int maxPage = pi.getMaxPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
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
            <table style="width: 100%;text-align: center;" class="admin-table" id="companyTable">
                <!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
                <tr>
                    <th style="">번호</th>
                    <th style="">업체명</th>
                    <th style="">전화번호</th>
                    <th style="">등록일</th>
                    <th style="">종료일</th>
                    <th style="">조회</th>
                    <th style="">비고</th>
                </tr>
                <%
                    for (PlaceCompanyAndAdsList l : list) { %>

                <tr>
                    <td><%=l.getCompany_pk()%>
                    </td>
                    <td><%=l.getCompany_name()%>
                    </td>
                    <td><%=l.getPhone()%>
                    </td>
                    <td><%=l.getStartDate()%>
                    </td>
                    <td class="endDate"><%=l.getEndDate()%>
                    </td>
                    <td>
                        <%-- 추후 코드 본격적으로 넣을때 id 부분도 손봐야함. --%>
                        <button class="inquery-btn"
                                onclick="location.href='<%=request.getContextPath()%>/addPlaceCompany.ad?pk=<%=l.getCompany_pk()%>&currentPage=<%=pi.getCurrentPage()%>'">
                            조회
                        </button>
                    </td>
                    <td class="deadline">
                        <%--                        <input type="checkbox" class="place-checkbox" name="placeId" id="company<%=l.getCompany_pk()%>" value="(업체번호)">--%>
                        <%-- 게시종료까지 몇일 남았는지 확인 --%>
                        <%
                            // 몇일 남았는지 계산하기.
                            Date deadLine = l.getEndDate();

                            Date now = new Date(System.currentTimeMillis());

                            long diff = deadLine.getTime() - now.getTime();
                            // System.out.println("diff: " + diff);
                            // ms * 초 * 분 * 시간
                            int days_calc = 1000 * 60 * 60 * 24;
                            // 몇일 남았는가?
                            long dDay = diff / days_calc;
                            // 위에 0일인 경우 시간이 지났는가?
                            long leftovers = diff % days_calc;
                        %>
                        <%-- 모든 시간이 0 이상이면 아직 시간이 남은거임--%>
                        <% if (dDay >= 0 && leftovers >= 0) { %>
                        <span style="color: green">종료까지 D-<%=dDay + 1%></span>
                        <%--여기 걸렸으면 기한이 지난거--%>
                        <% } else { %>
                        <span style="color: red">광고마감</span>
                        <% } %>
                    </td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="7">

                        <div class="pagingArea" align="center">
                            <button onclick="location.href='<%=request.getContextPath()%>/adminPlaceList.ad?currentPage=1'">
                                <<
                            </button>
                            <% if (currentPage <= 1) { %>
                            <button disabled><</button>
                            <% } else { %>
                            <button onclick="location.href='<%=request.getContextPath()%>/adminPlaceList.ad?currentPage=<%=currentPage - 1%>'">
                                <
                            </button>
                            <% } %>

                            <% for (int p = startPage; p <= endPage; p++) {
                                if (p == currentPage) {
                            %>
                            <button disabled><%= p %>
                            </button>
                            <%
                            } else {
                            %>
                            <button onclick="location.href='<%=request.getContextPath()%>/adminPlaceList.ad?currentPage=<%=p%>'"><%= p %>
                            </button>
                            <%
                                    }
                                }
                            %>


                            <% if (currentPage >= maxPage) { %>
                            <button disabled>></button>
                            <% } else { %>
                            <button onclick="location.href='<%=request.getContextPath()%>/adminPlaceList.ad?currentPage=<%=currentPage + 1%>'">
                                >
                            </button>
                            <% } %>

                            <button onclick="location.href='<%=request.getContextPath()%>/adminPlaceList.ad?currentPage=<%=maxPage%>'">
                                >>
                            </button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <%-- 마지막줄에는 삭제버튼 넣기.  --%>
        <div class="" style="width:1100px;text-align: right; margin-left: 60px">
            <button onclick="location.href='<%=request.getContextPath()%>/addPlaceCompany.ad'">등록</button>
            <button>삭제</button>
        </div>
    </article>
</section>
</body>
</html>
