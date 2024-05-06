<%@page import="java.util.List"%>
<%@page import="com.rs.fer.bean.Expense"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<c:if test="${expenses.isEmpty()}">
	Expense not Found...!
</c:if>
<c:if test="${!expenses.isEmpty()}">
	<table border='2'>
		<tr>
			<td colspan='6' align='center'>Expense Report</td>
		</tr>
		<tr>
			<td>Expense Type</td>
			<td>Date</td>
			<td>Price</td>
			<td>No Of Items</td>
			<td>Total</td>
			<td>By Whom</td>
		</tr>
		<c:forEach var="expense" items="${expenses }">
			<tr>
				<td><input type='text' name='type' value='${expense.type}'></td>
				<td><input type='text' name='date' value='${expense.date}'></td>
				<td><input type='text' name='price' value='${expense.price}'></td>
				<td><input type='text' name='numberOfItems'
					value='${expense.numberOfItems}'></td>
				<td><input type='text' name='total' value='${expense.total}'></td>
				<td><input type='text' name='byWhom' value='${expense.byWhom}'></td>
			</tr>
		</c:forEach>


		<tr>
			<td colspan='6' align='center'><input type='submit'
				value='print'></td>
		</tr>
	</table>
</c:if>

<jsp:include page="Layout/Footer.jsp"></jsp:include>
