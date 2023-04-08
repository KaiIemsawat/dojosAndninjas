package com.mvc.dojosNinjas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.dojosNinjas.model.Ninja;
import com.mvc.dojosNinjas.repositories.NinjaRepo;

@Service
public class NinjaServices {
	
	@Autowired
	private NinjaRepo ninRepo;
//	@Autowired
//	private DojoRepo dojoRepo;
	
	public List<Ninja> getAllNinjas() {
		return ninRepo.findAll();
	}
	
	public Ninja getNinById(Long id) {
		return ninRepo.findById(id).orElse(null);
	}
	
	public Ninja saveAndUpdateNinja(Ninja nin) {
		return ninRepo.save(nin);
	}
	
	public void deleteNin(Long id) {
		ninRepo.deleteById(id);
	}

}
