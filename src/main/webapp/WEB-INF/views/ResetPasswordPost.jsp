<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<%!
	FERService ferService = new FERServiceImpl();
%>
<%
	// 1.Get the input
	int id = Integer.parseInt(session.getAttribute("userId").toString());
	String currentPassword = request.getParameter("currentPassword");
	String newPassword = request.getParameter("newPassword");
	
	// Call the service by passing the input
	FERService ferService = new FERServiceImpl();
	boolean isResetPassword = ferService.resetPassword(id, currentPassword, newPassword);
	
	if (isResetPassword) {
		session.setAttribute("status", "password updated Successfully");
	} else {
		session.setAttribute("status", "Password Update is failed");
	}
%>
<jsp:include page="Dashboard.jsp"></jsp:include>