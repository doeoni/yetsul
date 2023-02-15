package com.yetsul.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yetsul.model.Login;
import com.yetsul.model.Recipient;
import com.yetsul.model.User;
import com.yetsul.recipient.RecipientServiceImpl;

@Controller
public class RecipientController {
	@Autowired
	private RecipientServiceImpl service;
	int delivery;
	
	@GetMapping("/orderRecipient.do")
	String orderRecipient(HttpSession session,@RequestParam int deliveryCharge ,Model model) {
		String url="redirect:/login.do";
		Login user=(Login)session.getAttribute("login");
		if(user!=null) {
			Recipient vo=service.getRecipientBasic(user.getId());
			if(vo==null) {
				service.insert(user);
				vo=service.getRecipientBasic(user.getId());
			}
			model.addAttribute("recipient",vo);
			model.addAttribute("deliveryCharge",deliveryCharge);
			url="recipient/recipient";
		}
		return url;
	}
	
	@GetMapping("/recipient.do")
	String recipient(@RequestParam String recipientId,@RequestParam int deliveryCharge,Model model) {
		Recipient vo=service.getRecipient(recipientId);
		model.addAttribute("recipient",vo);
		model.addAttribute("deliveryCharge",deliveryCharge);
		return "recipient/recipient";
	}
	
	@GetMapping("/recipientEdit.do")
	String recipientEdit(@RequestParam String page,@RequestParam int deliveryCharge,@RequestParam String recipientId,Model model) {
		model.addAttribute("recipient",service.getRecipient(recipientId));
		model.addAttribute("deliveryCharge",deliveryCharge);
		model.addAttribute("page",page);
		return "recipient/recipientEdit";
	}
	
	@PostMapping("/recipientEditOK.do")
	String recipientEditOK(Recipient vo,@RequestParam String page,@RequestParam(required=false) int deliveryCharge) {
		String url="redirect:/orderRecipient.do?deliveryCharge="+deliveryCharge;
		if(page.equals("list")) {
			url="redirect:/recipientList.do";
		}
		service.update(vo);
		return url;
	}
	
	@GetMapping("/recipientList.do")
	String recipientList(HttpSession session,User vo,Model model) {
		if(vo.getUserId() == null) {
			Login user=(Login)session.getAttribute("login");
			vo.setUserId(user.getId());
		}
		model.addAttribute("rList",service.getRecipientAll(vo));
		return "recipient/recipientList";
	}
	
	@GetMapping("/changeStatus.do")
	String changeStatus(Recipient vo) {
		vo.setRecipientStatus("Y");
		service.updateStatus(vo);
		return "redirect:/recipientList.do";
	}
	
	@GetMapping("/recipientInsert.do")
	String recipientInsert(Recipient vo) {
		return "recipient/recipientInsert";
	}

	@PostMapping("/recipientInsertOK.do")
	String recipientInsertOK(Recipient vo) {
		service.insert(vo);
		return "redirect:/recipientList.do";
	}
	
	@GetMapping("/getReNickname.do")
	void getReNickname(Recipient vo,HttpSession session,HttpServletResponse response) throws Exception {
		vo=service.getRecipient(vo.getRecipientId());
		Login login= (Login)session.getAttribute("login");
		vo.setUpdatedBy(login.getId());
		
		Map<String,Object> map=new HashMap<>();
		map.put("recipientNickname",vo.getRecipientNickname());
		map.put("recipientId",vo.getRecipientId());
		map.put("recipientStatus",vo.getRecipientStatus());
		map.put("updatedBy",vo.getUpdatedBy());
		
		JSONObject jso= new JSONObject(map);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.print(jso.toJSONString());
	}
	
	@GetMapping("/recipientDelete.do")
	String recipeintDelete(Recipient vo,HttpSession session) {
		Login user= (Login)session.getAttribute("login");
		vo.setUpdatedBy(user.getId());
		service.delete(vo);
		return "redirect:/recipientList.do";
	}
	
	@GetMapping("/popup/recipientList.do")
	String popupRecipientList(HttpSession session,User vo,Model model) {
		Login login= (Login)session.getAttribute("login");
		String url="popup/recipientListByUser";
		if(login.getGrade().equals("ADMIN")) {
			url="popup/recipientListByAdmin";
		}
		model.addAttribute("rList",service.getRecipientAll(vo));
		return url;
	}
	
	@GetMapping("/popup/recipientInsert.do")
	String popupRecipientInsert() {
		return "popup/recipientInsert";
	}
	
	@PostMapping("/popup/recipientInsertOK.do")
	String popupRecipientInsertOK(Recipient vo) {
		service.insert(vo);
		return "redirect:/popup/recipientList.do";
	}
}
