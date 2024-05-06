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
	
	int expensId = Integer.parseInt(session.getAttribute("expenseId").toString());
	expense.setId(expensId);
	
	// Call the service by passing the input
	boolean isEditExpense = ferService.editExpense(expense);
	
	// show the status
	String path = null;
	if (isEditExpense) {
		session.setAttribute("status","Expense Update is SuccesFull" );
		path = "Dashboard.jsp";
	} else {
		session.setAttribute("status","Expense Update is Failed");
	}
%>
<jsp:include page="<%=path%>"></jsp:include>