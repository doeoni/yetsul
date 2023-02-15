package com.yetsul.product;

import java.util.List;

import com.yetsul.model.Page;
import com.yetsul.model.Product;

public interface ProductService {
	void insert(Product vo);
	void inStock(Product vo);
	
	List<Product> getProductAll(Page vo);
	Product getProduct(Product vo);
	
	int getTotalRecode(Page vo);
}
