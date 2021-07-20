package org.kosta.myproject.controller;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.Authority;
import org.kosta.myproject.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@SuppressWarnings({ "unchecked", "rawtypes" })
@RestController
public class AdminController {
	
	@Resource
	MemberService memberService;
	
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping("/member_authority_detail")
	public String memberdetail(String id,Model model) {
		model.addAttribute("memberStatus", memberService.selectAuthorityById(id));
		return "admin/member_authority_detail.tiles";
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(value = "/authority")
	public ResponseEntity registerProduct( Authority authority) {
		System.out.println("Request Method : POST"+ authority);
		memberService.registerRole(authority);	
		return new ResponseEntity(authority.getId()+" "+authority.getAuthority()+" 권한추가완료", HttpStatus.OK);
	}
	@DeleteMapping("/authority/{id}")
	public ResponseEntity deleteProduct(@PathVariable String id) {
		System.out.println("Request Method : DELETE"+ id);
		if (memberService.ownerCancel(id)==0) {
			return new ResponseEntity(id+" 삭제 불가", HttpStatus.NOT_FOUND);
			
		}		
		return new ResponseEntity(id+" 삭제완료", HttpStatus.OK);
	}	
}
