package com.rs.fer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;

@Controller
public class RegistrationController {
	
	@Autowired
	private FERService ferService;

	@RequestMapping(value = "/showRegistration", method = RequestMethod.GET)
	public ModelAndView displayRegistration() {
		return new ModelAndView("Registration");
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute User user, HttpServletRequest request) {

		HttpSession session = request.getSession();
		// Call the service by passing the input
		boolean isRegister = ferService.registration(user);

		// show the status
		String viewName = null;
		if (isRegister) {
			session.setAttribute("status", "Registration is SuccesFull");
			viewName = "Login";

		} else {
			session.setAttribute("status", "Registartion is Failed");
			viewName = "Registration";
		}
		return new ModelAndView(viewName);
	}
}
