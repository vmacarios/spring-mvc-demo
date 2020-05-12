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

On the jsp files, use the `form` tag from spring and set the `modelAttribute` with the same value used in the controller.\
Also set the `path` for the inputs using the model field names.\
Use `${}` to access data from the model in the jsp files.
To `select` component, the values can be passed using one of the following lines:
`<form:option value="Austria" label="Austria" />` - pass the list on the JSP file
`<form:options items="${student.countryOptions}" />` - pass the list from the model (create a list on the constructor)
`<form:options items="${countryOptions}" />` - use an external file with the key/values pair.
To use a external file, the next line should be added to the spring XML file.
`<util:properties id="countryOptions" location="classpath:../country.properties" />`
Then, on the controller, add a Map field annotated with: `@Value("#{countryOptions}")`
Next, add the attribute to the model in the proper method.
