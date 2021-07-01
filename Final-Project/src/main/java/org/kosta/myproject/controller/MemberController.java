package org.kosta.myproject.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.MemberMapper;
import org.kosta.myproject.model.service.PostService;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.PostVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Resource
	private MemberMapper memberMapper;
	@Resource
	private PostService ps;

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
	
	@RequestMapping("about")
	public String getPost(String pageNo, Model model) {
		PagingBean pagingBean=null;
		int totalPostCount = ps.getTotalCount();
		System.out.println(totalPostCount);
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		}else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		System.out.println("getTotalPostCount: "+pagingBean.getTotalPostCount());
		System.out.println(pagingBean.getStartRowNumber());
		ArrayList<PostVO> list = ps.getList(pagingBean);
		System.out.println(list);
		model.addAttribute("list", list);
		return "about.tiles";
	}
}









