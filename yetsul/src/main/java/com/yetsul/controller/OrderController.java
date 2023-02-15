package com.yetsul.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yetsul.cart.CartServiceImpl;
import com.yetsul.model.Cart;
import com.yetsul.model.DetailOrder;
import com.yetsul.model.Login;
import com.yetsul.model.Order;
import com.yetsul.order.OrderServiceImpl;
import com.yetsul.recipient.RecipientServiceImpl;

@Controller
public class OrderController {
	@Autowired
	private OrderServiceImpl oService;
	@Autowired
	private CartServiceImpl cService;
	@Autowired
	private RecipientServiceImpl rService;
	
	@GetMapping("/order.do")
	String order(Order vo,Model model) {
		vo=oService.getOrder(vo);
		if(vo.getOrderTotalPrice()<40000) {
			vo.setDeliveryCharge(3000);
		}
		model.addAttribute("order",vo);
		return "order/order";
	}
	
	@PostMapping("/orderOK.do")
	String orderOK(@RequestParam String userId,@RequestParam int deliveryCharge,@RequestParam String recipientId,Model model) {
		Order vo= new Order();
		vo.setUserId(userId);
		vo= oService.getOrder(vo);
		vo.setRecipientId(recipientId);
		vo.setDeliveryCharge(deliveryCharge);
		vo.setOrderTotalPrice(vo.getOrderTotalPrice()+vo.getDeliveryCharge());
		oService.order(vo);
		int orderId= detailInsert(vo);
		cService.cartCancleAll(userId);
		model.addAttribute("orderId",orderId);
		return "order/orderOK";
	}
	
	@GetMapping("/orderList.do")
	String orderList(HttpSession session,Model model) {
		Login user= (Login)session.getAttribute("login");
		model.addAttribute("oList",oService.getOrderAll(user.getId()));
		return "order/orderList";
	}
	
	@GetMapping("/getDetail.do")
	String getDetailOrder(Order vo,Model model) {
		vo=oService.getOrderOne(vo);
		model.addAttribute("order",vo);
		model.addAttribute("detail",oService.getDetailOrder(vo));
		model.addAttribute("recipient",rService.getRecipient(vo.getRecipientId()));
		return "order/getDetailOrder";
	}
	
	int detailInsert(Order order) {
		List<Cart> orderList= cService.getCart(order.getUserId());
		DetailOrder dOrder= new DetailOrder();
		int orderId=oService.getOrderId(order);
		dOrder.setOrderId(orderId);
		dOrder.setCreatedBy(order.getUserId());
		if (order.getDeliveryCharge()!=0) {
			dOrder.setOrderAmount(order.getDeliveryCharge()/3000);
			dOrder.setProductId(100001);
			oService.detailOrder(dOrder);
		}
		for(int i=0;i<orderList.size();i++) {
			Cart c=orderList.get(i);
			dOrder.setOrderAmount(c.getOrderAmount());
			dOrder.setProductId(c.getProductId());
			dOrder.setDetailOrderId(c.getCartId());
			oService.detailOrder(dOrder);
		}
		return orderId;
	}
}
