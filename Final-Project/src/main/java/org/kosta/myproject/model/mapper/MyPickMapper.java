package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.MyPickVO;

@Mapper
public interface MyPickMapper {

   int addMyPick(String id, String resNo);

   List<MyPickVO> findMyPickListById(String id);

   int deleteMyPickByIdAndResNo(String id, String resNo);

}