package com.coffice.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.coffice.dto.HeartDTO;
import com.coffice.dto.MemberDTO;
import com.coffice.user.service.CafeSNSImpl;
import com.coffice.user.service.UserMemberImpl;

@Controller
public class LikeController {

	@Autowired
	private SqlSession sqlSession;
	
	   //좋아요 구현
	   @ResponseBody
	   @RequestMapping(value ="/like.do" , method = RequestMethod.POST)
	   public Map<String, Object> like(@RequestParam(value="review_idx")int review_idx, HeartDTO heartDTO ,
			   HttpServletResponse resp, HttpServletRequest req, Model model) throws Exception{
	      
		  HttpSession session = req.getSession();
		  String user = String.valueOf(session.getAttribute("user_id"));
		  System.out.println(review_idx); 
//		  heartDTO.setReview_idx(review_idx);
		  heartDTO.setMem_id(user);
		  System.out.println(heartDTO);
		   
	      int likecheck = sqlSession.getMapper(CafeSNSImpl.class).findLike(heartDTO);
	      System.out.println("!!!"+likecheck);
	      
	      if(likecheck == 1 ) {
	    	  sqlSession.getMapper(CafeSNSImpl.class).likedelete(heartDTO);
	    	  System.out.println("좋아요 취소");
	    	  sqlSession.getMapper(CafeSNSImpl.class).like_down(review_idx);
	      }
	      else {
	         sqlSession.getMapper(CafeSNSImpl.class).insertlike(heartDTO);
	         System.out.println("좋아요");
	         sqlSession.getMapper(CafeSNSImpl.class).like_up(review_idx);
	      }
	      int like_hit = sqlSession.getMapper(CafeSNSImpl.class).like_hit(review_idx);
	      
	      Map<String, Object> map = new HashMap<>();
	      map.put("likecheck", likecheck);
	      map.put("like_hit" , like_hit);
	      System.out.println(map);
	      return map;
	   }
}