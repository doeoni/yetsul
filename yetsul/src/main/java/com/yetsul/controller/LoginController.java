package com.yetsul.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yetsul.model.Login;
import com.yetsul.model.User;
import com.yetsul.user.BCrypt;
import com.yetsul.user.UserServiceImpl;

@Controller
public class LoginController {
	@Autowired
	private UserServiceImpl service;

	@GetMapping("/login.do")
	String login(HttpSession session) {
		session.invalidate();
		return "login/login";
	}
	
	@PostMapping("/loginOK.do")
	String loginOK(HttpSession session,User vo) {
		String url= "redirect:/login.do";
		Login loginVo= service.getLoginUser(vo);
		if(loginVo != null) {
			if(BCrypt.checkpw(vo.getUserPassword(),loginVo.getPassword())) {
				session.setAttribute("login",loginVo);
				url="redirect:/main.do";
			}
		}
		return url;
	}
	
	@GetMapping("/logout.do")
	String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/main.do";
	}
	
	@GetMapping("/search.do")
	String search() {
		return "login/search";
	}
	
	@PostMapping("/idSearch.do")
	String idSearch(User vo,Model model) {
		model.addAttribute("user",service.getUser(vo));
		return "login/idSearchOK";
	}
	
	@PostMapping("/pwChange.do")
	String pwSearch(User vo,Model model) {
		model.addAttribute("user",service.getUser(vo));
		return "login/pwChange";
	}

	@PostMapping("/pwChangeOK.do")
	String pwChangeOK(User vo) {
		vo.setUserPassword(BCrypt.hashpw(vo.getUserPassword(),BCrypt.gensalt()));
		service.pwChange(vo);
		return "redirect:/login.do";
	}
}
