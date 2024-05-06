package com.rs.fer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;

@Controller
public class UpdateProfileController {

	@Autowired
	private FERService ferService;

	@RequestMapping(value = "/showNameInfo", method = RequestMethod.POST)
	public ModelAndView displayNameInfo(HttpServletRequest request) {

		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		User user = ferService.getUser(userId);
		session.setAttribute("user", user);
		return new ModelAndView("NameInfo");
	}

	@RequestMapping(value = "/showContactInfo", method = RequestMethod.POST)
	public ModelAndView displayContactInfo(HttpServletRequest request, @ModelAttribute User userUI) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// call the service by passing the input
		user.setFirstName(userUI.getFirstName());
		user.setMiddleName(userUI.getMiddleName());
		user.setLastName(userUI.getLastName());
		
		return new ModelAndView("ContactInfo");

	}

	@RequestMapping(value = "/showAddressInfo", method = RequestMethod.POST)
	public ModelAndView displayAddressInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// call the service by passing the input
		user.setEmail(request.getParameter("email"));
		user.setMobile(request.getParameter("mobile"));
		Address address = user.getAddress();
		session.setAttribute("address", address);
		return new ModelAndView("AddressInfo");

	}

	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public ModelAndView displayReview(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Address address = user.getAddress();
		address.setLineOne(request.getParameter("lineOne"));
		address.setLineTwo(request.getParameter("lineTwo"));
		address.setCity(request.getParameter("city"));
		address.setState(request.getParameter("state"));
		address.setPinCode(request.getParameter("pinCode"));
		address.setCountry(request.getParameter("country"));
		return new ModelAndView("Review");
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public ModelAndView updateProfile(HttpServletRequest request) {
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");
		// call the service by passing the input
		boolean isUpdatedProfile = ferService.updateUser(user);
		// status
		if (isUpdatedProfile) {
			session.setAttribute("status", "Profile Updated Successfull");
		} else {
			session.setAttribute("status", "profile Update failed");
		}
		return new ModelAndView("Dashboard");

	}
}
