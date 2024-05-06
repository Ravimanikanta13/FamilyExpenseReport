<%@page import="com.rs.fer.bean.Address"%>
<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>

<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>


<table border='2' align='center'>
	<tr>
		<td colspan='2' align='center'>Address Info</td>
	</tr>

	<tr>
		<td>First Name</td>
		<td><input type='text' name='firstName' value='${user.firstName}'
			disabled='true'></td>
	</tr>

	<tr>
		<td>Middle Name</td>
		<td><input type='text' name='middleName'
			value='${user.middleName}' disabled='true'></td>
	</tr>
	<tr>
	<tr>
		<td>Last Name</td>
		<td><input type='text' name='lastName' value='${user.lastName}'
			disabled='true'></td>
	</tr>

	<tr>
		<td>Email</td>
		<td><input type='text' name='email' value='${user.email}'
			disabled='true'></td>
	</tr>

	<tr>
		<td>Mobile</td>
		<td><input type='text' name='mobile' value='${user.mobile}'
			disabled='true'></td>
	</tr>
	<tr>
	<tr>
		<td>Line 1</td>
		<td><input type='text' name='lineOne' value='${address.lineOne }'
			disabled='true'></td>
	</tr>

	<tr>
		<td>line 2</td>
		<td><input type='text' name='lineTwo' value='${address.lineTwo }'
			disabled='true'></td>
	</tr>
	<tr>
	<tr>
		<td>City</td>
		<td><input type='text' name='city' value='${address.city }'
			disabled='true'></td>
	</tr>

	<tr>
		<td>State</td>
		<td><input type='text' name='state' value='${address.state}'
			disabled='true'></td>
	</tr>

	<tr>
		<td>Pin Code</td>
		<td><input type='text' name='pinCode' value='${address.pinCode}'
			disabled='true'></td>
	</tr>

	<tr>
		<td>Country</td>
		<td><input type='text' name='country' value='${address.country }'
			disabled='true'></td>
	</tr>

	<tr>
		<td colspan='2' align='center'><input type='submit'
			value='Update Profile'
			onclick="javascript:submitForm('updateProfile')"></td>
	</tr>
</table>

<jsp:include page="Layout/Footer.jsp"></jsp:include>
