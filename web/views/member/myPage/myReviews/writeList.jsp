<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.LessonPayment" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.LessonSchedule" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.Lesson" %>
<%@ page import="com.dh.hobbyist.common.model.vo.Image" %>
<%@ page import="com.dh.hobbyist.lesson.model.vo.LessonOrder" %>
<%@ page import="com.dh.hobbyist.member.model.vo.Member" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.GregorianCalendar" %>
<%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-02-16
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.

  마이페이지 - 나의 수강 수업 목록 조회 및 리뷰 작성 페이지
  접속주소: /mypage/writeReviews.me
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>myReviews list</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eun-css.css">
    <%@include file="/views/common/boot4-script.jsp" %>
    <%@include file="/views/common/boot4.jsp" %>
    <style>
        #modal_star-1:hover {

        }
    </style>
</head>
<body>
<%@include file="/views/common/myPage.jsp" %>
<%
    System.out.println("entered writeList.jsp");
    ArrayList<LessonPayment> lessonPaymentArrayList = (ArrayList<LessonPayment>) request.getAttribute("lessonPaymentArrayList");
    ArrayList<LessonSchedule> scheduleArrayList = (ArrayList<LessonSchedule>) request.getAttribute("scheduleArrayList");
    ArrayList<Lesson> lessonArrayList = (ArrayList<Lesson>) request.getAttribute("lessonArrayList");
    ArrayList<Image> lessonImageArrayList = (ArrayList<Image>) request.getAttribute("lessonImageArrayList");
    ArrayList<Member> artistList = (ArrayList<Member>) request.getAttribute("artistList");
    ArrayList<Image> artistImageList = (ArrayList<Image>) request.getAttribute("artistImageList");
    ArrayList<LessonOrder> lessonOrderArrayList = (ArrayList<LessonOrder>) request.getAttribute("lessonOrderArrayList");
%>

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
            <td style="padding-bottom: 20px">
                리뷰 작성 안내 <br>
                - 리뷰 작성시, 포인트 500p이 지급됩니다.
            </td>
        </tr>
        <%
            System.out.println("lessonPaymentArrayList: " + lessonPaymentArrayList.size());
            System.out.println("scheduleArrayList: " + scheduleArrayList.size());
            System.out.println("lessonArrayList: " + lessonArrayList.size());
            System.out.println("lessonImageArrayList: " + lessonImageArrayList.size());
            System.out.println("artistList: " + artistList.size());
            System.out.println("artistImageList: " + artistImageList.size());
        %>
        <% for (int i = 0; i < lessonPaymentArrayList.size(); i++) {%>
        <%
            long lessonOrderArrayTimeFormat = lessonOrderArrayList.get(i).getOrderStart().getTime();
            System.out.println(lessonOrderArrayTimeFormat);
            Date date = new Date(lessonOrderArrayTimeFormat);
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(date);
            //         String.format("%1$TD %1$TT", lessonOrderArrayList.get(i).getOrderStart());
            System.out.println("lessonArrayList.get(" + i + "): " + lessonArrayList.get(i));
        %>
        <tr>
            <td></td>
            <td class="write-list-main">
                <table class="write-list-contents" border="0">
                    <tr>
                        <%--수업 대표사진--%>
                        <td rowspan="2">
                            <%
                                System.out.println(lessonImageArrayList.get(i).getImageRoute());
                                System.out.println(lessonImageArrayList.get(i).getImageName());
                            %>
                            <img src="<%=request.getContextPath()%>/<%=lessonImageArrayList.get(i).getImageRoute()%>/<%=lessonImageArrayList.get(i).getImageName()%>"
                                 style="width: 100%">
                        </td>
                        <td>
                            PK: <%=lessonArrayList.get(i).getLessonCode()%> /
                            <%--강의제목--%>
                            <%=lessonArrayList.get(i).getLessonName()%>
                            <br>
                            <%--수업 시작일 / 위치 --%>
                            수업 시작일 :
                            <%=calendar.get(Calendar.YEAR)%>년 <%=calendar.get(Calendar.MONTH)%>
                            월 <%=calendar.get(Calendar.DAY_OF_MONTH)%>일
                            <%=calendar.get(Calendar.HOUR)%>:<%=calendar.get(Calendar.MINUTE)%> /
                            <%--                                <%=lessonOrderArrayList.get(i).%>--%>
                            <%=scheduleArrayList.get(i).getRegion()%>
                            <%=scheduleArrayList.get(i).getSubRegion()%>
                            <br><br>
                            결제일 : <%=lessonPaymentArrayList.get(i).getPayment_date()%>
                            <%--                            2020-01-30 12:11:31--%>
                        </td>
                        <%--artist's pic--%>
                        <td rowspan="2" style="text-align: center">
                            <%if (artistImageList.get(i) != null) {%>
                            <img
                                    src="<%=request.getContextPath()%>/<%=artistImageList.get(i).getImageRoute()%>/<%=artistImageList.get(i).getImageName()%>"
                                    style="width: 100%">
                            <br>
                            <%}%>
                            <%--아티스트 별명 and name--%>

                            <%=artistList.get(i).getArtistNick()%>
                            <br>
                            <%=artistList.get(i).getMemberName()%>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<%=request.getContextPath()%>/static/images/pen-and-notepad-clipart-6.jpg"
                                 style="width: 30px; float: left" alt="">
                            <button class="write-review-btn" data-toggle="modal" data-target="#exampleModal">리뷰작성하기
                            </button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%-- 상하 간격주기 위한 용도 --%>
        <tr>
            <td> &nbsp;</td>
        </tr>
        <% } %>
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
                    <span class="rating_star" id="modal_star-1">★</span>
                    <span class="rating_star" id="modal_star-2">★</span>
                    <span class="rating_star" id="modal_star-3">★</span>
                    <span class="rating_star" id="modal_star-4">★</span>
                    <span class="rating_star" id="modal_star-5">★</span>
                </div>
                <input type="text" name="stars" id="stars" value="0" style="display: none;">
                <div class="col-12 review-modal-star-text">
                    별점을 매겨주세요.
                </div>
                <%--중간에 줄그으려고..--%>
                <div class="col-12">
                    <div class="col-12 report-modal-line"></div>
                </div>
                <div class="col-12 review-modal-content">
                    <textarea name="" style="width: 100%; height: 100%;" id="" cols="30" rows="5"
                              placeholder="수업에 대한 평가를 100자 이하로 작성해 주세요." onkeyup="onWriteChange(this)"></textarea>
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
    // 별주기.
    $(".rating_star").each(function () {
        this.hover(function () {
            // 몇번째 별인지 확인
            var this_num = this.attr('id')[this.attr('id')-1];

            for (let i = this_num; i <0; i--) {
                // let star_id = "#st"
            }

        }, function () {

        })
    });

    $("#modal_star-1").hover(function () {
        var this_num = $(this).
    }, function () {

    });

    function regRev () {
        console.log('$("#review-modal-words").val().length: ' + $("#review-modal-words").val().length)
        if ($("#review-modal-words").val().length < 100) {
            alert("100자 이상 쓰세요.");
            return;
        }

        alert("리뷰 작성으로 500포인트가 작성되었습니다.");
        $("#exampleModal").modal('toggle');
    }

    function onWriteChange (val) {
        var len = val.value.length;
        $("#review-modal-words").text(len);

    }
</script>
</body>
</html>
