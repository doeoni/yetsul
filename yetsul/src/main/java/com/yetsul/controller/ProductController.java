package com.yetsul.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.yetsul.model.Page;
import com.yetsul.model.Product;
import com.yetsul.product.ProductServiceImpl;

@Controller
public class ProductController {
	@Autowired
	private ProductServiceImpl service;
	@Autowired
	private ServletContext servletContext;
	private String path;
	
	@PostConstruct
	public void init() {
		path= servletContext.getRealPath("/include/img/");
	}
	
	@GetMapping("/insert.do")
	String insert() {
		return "/product/insert";
	}
	
	@PostMapping("/insertOK.do")
	String insertOK(Product vo) throws Exception {
		MultipartFile mFile=vo.getProductImgFile();
		String fileName= mFile.getOriginalFilename();
		File file= new File(path+fileName);
		if(!mFile.isEmpty()) {
			if(file.exists()) {
				fileName=changeFileName(fileName);
			}
			mFile.transferTo(new File(path+fileName));
		}else {
			fileName="space.png";
		}
		vo.setProductImg(fileName);
		service.insert(vo);
		return "redirect:/productList.do";
	}
	
	@GetMapping("/productList.do")
	String productList(Page vo,Model model) {
		if(vo.getSearchKeyword() != null && vo.getSearchKeyword().length() == 0) {
			vo.setSearchKeyword(null);
		}
		vo=setPage(vo);
		model.addAttribute("pList",service.getProductAll(vo));
		model.addAttribute("page",vo);
		return "product/productList";
	}
	
	@GetMapping("/getProduct.do")
	String getProduct(Product vo,Model model) {
		model.addAttribute("product",service.getProduct(vo));
		return "product/getProduct";
	}
	
	@GetMapping("/popup/inStock.do")
	String inStock(Product vo,Model model) {
		model.addAttribute("product",service.getProduct(vo));
		return "popup/inStock";
	}
	
	@GetMapping("/popup/inStockOK.do")
	String inStockOK(Product vo,Model model) {
		service.inStock(vo);
		return "redirect:/popup/inStock.do?productId="+vo.getProductId();
	}
	
	String changeFileName(String fileName) {
		SimpleDateFormat dateFormat= new SimpleDateFormat("HHmmss");
		String time=dateFormat.format(System.currentTimeMillis());
		String onlyFileName= fileName.substring(0,fileName.lastIndexOf("."));
		String extension= fileName.substring(fileName.lastIndexOf("."));
		return onlyFileName+"_"+time+extension;
	}
	
	Page setPage(Page page) {
		page.setDisplayRecode(4);
		page.setDisplayPage(5);
		page.setTotalRecode(service.getTotalRecode(page));
		page.setTotalPage((int)Math.ceil((double)page.getTotalRecode()/page.getDisplayRecode()));
		if(page.getNowRecode() < 1) {
			page.setNowRecode(1);
		}
		page.setNowPage((int)(page.getNowRecode()/page.getDisplayRecode())+1);
		page.setLastPageStartRecode((page.getTotalPage()-1)*page.getDisplayRecode()+1);
		page.setPageStart((page.getNowPage()-1)/page.getDisplayPage()*page.getDisplayPage()+1);
		page.setPageEnd(page.getPageStart()+page.getDisplayPage()-1);
		if(page.getPageEnd()>page.getTotalPage()) {
			page.setPageEnd(page.getTotalPage());
		}
		return page;
	}
}
