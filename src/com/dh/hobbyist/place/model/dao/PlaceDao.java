package com.dh.hobbyist.place.model.dao;

import com.dh.hobbyist.place.model.vo.PlaceCompany;

import static com.dh.hobbyist.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class PlaceDao {

    // 여기서 쓰일 properties 파일 연결
    private Properties prop = new Properties();

    // properties 파일은 dao 생성할 시 같이 로딩되게끔 한다.
    public PlaceDao() {
        String fileName = PlaceDao.class.getResource("/sql/place/place-query.properties").getPath();
        try {
            prop.load(new FileReader(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 회사정보 기입 (은석)
    public int insertPlaceCompany(Connection con, PlaceCompany inputPC) {
        PreparedStatement pstmt = null;
        int result = 0;

        String query = prop.getProperty("insertPlaceCompany");
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, inputPC.getCompany_name());
            pstmt.setString(2, inputPC.getPhone());
            pstmt.setString(3, inputPC.getAddress());
            pstmt.setString(4, inputPC.getWebsite());
            pstmt.setString(5, inputPC.getIntro());
            pstmt.setString(6, inputPC.getService_time());
            pstmt.setString(7, inputPC.getRoom_size());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }


        return result;
    }

    // 마지막 기입된 회사 불러오기
    public PlaceCompany selectLatestCompany(Connection con) {
        Statement stmt = null;
        ResultSet resultSet = null;
        PlaceCompany company = null;

        String query = prop.getProperty("selectLatestCompany");

        try {
            stmt = con.createStatement();
            resultSet = stmt.executeQuery(query);

            if (resultSet.next()) {
                company = new PlaceCompany();
                company.setCompany_pk(resultSet.getInt("company_pk"));
                company.setCompany_name(resultSet.getString("company_name"));
                company.setPhone(resultSet.getString("phone"));
                company.setAddress(resultSet.getString("address"));
                company.setWebsite(resultSet.getString("website"));
                company.setIntro(resultSet.getString("intro"));
                company.setService_time(resultSet.getString("service_time"));
                company.setRoom_size(resultSet.getString("room_size"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(resultSet);
            close(stmt);
        }

        return company;
    }
}
