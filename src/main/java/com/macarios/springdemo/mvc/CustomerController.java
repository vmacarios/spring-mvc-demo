package com.macarios.springdemo.mvc;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	/**
	 * This method pre-process every String to remove leading and trailing whitespaces or all whitespaces.
	 * @param dataBinder is the data inputted in the form.
	 */
	@InitBinder
	public void initBind(WebDataBinder dataBinder) {
//		Setting TrimmerEditor as true means that when a field has only whitespaces it will be converted to null
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
//		Register the Editor to all Strings.
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@RequestMapping("/showForm")
	public String showForm(Model theModel) {
		theModel.addAttribute("customer", new Customer());

		return "customer-form";
	}

	@RequestMapping("/processForm")
	public String processForm(
			@Valid @ModelAttribute("customer") Customer customer,
			BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			return "customer-form";
		} else {
			return "customer-confirmation";
		}
	}


}
