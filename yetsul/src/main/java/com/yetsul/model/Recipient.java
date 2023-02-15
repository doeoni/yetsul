package com.yetsul.model;

import java.util.Date;

import lombok.Data;

@Data
public class Recipient {
	private String recipientId;
	private String userId;
	private String recipientPostcode;
	private String recipientAddr1;
	private String recipientAddr2;
	private String recipientAddr3;
	private String recipientPhone;
	private String recipientStatus; //기본 배송지 여부
	private String recipientName;
	private int lastOrderId;
	private Date lastOrderDate;
	private String recipientNickname;  //배송지 이름(집/회사)
	
	private String createdBy;
	private Date createdAt;
	private String updatedBy;
	private Date updatedAt;
}
