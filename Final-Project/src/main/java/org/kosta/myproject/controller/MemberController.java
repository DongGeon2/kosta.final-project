package org.kosta.myproject.controller;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping("user/findMemberById")
	public String findMemberById(String id,Model model) {		
		MemberVO vo = memberService.findMemberById(id);
		if (vo == null)
			return "member/findMemberById_fail";
		else {
			model.addAttribute("memberVO",vo);
			return "member/findMemberById_ok.tiles" ;
		}
	}
	//WebSecurityConfig에 등록되어 있음 ( failureUrl("/login_fail") )
	@RequestMapping("login_fail")
	public String loginFail() {
		return "member/login_fail";
	}
	@RequestMapping("user/registerForm")
	public String registerForm() {
		return "member/registerForm.tiles";
	}
	@RequestMapping(value = "user/registerMember", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:/user/registerResultView?id=" + vo.getId();
	}

	@RequestMapping("user/registerResultView")
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_result.tiles", "memberVO", vo);
	}

	@RequestMapping("user/idcheckAjax")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}
	//@Secured("ROLE_MEMBER")
	@GetMapping("getMemberTotalCount")
	@ResponseBody
	public int getMemberTotalCount() {
		return memberService.getMemberCount();
	}
}
