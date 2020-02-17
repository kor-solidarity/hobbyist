<%--
  Created by IntelliJ IDEA.
  User: soy
  Date: 2020-02-17
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.

  문의관리목록
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>

        section {
            width: 100%;
            height: 91%;
        }

        #sideMenuBar {
            background-color: #4E4E4E;
            width: 15%;
            height: 100%;
            float: left;
            margin: 0px;
            text-align: center;
        }

        #bigMenu {
            margin-top: 20px;
            color: #DED842;
        }

        #smallMenu {
            margin-top: 20px;
            padding-left: 25px;
            color: white;
            text-align: left;
            font-weight: bold;
            font-size: 19px;
            line-height: 45px;
        }

        #contents {
            background-color: white;
            width: 85%;
            height: 100%;
            margin: 0px;
            float: left;
        }

        #searchMember {
            margin-top: 80px;
            text-align: right;
        }

        #searchDetailArea {
            width: 100%;
            text-align: right;
        }

        #searchT {
            width: 90%;
            height: 110px;
            margin-left: 10%;
        }

        #searchBtn {
            color: white;
            background-color: #4E4E4E;
        }

        #firstLine {
            width: 90%;
            height: 1px;
            background: black;
            margin: 0px;
            margin-left: 115px;
            margin-top: 10px;
            align: right;
        }

        #infoArea {
            margin-top: 50px;
            margin-left: 60px;
            width: 1100px;
            height: 500px;
            border: 1px solid #4E4E4E;
            overflow-x: hidden;
            overflow-y: auto;
        }

        th {
            background: #4E4E4E;
            color: white;
        }

    </style>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
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
            <label style="font-weight: bold; font-size: 25px;">신고/문의</label>
            <hr style="width: 80%; color: #DED842; height: 1px; background: #DED842; margin-top: 17px;">
        </div>

        <!-- 큰 메뉴안의 상세 메뉴 여러개 -->
        <div id="smallMenu">
            <label>신고 관리</label><br>
            <label>경고리스트</label><br>
            <label>문의 관리</label><br>
            <label>블랙리스트</label>
        </div>
    </article>
    <article id="contents">
        <!-- hr 상단에 들어갈 상세 페이지, 정렬이나 검색등 보기들. 기본적으로 회원검색이 있다. -->
        <div id="searchDetailArea">

            <!-- 상세페이지, 정렬, 검색 테이블 -->
            <table id="searchT" border="0">
                <tr>
                    <td style="text-align: left; vertical-align: bottom;">
                        <label style="font-weight: bold;">신고 관리</label></td>
                    <td style="padding-right: 20px; text-align: right; vertical-align: bottom;">
                        <input style="" name="searchMember">
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
                    <th style="">게시판</th>
                    <th style="">글 유형</th>
                    <th style="">글 번호</th>
                    <th style="">작성자 아이디</th>
                    <th style="">신고 유형</th>
                    <th style="">신고자 아이디</th>
                    <th style="">신고 일자</th>
                    <th style="">상세 정보</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>수업 건의 게시판</td>
                    <td>댓글</td>
                    <td>1113</td>
                    <td>rapmonster</td>
                    <td>무성의한 글/댓글</td>
                    <td>hyeon0705</td>
                    <td>2020/01/25</td>
                    <td>
                        <button class="inquery-btn" data-toggle="modal" data-target="#exampleModal">조회</button>
                    </td>
                </tr>
            </table>
        </div>
    </article>
</section>

<%-- 부트스트랩 모달. 목록 클릭시 팝업되게끔 한다. --%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header "
                 style="background-color: #4E4E4E; color: white; border-bottom: 2px solid black; padding: 0 10px">
                <h5 class="modal-title text-center" id="exampleModalLabel"
                    style="margin: 0 0 0 auto; width: 100%; ">
                    <span class="" style="">상세 정보</span>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: white">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="col-12 report-modal-content">
                    <table style="width: 100%; background: white" border="0" class="report-modal-content-category">
                        <tr>
                            <td>게시판</td>
                            <td>수업 건의 게시판</td>
                        </tr>
                        <tr>
                            <td>글 유형</td>
                            <td>댓글</td>
                        </tr>
                        <tr>
                            <td>글 번호</td>
                            <td>1113</td>
                        </tr>
                        <tr>
                            <td>작성자 아이디</td>
                            <td>rapmonster</td>
                        </tr>
                        <tr>
                            <td>신고 유형</td>
                            <td>무성의한 글/댓글</td>
                        </tr>
                        <tr>
                            <td>신고 내용</td>
                            <td>동참하는 댓글이 너무 무성의합니다</td>
                        </tr>
                        <tr>
                            <td>신고자 아이디</td>
                            <td id="guyInQuestion">hyeon0705</td>
                        </tr>
                        <tr>
                            <td>신고 일자</td>
                            <td>2020/01/25</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="width: 100%">
                                신고된 컨텐츠
                                <table style="margin: 10px; background: lightgrey">
                                    <tr>
                                        <td width="70%" style="color: darkolivegreen">김남준</td>
                                        <td width="30%">2020-01-24  19:12</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-weight: normal">낄낄낄길낄긹ㄹ아렁ㅁ라므ㅏ르나ㅡㄹ나ㅡ나ㅜㄹ너나ㅣㅓㅏ라누란ㅇㅁ룸!!!!!!!!!!!!!!!@@</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <%--중간에 줄그으려고..--%>
            <div class="col-12">
                <div class="col-12 report-modal-line"></div>
            </div>
            <div class="modal-footer report-modal-footer" style="justify-content: center;">
                <button type="button" class="btn btn-success" data-dismiss="modal" onclick="give_warning()">경고하기</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-secondary" data-dismiss="modal">삭제</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-danger">블랙리스트 등록</button>
            </div>
        </div>
    </div>
</div>

<script>
    // 경고 부과
    function give_warning () {
        // bool
        var conf = confirm($("#guyInQuestion").text() + '에게 경고를 부과하겠습니까?')
        alert(conf)

    }
</script>
</body>
</html>
