package com.dh.hobbyist.lesson.model.vo;

import java.sql.Timestamp;

/**
 * LESSON_PAYMENT 테이블
 */
public class LessonPayment {
    int payment_pk;
    int points_used;
    int points_given;
    int payment_costs;
    String payment_method;
    String payment_imp_num;
    Timestamp payment_date;
    int lesson_schedule_pk;
    int artist_pk;
    int member_pk;

    public LessonPayment() {
    }

    public LessonPayment(int payment_pk, int points_used, int points_given, int payment_costs, String payment_method,
                         String payment_imp_num, Timestamp payment_date, int lesson_schedule_pk, int artist_pk,
                         int member_pk) {
        this.payment_pk = payment_pk;
        this.points_used = points_used;
        this.points_given = points_given;
        this.payment_costs = payment_costs;
        this.payment_method = payment_method;
        this.payment_imp_num = payment_imp_num;
        this.payment_date = payment_date;
        this.lesson_schedule_pk = lesson_schedule_pk;
        this.artist_pk = artist_pk;
        this.member_pk = member_pk;
    }

    @Override
    public String toString() {
        return "LessonPayment{" +
                "payment_pk=" + payment_pk +
                ", points_used=" + points_used +
                ", points_given=" + points_given +
                ", payment_costs=" + payment_costs +
                ", payment_method='" + payment_method + '\'' +
                ", payment_imp_num='" + payment_imp_num + '\'' +
                ", payment_date=" + payment_date +
                ", lesson_schedule_pk=" + lesson_schedule_pk +
                ", artist_pk=" + artist_pk +
                ", member_pk=" + member_pk +
                '}';
    }

    public int getPayment_pk() {
        return payment_pk;
    }

    public void setPayment_pk(int payment_pk) {
        this.payment_pk = payment_pk;
    }

    public int getPoints_used() {
        return points_used;
    }

    public void setPoints_used(int points_used) {
        this.points_used = points_used;
    }

    public int getPoints_given() {
        return points_given;
    }

    public void setPoints_given(int points_given) {
        this.points_given = points_given;
    }

    public int getPayment_costs() {
        return payment_costs;
    }

    public void setPayment_costs(int payment_costs) {
        this.payment_costs = payment_costs;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getPayment_imp_num() {
        return payment_imp_num;
    }

    public void setPayment_imp_num(String payment_imp_num) {
        this.payment_imp_num = payment_imp_num;
    }

    public Timestamp getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Timestamp payment_date) {
        this.payment_date = payment_date;
    }

    public int getLesson_schedule_pk() {
        return lesson_schedule_pk;
    }

    public void setLesson_schedule_pk(int lesson_schedule_pk) {
        this.lesson_schedule_pk = lesson_schedule_pk;
    }

    public int getArtist_pk() {
        return artist_pk;
    }

    public void setArtist_pk(int artist_pk) {
        this.artist_pk = artist_pk;
    }

    public int getMember_pk() {
        return member_pk;
    }

    public void setMember_pk(int member_pk) {
        this.member_pk = member_pk;
    }
}
