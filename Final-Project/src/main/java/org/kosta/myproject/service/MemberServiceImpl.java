package org.kosta.myproject.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.MemberMapper;
import org.kosta.myproject.model.vo.Authority;
import org.kosta.myproject.model.vo.Authority;
import org.kosta.myproject.model.vo.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberMapper memberMapper;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public MemberVO findMemberById(String id) {
		return memberMapper.findMemberById(id);
	}

	@Override
	public List<Authority> selectAuthorityById(String id) {
		return memberMapper.selectAuthorityByUsername(id);
	}

	@Override
	public int getMemberCount() {
		return memberMapper.getMemberCount();
	}

	// 회원가입시 반드시 권한까지, 부여되도록 트랜잭션 처리한다
	@Transactional
	@Override
	public void registerMember(MemberVO vo) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodedPwd);
		memberMapper.registerMember(vo);
		// 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다
		Authority authority = new Authority(vo.getId(), "ROLE_MEMBER");
		memberMapper.registerRole(authority);
	}

	
	  @Override
	  public void updateMember(MemberVO memberVO) { 
		  // 변경할 비밀번호를 암호화한다
		  String encodePassword = passwordEncoder.encode(memberVO.getPassword());
		  memberVO.setPassword(encodePassword); memberMapper.updateMember(memberVO); 
	  }
	 
	@Override
	public String idcheck(String id) {
		int count = memberMapper.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public int deleteMember(String id) {
		
		if(memberMapper.deleteMember(id))
			return 1;
		else 
			return 0;
	}

	@Override
	public List<Authority> selectAuthority() {
		return memberMapper.selectAuthority();
	}

	@Override
	public int ownerCancel(String id) {
		return memberMapper.ownerCancel(id);
	}

	@Override
	public void registerRole(Authority authority) {
		 memberMapper.registerRole(authority);
	}
}
