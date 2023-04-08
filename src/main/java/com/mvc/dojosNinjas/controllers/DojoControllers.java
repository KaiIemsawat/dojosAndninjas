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
import com.mvc.dojosNinjas.model.Ninja;
import com.mvc.dojosNinjas.services.DojoServices;
import com.mvc.dojosNinjas.services.NinjaServices;

@Controller
public class DojoControllers {
	
	@Autowired
	DojoServices dServ;
	@Autowired
	NinjaServices nServ;
	
	@GetMapping("/dojos/new")
	public String dojosNew(@ModelAttribute("dojo") Dojo dojo) {
		return "dojosnew";
	}
	
	@PostMapping("/dojos/new")
	public String addDojo(
			@Valid @ModelAttribute("dojo") Dojo dojo
			, BindingResult result
			, Model model
			) {
		if (result.hasErrors()) {
			model.addAttribute("dojos", dServ.getAllDojo());
			return "dojosnew";
		}
		dServ.saveAndUpdateDojo(dojo);
		return "redirect:/";
	}
	
	@GetMapping("/dojos/{id}")
	public String dojoDetails(
			@PathVariable("id") Long dojoId
//			, @ModelAttribute("ninja") Ninja ninja
			, Model model) {
		model.addAttribute("dojo", dServ.getDojoById(dojoId));
		model.addAttribute("ninjas", nServ.getAllNinjas());
		return "dojodetails";
	}
	
	@DeleteMapping("/dojos/delete/{id}")
	public String deleteDojo(@PathVariable("id") Long id) {
		dServ.deleteDojo(id);
		return "redirect:/";
	}
}
