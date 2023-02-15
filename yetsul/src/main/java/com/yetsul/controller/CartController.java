package com.yetsul.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yetsul.cart.CartServiceImpl;
import com.yetsul.model.Cart;
import com.yetsul.model.Login;

@Controller
public class CartController {
	@Autowired
	private CartServiceImpl service;
	
	@GetMapping("/cartInsert.do")
	String cartInsert(Cart vo) {
		service.insert(vo);
		return "redirect:/productList.do";
	}
	
	@GetMapping("/cart.do")
	String cart(HttpSession session,Model model){
		Login user= (Login)session.getAttribute("login");
		String url= "login/login";
		if(user!=null) {
			url= "cart/cart";
			model.addAttribute("cart",service.getCart(user.getId()));
		}
		return url;
	}
	
	@GetMapping("/cartCancel.do")
	String cartCancel(Cart vo) {
		if(vo.getUserId()==null) {
			service.cartCancle(vo);
		} else {
			service.cartCancleAll(vo.getUserId());
		}
		return "redirect:/cart.do";
	}
	
	@GetMapping("/cartEdit.do")
	String cartEdit(HttpSession session,@RequestParam int[] cartId,@RequestParam int[] orderAmount) {
		Cart vo= new Cart();
		Login user= (Login)session.getAttribute("login");
		vo.setUserId(user.getId());
		for(int i=0;i<cartId.length;i++) {
			vo.setCartId(cartId[i]);
			vo.setOrderAmount(orderAmount[i]);
			service.update(vo);
		}
		return "redirect:/cart.do";
	}

}
