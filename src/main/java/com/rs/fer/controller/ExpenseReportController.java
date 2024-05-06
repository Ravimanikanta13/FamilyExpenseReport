package com.rs.fer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.bean.Expense;
import com.rs.fer.service.FERService;

@Controller
public class ExpenseReportController {

	@Autowired
	private FERService ferService;

	@RequestMapping(value = "/showExpenseReportSelection", method = RequestMethod.POST)
	public ModelAndView displayExpenseReportSelection() {

		return new ModelAndView("ExpenseReportSelection");
	}

	@RequestMapping(value = "/expenseReport", method = RequestMethod.POST)
	public ModelAndView expenseReport(HttpServletRequest request, @RequestParam String type,
			@RequestParam String fromDate, @RequestParam String toDate) {

		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		// call the service by passing the input
		List<Expense> expenses = ferService.expenseReport(userId, type, fromDate, toDate);
		session.setAttribute("expenses", expenses);

		return new ModelAndView("ExpenseReport");

	}

}
