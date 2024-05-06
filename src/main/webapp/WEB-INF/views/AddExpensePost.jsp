<%@page import="com.rs.fer.bean.Expense"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<%!FERService ferService = new FERServiceImpl();%>
<%
	// Get the Input
	Expense expense = new Expense();
	expense.setType(request.getParameter("type"));
	expense.setDate(request.getParameter("date"));
	expense.setPrice(Float.parseFloat(request.getParameter("price")));
	expense.setNumberOfItems(Integer.parseInt(request.getParameter("numberOfItems")));
	expense.setTotal(Float.parseFloat(request.getParameter("total")));
	expense.setByWhom(request.getParameter("byWhom"));
	
	int userId = Integer.parseInt(session.getAttribute("userId").toString());
	expense.setUserId(userId);
	
	// Call the service by passing the input
	FERService ferService = new FERServiceImpl();
	boolean isAddExpense = ferService.addExpense(expense);
	
	// show the status
	
	if (isAddExpense) {
		session.setAttribute("status", "Expense added is SuccesFull");
	} else {
		session.setAttribute("status", "Expense added is Failed");
	}
%>
<jsp:include page="Dashboard.jsp"></jsp:include>