<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<%!
	FERService ferService = new FERServiceImpl();
	%>
<%
	// Body
	// Get the Input
	int expenseId = Integer.parseInt(request.getParameter("expenseId"));
	
	// Call the service by passing the input
	boolean isExpenseDeleted = ferService.deleteExpense(expenseId);
	
	// show the status
	if (isExpenseDeleted) {
		session.setAttribute("status","Expense deleted is SuccesFull");
	} else {
		session.setAttribute("status","Expense delete is Failed");
	}
%>
<jsp:include page="Dashboard.jsp"></jsp:include>