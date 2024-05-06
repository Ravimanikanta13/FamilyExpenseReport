<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>
<script>
	function validateAddressInfoForm() {

		//1. Get the form object and instantiate errors
		var form = document.DashboardForm;
		var errors = '';

		//2.validate the form and add error to the errors if the required field is empty
		if (form.lineOne.value.trim() == '') {
			errors += 'please enter Line 1<br>';
		}
		if (form.lineTwo.value.trim() == '') {
			errors += 'please enter Line 2<br>';
		}
		if (form.city.value.trim() == '') {
			errors += 'please enter City<br>';
		}
		if (form.state.value.trim() == '') {
			errors += 'please enter State<br>';
		}
		if (form.pinCode.value.trim() == '') {
			errors += 'please enter Pin Code<br>';
		}
		if (form.country.value.trim() == '') {
			errors += 'please enter Country<br>';
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
			submitForm("review")
		}
	}
</script>

<table border='2' align='center'>
	<tr>
		<td colspan='2' align='center'>Address Info</td>
	</tr>
	<tr style='display: none; color: red' id='errorTrId'>
		<td colspan='2' align='left' id='errorTdId'></td>
	</tr>
	<tr>
		<td>Line 1 <font color='red'>*</font>
		</td>
		<td><input type='text' name='lineOne' value='${address.lineOne }'></td>
	</tr>

	<tr>
		<td>line 2 <font color='red'>*</font>
		</td>
		<td><input type='text' name='lineTwo' value='${address.lineTwo }'></td>
	</tr>
	<tr>
	<tr>
		<td>City <font color='red'>*</font>
		</td>
		<td><input type='text' name='city' value='${address.city }'></td>
	</tr>

	<tr>
		<td>State <font color='red'>*</font>
		</td>
		<td><input type='text' name='state' value='${address.state}'></td>
	</tr>

	<tr>
		<td>Pin Code <font color='red'>*</font>
		</td>
		<td><input type='text' name='pinCode' value='${address.pinCode}'></td>
	</tr>

	<tr>
		<td>Country <font color='red'>*</font>
		</td>
		<td><input type='text' name='country' value='${address.country}'></td>
	</tr>

	<tr>

		<td colspan='2' align='center'><input type='button'
			value='review' onclick='javascript: validateAddressInfoForm()'></td>
	</tr>
</table>

<jsp:include page="Layout/Footer.jsp"></jsp:include>
