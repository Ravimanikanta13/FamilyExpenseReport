<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.FERService"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%!
	FERService ferService = new FERServiceImpl();
%>
<%

	// Get the Input
	User user = new User();
	
	user.setFirstName(request.getParameter("firstName"));
	user.setMiddleName(request.getParameter("middleName"));
	user.setLastName(request.getParameter("lastName"));
	user.setEmail(request.getParameter("email"));
	user.setUserName(request.getParameter("username"));
	user.setPassword(request.getParameter("password"));
	user.setMobile(request.getParameter("mobile"));
	
	// Call the service by passing the input
	
	boolean isRegister = ferService.registration(user);
	
	// show the status
	String path = null;
	if (isRegister) {
		out.println("Registration is SuccesFull");
		path = "Login.jsp";
	
	} else {
		out.println("Registartion is Failed");
		path = "Registration.jsp";
	}
	
%>
<jsp:include page="<%=path %>"/>