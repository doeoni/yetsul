package com.yetsul.order;

import java.util.List;

import com.yetsul.model.DetailOrder;
import com.yetsul.model.Order;

public interface OrderService {
	Order getOrder(Order vo);
	Order getOrderOne(Order vo);
	List<DetailOrder> getDetailOrder(Order vo);
	List<Order> getOrderAll(String userId);
	
	void order(Order vo);
	void detailOrder(DetailOrder vo);
	
	int getOrderId(Order vo);
}
