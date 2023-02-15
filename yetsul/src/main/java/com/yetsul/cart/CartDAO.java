package com.yetsul.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yetsul.model.Cart;

@Mapper
public interface CartDAO {
	void insert(Cart vo);
	void update(Cart vo);
	void cartCancle(Cart vo);
	void cartCancleAll(String userId);
	
	List<Cart> getCart(String userId);
}
