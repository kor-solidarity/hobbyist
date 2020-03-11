package com.dh.hobbyist.point.model.vo;

import java.sql.Timestamp;

public class Point {
	private int type;
	private int point;
	private Timestamp pointDate;
	private String base;
	
	public Point() {}

	public Point(int type, int point, Timestamp pointDate, String base) {
		super();
		this.type = type;
		this.point = point;
		this.pointDate = pointDate;
		this.base = base;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Timestamp getPointDate() {
		return pointDate;
	}

	public void setPointDate(Timestamp pointDate) {
		this.pointDate = pointDate;
	}

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}

	@Override
	public String toString() {
		return "Point [type=" + type + ", point=" + point + ", pointDate=" + pointDate + ", base=" + base + "]";
	}
}
