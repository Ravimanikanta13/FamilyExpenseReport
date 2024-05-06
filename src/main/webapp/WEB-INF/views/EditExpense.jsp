<%@page import="com.rs.fer.bean.Expense"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>
<script>
	function validateEditExpenseForm() {

		//1. Get the form object and instantiate errors
		var form = document.DashboardForm;
		var errors = '';

		//2.validate the form and add error to th`e errors if the required field is empty
		if (form.type.value.trim() == '') {
			errors += 'please enter Expense Type<br>';
		}
		if (form.date.value.trim() == '') {
			errors += 'please enter Date<br>';
		}
		if (form.price.value.trim() == '') {
			errors += 'please enter price<br>';
		}
		if (form.numberOfItems.value.trim() == '') {
			errors += 'please enter numberOfItems<br>';
		}
		if (form.total.value.trim() == '') {
			errors += 'please enter Total<br>';
		}
		if (form.byWhom.value.trim() == '') {
			errors += 'please enter ByWhom<br>';
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
			submitForm("editExpense");
		}
	}
</script>
<c:if test="${expense == null }">
	Expense not found to edit...
</c:if>
<c:if test="${expense != null }">
	<table border='2' align='center'>
		<tr>
			<td colspan='2' align='center'>Edit Expense</td>
		</tr>
		<tr>
			<td>Expense Type <font color='red'>*</font>
			</td>
			<td><input type='text' name='type'
				value='${expense.type }'></td>
		</tr>

		<tr>
			<td>Date <font color='red'>*</font>
			</td>
			<td><input type='text' name='date'
				value='${expense.date}'></td>
		</tr>
		<tr>
			<td>Price <font color='red'>*</font>
			</td>
			<td><input type='text' name='price'
				value='${expense.price }'></td>
		</tr>

		<tr>
			<td>Number OF items <font color='red'>*</font>
			</td>
			<td><input type='text' name='numberOfItems'
				value='${expense.numberOfItems}'> </td>
		</tr>

		<tr>
			<td>Total <font color='red'>*</font>
			</td>
			<td><input type='text' name='total'
				value='${expense.total }'></td>
		</tr>

		<tr>
			<td>ByWhom <font color='red'>*</font>
			</td>
			<td><input type='text' name='byWhom'
				value='${expense.byWhom }'></td>
		</tr>

		<tr>
			<td colspan='2' align='center'><input type='button'
				value='Edit Expense' onclick = 'javascript: validateEditExpenseForm()'></td>
		</tr>
	</table>

</c:if>



<jsp:include page="Layout/Footer.jsp"></jsp:include>
