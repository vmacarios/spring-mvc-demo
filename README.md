# spring-mvc-demo
Configuration steps for a Spring MVC WebApp

The POM file should include the `spring-webmvc` and `javax.servlet.jsp.jstl-api` dependencies.

#### src/main/webapp/WEB-INF
This folder contains the web.xml file where the Dispatcher and URL mapping are configured.\
The contextConfig XML file is also located in this folder.\
The contextConfig includes the component-scan tag, `<mvc:annotation-driven/>` tag and the View Resolver.\
The view folder (where the JSP files will be placed) should also be located here.

#### src/main/java/package
This is the folder for the Controller
