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

        <input type="submit" value="Submit" />

    </form:form>
</body>
</html>