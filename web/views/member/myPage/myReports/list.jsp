<%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-02-14
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.

    마이페이지 - 나의문의/신고 목록
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/students.css">
    <%@include file="/views/common/boot4-script.jsp" %>
    <%@include file="/views/common/boot4.jsp" %>
</head>
<body>
<%@include file="../memberUpdate.jsp" %>
<br clear="both">
<div class="">
    <table id="rep-list" class="centralise standard-width report-table">
        <tr>
            <td colspan="4"></td>
            <td>
                <select name="category-opt" id="">
                    <option value="all">전체보기</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>번호</th>
            <th>유형</th>
            <th>상태</th>
            <th>제목</th>
            <th>날짜</th>
        </tr>
        <tr>
            <td>1</td>
            <td>문의</td>
            <td>미확인</td>
            <td style="text-align: left">구매후기는 언제 작성할 수 있나요</td>
            <td>02/01/28</td>
        </tr>
        <tr>
            <td>2</td>
            <td>문의</td>
            <td>미확인</td>
            <td style="text-align: left">구매후기는 언제 작성할 수 있나요</td>
            <td>02/01/28</td>
        </tr>
        <tr>
            <td>3</td>
            <td>문의</td>
            <td>미확인</td>
            <td style="text-align: left">구매후기는 언제 작성할 수 있나요</td>
            <td>02/01/28</td>
        </tr>
    </table>
</div>
<br>
<div class="" style="text-align: center; clear:both;">
    <div class="paging">
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
<br><br><br><br><br><br><br><br><br><br>
<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header "
                 style="background-color: darkolivegreen; color: white; border-bottom: 2px solid black; padding: 0 10px">
                <h5 class="modal-title text-right" id="exampleModalLabel"
                    style="margin: 0 0 0 auto; width: 100%; ">
                    <span class="do-hyun-font " style="">hobbyist</span>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: white">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="report-modal-title">구매후기는 언제 작성할 수 있나요</div>
                <div class="col-12">
                    카테고리: 문의
                </div>
                <div class="col-12 report-modal-content">
                    구매후기는 언제 작성할 수 있나요? 궁금해서 문의합니다.
                </div>
            </div>
            <div class="col-12">
                <div class="col-12 report-modal-line">
                    &nbsp;
                </div>
            </div>
            <div class="modal-footer" style="justify-content: center;">
                <%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                <%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
                <%-- 답변이 나오면 또 다르게 떠야함 --%>
                <div class="report-modal-end">답변 대기중입니다</div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#rep-list').attr('data-toggle', "modal").attr('data-target', '#exampleModal');
</script>
</body>
</html>
