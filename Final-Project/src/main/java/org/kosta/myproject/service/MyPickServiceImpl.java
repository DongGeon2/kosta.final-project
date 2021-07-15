package org.kosta.myproject.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.MyPickMapper;
import org.kosta.myproject.model.vo.MyPickVO;
import org.springframework.stereotype.Service;

@Service
public class MyPickServiceImpl implements MyPickService {
   @Resource
   MyPickMapper myPickMapper;
   
   @Override
   public int addMyPick(String id, String resNo) {
      return myPickMapper.addMyPick(id,resNo);
   }

   @Override
   public List<MyPickVO> findMyPickListById(String id) {
      return myPickMapper.findMyPickListById(id);
   }

   @Override
   public int deleteMyPickByIdAndResNo(String id, String resNo) {
      return myPickMapper.deleteMyPickByIdAndResNo(id,resNo);
   }

   @Override
   public void addMyPick2(String id, String resNo) {
      myPickMapper.addMyPick(id, resNo);
   }

   @Override
   public void deleteMyPickByIdAndResNo2(String id, String resNo) {
      myPickMapper.deleteMyPickByIdAndResNo(id, resNo);
   }

}