package com.yetsul.report;

import java.util.List;

import com.yetsul.model.Order;
import com.yetsul.model.Report;

public interface ReportService {
	List<Report> getReportAll();
	List<Order> getOrderToday();
	
	Report getSalse(String date);
}
