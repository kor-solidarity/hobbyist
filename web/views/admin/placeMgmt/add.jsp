<%--
  Created by IntelliJ IDEA.
  User : SOY
  Date : 2020-02-18
  Time : 오후 1 :49
  To change this template use File | Settings | File Templates.
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

<section>

    <!-- 왼쪽 사이드바 메뉴  -->
    <article id="sideMenuBar">

        <!-- 큰 영역의 메뉴 -->
        <div id="bigMenu">
            <label style="font-weight : bold; font-size : 25px;">게시판관리</label>
            <hr style="width : 80%; color : #DED842; height : 1px; background : #DED842; margin-top : 17px;">
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
                    <td style="text-align : left; vertical-align : bottom;">
                        <label style="font-weight : bold;">공간대여관리 편집</label></td>
                    <%--                    <td style="padding-right : 20px; text-align : right; vertical-align : bottom;">--%>
                    <%--                        <select name="category" id="category">--%>
                    <%--                            <option value="all" selected>전체</option>--%>
                    <%--                            <option value="all">업체명</option>--%>
                    <%--                            <option value="all">업주명</option>--%>
                    <%--                        </select>--%>
                    <%--                        <input style="" class="" name="searchMember">--%>
                    <%--                        <button id="searchBtn">검색</button>--%>
                    <%--                    </td>--%>
                </tr>
            </table>
        </div>
        <hr id="firstLine">
        <form enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/add_place.ad">
            <div id="infoArea" class="place-edit-div">
                <table style="width : 95%; float : right" class="place-edit-table">
                    <!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
                    <tr>
                        <td style="">업체명 :</td>
                        <td style="">
                            <input type="text" name="companyName" value="">
                        </td>
                    </tr>
                    <tr>
                        <td>전화번호 :</td>
                        <td>
                            <input type="text" name="phone" id="" value="">
                        </td>
                    </tr>
                    <tr>
                        <td>업체주소 :</td>
                        <td>
                            <input type="text" name="addr" style="width: 500px" id="" value="">
                        </td>
                    </tr>
                    <tr>
                        <td>사이트 주소</td>
                        <td><input type="text" name="website" id="" value=""></td>
                    </tr>
                    <tr>
                        <td>업체 소개 : <br>(영업일 가격 등)</td>
                        <td>
                            <textarea name="intro" id="" cols="75" rows="10"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>영업시간</td>
                        <td>
                            <textarea name="serviceTime" id="" cols="75" rows="3"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>공간규모 선택 :</td>
                        <td>
                            <input type="checkbox" name="roomSize" value="3" id="big">&nbsp;<label for="big">대규모</label>
                            <input type="checkbox" name="roomSize" value="2" id="small">&nbsp;<label
                                for="small">소규모</label>
                            <input type="checkbox" name="roomSize" value="1" id="one">&nbsp;<label for="one">일대일</label>
                        </td>
                    </tr>
                    <tr>
                        <td>사진등록</td>
                        <td></td>
                    </tr>
                    <tr>
                        <%-- 사진등록창 5개 띄워야함.  --%>
                        <td style="width: 100%" colspan="2">
                            <table style="width: 100%" class="place-edit-img">
                                <tbody>
                                <tr>
                                    <td colspan="5">
                                        <div style="text-align: center">※ 가장 왼쪽 사진이 대표사진으로 간주됩니다.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><img id="pic1"
                                             src="<%=request.getContextPath()%>/static/images/iphoneCamera.png" alt="">
                                    </td>
                                    <td><img id="pic2"
                                             src="<%=request.getContextPath()%>/static/images/iphoneCamera.png" alt="">
                                    </td>
                                    <td><img id="pic3"
                                             src="<%=request.getContextPath()%>/static/images/iphoneCamera.png" alt="">
                                    </td>
                                    <td><img id="pic4"
                                             src="<%=request.getContextPath()%>/static/images/iphoneCamera.png" alt="">
                                    </td>
                                    <td><img id="pic5"
                                             src="<%=request.getContextPath()%>/static/images/iphoneCamera.png" alt="">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
                <table style="width : 95%; float : right" class="place-edit-table">
                    <tr>
                        <td style="width: 40%">
                            <bold>게제시작일:</bold>
                            <input type="date" name="startDate" id="startDate"></td>
                        <td>
                            <bold>종료일:</bold>
                            <input type="date" name="endDate" id="endDate"></td>
                    </tr>
                </table>
                <div id="pic_files">
                    <input type="file" name="file1" id="file1" onchange="changedPic(this, 1)">
                    <input type="file" name="file2" id="file2" onchange="changedPic(this, 2)">
                    <input type="file" name="file3" id="file3" onchange="changedPic(this, 3)">
                    <input type="file" name="file4" id="file4" onchange="changedPic(this, 4)">
                    <input type="file" name="file5" id="file5" onchange="changedPic(this, 5)">
                </div>
            </div>
            <%-- 마지막줄에는 삭제버튼 넣기.  --%>
            <div class="" style="width :1100px;text-align : right; margin-left : 60px">
                <button type="submit">등록</button>
                <button type="reset">초기화</button>
            </div>
        </form>
    </article>
</section>
<script>
    $(function () {
        // 첫 시작일자 초기화 목적
        var date = new Date();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours();
        var min = date.getMinutes();
        if (day < 10) {
            day = '0' + day.toString()
        }
        if (month < 10) {
            month = '0' + month.toString();
        }
        if (hour < 10) {
            hour = '0' + hour.toString();
        }
        if (min < 10) {
            min = '0' + min.toString();
        }
        // 시작일자 초기화
        $("#startDate").val(date.getFullYear() + '-' + month + '-' + day);// + 'T' + hour + ':' + min);

        // 이미지파일 들어갈 파일인풋 삭제
        $("#pic_files").hide();
        // 각 사진 미리보기와 파일 인풋을 맞게 연동시켜준다.
        $('#pic1').click(function () {
                $('#file1').click();
            }
        );
        $('#pic2').click(function () {
                $('#file2').click();
            }
        );
        $('#pic3').click(function () {
                $('#file3').click();
            }
        );
        $('#pic4').click(function () {
                $('#file4').click();
            }
        );
        $('#pic5').click(function () {
                $('#file5').click();
            }
        );
    });

    // 사진 업로드시 미리보기에 반영
    function changedPic (obj, num) {
        if (obj.files && obj.files[0]) {
            var pic = '#pic' + num;
            var reader = new FileReader();

            reader.onload = function (e) {
                // console.log(e.target)
                // console.log(e.target.result);
                $(pic).attr('src', e.target.result);
            };
            // todo 이게 정확히 뭐하는거지??
            // 뭐던간에 없으면 위에 onload 자체가 작동하질 않음
            reader.readAsDataURL(obj.files[0]);
        }
    }
</script>
</body>
</html>
