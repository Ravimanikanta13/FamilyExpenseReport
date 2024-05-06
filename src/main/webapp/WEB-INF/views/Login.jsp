 <html>
<head>
<title>Fer-Login</title>
<script>
	function validateLoginForm() {

		//1. Get the form object and instantiate errors
		var form = document.LoginForm;
		var errors = '';

		//2.validate the form and add error to the errors if the required field is empty

		if (form.username.value.trim() == '') {
			errors += 'please enter username<br>';
		}
		if (form.password.value.trim() == '') {
			errors += 'please enter password<br>';
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
	<form name ="LoginForm" action="login" method="post">
		<table border="2" align="center">
			<tr>
				<td colspan="2" align="center">Login</td>
			</tr>
			<tr style ="display:none; color:red" id="errorTrId">
				<td colspan="2" align="left" id="errorTdId"></td>
			</tr>
			<tr>
				<td>User Name <font color='red'>*</font> </td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password <font color='red'>*</font> </td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="Login" onclick="javascript: validateLoginForm()"> &nbsp;&nbsp;&nbsp; <a
					href='showRegistration'>Registration</a></td>
			</tr>
		</table>
	</form>
</body>
</html>