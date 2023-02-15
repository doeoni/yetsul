package com.yetsul.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yetsul.model.Order;
import com.yetsul.order.OrderServiceImpl;
import com.yetsul.recipient.RecipientServiceImpl;
import com.yetsul.report.ReportServiceImpl;

@Controller
public class ReportController {
	@Autowired
	private ReportServiceImpl reportService;
	@Autowired
	private OrderServiceImpl oService;
	@Autowired
	private RecipientServiceImpl rService;
	
	@GetMapping("/todaySalse.do")
	String todaySalse(Model model) {
		LocalDate now=LocalDate.now();
		model.addAttribute("dayBeforeSalse",reportService.getSalse(now.minusDays(1).toString()));
		model.addAttribute("todaySalse",reportService.getSalse(now.toString()));
		model.addAttribute("oList",reportService.getOrderToday());
		return "report/todaySalse";
	}
	
	@GetMapping("/todayInventory.do")
	String todayInventory(Model model) {
		model.addAttribute("iList",reportService.getReportAll());
		return "report/todayInventory";
	}
	
	@GetMapping("/popup/getDetailOrder.do")
	String getDetailOrder(Order vo,Model model) {
		vo=oService.getOrderOne(vo);
		model.addAttribute("order",vo);
		model.addAttribute("detail",oService.getDetailOrder(vo));
		model.addAttribute("recipient",rService.getRecipient(vo.getRecipientId()));
		return "popup/getDetailOrder";
	}
}
