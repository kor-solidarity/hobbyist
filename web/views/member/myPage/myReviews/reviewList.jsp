<%--
  Created by IntelliJ IDEA.
  User: soy
  Date: 2020-02-17
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.

  마이페이지 나의 리뷰 - 리뷰내역 페이지
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>reviewList</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eun-css.css">
    <%@include file="/views/common/boot4-script.jsp" %>
    <%@include file="/views/common/boot4.jsp" %>
</head>
<body>
<%@include file="/views/common/myPage.jsp" %>
<div>
    <table class="standard-width centralise" style="border-bottom: 1px solid black;">
        <tr>
            <td>
                <table class="my-page-subcategory">
                    <tr>
                        <td style="width: 50px"></td>
                        <td class="">리뷰 작성</td>
                        <td class="green">리뷰 내역</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br><br>
    <table class="standard-width centralise write-list">
        <tr>
            <td></td>
            <td class="write-list-main">
                <table class="review-list-contents" border="0">
                    <tr>
                        <td rowspan="2"><img src="<%=request.getContextPath()%>/static/images/coffee.jpg"
                                             style="width: 100%"></td>
                        <td>[1:1_청담샵 경력] #선.착.순.이.벤.트 #자존감이 두배 올라가는 메이크업 배우기!
                            <br>
                            수업 시작일 : 2020-02-03 19:00 / 당산
                        </td>
                        <td class="review-star">
                            <span class="starred">★</span>
                            <span class="starred">★</span>
                            <span>★</span>
                            <span>★</span>
                            <span>★</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            제가 생각했던 것보다는 수업이 그렇게 유용하지는 않았던 것같아요.
                            자존감이 두배 올라가는 메이크업이라고 했는데 자존감이 더 떨어진 느낌이에요.
                            다시는 안들을거 같은 느낌...
                        </td>
                        <%--                        <td></td>--%>
                    </tr>
                </table>
            </td>
        </tr>
        <%-- 상하 간격주기 위한 용도 --%>
        <tr>
            <td> &nbsp;</td>
        </tr>
    </table>

</div>
</body>
</html>
