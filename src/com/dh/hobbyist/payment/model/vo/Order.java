package com.dh.hobbyist.payment.model.vo;

import java.sql.Timestamp;

public class Order implements java.io.Serializable {
	private Timestamp firstOrder;
	private Timestamp lastOrder;
	
	public Order() {}

	public Order(Timestamp firstOrder, Timestamp lastOrder) {
		super();
		this.firstOrder = firstOrder;
		this.lastOrder = lastOrder;
	}

	public Timestamp getFirstOrder() {
		return firstOrder;
	}

	public void setFirstOrder(Timestamp firstOrder) {
		this.firstOrder = firstOrder;
	}

	public Timestamp getLastOrder() {
		return lastOrder;
	}

	public void setLastOrder(Timestamp lastOrder) {
		this.lastOrder = lastOrder;
	}

	@Override
	public String toString() {
		return "Order [firstOrder=" + firstOrder + ", lastOrder=" + lastOrder + "]";
	}
	
}
