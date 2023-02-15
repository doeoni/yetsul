package com.yetsul.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yetsul.model.Login;
import com.yetsul.model.Page;
import com.yetsul.model.User;
import com.yetsul.user.BCrypt;
import com.yetsul.user.UserServiceImpl;

@Controller
public class UserController {
	@Autowired
	private UserServiceImpl service;
	
	@GetMapping("/project.do")
	String project() {
		return "/project.html";
	}

	@GetMapping("/main.do")
	String main() {
		return "main";
	}

	@GetMapping("/join.do")
	String join() {
		return "user/join";
	}

	@PostMapping("/joinOK.do")
	String joinOK(User vo) {
		vo.setUserPassword(BCrypt.hashpw(vo.getUserPassword(), BCrypt.gensalt()));
		service.join(vo);
		return "redirect:/join.do";
	}

	@GetMapping("/idCheck.do")
	void idCheck(User vo,HttpServletResponse response) throws IOException {
		PrintWriter out= response.getWriter();
		out.print(service.getUser(vo));
	}
	
	@GetMapping("/myPage.do")
	String myPage(HttpSession session,Model model) {
		Login user=(Login)session.getAttribute("login");
		User vo= new User();
		vo.setUserId(user.getId());
		model.addAttribute("info",service.getUser(vo));
		return "user/myPage";
	}

	@GetMapping("/userInfo.do")
	String userInfo(User vo,Model model) {
		model.addAttribute("info",service.getUser(vo));
		return "user/userInfo";
	}
	
	@GetMapping("/userCheck.do")
	String userCheck() {
		return "user/userCheck";
	}
	
	@PostMapping("/userEditOK.do")
	String userEditOK(HttpSession session,User vo) {
		String url="redirect:/login.do";
		Login user= (Login)session.getAttribute("login");
		if(vo.getUserPassword().length() > 0) {
			vo.setUserPassword(BCrypt.hashpw(vo.getUserPassword(),BCrypt.gensalt()));
		}
		if(!user.getId().equals(vo.getUserId())) {
			vo.setUpdatedBy(user.getId());
			url="redirect:/userList.do";
		}
		service.userEdit(vo);
		return url;
	}
	
	@GetMapping("/userList.do")
	String userList(Page vo,Model model) {
		if(vo.getOrderBy()!=null && vo.getOrderBy().length()>0) {
			vo.setSortBy(vo.getOrderBy().substring(0,vo.getOrderBy().lastIndexOf(".")));
			vo.setAsc(vo.getOrderBy().substring(vo.getOrderBy().lastIndexOf(".")+1));
		} else {
			vo.setOrderBy(null);
		}
		if(vo.getSearchKeyword()!=null && vo.getSearchKeyword().equals("")) {
			vo.setSearchKeyword(null);
		}
		vo=setPage(vo);
		model.addAttribute("uList",service.getUserAll(vo));
		model.addAttribute("page",vo);
		return "user/userList";
	}
	
	@GetMapping("/updateGrade.do")
	String updateGrade(@RequestParam String[] userId,@RequestParam String[] userGrade,String updatedBy) {
		User vo=new User();
		vo.setUpdatedBy(updatedBy);
		for(int i=0;i<userId.length;i++) {
			vo.setUserId(userId[i]);
			vo.setUserGrade(userGrade[i]);
			service.updateGrade(vo);
		}
		return "redirect:/userList.do";
	}
	
	@PostMapping("/userCheckOK.do")
	String userCheckOK(HttpSession session,@RequestParam String userPassword,Model model) {
		String url="redirect:/myPage.do";
		Login vo= (Login)session.getAttribute("login");
		if(BCrypt.checkpw(userPassword,vo.getPassword())) {
			User user=new User();
			user.setUserId(vo.getId());
			model.addAttribute("info",service.getUser(user));
			url="user/userEdit";
		}
		return url;
	}
	
	Page setPage(Page page) {
		page.setDisplayRecode(6);
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
