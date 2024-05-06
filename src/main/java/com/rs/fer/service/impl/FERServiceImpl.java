package com.rs.fer.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.repository.ExpenseRepository;
import com.rs.fer.repository.UserRepository;
import com.rs.fer.service.FERService;

@Service
public class FERServiceImpl implements FERService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ExpenseRepository expenseRepository;

	@Transactional
	@Override
	public boolean registration(User user) {
		return userRepository.save(user).getId() > 0;
	}

	@Override
	public int login(String userName, String password) {
		List<User> users = userRepository.findByUserNameAndPassword(userName, password);
		if (users != null && !users.isEmpty()) {
			return users.get(0).getId();
		}
		return 0;

	}

	@Transactional
	@Override
	public boolean addExpense(Expense expense) {
		return expenseRepository.save(expense).getId() > 0;
	}

	@Override
	public boolean editExpense(Expense expense) {
		return addExpense(expense);
	}

	@Transactional
	@Override
	public boolean deleteExpense(int expenseId) {

		try {
			expenseRepository.deleteById(expenseId);
		} catch (Exception ex) {
			return false;
		}

		return true;
	}

	@Override
	public boolean resetPassword(int id, String currentPassword, String newPassword) {
		User user = getUser(id);
		if (user != null && user.getPassword().equals(currentPassword)) {
			user.setPassword(newPassword);
			return registration(user);
		}

		return false;
	}

	@Override
	public List<Expense> getExpenseOptions(int userId) {
		return expenseRepository.findByUserId(userId);
	}

	@Override
	public Expense getExpense(int expenseId) {
		return expenseRepository.findById(expenseId).get();
	}

	@Override
	public List<Expense> expenseReport(int userId, String type, String fromDate, String toDate) {
		return expenseRepository.findByUserIdAndTypeAndDateBetween(userId, type, fromDate, toDate);
	}

	@Override
	public User getUser(int userId) {
		User user = userRepository.findById(userId).get();

		if (user.getAddress() == null) {
			user.setAddress(new Address());
		}
		return user;

	}

	@Override
	public boolean updateUser(User user) {
		return registration(user);
	}

}
