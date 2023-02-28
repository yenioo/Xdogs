package com.spring.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.login.service.InterLoginService;

@Controller
public class LoginController {
	@Autowired
	private InterLoginService service;
	
	/*
	@RequestMapping(value = "/login.com", method= {RequestMethod.GET})
	public String login(HttpServletRequest request, HttpServletResponse response) {
		return "login/login";
	} */
	
}
