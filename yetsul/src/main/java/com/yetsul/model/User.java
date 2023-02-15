package com.yetsul.model;

import java.util.Date;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userPassword;
	private String userName;
	private String userPhone;
	private String userPostcode;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String userEmail;
	private String userGrade;
	private int userOrderCount;
	
	private Date createdAt;
	private String createdBy;
	private Date updatedAt;
	private String updatedBy;
}
