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
            <%-- 작업완료시 필요함. --%>
        <tr id="pk<%=lessonArrayList.get(i).getLessonCode()%>">
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
                            <button class="write-review-btn" data-toggle="modal" data-target="#exampleModal"
                                    onclick="setModal(<%=lessonArrayList.get(i).getLessonCode()%>)">리뷰작성하기
                            </button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%-- 상하 간격주기 위한 용도 --%>
        <tr>
            <td></td>
        </tr>
        <% } %>
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
                    <span class="rating_star" id="modal_star-1" onclick="put_star(1)">★</span>
                    <span class="rating_star" id="modal_star-2" onclick="put_star(2)">★</span>
                    <span class="rating_star" id="modal_star-3" onclick="put_star(3)">★</span>
                    <span class="rating_star" id="modal_star-4" onclick="put_star(4)">★</span>
                    <span class="rating_star" id="modal_star-5" onclick="put_star(5)">★</span>
                </div>
                <%--num of stars--%>
                <input type="number" name="stars" id="stars" value="5" style="display: none;">
                <input type="number" name="review_pk" id="review_pk" value="5" style="display: none;">
                <%--pk--%>
                <div class="col-12 review-modal-star-text">
                    별점을 매겨주세요.
                </div>
                <%--중간에 줄그으려고..--%>
                <div class="col-12">
                    <div class="col-12 report-modal-line"></div>
                </div>
                <div class="col-12 review-modal-content">
                    <textarea name="review_content" style="width: 100%; height: 100%;" id="review_content" cols="30"
                              rows="5"
                              placeholder="수업에 대한 평가를 100자 이상으로 작성해 주세요." onkeyup="onWriteChange(this)"></textarea>
                </div>
                <div class="col-12" style="text-align: right">
                    <span id="review-modal-words">0</span>자 / 100자 이상으로 작성 해 주세요.
                </div>
            </div>
            <%--중간에 줄그으려고..--%>
            <div class="col-12">
                <div class="col-12 report-modal-line"></div>
            </div>
            <div class="modal-footer report-modal-footer" style="justify-content: center;">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-success" id="rev_apply" onclick="regRev()">등록</button>
                <%-- 답변이 나오면 또 다르게 떠야함 --%>
                <%--                <div class="report-modal-end">답변 대기중입니다</div>--%>
            </div>
        </div>
    </div>
</div>
<script>
    let rated_color = 'red';
    let hover_color = 'yellowgreen';
    let star_input = $("#stars");
    let star_list = $(".rating_star");

    let review_content = $("#review_content");
    let review_pk = $("#review_pk");

    // ajax 건들때 필요함.
    let last_pk;

    // 별주기.
    star_list.each(function () {
        $(this).hover(function () {
            // 몇번째 별인지 확인
            let this_num = parseInt($(this).attr('id')[$(this).attr('id').length - 1]);
            console.log("this_num is " + this_num);
            for (let i = this_num; i > 0; i--) {
                let star_id = "#modal_star-" + i;
                $(star_id).css('color', hover_color);
            }
        }, function () {
            console.log('$("#stars").val(num); ' + star_input.val());
            let this_num = parseInt($(this).attr('id')[$(this).attr('id').length - 1]);
            for (let i = this_num; i > 0; i--) {
                let star_id = "#modal_star-" + i;
                $(star_id).css('color', 'gray');
            }
            console.log('star_input.val(): ' + star_input.val());
            // 별 평점 확정한대로 넣기
            for (let i = 5; i >= 1; i--) {
                console.log("i: " + i);
                let star_id = "#modal_star-" + i;
                // 5번별부터 시작해서 하나하나 맞는지 확인
                if (i <= parseInt(star_input.val())) {
                    console.log("star on " + (i));
                    $(star_id).css('color', rated_color);
                } else {
                    $(star_id).css('color', "gray");
                }
            }

        })
    });

    function put_star (num) {
        console.log("num: " + num);

        for (let i = 0; i < num; i++) {
            star_list.eq(i).css('color', rated_color);
        }
        star_input.val(num);
        console.log('$("#stars").val(): ' + star_input.val());
    }

    // 모든 모달값 초기화
    function setModal (pk) {
        star_input.val(0);
        review_content.val("");
        $("#review-modal-words").html("0");
        star_list.css('color', 'gray');
        review_pk.val(pk);
        last_pk = pk;
        // $("#rev_apply").click(regRev(pk));
    }

    function regRev () {
        console.log('$("#review_content").val().length: ' + $("#review_content").val().length);
        if ($("#review_content").val().length < 100) {
            alert("100자 이상 쓰세요.");
            return;
        } else if (star_input.val() == 0) {
            alert("별점을 주세요");
            return;
        }

        alert("리뷰 작성으로 500포인트가 작성되었습니다.");
        $("#exampleModal").modal('toggle');

        $.ajax({
            url: "insertReview.me",
            // 들어가야 하는 내용: 글쓴이(자동), 점수, 내용, 대상수업번호
            data: {
                stars: $("#stars").val(),
                rv_content: review_content.val(),
                lesson_pk: review_pk.val(),
            },
            type: "POST",
            success: function (data) {

                // if data's 0? that means the insert failed.
                if (data==1){
                    alert("리뷰가 등록됐습니다. ");
                    let lessonId = "#pk" + last_pk;
                    $(lessonId).hide();
                }else {
                    alert("오류가 발생했습니다. 나중에 다시 써주세요.");

                }
                // var $replySelectTable = $("#replySelectTable");
                // $replySelectTable.html('');
                //
                // for(var key in data) {
                //     var $tr = $("<tr>");
                //     var $writerTd = $("<td>").text(data[key].nickName).css("width", "100px");
                //     var $contentTd = $("<td>").text(data[key].bContent).css("width", "400px");
                //     var $dateTd = $("<td>").text(data[key].bDate).css("width", "200px");
                //
                //     $tr.append($writerTd);
                //     $tr.append($contentTd);
                //     $tr.append($dateTd);
                //
                //     $replySelectTable.append($tr);
                // }

            },
            error: function (error) {
                console.log(error);
            }
        });

    }

    function onWriteChange (val) {
        let len = val.value.length;
        $("#review-modal-words").text(len);

    }
</script>
</body>
</html>
