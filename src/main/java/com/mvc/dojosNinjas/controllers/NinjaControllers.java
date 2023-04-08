package com.mvc.dojosNinjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mvc.dojosNinjas.model.Ninja;
import com.mvc.dojosNinjas.services.DojoServices;
import com.mvc.dojosNinjas.services.NinjaServices;

@Controller
public class NinjaControllers {
	@Autowired
	DojoServices dServ;
	@Autowired
	NinjaServices nServ;
	
	@GetMapping("/ninjas/new")
	public String ninjasNew(
			@ModelAttribute("ninja") Ninja ninja
			, Model model) {
		model.addAttribute("dojos", dServ.getAllDojo());
		return "ninjasnew";
	}
	
	@PostMapping("/ninjas/new")
	public String addNinja(
			@Valid @ModelAttribute("ninja") Ninja ninja
			, BindingResult result
			, Model model
			) {
		if(result.hasErrors()) {
			return "ninjasnew";
		}
		nServ.saveAndUpdateNinja(ninja);
		return "redirect:/";
	}
}
