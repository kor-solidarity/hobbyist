package com.dh.hobbyist.place.model.vo;

import java.sql.Date;

public class CompanyAds {
    // COMPANY_ADS 테이블
    int adPk;
    int companyPk;
    Date startTime;
    Date endTime;

    public CompanyAds() {
    }

    public CompanyAds(int adPk, int companyPk, Date startTime, Date endTime) {
        this.adPk = adPk;
        this.companyPk = companyPk;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "CompanyAds{" +
                "adPk=" + adPk +
                ", companyPk=" + companyPk +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
