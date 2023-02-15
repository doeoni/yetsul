package com.yetsul.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yetsul.model.DetailOrder;
import com.yetsul.model.Order;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO dao;

	@Override
	public Order getOrder(Order vo) {
		return dao.getOrder(vo);
	}

	@Override
	public void order(Order vo) {
		dao.order(vo);
	}

	@Override
	public int getOrderId(Order vo) {
		return dao.getOrderId(vo);
	}

	@Override
	public void detailOrder(DetailOrder vo) {
		if(vo.getProductId()==100001) {
			dao.deliveryCharge(vo);
		}else {
			dao.detailOrder(vo);
		}
	}

	@Override
	public List<Order> getOrderAll(String userId) {
		return dao.getOrderAll(userId);
	}

	@Override
	public List<DetailOrder> getDetailOrder(Order vo) {
		return dao.getDetailOrder(vo);
	}

	@Override
	public Order getOrderOne(Order vo) {
		return dao.getOrderOne(vo);
	}

}
