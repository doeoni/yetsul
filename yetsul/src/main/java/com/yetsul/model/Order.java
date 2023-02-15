package com.yetsul.model;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private int orderId;
	private String userId;
	private String recipientId;
	private int orderTotalPrice;
	private int orderTotalNum;
	private int orderTotalAmount;
	private int deliveryCharge;
	private int mainProductId;
	private String mainProductName;
	private Date orderDate;
	
	private Date updatedAt;
	private String updatedBy;
}
