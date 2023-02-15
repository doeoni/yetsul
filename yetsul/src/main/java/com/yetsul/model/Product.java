package com.yetsul.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int productId ;
	private String productCategory;
	private String productName;
	private String productMaker;
	private int productPrice;
	private int productABV;
	private String productSize;
	private int productAmount;
	private String productDesc;
	private String productImg;
	private MultipartFile productImgFile;
	
	private Date createdAt;
	private String createdBy;
	private Date updatedAt;
	private String updatedBy;
}
