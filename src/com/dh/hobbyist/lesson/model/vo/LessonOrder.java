package com.dh.hobbyist.lesson.model.vo;

import java.sql.Timestamp;

public class LessonOrder implements java.io.Serializable {
	private int orderCode;
	private int scheduleCode;
	private int orderTime;
	private Timestamp orderStart;
	private Timestamp orderEnd;
	private int listeners;
	
	public LessonOrder() {}

	public LessonOrder(int orderCode, int scheduleCode, int orderTime, Timestamp orderStart, Timestamp orderEnd,
			int listeners) {
		super();
		this.orderCode = orderCode;
		this.scheduleCode = scheduleCode;
		this.orderTime = orderTime;
		this.orderStart = orderStart;
		this.orderEnd = orderEnd;
		this.listeners = listeners;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public int getScheduleCode() {
		return scheduleCode;
	}

	public int getOrderTime() {
		return orderTime;
	}

	public Timestamp getOrderStart() {
		return orderStart;
	}

	public Timestamp getOrderEnd() {
		return orderEnd;
	}
	
	public int getListeners() {
		return listeners;
	}


	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	public void setOrderTime(int orderTime) {
		this.orderTime = orderTime;
	}

	public void setOrderStart(Timestamp orderStart) {
		this.orderStart = orderStart;
	}

	public void setOrderEnd(Timestamp orderEnd) {
		this.orderEnd = orderEnd;
	}

	public void setListeners(int listeners) {
		this.listeners = listeners;
	}

	@Override
	public String toString() {
		return "LessonOrder [orderCode=" + orderCode + ", scheduleCode=" + scheduleCode + ", orderTime=" + orderTime
				+ ", orderStart=" + orderStart + ", orderEnd=" + orderEnd + ", listeners=" + listeners + "]";
	}
	
}
