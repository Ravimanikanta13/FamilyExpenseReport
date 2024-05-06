<%@page import="com.rs.fer.service.FERService"%>
<%@page import="java.util.List"%>
<%@page import="com.rs.fer.bean.Expense"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>
<script>
	function validateEditExpenseOptionsForm() {

		//1. Get the form object and instantiate errors
		var form = document.DashboardForm;
		var errors = '';

		//2.validate the form and add error to the errors if the required field is empty
		if (form.expenseId.value.trim() == '') {
			errors += 'Please Select Expense Id<br>';
		}

		//3. show the error if present
		if (errors != '') {
			//alert(errors);

			//Get the td element  and write the errors to td element
			var tdElement = document.getElementById("errorTdId");
			tdElement.innerHTML = errors;

			//Get the tr element  and show
			var trElement = document.getElementById("errorTrId")
			trElement.style.display = '';

		} else {
			submitForm("showEditExpense");
		}
	}
</script>
<c:if test="${expense.size() ==0 }">
	Expense not Found to edit...!
</c:if>

<c:if test="${expense.size()!=0 }">
Expense Id: 
&nbsp;&nbsp;
	<select name='expenseId'>
		<option value=''>Please select the Expense ID</option>
		<c:forEach var="expense" items="${expenses }">
			<option value='${expense.id}'>${expense.id}--${expense.type}--${expense.date}-${expense.total}--${expense.byWhom}</option>
		</c:forEach>
	</select> 

&nbsp; &nbsp;
<input type='button' value='Next'
		onclick='javascript:validateEditExpenseOptionsForm()'>
</c:if>
<jsp:include page="Layout/Footer.jsp"></jsp:include>
