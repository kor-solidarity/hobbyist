package com.dh.hobbyist.place.model.dao;

import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.common.model.vo.PageInfo;
import com.dh.hobbyist.place.model.vo.CompanyAds;
import com.dh.hobbyist.place.model.vo.PlaceCompany;
import com.dh.hobbyist.place.model.vo.PlaceCompanyAndAdsList;

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

    // 마지막 기입된 회사 불러오기 (은석)
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

    public int insertAds(Connection con, int company_pk, CompanyAds inputAds) {
        PreparedStatement preparedStatement = null;
        int result = 0;

        String query = prop.getProperty("insertAds");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, company_pk);
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

    public ArrayList<PlaceCompanyAndAdsList> selectList(Connection con, PageInfo pageInfo) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<PlaceCompanyAndAdsList> companyArrayList = null;

        String query = prop.getProperty("selectPagedPlaceCompanyList");

        try {
            preparedStatement = con.prepareStatement(query);

            // 불러와야 하는 목록의 첫글 - 2페이지면 21번째글
            int startNum = (pageInfo.getCurrentPage() - 1) * pageInfo.getLimit() + 1;
            // 불러와야 하는 목록의 마지막글 - 2페이지면 30번글.
            int endNum = startNum + pageInfo.getLimit() - 1;

            preparedStatement.setInt(1, startNum);
            preparedStatement.setInt(2, endNum);

            resultSet = preparedStatement.executeQuery();

            companyArrayList = new ArrayList<>();

            while (resultSet.next()) {
                PlaceCompanyAndAdsList pc = new PlaceCompanyAndAdsList();
                // 번호 이름 전번 시작일 종료일
                pc.setCompany_pk(resultSet.getInt("company_pk"));
                pc.setCompany_name(resultSet.getString("company_name"));
                pc.setPhone(resultSet.getString("phone"));
                // System.out.println(resultSet.getString("start_date"));
                pc.setStartDate(resultSet.getDate("start_date"));
                pc.setEndDate(resultSet.getDate("end_date"));

                companyArrayList.add(pc);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
            close(preparedStatement);
        }


        return companyArrayList;
    }

    // 공간대여업체에 엮여 등록된 이미지 사진목록 (은석)
    public ArrayList<Image> selectImage(Connection con, int companyPk) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Image> imgList = null;

        String query = prop.getProperty("selectCompanyImageList");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, companyPk);

            resultSet = preparedStatement.executeQuery();
            imgList = new ArrayList<>();
            while (resultSet.next()) {
                Image img = new Image();

                img.setImageCode(resultSet.getInt(1));
                img.setImageRoute(resultSet.getString(2));
                img.setImageName(resultSet.getString(3));
                img.setImageType(resultSet.getString(4));
                img.setImageFkPk(resultSet.getInt(5));
                img.setImageMain(resultSet.getInt(6));
                imgList.add(img);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
            close(preparedStatement);
        }

        return imgList;
    }

    public CompanyAds selectCompanyAdsByDate(Connection con, int pk) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        CompanyAds companyAds = null;

        // 기한이 남은 경우에만 불러온다.
        String query = prop.getProperty("selectCompanyAdsByDate");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, pk);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                companyAds = new CompanyAds();

                companyAds.setAdPk(resultSet.getInt(1));
                companyAds.setCompanyPk(resultSet.getInt(2));
                companyAds.setStartDate(resultSet.getDate(3));
                companyAds.setEndDate(resultSet.getDate(4));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
            close(preparedStatement);
        }

        return companyAds;
    }

    /**
     * 공간대여 회사정보 수정 DAO
     *
     * @param editCompanyInfo {@link PlaceCompany}
     * @param companyPk
     * @return
     */
    public int updateCompany(Connection con, PlaceCompany editCompanyInfo, int companyPk) {
        PreparedStatement preparedStatement = null;
        int result = 0;

        String query = prop.getProperty("updateCompany");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, editCompanyInfo.getCompany_name());
            preparedStatement.setString(2, editCompanyInfo.getPhone());
            preparedStatement.setString(3, editCompanyInfo.getAddress());
            preparedStatement.setString(4, editCompanyInfo.getWebsite());
            preparedStatement.setString(5, editCompanyInfo.getIntro());
            preparedStatement.setString(6, editCompanyInfo.getService_time());
            preparedStatement.setString(7, editCompanyInfo.getRoom_size());
            preparedStatement.setInt(8, companyPk);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(preparedStatement);
        }

        return result;
    }

    public int updateAds(Connection con, CompanyAds companyAds) {
        PreparedStatement preparedStatement = null;
        int result = 0;

        String query = prop.getProperty("updateAds");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setDate(1, companyAds.getStartDate());
            preparedStatement.setDate(2, companyAds.getEndDate());
            preparedStatement.setInt(3, companyAds.getAdPk());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(preparedStatement);
        }

        return result;
    }

    public int updateImageName(Connection con, Image image, int pk) {
        PreparedStatement preparedStatement = null;
        int result = 0;

        String query = prop.getProperty("updateImageName");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, image.getImageName());
            preparedStatement.setInt(2, pk);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(preparedStatement);
        }

        return result;
    }

    public int deleteImage(Connection con, int pk) {
        PreparedStatement preparedStatement = null;
        int result = 0;

        String query = prop.getProperty("deleteImage");

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, pk);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public int getMemberPlaceListCount(Connection con) {
        Statement statement = null;
        ResultSet resultSet = null;

        int list = 0;

        String query = prop.getProperty("memberPlaceListCount");

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

    /**
     * 사용자단 공간대여업체 목록 조회
     *
     * @param con
     * @param pi
     * @return
     */
    public ArrayList<PlaceCompany> selectCompanyList(Connection con, PageInfo pi) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<PlaceCompany> companyArrayList = null;

        String query = prop.getProperty("memberPlaceListByPage");

        // 첫 페이지인 경우 1-9번 글을 뽑아와야 함.

        // 설명: 현재 페이지에서 1을 뺀 값을
        //  한 페이지에 보여야 하는 글 수만큼 곱한 후 1을 더한다.
        int startPk = ((pi.getCurrentPage() - 1) * pi.getLimit() + 1);
        // 마지막 끌어와야 하는 값은
        //  현재 시작번호에서 보여야 하는 글 수 값에서 1을 뺌.
        //  하나 빼는 이유는 startPk 의 값을 포함해서 보여야 하는 글 수까지기 때문.
        int endPk = startPk + pi.getLimit() - 1;

        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, startPk);
            preparedStatement.setInt(2, endPk);

            resultSet = preparedStatement.executeQuery();

            companyArrayList = new ArrayList<>();

            while (resultSet.next()) {
                PlaceCompany company = new PlaceCompany();

                company.setCompany_pk(resultSet.getInt("COMPANY_PK"));
                company.setCompany_name(resultSet.getString("COMPANY_NAME"));
                company.setAddress(resultSet.getString("ADDRESS"));
                company.setRoom_size(resultSet.getString("ROOM_SIZE"));
                company.setMain_image_name(resultSet.getString("IMAGE_NAME"));

                companyArrayList.add(company);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
            close(preparedStatement);
        }
        return companyArrayList;
    }
}
