package com.dh.hobbyist.place.model.dao;

import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.common.model.vo.PageInfo;
import com.dh.hobbyist.place.model.vo.CompanyAds;
import com.dh.hobbyist.place.model.vo.PlaceCompany;
import com.dh.hobbyist.place.model.vo.PlaceCompanyForList;

import static com.dh.hobbyist.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
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
        Statement statement = null;
        ResultSet resultSet = null;
        int result = 0;

        String query = prop.getProperty("insertPlaceCompany");
        String pkQuery = prop.getProperty("selectPlaceCompanySeqCurrval");
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, inputPC.getCompany_name());
            pstmt.setString(2, inputPC.getPhone());
            pstmt.setString(3, inputPC.getAddress());
            pstmt.setString(4, inputPC.getWebsite());
            pstmt.setString(5, inputPC.getIntro());
            pstmt.setString(6, inputPC.getService_time());
            pstmt.setString(7, inputPC.getRoom_size());
            System.out.println(pstmt.toString());
            result = pstmt.executeUpdate();

            // 잘 들어갔으면 안에서 값 빼온다.
            // 시퀀스는 세션 지나면 currval 만으로 조회가 안되기 때문에 꼭 바로바로 확인을 해야함.
            if (result > 0) {
                statement = con.createStatement();

                resultSet = statement.executeQuery(pkQuery);
                if (resultSet.next()) {
                    result = resultSet.getInt("currval");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
            close(pstmt);
        }


        return result;
    }

    // 마지막 기입된 회사 불러오기
    public PlaceCompany selectPlaceCompany(Connection con, int pk) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        PlaceCompany company = null;

        String query = prop.getProperty("selectPlaceCompany");

        try {
            // stmt = con.createStatement();
            preparedStatement = con.prepareStatement(query);
            // resultSet = stmt.executeQuery(query);

            preparedStatement.setInt(1, pk);

            resultSet = preparedStatement.executeQuery();

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
        } finally {
            close(resultSet);
            close(preparedStatement);
        }

        return company;
    }

    public int insertAds(Connection con, PlaceCompany company, CompanyAds inputAds) {
        PreparedStatement preparedStatement = null;
        int result = 0;

        String query = prop.getProperty("insertAds");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, company.getCompany_pk());
            preparedStatement.setDate(2, inputAds.getStartDate());
            preparedStatement.setDate(3, inputAds.getEndDate());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // PreparedStatement 클래스는 Statement 를 상속받기 때문에 그냥 대상이 Statement 여도 상관없다.
            close(preparedStatement);
        }

        return result;
    }

    // 공간대여업체 이미지파일 디비에 인서트
    public int insertImage(Connection con, Image image, int isMain) {
        PreparedStatement preparedStatement = null;
        int result = 0;

        String query = prop.getProperty("insertImage");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, image.getImageRoute());
            preparedStatement.setString(2, image.getImageName());
            preparedStatement.setString(3, image.getImageType());
            preparedStatement.setInt(4, image.getImageFkPk());
            preparedStatement.setInt(5, isMain);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(preparedStatement);
        }

        return result;
    }

    public int getListCount(Connection con) {
        Statement statement = null;
        ResultSet resultSet = null;

        int list = 0;

        String query = prop.getProperty("placeListCount");

        try {
            statement = con.createStatement();
            resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                list = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
            close(statement);
        }

        return list;
    }

    public ArrayList<PlaceCompanyForList> selectList(Connection con, PageInfo pageInfo) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<PlaceCompanyForList> companyArrayList = null;

        String query = prop.getProperty("selectPagedPlaceCompanyList");

        try {
            preparedStatement = con.prepareStatement(query);

            // 불러와야 하는 목록의 첫글 - 2페이지면 21번째글
            int startNum = (pageInfo.getCurrentPage() - 1) * pageInfo.getLimit() + 1;
            // 불러와야 하는 목록의 마지막글 - 2페이지면 30번글.
            int endNum = startNum + pageInfo.getLimit() -1;

            preparedStatement.setInt(1, startNum);
            preparedStatement.setInt(2, endNum);

            resultSet = preparedStatement.executeQuery();

            companyArrayList = new ArrayList<>();

            while (resultSet.next()) {
                PlaceCompanyForList pc = new PlaceCompanyForList();
                // 번호 이름 전번 시작일 종료일
                pc.setCompany_pk(resultSet.getInt("company_pk"));
                pc.setCompany_name(resultSet.getString("company_name"));
                pc.setPhone(resultSet.getString("phone"));
                pc.setStartDate(Date.valueOf(resultSet.getString("start_date")));
                pc.setEndDate(Date.valueOf(resultSet.getString("end_date")));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(resultSet);
            close(preparedStatement);
        }


        return companyArrayList;
    }
}
