<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>
<script>
	function validateNameInfoForm() {

		//1. Get the form object and instantiate errors
		var form = document.DashboardForm;
		var errors = '';

		//2.validate the form and add error to the errors if the required field is empty
		if (form.firstName.value.trim() == '') {
			errors += 'please enter First Name<br>';
		}
		if (form.lastName.value.trim() == '') {
			errors += 'please enter Last Name<br>';
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
			submitForm("showContactInfo")
		}
	}
</script>



<table border='2' align='center'>
	<tr>
		<td colspan='2' align='center'>Name Info</td>
	</tr>
	<tr style='display: none; color: red' id='errorTrId'>
		<td colspan='2' align='left' id='errorTdId'></td>
	</tr>

	<tr>
		<td>First Name <font color='red'>*</font>
		</td>
		<td><input type='text' name='firstName' value='${user.firstName}'></td>
	</tr>

	<tr>
		<td>Middle Name</td>
		<td><input type='text' name='middleName'
			value='${user.middleName}'></td>
	</tr>
	<tr>
	<tr>
		<td>Last Name <font color='red'>*</font>
		</td>
		<td><input type='text' name='lastName' value='${user.lastName}'></td>
	</tr>

	<tr>

		<td colspan='2' align='center'><input type='button' value='Next'
			onclick='javascript: validateNameInfoForm()'></td>
	</tr>

</table>

<jsp:include page="Layout/Footer.jsp"></jsp:include>
