<html>
<head>
<title>Fer-Dashboard</title>
<script>
	function submitForm(path) {
		//Get Form
		var form = document.DashboardForm;

		//2.Load Path into form action attribute
		form.action = path;

		//3.submit form
		form.submit();
	}
</script>
</head>
<body>
	<form name='DashboardForm' method="post">
		<table border="2" align="center" height="550px" width="800px">
			<tr>
				<td colspan="2" align="center" height="75px">Family Expense
					Report &nbsp; &nbsp; user: ${username}</td>
			</tr>
			<tr>
				<td width="150px"><br> <br> <a
					href="javascript: submitForm('showAddExpense')">Add Expense</a>
					<br> <br> <a
					href="javascript: submitForm('showEditExpenseOptions')"">Edit
						Expense</a> <br> <br> <a
					href="javascript: submitForm('showDeleteExpenseOptions')">Delete
						Expense</a> <br> <br> <a
					href="javascript: submitForm('showExpenseReportSelection')">Expense
						Report</a> <br> <br> <a
					href="javascript: submitForm('showResetPassword')">Reset
						Password</a> <br> <br> <a
					href="javascript: submitForm('showNameInfo')">Update Profile</a>
					<br> <br></td>
				<td align="center">