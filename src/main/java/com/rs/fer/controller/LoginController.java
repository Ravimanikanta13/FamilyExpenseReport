package com.rs.fer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.service.FERService;

@Controller
public class LoginController {	
	
	@Autowired
	FERService ferService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("Login");
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView authenticateUser(@RequestParam String username, @RequestParam String password,
			HttpServletRequest request) {

		// Call the service by passing the input

		int userId = ferService.login(username, password);

		String viewName = null;
		HttpSession session = request.getSession();

		// show the status
		if (userId > 0) {
			session.setAttribute("username", username);
			session.setAttribute("userId", userId);

			// Body
			session.setAttribute("status", "Welcome to user: " + username + "!");
			viewName = "Dashboard";
		} else {

			session.setAttribute("status", "Incorrect username/password.Please Try again...!");
			viewName = "Login";

		}
		return new ModelAndView(viewName);
	}
}
