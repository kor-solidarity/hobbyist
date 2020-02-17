<%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-02-16
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.

  마이페이지 - 나의 리뷰 목록 조회/작성 페이지
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>myReviews list</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eun-css.css">
</head>
<body>
<%@include file="/views/common/myPage.jsp" %>


<div class="">
    <table class="standard-width centralise" style="border-bottom: 1px solid black;">
        <tr>
            <td>
                <table class="my-page-subcategory">
                    <tr>
                        <td style="width: 50px"></td>
                        <td class="green">리뷰 작성</td>
                        <td>리뷰 내역</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br>
    <table class="standard-width centralise review-list">
        <%-- 첫 td는 --%>
        <tr>
            <td></td>
            <td>
                리뷰 작성 안내 <br>
                - 리뷰 작성시, 포인트 500p이 지급됩니다.
            </td>
        </tr>
        <tr>
            <td></td>
            <td class="review-list-main">
                <table class="review-list-contents" border="1">
                    <tr>
                        <td rowspan="2"><img src="<%=request.getContextPath()%>/static/images/coffee.jpg"
                                             style="width: 100%"></td>
                        <td>[1:1_청담샵 경력] #선.착.순.이.벤.트 #자존감이 두배 올라가는 메이크업 배우기!
                            <br>
                            수업 시작일 : 2020-02-03 19:00 / 당산
                            <br><br>
                            결제일 : 2020-01-30 12:11:31
                        </td>
                        <td rowspan="2" style="text-align: center"><img
                                src="<%=request.getContextPath()%>/static/images/iu.jpg"
                                style="width: 100%">
                            <br>
                            피치핑크
                            <br>
                            오지호
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<%=request.getContextPath()%>/static/images/pen-and-notepad-clipart-6.jpg"
                                 style="width: 30px; float: left" alt="">
                            <button class="write-review-btn">리뷰작성하기</button>
                        </td>
                        <%--                        <td></td>--%>
                    </tr>
                </table>
            </td>
        </tr>
            <%-- 상하 간격주기 위한 용도 --%>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</div>
</body>
</html>
