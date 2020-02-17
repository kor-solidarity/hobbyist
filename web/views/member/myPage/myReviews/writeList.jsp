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
    <%@include file="/views/common/boot4-script.jsp" %>
    <%@include file="/views/common/boot4.jsp" %>
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
    <table class="standard-width centralise write-list">
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
            <td class="write-list-main">
                <table class="write-list-contents" border="0">
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
                            <button class="write-review-btn" data-toggle="modal" data-target="#exampleModal">리뷰작성하기
                            </button>
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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header "
                 style="background-color: darkolivegreen; color: white; border-bottom: 2px solid black; padding: 0 10px">
                <h5 class="modal-title text-right" id="exampleModalLabel"
                    style="margin: 0 0 0 auto; width: 100%; ">
                    <span class="do-hyun-font" style="float: left">리뷰 작성</span>
                    <span class="zCool" style="float: right">hobbyist</span>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: white">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="review-modal-stars">
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                </div>
                <div class="col-12 review-modal-star-text">
                    별점을 매겨주세요.
                </div>
                <%--중간에 줄그으려고..--%>
                <div class="col-12">
                    <div class="col-12 report-modal-line"></div>
                </div>
                <div class="col-12 review-modal-content">
                    <textarea name="" style="width: 100%; height: 100%;" id="" cols="30" rows="5"
                              placeholder="상품에 대한 평가를 100자 이하로 작성해 주세요." onkeyup="onWriteChange(this)"></textarea>
                </div>
                <div class="col-12" style="text-align: right">
                    <span id="review-modal-words">0</span>자 / 100자 이하로 작성 해 주세요.
                </div>
            </div>
            <%--중간에 줄그으려고..--%>
            <div class="col-12">
                <div class="col-12 report-modal-line"></div>
            </div>
            <div class="modal-footer report-modal-footer" style="justify-content: center;">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-success" onclick="regRev()">등록</button>
                <%-- 답변이 나오면 또 다르게 떠야함 --%>
                <%--                <div class="report-modal-end">답변 대기중입니다</div>--%>
            </div>
        </div>
    </div>
</div>
<script>
    function regRev () {
        console.log('$("#review-modal-words").val().length: ' + $("#review-modal-words").val().length)
        if ($("#review-modal-words").val().length < 100){
            alert("100자 이상 쓰세요.")
            return;
        }

        alert("리뷰 작성으로 500포인트가 작성되었습니다.")
        $("#exampleModal").modal('toggle');
    }

    function onWriteChange (val) {
        var len = val.value.length;
        $("#review-modal-words").text(len);

    }
</script>
</body>
</html>
