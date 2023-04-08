package com.mvc.dojosNinjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.dojosNinjas.model.Dojo;
import com.mvc.dojosNinjas.repositories.DojoRepo;

@Service
public class DojoServices {
	
	@Autowired
	private DojoRepo dojoRepo;
//	@Autowired
//	private NinjaRepo ninRepo;
	
	public List<Dojo> getAllDojo() {
		return dojoRepo.findAll();
	}
	
	public Dojo getDojoById(Long id) {
		Optional<Dojo> d = dojoRepo.findById(id);
		return d.isPresent() ? d.get() : null;
	}
	
	public Dojo saveAndUpdateDojo(Dojo d) {
		return dojoRepo.save(d);
	}
	
	public void deleteDojo(Long id) {
		dojoRepo.deleteById(id);
	}
}
