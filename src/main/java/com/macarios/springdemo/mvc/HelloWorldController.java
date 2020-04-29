package com.macarios.springdemo.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HelloWorldController {

    //need a controller method to show the initial HTML form

    @RequestMapping("/showForm")
    public String showForm() {
        return "helloworld-form";
    }

    //need a controller method to process the HTML form
    @RequestMapping("/processForm")
    public String processForm() {
        return "helloworld";
    }

    //create a controller method to read form data and
    //add data to the model

    @RequestMapping("/processFormV2")
    public String upperCase(HttpServletRequest request, Model model) {
        //read the request parameter from the HTML form
        String name = request.getParameter("studentName");
        //convert the data to all all caps
        String result = name.toUpperCase();
        //create the message
        String message = "Hello " + result + "!";
        //add message to the model
        model.addAttribute("message", message);

        return "helloworld";
    }

    @RequestMapping("/processFormV3")
    public String upperCaseV3(@RequestParam("studentName") String name, Model model) {
        //convert the data to all caps
        name = name.toUpperCase();
        //create the message
        String message = "Hi " + name + "!";
        //add message to the model
        model.addAttribute("message", message);

        return "helloworld";
    }

}
