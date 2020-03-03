package com.dh.hobbyist.place.controller;

import com.dh.hobbyist.common.MyFileRenamePolicy;
import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.place.model.service.PlaceService;
import com.dh.hobbyist.place.model.vo.CompanyAds;
import com.dh.hobbyist.place.model.vo.PlaceCompany;
import com.oreilly.servlet.MultipartRequest;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Enumeration;

// 공간대여업체 수정. (은석)
@WebServlet(name = "UpdatePlaceCompanyServlet", urlPatterns = "/adminUpdateCompany.ad")
public class UpdatePlaceCompanyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdatePlaceCompanyServlet");


        // 여기서 개인적으로 가장 많이 고민했던 점은 지금 사진이 먼져 올라간 다음에야 들어가지는데,
        // 사진을 수정하거나 할 때 이걸 조치할 수 있는거지??

        // 결론: 그냥 순서 하나하나 체크해가면 될듯.

        if (ServletFileUpload.isMultipartContent(request)) {

            int maxSize = 20 * 1024 * 1024;

            String root = request.getSession().getServletContext().getRealPath("/");

            String savePath = "static/upload/place";


            // 이걸 선언하는 순간 인풋파일이 그냥 저장돼버리기 때문에
            // 파일이 수정됬는지 확인하는 방법은 그저 목록순서를 따지는것 뿐이다.
            MultipartRequest multipartRequest =
                    new MultipartRequest(request, root + savePath,
                            maxSize, "utf-8", new MyFileRenamePolicy());

            // 들어간 파일이름.
            ArrayList<String> fileName = new ArrayList<>();


            //파일이 전송된 폼의 name값을 반환
            Enumeration<String> files = multipartRequest.getFileNames();

            // 내용물 확인.
            // 이때 역순으로 파일이 불러져온다.
            // 중요한 참고사항임
            // nextElement() 하면 가장 마지막으로 들어갔을 pic5 부터 불러와진다는 소리.
            while (files.hasMoreElements()) {
                String name = files.nextElement();
                // 만일 아무것도 들어간게 없으면 null 처리된다.
                // 일반 인풋때는 생략되겠지만 여기선 널이어도 우선은 다 넣어야 한다.
                System.out.println("name: " + name);

                // 저장된 파일명들 다 넣기
                fileName.add(multipartRequest.getFilesystemName(name));
            }
            // 파일명 확인좀
            for (int i = 0; i < fileName.size(); i++) {
                System.out.println(i + ": " + fileName.get(i));
            }
            System.out.println("fileName: " + fileName);

            // 우선 변환할 대상부터 집어온다.
            // 뽑아와야 하는 PK
            int companyPk = Integer.parseInt(multipartRequest.getParameter("companyPk"));
            System.out.println("companyPk: " + companyPk);

            // 다 잘 나오는거 확인완료. 이제 하나하나 대조해가면서 바뀐게 있나 확인한다.

            // 회사명
            String companyName = multipartRequest.getParameter("companyName");
            System.out.println("companyName: " + companyName);
            // 폰번
            String phone = multipartRequest.getParameter("phone");
            // 주소
            String addr = multipartRequest.getParameter("addr");
            // 사이트 주소
            String website = multipartRequest.getParameter("website");
            // 업체소개
            String intro = multipartRequest.getParameter("intro");
            // 영업시간
            String serviceTime = multipartRequest.getParameter("serviceTime");
            System.out.println("serviceTime " + serviceTime);
            // 공간규모
            String roomSize1 = multipartRequest.getParameter("roomSize1");
            String roomSize2 = multipartRequest.getParameter("roomSize2");
            String roomSize3 = multipartRequest.getParameter("roomSize3");
            // 공간규모 통합
            String roomSize = "";
            if (roomSize1 != null) {
                roomSize += "1";
            }
            if (roomSize2 != null) {
                if (roomSize.length() > 0) {
                    roomSize += ",2";
                } else {
                    roomSize += "2";
                }
            }
            if (roomSize3 != null) {
                if (roomSize.length() > 0) {
                    roomSize += ",3";
                } else {
                    roomSize += "3";
                }
            }

            // 사진 확인용


            // 위에 파일목록 역순으로 들어간거 순서 재정렬
            ArrayList<Image> fileList = new ArrayList<>();
            for (int i = fileName.size() - 1; i >= 0; i--) {
                System.out.println(i);
                Image image = null;
                if (fileName.get(i) != null) {
                    image = new Image();
                    image.setImageRoute(savePath);
                    image.setImageName(fileName.get(i));
                    image.setImageType("PLACE_COMPANY");
                    image.setImageFkPk(companyPk);
                }
                fileList.add(image);
            }


            // 로딩한 회사와 인풋값 이제 하나하나 대조해본다.
            // 조금이라도 다른게 있으면 교체
            PlaceCompany editCompanyInfo = new PlaceCompany();
            // 받은 값 넣기
            editCompanyInfo.setCompany_name(companyName);
            editCompanyInfo.setPhone(phone);
            editCompanyInfo.setAddress(addr);
            editCompanyInfo.setWebsite(website);
            editCompanyInfo.setIntro(intro);
            editCompanyInfo.setService_time(serviceTime);
            editCompanyInfo.setRoom_size(roomSize);

            PlaceService placeService = new PlaceService();

            // ... 그냥 통째로 다 update 처리.
            int companyUpdateResult = placeService.updateCompany(editCompanyInfo, companyPk);

            // COMPANY_ADS table
            String startDateString = multipartRequest.getParameter("startDate");
            String endDateString = multipartRequest.getParameter("endDate");
            // System.out.println("endDateString: " + endDateString);
            // System.out.println("startDateString: " + startDateString);
            Date startDate = Date.valueOf(startDateString);
            // 종료일
            Date endDate = Date.valueOf(endDateString);

            CompanyAds companyAds = new CompanyAds();

            companyAds.setCompanyPk(companyPk);
            companyAds.setStartDate(startDate);
            companyAds.setEndDate(endDate);

            int adsUpdateResult = 0;
            // 회사홍보일정 중에 기한 남은게 있나 확인.
            CompanyAds notDueCompanyAds = placeService.selectCompanyAdsByDate(companyPk);
            // 여기서 하나 확인해야 할게 있음.
            // 위에 notDueCompanyAds 가 널이 아닌 경우 업데이트, 널이면 새로 인서트임.
            if (notDueCompanyAds != null) {
                companyAds.setAdPk(notDueCompanyAds.getAdPk());
                adsUpdateResult = placeService.updateAds(companyAds);
            } else {
                adsUpdateResult = placeService.insertAds(companyPk, companyAds);
            }

            // 다 넣었으면 이제 사진교체가 남아있다.
            // 기존 사진 불러오기.
            ArrayList<Image> imageArrayList = placeService.selectCompanyImage(companyPk);

            /*
             * 확인절차:
             * 0. 메인용 사진인지 확인(첫번째 사진인가?)
             * 1. 첫번째 사진에 업로드된게 있는지 확인한다.
             *   - 있으면 그 위치에 원래 등록된 다른 사진이 있었는지 확인한다.
             *   - 그럼 원래 업데이트 조치하고 사진을 삭제.
             *   - 업로드된게 있지만 사진이 없으면 그냥 추가하면 됨.
             * 2. 없으면 사진 index 에 삭제명령이 있었는지 확인한다.
             *   - 있으면 삭제조치만 한다.
             *   - 이때 메인사진인지 꼭 확인할것! 메인이면 그다음꺼로 메인 넘겨야함.
             * 3. 그럼 그냥 기존 사진이 존재하는가?
             *   - 아무것도 없이 사진만 달랑 존재하면 패스
             * */

            // 0. 메인용 사진인지 확인(첫번째 사진인가?)
            Boolean mainImageBool = true;

            // 삭제명령 목록
            ArrayList<String> picOpt = new ArrayList<>();
            picOpt.add(multipartRequest.getParameter("delFile1"));
            picOpt.add(multipartRequest.getParameter("delFile2"));
            picOpt.add(multipartRequest.getParameter("delFile3"));
            picOpt.add(multipartRequest.getParameter("delFile4"));
            picOpt.add(multipartRequest.getParameter("delFile5"));

            // 업로드된 파일목록과 대조해야 한다.
            int registeredFileSize = imageArrayList.size() - 1;
            for (int i = 0; i < fileList.size(); i++) {
                int isMain = 0;
                // 메인사진인지 확인하기 위한 용도
                if (mainImageBool) {
                    isMain = 1;
                }
                // 1. 사진에 업로드된게 있는지 확인한다.
                if (fileList.get(i) != null) {
                    // 있으면 그 위치에 원래 등록된 다른 사진이 있었는지 확인한다.
                    if (registeredFileSize >= i) {
                        // 그럼 원래 업데이트 조치하고 사진을 삭제.
                        int result = placeService.updateImageName(fileList.get(i), imageArrayList.get(i).getImageCode());
                        if (result > 0) {
                            File leFile = new File(root + savePath + "/" + imageArrayList.get(i).getImageName());
                            leFile.delete();
                        }
                    } else {
                        // 업로드된게 있지만 사진이 없으면 그냥 추가하면 됨.

                        // 단, 이때 메인사진인지 확인을 해야함. 메인이면 그다음꺼로 메인 넘겨야함.
                        // ^ 이건 포문 첫시작에 이미 확인함
                        int result = placeService.insertImage(fileList.get(i), isMain);
                        mainImageBool = false;
                    }
                    continue;
                } else if (picOpt.get(i).equals("1")) {
                    // 2. 없으면 사진에 삭제명령이 있었는지 확인한다.
                    // 있으면 삭제조치한다.
                    int result = placeService.deleteImage(imageArrayList.get(i));

                    // 이때 메인사진인지 꼭 확인할것! 메인이면 그다음꺼로 메인 넘겨야함.
                    if (result > 0 && mainImageBool) {
                        continue;
                    }
                }
                // 3. 그럼 그냥 기존 사진이 존재하는가?
                // 아무것도 없이 사진만 달랑 존재하면 패스
                // 여기까지 컨티뉴 없이 걸렸으면 메인사진이 어딘가에 걸린거니 고이 쉬게끔.
                if (mainImageBool) {
                    mainImageBool = false;
                }
            }
            // 이제 필요한건 기존 목록에 페이지 찾아오고 거기로 반환시키기.

            int currentPage = 1;
            try {
                currentPage = Integer.parseInt(multipartRequest.getParameter("currentPage"));
            } catch (NumberFormatException ignored) {

            }
            String page = request.getContextPath() + "/adminPlaceList.ad?" + "currentPage=" + currentPage;
            response.sendRedirect(page);


            // DEBUG: 현재는 파일을 저장할 필요가 없음. 고로 바로바로 삭제
            // System.out.println("DEBUG: deleting files...");
            // for (int i = 0; i < fileName.size(); i++) {
            //     File file = new File(root + savePath + "/" + fileName.get(i));
            //     if (file.exists()) {
            //         System.out.println("deleting added file: " + file.getName());
            //         System.out.println(file.delete());
            //     } else {
            //         System.out.println("wut no file " + file.getName());
            //     }
            // }


        }


    }
}
