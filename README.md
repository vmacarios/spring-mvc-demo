# spring-mvc-demo
Configuration steps for a Spring MVC WebApp

The POM file should include the `spring-webmvc`, `javax.servlet.jsp.jstl-api`, and `javax.servlet-api` dependencies.

#### src/main/webapp/WEB-INF
This folder contains the web.xml file where the Dispatcher and URL mapping are configured.\
The contextConfig XML file is also located in this folder.\
The contextConfig includes the component-scan tag, `<mvc:annotation-driven/>` tag and the View Resolver Bean.\
The view folder (where the JSP files will be placed) should also be located here.\
Add the tag `<mvc:resources mapping="/**" location="/WEB-INF/view/images"></mvc:resources>` to map static resources.\
Use the sintax `<img src="${pageContext.request.contextPath}/images/spring-logo.jpg" width=200 height=100>` to access them.

#### src/main/java/package
This is the folder for the Controller

---

The HelloWorld example shows how to process a form.\
processFormV2 will convert the received data to upperCase and return it to the model.
