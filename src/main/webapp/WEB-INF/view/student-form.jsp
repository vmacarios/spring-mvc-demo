<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" xmlns:form="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Student Registration Form</title>
</head>
<body>
    <form:form action="processForm" modelAttribute="student">
        First Name: <form:input path="firstName" />

        <br /><br />

        Last Name: <form:input path="lastName" />

        <br /><br />

		<form:select path="country">
			<form:option value="Austria" label="Austria" />
			<form:option value="Brazil" label="Brazil" />
			<form:option value="Germany" label="Germany" />
			<form:option value="Netherlands" label="Netherlands" />
			<form:option value="Portugal" label="Portugal" />
		</form:select>

		<br /><br />

        <input type="submit" value="Submit" />

    </form:form>
</body>
</html>