package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.MemberVO;

@Mapper
public interface MemberMapper {
	public MemberVO findMemberById(String id);
  
	public List<String> getMemberAddressKind();

	public List<MemberVO> findMemberByAddress(String address);
	
	public int getTotalCount();
}
