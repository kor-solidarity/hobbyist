package com.dh.hobbyist.place.model.service;

import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.common.model.vo.PageInfo;
import com.dh.hobbyist.place.model.dao.PlaceDao;
import com.dh.hobbyist.place.model.vo.CompanyAds;
import com.dh.hobbyist.place.model.vo.PlaceCompany;
import com.dh.hobbyist.place.model.vo.PlaceCompanyForList;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class PlaceService {
    // 공간대여업체 추가 (은석)
    public int insertPlaceCompany(PlaceCompany inputPC) {
        // 커넥션 객체 생성
        Connection con = getConnection();
        int result = 0;

        // 반환값은 단순히 0 1 이 아니라 인서트된 PK 값
        result = new PlaceDao().insertPlaceCompany(con, inputPC);

        if (result > 0) {
            commit(con);
        } else {
            rollback(con);
        }
        close(con);

        return result;
    }

    /**
     * 업체 가져오기 (은석)
     *
     * @param pk: 가져올 관리번호
     * @return PlaceCompany
     */
    public PlaceCompany selectPlaceCompany(int pk) {
        Connection con = getConnection();

        PlaceCompany company = new PlaceDao().selectPlaceCompany(con, pk);

        close(con);
        return company;
    }

    // 광고일정 추가 (은석)
    public int insertAds(int companyPk, CompanyAds inputAds) {
        Connection con = getConnection();
        int result = 0;

        result = new PlaceDao().insertAds(con, companyPk, inputAds);

        if (result > 0) {
            commit(con);
        } else {
            System.out.println("rollback occurred wtf");
            rollback(con);
        }
        close(con);

        return result;
    }

    // 공간대여업체의 관련사진 추가 (은석)
    public int insertImageList(ArrayList<Image> fileList) {
        Connection con = getConnection();
        int result = 0;

        // int result = new PlaceDao().insertImageList(con, fileList);
        // 파일 포문 돌려가면서 하나하나 넣기.
        for (int i = 0; i < fileList.size(); i++) {
            int isMain = 0;
            // 첫 사진은 메인으로 분류한다.
            if (i == 0) {
                isMain = 1;
            }
            //
            result += new PlaceDao().insertImage(con, fileList.get(i), isMain);
        }
        System.out.println("result: " + result);
        System.out.println("fileList: " + fileList.size());

        if (result == fileList.size()) {
            commit(con);
            System.out.println("commit");
            result = 1;
        } else {
            rollback(con);
            System.out.println("rollback");
            result = 0;
        }
        close(con);
        return result;
    }

    public int getListCount() {
        Connection con = getConnection();
        int result = 0;

        result = new PlaceDao().getListCount(con);


        close(con);
        return result;
    }

    // 목록조회에 쓸 명단들.
    public ArrayList<PlaceCompanyForList> selectList(PageInfo pageInfo) {
        Connection con = getConnection();

        ArrayList<PlaceCompanyForList> companyArrayList = new PlaceDao().selectList(con, pageInfo);

        close(con);

        return companyArrayList;
    }

    /**
     * 각 회사별 등록된 사진 목록 (은석)
     *
     * @param companyPk 이미지가 로딩될 회사 관리번호
     * @return
     */
    public ArrayList<Image> selectCompanyImage(int companyPk) {
        Connection con = getConnection();

        ArrayList<Image> images = new PlaceDao().selectImage(con, companyPk);

        close(con);

        return images;
    }

    /**
     * 회사별 등록된 홍보가능 일정목록.
     *
     * @param pk 홍보대상 회사의 관리번호.
     * @return
     */
    public CompanyAds selectCompanyAdsByDate(int pk) {
        Connection con = getConnection();
        CompanyAds ads = new PlaceDao().selectCompanyAdsByDate(con, pk);

        close(con);

        return ads;
    }

    public int updateCompany(PlaceCompany editCompanyInfo, int companyPk) {
        Connection con = getConnection();

        int result = new PlaceDao().updateCompany(con, editCompanyInfo, companyPk);

        if (result > 0) {
            commit(con);
        } else {
            rollback(con);
        }
        close(con);

        return result;
    }

    /**
     * 공간대여업체 홍보기간 수정.
     *
     * @param companyAds
     * @return
     */
    public int updateAds(CompanyAds companyAds) {
        Connection con = getConnection();

        int result = new PlaceDao().updateAds(con, companyAds);

        if (result > 0) {
            commit(con);
        } else {
            rollback(con);
        }
        close(con);

        return result;
    }
}
