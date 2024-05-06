<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>
<script>
	function validateContactInfoForm() {

		//1. Get the form object and instantiate errors
		var form = document.DashboardForm;
		var errors = '';

		//2.validate the form and add error to the errors if the required field is empty
		if (form.email.value.trim() == '') {
			errors += 'please enter Email<br>';
		}
		if (form.mobile.value.trim() == '') {
			errors += 'please enter Mobile<br>';
		}

		//3. show the error if present
		if (errors != '') {
			//alert(errors);

			//Get the td element  and write the errors to td element
			var tdElement = document.getElementById("errorTdId")
			tdElement.innerHTML = errors;

			//Get the tr element  and show
			var trElement = document.getElementById("errorTrId")
			trElement.style.display = '';

		} else {
			submitForm("showAddressInfo")
		}
	}
</script>
<table border='2' align='center'>
	<tr>
		<td colspan='2' align='center'>Contact Info</td>
	</tr>
	<tr style='display: none; color: red' id='errorTrId'>
		<td colspan='2' align='left' id='errorTdId'></td>
	</tr>

	<tr>
		<td>Email <font color='red'>*</font>
		</td>
		<td><input type='text' name='email' value='${user.email }'></td>
	</tr>

	<tr>
		<td>Mobile <font color='red'>*</font>
		</td>
		<td><input type='text' name='mobile'
			value='${user.mobile}'></td>
	</tr>
	<tr>
		<td colspan='2' align='center'><input type='button' value='Next'
			onclick='javascript: validateContactInfoForm()'></td>
	</tr>

</table>
<jsp:include page="Layout/Footer.jsp"></jsp:include>