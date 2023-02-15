package com.yetsul.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yetsul.model.DetailOrder;
import com.yetsul.model.Order;

@Mapper
public interface OrderDAO {
	Order getOrder(Order vo);
	Order getOrderOne(Order vo);
	List<DetailOrder> getDetailOrder(Order vo);
	List<Order> getOrderAll(String userId);
	
	void order(Order vo);
	void detailOrder(DetailOrder vo);
	void deliveryCharge(DetailOrder vo);
	
	int getOrderId(Order vo);
}
