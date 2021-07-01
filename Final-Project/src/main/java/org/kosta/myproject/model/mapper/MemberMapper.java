package org.kosta.myproject.model.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.PostVO;

@Mapper
public interface MemberMapper {
	public MemberVO findMemberById(String id);
  
	public List<String> getMemberAddressKind();

	public List<MemberVO> findMemberByAddress(String address);
	
	public int getTotalCount();

	public ArrayList<PostVO> getPostingList(int getStartRowNumber, int getEndRowNumber);
}
