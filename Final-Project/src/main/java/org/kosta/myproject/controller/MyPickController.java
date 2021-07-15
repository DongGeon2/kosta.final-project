package org.kosta.myproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.myproject.model.vo.BoardVO;
import org.kosta.myproject.model.vo.CommentVO;
import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.MyPickService;
import org.kosta.myproject.service.RestaurantService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MyPickController {
   @Resource
   private MyPickService mypickService;
   
   @Resource
   private RestaurantService restaurantService;
   @Secured("ROLE_MEMBER")
   @PostMapping("my-pick-add")
   @ResponseBody
   public String myPickList(String resNo) {
      MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      String id=pvo.getId();
      int count=-1;
      try {
         count=mypickService.addMyPick(id,resNo);
      }catch (Exception e) {
         e.printStackTrace();
         count=0;
      }
      return (count>=1) ? "ok":"fail";
   }
      @Secured("ROLE_MEMBER")   
      @PostMapping("my-pick-delete-by-id-resNo")
      @ResponseBody
      public String MyPickDeleteByIdAndResNo(String resNo) {
         MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
         String id=pvo.getId();
         int count=mypickService.deleteMyPickByIdAndResNo(id, resNo);
         return (count>=1) ? "ok":"fail";
      }
      
      /*
       * @Secured("ROLE_MEMBER")
       * 
       * @PostMapping("mypick-check")
       * 
       * @ResponseBody public String MyPickCheck(String resNo,String stateInfo){
       * MemberVO pvo = (MemberVO)
       * SecurityContextHolder.getContext().getAuthentication().getPrincipal(); String
       * id=pvo.getId(); System.out.println(stateInfo); if(stateInfo.equals("like")) {
       * mypickService.deleteMyPickByIdAndResNo2(id, resNo); return "unlike"; }else {
       * mypickService.addMyPick2(id, resNo); return "like"; }
       * 
       * }
       */
   
}