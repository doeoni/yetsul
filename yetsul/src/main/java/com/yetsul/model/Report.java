package com.yetsul.model;

import java.util.Date;

import lombok.Data;

@Data
public class Report {
	private int productId;
	private String productName;
	private int productAmount;
	private int dayBeforeOrderAmount;
	private int todayOrderAmount;
	private Date lastInStockDate;
	
	private String today;
	private int todayTotalOrderCount;
	private int todayTotalOrderAmount;
	private int todayTotalOrderSalse;
}
