package com.rs.fer.service;

import java.util.List;

import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;

public interface FERService {
	boolean registration(User user);

	int login(String userName, String password);

	boolean addExpense(Expense expense);

	boolean editExpense(Expense expense);

	boolean deleteExpense(int expenseId);

	boolean resetPassword(int id, String currentPassword, String newPassword);

	List<Expense> getExpenseOptions(int userId);

	Expense getExpense(int expenseId);

	List<Expense> expenseReport(int userId, String type, String fromDate, String toDate);

	User getUser(int userId);

	boolean updateUser(User user);
}
