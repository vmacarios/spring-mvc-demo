# spring-mvc-demo
Configuration steps for a Spring MVC WebApp

The POM file should include the `spring-webmvc`, `javax.servlet.jsp.jstl-api`, and `javax.servlet-api` dependencies.

#### src/main/webapp/WEB-INF
This folder contains the web.xml file where the Dispatcher and URL mapping are configured.\
The contextConfig XML file is also located in this folder.\
The contextConfig includes the component-scan tag, `<mvc:annotation-driven/>` tag and the View Resolver Bean.\
The view folder (where the JSP files will be placed) should also be located here.\
Add the tag `<mvc:resources mapping="/**" location="/WEB-INF/view/images"></mvc:resources>` to map static resources.\
Use the syntax `<img src="${pageContext.request.contextPath}/images/spring-logo.jpg" width=200 height=100>` to access them.

#### src/main/java/package
This is the folder for the Controller

---

The HelloWorld example shows how to process a form.\
`@RequestMapping` annotation is used to define the URI for the method. It can also be used at the class level, so the methods become nested.\
processFormV2 will convert the received data (using `HttpServletRequest`) to upperCase and return it to the model.\
processFormV3 do the same using `@RequestParam("fieldName")` annotation.

---

### Data Binding
Spring has special tags for data binding. Those tags are used in the jsp file.\
A special line has to be included on top of the jsp file.

For the bindings, a model need to be created.\
It can be done using a class that includes the required fields, an empty constructor, and the getters and setters.\
Then, the controller simple add the object to the model.\
When processing the submitted form, the controller receives the data from the `modelAttribute` set in the form and bind it to the object.

On the form, set the `modelAttribute` with the same value used in the controller.\
Also set the `path` for the inputs using the model field names.\
Use `${}` to access data from the model in the jsp files.
