package com.yetsul.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yetsul.model.Order;
import com.yetsul.model.Report;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportDAO dao;
	
	@Override
	public List<Report> getReportAll() {
		return dao.getReportAll();
	}

	@Override
	public List<Order> getOrderToday() {
		return dao.getOrderToday();
	}

	@Override
	public Report getSalse(String date) {
		return dao.getSalse(date);
	}
	

}
