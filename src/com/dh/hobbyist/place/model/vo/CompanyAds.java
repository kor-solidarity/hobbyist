package com.dh.hobbyist.place.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CompanyAds implements Serializable {
    // COMPANY_ADS 테이블
    int adPk;
    int companyPk;
    Date startDate;
    Date endDate;

    public CompanyAds() {
    }

    public CompanyAds(int adPk, int companyPk, Date startDate, Date endDate) {
        this.adPk = adPk;
        this.companyPk = companyPk;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "CompanyAds{" +
                "adPk=" + adPk +
                ", companyPk=" + companyPk +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }

    public int getAdPk() {
        return adPk;
    }

    public void setAdPk(int adPk) {
        this.adPk = adPk;
    }

    public int getCompanyPk() {
        return companyPk;
    }

    public void setCompanyPk(int companyPk) {
        this.companyPk = companyPk;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
