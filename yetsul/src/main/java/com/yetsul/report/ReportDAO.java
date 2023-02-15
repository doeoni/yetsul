package com.yetsul.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yetsul.model.Order;
import com.yetsul.model.Report;

@Mapper
public interface ReportDAO {
	List<Report> getReportAll();
	List<Order> getOrderToday();
	
	Report getSalse(String date);
}
