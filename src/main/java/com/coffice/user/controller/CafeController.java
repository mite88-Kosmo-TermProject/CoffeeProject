package com.coffice.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.SearchDTO;
import com.coffice.user.service.CafeImpl;

import util.PagingUtil;



import com.coffice.dto.StoresDTO;
import com.coffice.user.service.CafeImpl;


@Controller
public class CafeController {
	
	@Autowired
	private SqlSession sqlSession;
	private CafeImpl cafeImpl;
	StoresDTO dto = new StoresDTO();

//	//지도검색
//	@RequestMapping(value = "/cafe/map.do", method = RequestMethod.GET)
//	public String map() {
//	
//
//		return "/user/cafe/map";
//	}
//	
//	//일반검색
//	@RequestMapping(value = "/cafe/list.do", method = RequestMethod.GET)
//	public String list() {
//	
//
//		return "/user/cafe/list";
//	}
	@RequestMapping("/cafe/map.do")
public String listSearch(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		SearchDTO searchDTO = new SearchDTO();
	
		searchDTO.setSearchTxt(req.getParameter("searchTxt"));
		
		System.out.println(searchDTO.getSearchTxt());
		
		int totalRecordCount =
				sqlSession.getMapper(CafeImpl.class).getTotalCountSearch(searchDTO);
		
		System.out.println(totalRecordCount);
		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		
		int nowPage = req.getParameter("nowPage")== null ? 1 : 
			Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage -1) * pageSize + 1 ;
		int end = nowPage * pageSize;
		
		searchDTO.setStart(start);
		searchDTO.setEnd(end);
		
		System.out.println(start);
		System.out.println(end);
		ArrayList<SearchDTO> lists = 
				sqlSession.getMapper(CafeImpl.class).listPageSearch(searchDTO);
	
		String pagingImg = 
				PagingUtil.pagingImg(
						totalRecordCount,
						pageSize, blockPage, nowPage,
						req.getContextPath()
						+"/mybatis/listSearch.do?searchTxt="+ searchDTO.getSearchTxt()+"&&");
		model.addAttribute("pagingImg",pagingImg);
		model.addAttribute("searchTxt", searchDTO.getSearchTxt());
		model.addAttribute("totalRecordCount",totalRecordCount);
		
		
		model.addAttribute("lists", lists);

		return "maptutorial10";
	}
	
	@RequestMapping("/cafe/marker.do")
	@ResponseBody
public Map<String, Object> responseBodyView(HttpServletRequest req){
		
		SearchDTO searchDTO = new SearchDTO();
		
		
		searchDTO.setSearchTxt(req.getParameter("searchTxt"));

//		System.out.println(myStoreDTO.getSearchTxt());
		
		int totalRecordCount =
				sqlSession.getMapper(CafeImpl.class).getTotalCountSearch(searchDTO);
		
//		System.out.println(totalRecordCount);
		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		
		int nowPage = req.getParameter("nowPage")== null ? 1 : 
			Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage -1) * pageSize + 1 ;
		int end = nowPage * pageSize;
		
		searchDTO.setStart(start);
		searchDTO.setEnd(end);
		
		ArrayList<SearchDTO> lists = 
				sqlSession.getMapper(CafeImpl.class).listPageSearch(searchDTO);
		
		
		Map<String, Object> map = new HashMap<String, Object>();

		int i = 0;
		for (SearchDTO dto : lists) {
			map.put("store_name"+i,dto.getStore_name());
			map.put("store_star"+i, dto.getStore_star());
			map.put("store_latitude"+i, dto.getStore_latitude());
			map.put("store_longitude"+i, dto.getStore_longitude());
			map.put("store_idx"+i, dto.getStore_idx());
			i++;
		}
			
		return map;
		
	}

	//카페상세
	@RequestMapping(value = "/cafe/info.do", method = RequestMethod.GET)
	public  String cafeinfo(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {
		
		int store_idx = Integer.parseInt(req.getParameter("store_idx"));
		cafeImpl = sqlSession.getMapper(CafeImpl.class);
		 List<StoresDTO> resultList = cafeImpl.getCafeData(store_idx);
		 
		 System.out.println("!!"+resultList);
		 
		System.out.println("!!"+store_idx);

		model.addAttribute("resultList", resultList);
		return "/user/cafe/info";
	}

}
