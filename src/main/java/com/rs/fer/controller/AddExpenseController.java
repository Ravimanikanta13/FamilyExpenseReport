package com.rs.fer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.bean.Expense;
import com.rs.fer.service.FERService;

@Controller
public class AddExpenseController {

	@Autowired
	private FERService ferService;

	@RequestMapping(value = "/showAddExpense", method = RequestMethod.POST)
	public ModelAndView display() {
		return new ModelAndView("AddExpense");
	}

	@RequestMapping(value = "/addExepense", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute Expense expense, HttpServletRequest request) {

		HttpSession session = request.getSession();

		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		expense.setUserId(userId);

		// Call the service by passing the input
		boolean isAddExpense = ferService.addExpense(expense);

		// show the status

		if (isAddExpense) {
			session.setAttribute("status", "Expense added is SuccesFull");
		} else {
			session.setAttribute("status", "Expense added is Failed");
		}

		return new ModelAndView("Dashboard");

	}

}
