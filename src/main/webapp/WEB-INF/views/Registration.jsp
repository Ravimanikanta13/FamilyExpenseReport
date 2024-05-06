<html>
<head>
<title>Fer-Registration</title>
<script>
	function validatorRegistrationForm() {

		//1. Get the form object and instantiate errors
		var form = document.RegistrationForm;
		var errors = '';

		//2.validate the form and add error to the errors if the required field is empty
		if (form.firstName.value.trim() == '') {
			errors += 'please enter First Name<br>';
		}
		if (form.lastName.value.trim() == '') {
			errors += 'please enter Last Name<br>';
		}
		if (form.email.value.trim() == '') {
			errors += 'please enter Email<br>';
		}
		if (form.userName.value.trim() == '') {
			errors += 'please enter username<br>';
		}
		if (form.password.value.trim() == '') {
			errors += 'please enter password<br>';
		}
		if (form.mobile.value.trim() == '') {
			errors += 'please enter Mobile<br>';
		}

		//3. show the error if present
		if (errors != '') {
			//alert(errors);
			
			//Get the td element  and write the errors to td element
			var tdElement = document.getElementById("errorTdId");
			tdElement.innerHTML = errors;
			
			//Get the tr element  and show
			var trElement = document.getElementById("errorTrId")
			trElement.style.display ='';
			
		} else {
			form.submit();
		}
	}
</script>
</head>
<body>
	<font color='red'>${status }</font>
	<form name="RegistrationForm" action="registration"
		method="post">
		<table border='2' align='center'>
			<tr>
				<td colspan="2" align="center">Registration</td>
			</tr>
			<tr style ="display:none; color:red" id="errorTrId">
				<td colspan="2" align="left" id="errorTdId"></td>
			</tr>
			<tr>
				<td>First Name <font color='red'>*</font></td>
				<td><input type="text" name="firstName"></td>
			</tr>
			<tr>
				<td>Middle Name</td>
				<td><input type="text" name="middleName"></td>
			</tr>
			<tr>
				<td>Last Name <font color='red'>*</font></td>
				<td><input type="text" name="lastName"></td>
			</tr>
			<tr>
				<td>Email <font color='red'>*</font></td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>User Name<font color='red'>*</font></td>
				<td><input type="text" name="userName"></td>
			</tr>

			<tr>
				<td>Password <font color='red'>*</font></td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>Mobile <font color='red'>*</font></td>
				<td><input type="text" name="mobile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="Registration"
					onclick="javascript: validatorRegistrationForm()"></td>
			</tr>
		</table>
	</form>
</body>

</html>