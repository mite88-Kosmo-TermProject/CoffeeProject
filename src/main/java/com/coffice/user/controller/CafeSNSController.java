package com.coffice.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.CafeSNSDTO;
import dto.ParameterDTO;
import service.CafeSNSImpl;


@Controller
public class CafeSNSController {

	@Autowired
	private SqlSession sqlSession;
	/*카페SNS페이지 연결*/
	@RequestMapping("/cafeSNS/review.do")
	public String goCafeSNS() {
		
		return "/user/cafeSNS/review";
	}
	
	
	@ResponseBody
	@RequestMapping("/cafeSNS/getList.do")
	public ArrayList<CafeSNSDTO> getCafeList() {
		System.out.println("controller 연결성공");
		ArrayList<CafeSNSDTO> getCafeList = sqlSession.getMapper(CafeSNSImpl.class).list();
		//내용 부분 줄바꿈 처리를 해준다.
		for(CafeSNSDTO dto : getCafeList) {
			String temp = dto.getContent().replace("\r\n", "<br/>");
			dto.setContent(temp);
			/* System.out.println(dto); */
		}
		
		return getCafeList;
	}
	@ResponseBody
	@RequestMapping(value =  "/cafeSNS/newcafelist" , method = RequestMethod.POST)
	public ArrayList<CafeSNSDTO> pagingCafeList(HttpServletRequest req 
			,@RequestParam(value = "list[]")ArrayList<String> review_idx
			,Model model) {
		
//		System.out.println(review_idx);
		ArrayList<CafeSNSDTO> list = new ArrayList<CafeSNSDTO>();
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setReview_idx(review_idx);
		int totalRecordCount =
				sqlSession.getMapper(CafeSNSImpl.class).getTotalCount(parameterDTO);
		
//		System.out.println(totalRecordCount);
		int pageSize = 10;
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage -1) * pageSize +1;
		int end = nowPage * pageSize;
		System.out.println(nowPage);
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		ArrayList<CafeSNSDTO> lists = sqlSession.getMapper(CafeSNSImpl.class).getnewList(parameterDTO);
		
		for(CafeSNSDTO dto : lists) {
			String temp = dto.getContent().replace("\r\n", "<br/>");
			dto.setContent(temp);
			/* System.out.println(dto); */
		}
		
		return lists;
	}
}