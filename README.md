# spring-mvc-demo
Configuration steps for a Spring MVC WebApp

The POM file should include the `spring-webmvc`, `javax.servlet.jsp.jstl-api`, and `javax.servlet-api` dependencies.

#### src/main/webapp/WEB-INF
This folder contains the web.xml file where the Dispatcher and URL mapping are configured.\
The contextConfig XML file is also located in this folder.\
The contextConfig includes the component-scan tag, `<mvc:annotation-driven/>` tag and the View Resolver Bean.\
The view folder (where the JSP files will be placed) should also be located here.\
Add the tag `<mvc:com.macarios.springdemo.mvc.resources mapping="/**" location="/WEB-INF/view/images"></mvc:com.macarios.springdemo.mvc.resources>` to map resources.\
Use the syntax `<img src="${pageContext.request.contextPath}/images/spring-logo.jpg" width=200 height=100>` to access them.

#### src/main/java/package
This is the folder for the Controller

---

The HelloWorld example shows how to process a form.\
`@RequestMapping` annotation is used to define the URI for the method. It can also be used at the class level, so the methods become nested.\
processFormV2 will convert the received data (using `HttpServletRequest`) to upperCase and return it to the model.\
processFormV3 do the same using `@RequestParam("fieldName")` annotation.

### Data Binding
Spring has special tags for data binding. Those tags are used in the jsp file.\
A special line has to be included on top of the jsp file.

For the bindings, a model need to be created.\
It can be done using a class that includes the required fields, an empty constructor, and the getters and setters.\
Then, the controller simple add the object to the model.\
When processing the submitted form, the controller receives the data from the `modelAttribute` set in the form and bind it to the object.

On the jsp files, use the `form` tag from spring and set the `modelAttribute` with the same value used in the controller.\
Also set the `path` for the inputs using the model field names.\
Use `${}` to access data from the model in the jsp files.\
To `select` component, the values can be passed using one of the following lines:\
`<form:option value="Austria" label="Austria" />` - pass the list on the JSP file\
`<form:options items="${student.countryOptions}" />` - pass the list from the model (create a list on the constructor)\
`<form:options items="${countryOptions}" />` - use an external file with the key/values pair.\
To use a external file, the next line should be added to the spring XML file.\
`<util:properties id="countryOptions" location="classpath:../country.properties" />`\
Then, on the controller, add a Map field annotated with: `@Value("#{countryOptions}")`\
Next, add the attribute to the model in the proper method.\
`radiobutton` components can be add using the same ways of `select`.\
`<form:radiobutton path="favoriteLanguage" value="Java" /> Java`\
`checkbox` component uses pretty much the same syntax as `radiobutton`.\
The difference will be in the model, as the field should support multiple values.\
So, use an array of Strings.\
To iterate the array in the confirmation page, add the next line in the jsp file:\
`<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>`\
Then, use the `<c:forEach var="varName" items` to show the results.\
To use this taglib, it's necessary to add `jstl` to the pom.xml\
`<dependency>`\
     `<groupId>jstl</groupId>`\
     `<artifactId>jstl</artifactId>`\
     `<version>1.2</version>`\
 `</dependency>`
 
### Hibernate Validator

Validations can be done by using Hibernate Validator Annotations.\
This is an implementation of JSR-303/309 specification.\
To use them, add the following dependency on POM.xml.

`<dependency>`\
    `<groupId>org.hibernate.validator</groupId>`\
    `<artifactId>hibernate-validator</artifactId>`\
    `<version>6.1.2.Final</version>`\
`</dependency>`

Put the validations in the model. In this case, are:\
`@NotNull(message = "is required")` and `@Size(min=1, message = "is required)"`\
Then, in the Controller, use `@Valid` to validate the model and bind the results using `BindingResult`\
Do a verification at bindingResult and do the right return to each scenario.\
The `bindingResult` can also be printed to show the errors types.\
With the type, it's possible to create a custom message.\
PS: This validation won't fail if the inputted characters are whitespaces.\
To solve this, we need to use `StringTrimmerEditor` on a `@InitBinder` method to remove the leading and trailing whitespaces.

Other validation annotations are `@Min` and `@Max`.\
It's also possible to validate through a regex using `@Pattern(regexp="^[a-zA-Z0-9]{5}", message = "only 5 chars/digits")`\
To create a custom error message, use the error type from the `bindingResult` in a messages.properties file.\
Call this files in the config XML with the following bean:\
`<bean id="messageSource"`\
     `class="org.springframework.context.support.ResourceBundleMessageSource">`\
     `<property name="basenames" value="messages" />`\
 `</bean>`
 
To create a custom validator annotation, create a new Annotation class with the following parameters:\
`@Constraint(validatedBy = CourseCodeConstraintValidator.class)` - the class with the logic.\
`@Target({ElementType.METHOD, ElementType.FIELD})` - where the annotation can be used.\
`@Retention(RetentionPolicy.RUNTIME)` - when to check the validations.
In the same file, define the default value and message.

To define the logic, `implements ConstraintValidator<CourseCode, String>` on the class.\
Where `String` is the type of data to be validated.

 
 