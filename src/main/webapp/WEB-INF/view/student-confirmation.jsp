<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Confirmation Page</title>
</head>
<body>
    The student is confirmed: ${student.firstName} ${student.lastName} <br />
    The country is: ${student.country} <br />
    The favorite language is: ${student.favoriteLanguage} <br />
    The operating system:
    <ul>
    	<c:forEach var="OS" items="${student.operatingSystem}">
    		<li>${OS}</li>
    	</c:forEach>
    </ul>
</body>
</html>