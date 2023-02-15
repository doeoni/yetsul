package com.yetsul.model;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {
	private int cartId;
	private String userId;
	private int productId;
	private String productName;
	private int productPrice;
	private int orderAmount;
	private int totalPrice;
	
	private Date createdAt;
	private String createdBy;
	private Date updatedAt;
	private String updatedBy;
}
