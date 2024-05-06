package com.rs.fer.controller;

import java.util.List;

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
public class DeleteExpenseController {

	@Autowired
	private FERService ferService;

	@RequestMapping(value = "/showDeleteExpenseOptions", method = RequestMethod.POST)
	public ModelAndView getExpenseOptions(HttpServletRequest request) {

		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		// call the service by passing the input
		List<Expense> expenses = ferService.getExpenseOptions(userId);
		session.setAttribute("expenses", expenses);

		return new ModelAndView("DeleteExpenseOptions");
	}

	@RequestMapping(value = "/deleteExpense", method = RequestMethod.POST)
	public ModelAndView editExpense(@ModelAttribute Expense expense, HttpServletRequest request) {

		HttpSession session = request.getSession();
		// Get the Input
		int expenseId = Integer.parseInt(request.getParameter("expenseId"));

		// Call the service by passing the input
		boolean isExpenseDeleted = ferService.deleteExpense(expenseId);

		// show the status
		if (isExpenseDeleted) {
			session.setAttribute("status", "Expense deleted is SuccesFull");
		} else {
			session.setAttribute("status", "Expense delete is Failed");
		}
		return new ModelAndView("Dashboard");
	}

}
