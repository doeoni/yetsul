package com.yetsul.cart;

import java.util.List;

import com.yetsul.model.Cart;

public interface CartService {
	void insert(Cart vo);
	void update(Cart vo);
	void cartCancle(Cart vo);
	void cartCancleAll(String userId);
	
	List<Cart> getCart(String userId);
}
