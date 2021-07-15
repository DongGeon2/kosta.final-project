package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.model.vo.MyPickVO;

public interface MyPickService {

   int addMyPick(String id, String resNo);
   
   void addMyPick2(String id, String resNo);

   List<MyPickVO> findMyPickListById(String id);

   int deleteMyPickByIdAndResNo(String id, String resNo);

   void deleteMyPickByIdAndResNo2(String id, String resNo);

}