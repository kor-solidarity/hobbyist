<%@ page import="com.dh.hobbyist.place.model.vo.PlaceCompany" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dh.hobbyist.common.model.vo.Image" %>
<%@ page import="com.dh.hobbyist.place.model.vo.CompanyAds" %>
<%--
  Created by IntelliJ IDEA.
  User : SOY
  Date : 2020-02-18
  Time : 오후 1 :49
  To change this template use File | Settings | File Templates.

  공간대여업체정보 조회페이지. 만일 수정을 누르면 바로 수정페이지로 변신시킨다.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
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
    PlaceCompany company = (PlaceCompany) request.getAttribute("placeCompany");
    ArrayList<Image> images = (ArrayList<Image>) request.getAttribute("images");
    System.out.println("images: " + images.size());
    CompanyAds companyAds = (CompanyAds) request.getAttribute("companyAds");
    int currentPage = 1;
    try {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    } catch (NumberFormatException ignored) {

    }

    // 수정모드인지 확인
    Boolean onEdit = false;
%>

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

                </tr>
            </table>
        </div>
        <hr id="firstLine">
        <form enctype="multipart/form-data" method="post" onreset="resetClicked()"
              action="<%=request.getContextPath()%>/adminUpdateCompany.ad">
            <div id="infoArea" class="place-edit-div">
                <table style="width : 95%; float : right" class="place-edit-table">
                    <!-- 테이블 첫번째 줄은 아이디, 비밀번호 등 조회할 내용 제목이다. background(#4E4E4E), font-color(white) 색 다르게 지정 -->
                    <tr>
                        <td style="">업체명 :</td>
                        <td style="">
                            <input type="text" name="companyName" id="companyName"
                                   value="<%=company.getCompany_name()%>" disabled>
                        </td>
                    </tr>
                    <tr>
                        <td>전화번호 :</td>
                        <td>
                            <input type="text" name="phone" id="phone" value="<%=company.getPhone()%>" disabled>
                        </td>
                    </tr>
                    <tr>
                        <td>업체주소 :</td>
                        <td>
                            <input type="text" name="addr" style="width: 500px" id="addr"
                                   value="<%=company.getAddress()%>"
                                   disabled>
                        </td>
                    </tr>
                    <tr>
                        <td>사이트 주소</td>
                        <td><input type="text" name="website" disabled value="<%=company.getWebsite()%>"></td>
                    </tr>
                    <tr>
                        <td>업체 소개 : <br>(영업일 가격 등)</td>
                        <td>
                            <textarea name="intro" id="intro" cols="75" rows="10"
                                      disabled><%=company.getIntro()%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>영업시간</td>
                        <td>
                            <textarea name="serviceTime" id="serviceTime" cols="75"
                                      rows="3" disabled><%=company.getService_time()%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>공간규모 선택 :</td>
                        <td>
                            <%
                                String room_size = company.getRoom_size();
                                System.out.println(room_size);
                                String[] room_size_array = room_size.split(",");
                                boolean rSize1 = false;
                                boolean rSize2 = false;
                                boolean rSize3 = false;
                                for (int i = 0; i < room_size_array.length; i++) {
                                    if (room_size_array[i].equals("1")) {
                                        rSize1 = true;
                                    } else if (room_size_array[i].equals("2")) {
                                        rSize2 = true;
                                    } else if (room_size_array[i].equals("3")) {
                                        rSize3 = true;
                                    }
                                }
                            %>
                            <input type="checkbox" name="roomSize1" value="1" id="one" disabled
                                <% if(rSize1){ %>
                                   checked
                                <% } %>> <label for="one">일대일</label>
                            <input type="checkbox" name="roomSize2" value="2" id="small" disabled
                                <% if(rSize2){ %>
                                   checked
                                <% } %>> <label for="small">소규모</label>
                            <input type="checkbox" name="roomSize3" value="3" id="big" disabled
                                <% if(rSize3){ %>
                                   checked
                                <% } %>>&nbsp;<label for="big">대규모</label>
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
                                    <%
                                        // 사진로딩
                                        int counter = 1;
                                    %>
                                    <%-- 포문 돌려가면서 사진을 채운다--%>
                                    <% for (Image image : images) {%>
                                    <td>
                                        <input type="button" id="delPic<%=counter%>" class="picDelBtn"
                                               onclick="delPic(<%=counter%>)" value="사진 삭제"/>
                                        <br>
                                        <img src="<%=request.getContextPath()%>/<%=image.getImageRoute()%>/<%=image.getImageName()%>"
                                             id="pic<%=counter%>">
                                    </td>
                                    <%counter++;%>
                                    <% } %>
                                    <%--카운터가 5 이하면 빈칸 마저 채운다--%>
                                    <%
                                        if (counter < 5) {
                                            for (int i = counter; i <= 5; i++) {
                                    %>
                                    <td>
                                        <img id="pic<%=counter%>"
                                             src="<%=request.getContextPath()%>/static/images/iphoneCameraW.png" alt="">
                                    </td>
                                    <%
                                                counter++;
                                            }
                                        }
                                    %>
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
                            <%
                                System.out.println(companyAds.getStartDate());
                            %>
                            <input type="date" name="startDate" id="startDate"
                                <% if (companyAds.getStartDate() != null) { %>
                                   value="<%=companyAds.getStartDate()%>"
                                <% } %>
                                   disabled>
                        </td>
                        <td>
                            <bold>종료일:</bold>
                            <input type="date" name="endDate" id="endDate"
                                <% if (companyAds.getEndDate() != null) { %>
                                   value="<%=companyAds.getEndDate()%>"
                                <% } %>
                                   disabled></td>
                    </tr>
                </table>
                <div id="pic_files">
                    <input type="text" name="currentPage" value="<%=currentPage%>" hidden>
                    <input type="text" name="delFile1" id="delFile1" class="delFile" value="0">
                    <input type="text" name="delFile2" id="delFile2" class="delFile" value="0">
                    <input type="text" name="delFile3" id="delFile3" class="delFile" value="0">
                    <input type="text" name="delFile4" id="delFile4" class="delFile" value="0">
                    <input type="text" name="delFile5" id="delFile5" class="delFile" value="0">
                    <input type="file" name="file1" id="file1" onchange="changedPic(this, 1)">
                    <input type="file" name="file2" id="file2" onchange="changedPic(this, 2)">
                    <input type="file" name="file3" id="file3" onchange="changedPic(this, 3)">
                    <input type="file" name="file4" id="file4" onchange="changedPic(this, 4)">
                    <input type="file" name="file5" id="file5" onchange="changedPic(this, 5)">
                    <input type="text" name="fileChanged" value="0">
                    <input type="text" name="companyPk" value="<%=company.getCompany_pk()%>" hidden>
                </div>
            </div>
            <div class="" style="width :1100px;text-align : right; margin-left : 60px">
                <input type="button" onclick="startEdit()" id="editBtn" value="수정"/>&nbsp;
                <button type="reset" id="reset">수정취소</button>
                <button type="submit" id="submitBtn" disabled>등록</button>
                <%-- 목록으로 돌아가게끔 조정. --%>
                <button onclick="">목록으로 돌아가기</button>
            </div>
        </form>
    </article>
</section>
<script>
    var pic1 = $("#pic1").attr('src');
    var pic2 = $("#pic2").attr('src');
    var pic3 = $("#pic3").attr('src');
    var pic4 = $("#pic4").attr('src');
    var pic5 = $("#pic5").attr('src');

    $(function () {
        // 이미지파일 들어갈 파일인풋 삭제
        $("#pic_files").hide();
        $("#reset").hide();
        $('.picDelBtn').hide();
    });

    // 수정취소 할 시
    function resetClicked () {
        // 취소를 누르면 모든걸 다 되돌린다
        $("#reset").hide();
        $("#submitBtn").attr('disabled', true);
        $("#pic1").attr('src', pic1);
        $("#pic2").attr('src', pic2);
        $("#pic3").attr('src', pic3);
        $("#pic4").attr('src', pic4);
        $("#pic5").attr('src', pic5);

        // 온클릭 해제
        $('#pic1').prop('onclick', null).off('click');
        $('#pic2').prop('onclick', null).off('click');
        $('#pic3').prop('onclick', null).off('click');
        $('#pic4').prop('onclick', null).off('click');
        $('#pic5').prop('onclick', null).off('click');

        // 사진삭제로 설정된거 전부 해제.
        $('.delFile').val('0');
        $('.picDelBtn').hide();

        $("input, textarea, #submitBtn").attr("disabled", true);
        $("#editBtn").removeAttr("disabled");
    }

    function startEdit () {
        // alert("start edit");
        // disabled 뜬거 다 제거
        $("input, textarea, #submitBtn").removeAttr("disabled");
        $("#reset").show();
        $('.picDelBtn').show();

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
    }

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

    // 사진을 삭제하겠다고 표시하기.
    function delPic (num) {
        let delFile = "#delFile";
        $(delFile + num).val('1');

        // default 이미지로 변경
        let pic = "#pic" + num;
        $(pic).attr("src", '<%=request.getContextPath()%>/static/images/iphoneCameraW.png');

        // 누른 해당 버튼 숨기기.
        $("#delPic" + num).hide();

    }
</script>
</body>
</html>
