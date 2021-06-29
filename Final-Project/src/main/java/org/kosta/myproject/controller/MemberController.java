package org.kosta.myproject.controller;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.MemberMapper;
import org.kosta.myproject.model.vo.PagingBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Resource
	private MemberMapper memberMapper;

	@RequestMapping("findbyid-form")
	public String findbyIdForm() {
		return "member/findbyid-form.tiles";
	}
	@RequestMapping("findMemberById")
	public String findMemberById(String id,Model model) {
		model.addAttribute("memberVO", memberMapper.findMemberById(id));
		return "member/findbyid-result.tiles";
	}
	@RequestMapping("findbyaddress-form")
	public String findbyaddressForm(Model model) {
		model.addAttribute("addressList", memberMapper.getMemberAddressKind());
		return "member/findbyaddress-form.tiles";
	}
	@RequestMapping("findMemberByAddress")
	public String findMemberByAddress(String address,Model model) {
		model.addAttribute("memberList", memberMapper.findMemberByAddress(address));
		return "member/findbyaddress-result.tiles";
	}
	
	@RequestMapping("countPage")
	public String countPage(String pageNo, Model model) {
		
		return "event.tiles";
	}
}









