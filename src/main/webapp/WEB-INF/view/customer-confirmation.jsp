<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer confirmation</title>
</head>
<body>
The customer is confirmed: ${customer.firstName} ${customer.lastName} <br />
The customer has: ${customer.freePasses} free passes <br />
Postal Code: ${customer.postalCode} <br />
Course Code: ${customer.courseCode} <br />
</body>
</html>