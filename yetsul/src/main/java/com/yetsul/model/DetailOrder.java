package com.yetsul.model;

import java.util.Date;

import lombok.Data;

@Data
public class DetailOrder {
	private int detailOrderId;
	private int orderId;
	private int productId;
	private String productName;
	private int productPrice;
	private int orderAmount;
	
	private Date createdAt;
	private String createdBy;
	private Date updatedAt;
	private String updatedBy;
}
