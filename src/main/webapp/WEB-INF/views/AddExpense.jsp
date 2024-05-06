<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>
<script>
	function validateAddExpenseForm() {

		//1. Get the form object and instantiate errors
		var form = document.DashboardForm;
		var errors = '';

		//2.validate the form and add error to the errors if the required field is empty
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
			submitForm("addExepense");
		}
	}
</script>
<table border='2' align='center'>
	<tr>
		<td colspan="2" align="center">Add Expense</td>
	</tr>
	<tr style ="display:none; color:red" id="errorTrId">
				<td colspan="2" align="left" id="errorTdId"></td>
			</tr>
	<tr>
		<td>Expense Type <font color='red'>*</font></td>
		<td><input type="text" name="type"></td>
	</tr>
	<tr>
		<td>Date <font color='red'>*</font> </td>
		<td><input type="text" name="date"></td>
	</tr>
	<tr>
		<td>Price <font color='red'>*</font></td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td>Number of Items <font color='red'>*</font> </td>
		<td><input type="text" name="numberOfItems"></td>
	</tr>
	<tr>
		<td>Total <font color='red'>*</font> </td>
		<td><input type="text" name="total"></td>
	</tr>
	<tr>
		<td>By Whom <font color='red'>*</font> </td>
		<td><input type="text" name="byWhom"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button"
			value="save Expense"
			onclick="javascript: validateAddExpenseForm()"></td>
	</tr>
</table>
<jsp:include page="Layout/Footer.jsp"></jsp:include>
