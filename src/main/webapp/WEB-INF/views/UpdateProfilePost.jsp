<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<%!
	FERService ferService = new FERServiceImpl();
%>
<%
	// Body
	// Get the input
	User user = (User) session.getAttribute("user");
	
	// call the service by passing the input
	boolean isUpdatedProfile = ferService.updateUser(user);
	
	// status
	if (isUpdatedProfile) {
		session.setAttribute("status", "Profile Updated Successfull");
	} else {
		session.setAttribute("status", "profile Update failed");
	}
%>
<jsp:include page="Dashboard.jsp"></jsp:include>