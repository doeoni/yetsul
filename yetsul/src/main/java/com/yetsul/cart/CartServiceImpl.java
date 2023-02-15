package com.yetsul.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yetsul.model.Cart;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO dao;
	
	@Override
	public void insert(Cart vo) {
		dao.insert(vo);
	}

	@Override
	public List<Cart> getCart(String userId) {
		return dao.getCart(userId);
	}

	@Override
	public void cartCancle(Cart vo) {
		dao.cartCancle(vo);
	}

	@Override
	public void cartCancleAll(String userId) {
		dao.cartCancleAll(userId);
	}

	@Override
	public void update(Cart vo) {
		dao.update(vo);
	}

}
