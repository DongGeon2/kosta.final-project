package org.kosta.myproject.service;

import java.util.List;
import org.kosta.myproject.model.vo.Authority;
import org.kosta.myproject.model.vo.MemberVO;


public interface MemberService {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityById(String id);

	void registerMember(MemberVO vo);

	String idcheck(String id);

	int getMemberCount();

	void updateMember(MemberVO memberVO);
	
	void deleteMember(String id);
}