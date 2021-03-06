package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.Authority;
import org.kosta.myproject.model.vo.MemberVO;

@Mapper
public interface MemberMapper {

	MemberVO findMemberById(String id);

	void registerMember(MemberVO vo);

	void registerRole(Authority authority);

	int getMemberCount();

	int idcheck(String id);

	List<Authority> selectAuthorityByUsername(String id);

	void updateMember(MemberVO memberVO);
	
	boolean deleteMember(String id);

	List<Authority> selectAuthority();

	int ownerCancel(String id); 
}
