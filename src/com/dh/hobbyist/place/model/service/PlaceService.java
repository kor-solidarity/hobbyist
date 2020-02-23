package com.dh.hobbyist.place.model.service;

import com.dh.hobbyist.place.model.dao.PlaceDao;
import com.dh.hobbyist.place.model.vo.PlaceCompany;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.sql.Connection;

public class PlaceService {
    // 공간대여업체 추가 (은석)
    public int insertPlaceCompany(PlaceCompany inputPC) {
        // 커넥션 객체 생성
        Connection con = getConnection();

        //
        int result = new PlaceDao().insertPlaceCompany(con, inputPC);

        if (result > 0) {
            commit(con);
        } else {
            rollback(con);

        }
        close(con);

        return result;
    }

    // 마지막으로 추가된 업체 가져오기
    public PlaceCompany getLatestInserted() {
        Connection con = getConnection();

        PlaceCompany company = new PlaceDao().selectLatestCompany();
        return null;
    }
}
