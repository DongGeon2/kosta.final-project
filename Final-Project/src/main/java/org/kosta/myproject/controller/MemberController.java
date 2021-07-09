package org.kosta.myproject.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.service.MemberService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;

	@RequestMapping("findMemberById")
	public String findMemberById(String id, Model model) {
		MemberVO vo = memberService.findMemberById(id);
		if (vo == null)
			return "member/findMemberById_fail";
		else {
			model.addAttribute("memberVO", vo);
			return "member/findMemberById_ok.tiles";
		}
	}

	// WebSecurityConfig에 등록되어 있음 ( failureUrl("/login_fail") )
	@RequestMapping("login_fail")
	public String loginFail() {
		return "member/login_fail";
	}

	@RequestMapping("registerForm")
	public String registerForm() {
		return "member/registerForm.tiles";
	}

	@RequestMapping("updateMemberForm")
	public String updateMemberForm() {
		return "member/updateMemberForm.tiles";
	}

	@RequestMapping(value = "registerMember", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:registerResultView?id=" + vo.getId();
	}

	@RequestMapping("registerResultView")
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_result.tiles", "memberVO", vo);
	}

	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}

	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("getMemberTotalCount")
	@ResponseBody
	public int getMemberTotalCount() {
		return memberService.getMemberCount();
	}

	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping("updateMemberAction")
	public String updateMemberAction(HttpServletRequest request, MemberVO memberVO) {
		// 1 회원정보 수정시 권한까지 수정해야 할 경우에는 아래처럼 코딩하면 된다
		/*
		 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 * List<GrantedAuthority> updatedAuthorities = new
		 * ArrayList<>(auth.getAuthorities()); updatedAuthorities.add(new
		 * SimpleGrantedAuthority("ROLE_ADMIN")); Authentication newAuth = new
		 * UsernamePasswordAuthenticationToken(auth.getPrincipal(),
		 * auth.getCredentials(), updatedAuthorities);
		 * SecurityContextHolder.getContext().setAuthentication(newAuth);
		 */
		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("Spring Security 세션 수정 전 회원정보:" + pvo);
		memberService.updateMember(memberVO);// service에서 변경될 비밀번호를 암호화한다

		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		pvo.setPassword(memberVO.getPassword());
		pvo.setName(memberVO.getName());
		pvo.setEmail(memberVO.getEmail());
		pvo.setTel(memberVO.getTel());
		System.out.println(pvo);
		System.out.println("Spring Security 세션 수정 후 회원정보:" + pvo);
		return "member/update_member_result.tiles";
	}
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping("deleteMember")
	public String deleteMember(RedirectAttributes redirectAttr, SessionStatus sessionStatus) {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(pvo);
		String id = pvo.getId();
		int result=memberService.deleteMember(id);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("msg", "성공적으로 회원정보를 삭제했습니다.");
			SecurityContextHolder.clearContext();
		}
		else 
			redirectAttr.addFlashAttribute("msg", "회원정보삭제에 실패했습니다.");

		return "redirect:/";
	}

}
