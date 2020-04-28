<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello World</title>
</head>
    <body>
        <img src="${pageContext.request.contextPath}/images/spring-logo.jpg" width=200 height=100>
        <br />
        Hello World of Spring
        <br/><br/>
        Student name: ${param.studentName}
        <br/><br/>
        The message: ${message}
    </body>
</html>