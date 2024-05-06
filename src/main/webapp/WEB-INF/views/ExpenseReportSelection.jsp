<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>
<script>
	function ValidateExpenseReportForm() {

		//1. Get the form object and instantiate errors
		var form = document.DashboardForm;
		var errors = '';

		//2.validate the form and add error to the errors if the required field is empty
		if (form.type.value.trim() == '') {
			errors += 'please enter Expense Type<br>';
		}
		if (form.fromDate.value.trim() == '') {
			errors += 'please enter From Date<br>';
		}
		if (form.toDate.value.trim() == '') {
			errors += 'please enter To Date<br>';
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
			submitForm("expenseReport");
		}
	}
</script>
</html>
<table border='2'>
	<tr>
		<td colspan="2" align="center">Expense Report</td>
	</tr>
	<tr style="display: none; color: red" id="errorTrId">
		<td colspan="2" align="left" id="errorTdId"></td>
	</tr>
	<tr>
		<td>Expense Type <font color='red'>*</font> </td>
		<td><input type="text" name="type"></td>
	</tr>
	<tr>
		<td>from Date <font color='red'>*</font> </td>
		<td><input type="text" name="fromDate"></td>
	</tr>
	<tr>
		<td>To Date <font color='red'>*</font> </td>
		<td><input type="text" name="toDate"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button"
			value="Expense Report"
			onclick="javascript: ValidateExpenseReportForm()"></td>
	</tr>
</table>
<jsp:include page="Layout/Footer.jsp"></jsp:include>