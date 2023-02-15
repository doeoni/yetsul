package com.yetsul.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yetsul.model.Page;
import com.yetsul.model.Product;

@Mapper
public interface ProductDAO {
	void insert(Product vo);
	void inStock(Product vo);
	
	Product getProduct(Product vo);
	List<Product> getProductAll(Page vo);
	
	int getTotalRecode(Page vo);
}
