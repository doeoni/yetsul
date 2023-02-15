package com.yetsul.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yetsul.model.Page;
import com.yetsul.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO dao;
	
	@Override
	public void insert(Product vo) {
		dao.insert(vo);
	}

	@Override
	public List<Product> getProductAll(Page vo) {
		return dao.getProductAll(vo);
	}

	@Override
	public Product getProduct(Product vo) {
		return dao.getProduct(vo);
	}

	@Override
	public void inStock(Product vo) {
		dao.inStock(vo);
	}

	@Override
	public int getTotalRecode(Page vo) {
		return dao.getTotalRecode(vo);
	}

}
