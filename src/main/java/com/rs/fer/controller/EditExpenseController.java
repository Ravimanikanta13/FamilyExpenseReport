package com.rs.fer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.bean.Expense;
import com.rs.fer.service.FERService;

@Controller
public class EditExpenseController {

	@Autowired
	private FERService ferService;

	@RequestMapping(value = "/showEditExpenseOptions", method = RequestMethod.POST)
	public ModelAndView getExpenseOptions(HttpServletRequest request) {

		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		// call the service by passing the input
		List<Expense> expenses = ferService.getExpenseOptions(userId);
		session.setAttribute("expenses", expenses);

		return new ModelAndView("EditExpenseOptions");
	}

	@RequestMapping(value = "/showEditExpense", method = RequestMethod.POST)
	public ModelAndView showEditExpense(HttpServletRequest request, @RequestParam int expenseId) {

		HttpSession session = request.getSession();
		session.setAttribute("expenseId", expenseId);

		Expense expense = ferService.getExpense(expenseId);
		
		session.setAttribute("expense", expense);

		return new ModelAndView("EditExpense");

	}

	@RequestMapping(value = "/editExpense", method = RequestMethod.POST)
	public ModelAndView editExpense(@ModelAttribute Expense expense, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Expense expenseDB = (Expense) session.getAttribute("expense");
		expense.setUserId(expenseDB.getUserId());
		expense.setId(expenseDB.getId());

		// Call the service by passing the input
		boolean isEditExpense = ferService.editExpense(expense);

		// show the status
		if (isEditExpense) {
			session.setAttribute("status", "Expense Update is SuccesFull");
		} else {
			session.setAttribute("status", "Expense Update is Failed");
		}
		return new ModelAndView("Dashboard");

	}

}
