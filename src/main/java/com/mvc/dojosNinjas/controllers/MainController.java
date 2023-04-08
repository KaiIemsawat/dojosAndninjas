package com.mvc.dojosNinjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.mvc.dojosNinjas.model.Dojo;
import com.mvc.dojosNinjas.services.DojoServices;
import com.mvc.dojosNinjas.services.NinjaServices;

@Controller
public class MainController {
	
	@Autowired
	DojoServices dServ;
	@Autowired
	NinjaServices nServ;
	
//	----- Main page -----
	
	@GetMapping("")
	public String index(Model model) {
		model.addAttribute("dojos", dServ.getAllDojo());
		return "index";
	}
	
}
