package com.coffice.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.coffice.dto.HeartDTO;
import com.coffice.dto.ParameterDTO;
import com.coffice.dto.ReviewDTO;
import com.coffice.dto.SearchDTO;
import com.coffice.user.service.CafeImpl;
import com.coffice.user.service.CafeSNSImpl;
import com.coffice.user.service.CafeSearchImpl;
import com.coffice.user.service.TagImpl;

import util.PagingUtil;

import com.coffice.dto.StoresDTO;
import com.coffice.dto.TagDTO;
import com.coffice.user.service.CafeImpl;

@Controller
public class CafeController {

	@Autowired
	private SqlSession sqlSession;
	private CafeImpl cafeImpl;
	StoresDTO dto = new StoresDTO();


	//일반검색
	@RequestMapping(value = "/cafe/list.do", method = RequestMethod.POST)
	public String list(Model model, HttpServletRequest req, HttpServletResponse resp) {
		
		SearchDTO searchDTO = new SearchDTO();

		//작성한 검색어 파라미터로 받아오기
		String searchTxt = req.getParameter("searchTxt");
		// 검색어 파리미터가 없을시 공백문자열로 처리
		if (searchTxt == "null") {
			searchTxt = "";
		}
		System.out.println("검색어"+searchTxt);
		// 입점여부 플래그
		String exAFLTD = req.getParameter("구독여부");
		
		System.out.println("처음받은 AFLTD="+ exAFLTD);
		
		// 없을시 기본값인 0으로 초기화
		if (exAFLTD == null || exAFLTD.equals("null")) {
			exAFLTD = "0";
		}
		//문자열 정수변환
		int AFLTD = Integer.parseInt(exAFLTD);
		System.out.println("afltd="+AFLTD);
		
		//플래그 저장
		model.addAttribute("AFLTD",AFLTD);
		//매퍼에 넘길 파라미터 세팅
		searchDTO.setSearchTxt(searchTxt);
		//매퍼에 넘길 파라미터 세팅
		searchDTO.setStore_afltd(AFLTD);

		System.out.println(searchDTO.getSearchTxt());

		//해당되는 게시물의 총 갯수
		int totalRecordCount = sqlSession.getMapper(CafeSearchImpl.class).getTotalCountSearch(searchDTO);
		System.out.println(totalRecordCount);
		//페이지 설정
		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		searchDTO.setStart(start);
		searchDTO.setEnd(end);
		System.out.println(start);
		System.out.println(end);

		//검색어 기반 가게 정보 출력
		ArrayList<SearchDTO> lists = sqlSession.getMapper(CafeSearchImpl.class).listPageSearch(searchDTO);

		//페이지 버튼 누를시 이동할 경로 선택
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/cafe/search.do?searchTxt=" + searchDTO.getSearchTxt() + "&&구독여부="+AFLTD+"&&");
		
		//추출한 정보 model 객체에 저장
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("searchTxt", searchDTO.getSearchTxt());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("lists", lists);
		

		return "user/cafe/map";
	}

	// 처음 리스트출력
	@RequestMapping("/cafe/map.do")
	public String maplist(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {

		System.out.println("처음 컨트롤러는 실행?");
		
		//검색어없는 게시물의 총개수를 출력 
		int totalRecordCount = sqlSession.getMapper(CafeSearchImpl.class).getTotalCount();
		//한페이지에 출력될 게시물 갯수
		int pageSize = 10;
		//페이지 블럭 갯수
		int blockPage = 5;
		//총페이지수
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

		//현재페이지
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		//구간의 시작값
		int start = (nowPage - 1) * pageSize + 1;
		//구간의 종료값
		int end = nowPage * pageSize;

		//전체게시물 출력
		ArrayList<SearchDTO> lists = sqlSession.getMapper(CafeSearchImpl.class).listPage(start, end);

		//페이징 처리
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/cafe/map.do?");
		//페이지 str 모델객체에 저장
		model.addAttribute("pagingImg", pagingImg);
		//초기 리스트 출력시 에러 방지를 위한 기본 제휴 플래그 0 저장
		model.addAttribute("AFLTD", 0);
		//게시물 정보 저장
		model.addAttribute("lists", lists);
		//지도 검색 페이지 이동
		return "user/cafe/map";
	}

	// 검색버튼을 누를시 검색결과 리스트 값 리턴
	@RequestMapping("/cafe/search.do")
	public String Search(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {

		SearchDTO searchDTO = new SearchDTO();

		//작성한 검색어 파라미터로 받아오기
		String searchTxt = req.getParameter("searchTxt");
		// 검색어 파리미터가 없을시 공백문자열로 처리
		if (searchTxt == "null") {
			searchTxt = "";
		}
		// 입점여부 플래그
		String exAFLTD = req.getParameter("구독여부");
		
		System.out.println("처음받은 AFLTD="+ exAFLTD);
		
		// 없을시 기본값인 0으로 초기화
		if (exAFLTD == null || exAFLTD.equals("null")) {
			exAFLTD = "0";
		}
		//문자열 정수변환
		int AFLTD = Integer.parseInt(exAFLTD);
		System.out.println("afltd="+AFLTD);
		
		//플래그 저장
		model.addAttribute("AFLTD",AFLTD);
		//매퍼에 넘길 파라미터 세팅
		searchDTO.setSearchTxt(searchTxt);
		//매퍼에 넘길 파라미터 세팅
		searchDTO.setStore_afltd(AFLTD);

		System.out.println(searchDTO.getSearchTxt());

		//해당되는 게시물의 총 갯수
		int totalRecordCount = sqlSession.getMapper(CafeSearchImpl.class).getTotalCountSearch(searchDTO);
		System.out.println(totalRecordCount);
		//페이지 설정
		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		searchDTO.setStart(start);
		searchDTO.setEnd(end);
		System.out.println(start);
		System.out.println(end);

		//검색어 기반 가게 정보 출력
		ArrayList<SearchDTO> lists = sqlSession.getMapper(CafeSearchImpl.class).listPageSearch(searchDTO);

		//페이지 버튼 누를시 이동할 경로 선택
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/cafe/search.do?searchTxt=" + searchDTO.getSearchTxt() + "&&구독여부="+AFLTD+"&&");
		
		//추출한 정보 model 객체에 저장
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("searchTxt", searchDTO.getSearchTxt());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("lists", lists);

		
		return "user/cafe/map";
	}

	// 문서가 로드될시 마커값을 가져오는 요청명
	@RequestMapping("/cafe/marker.do")
	@ResponseBody
	public Map<String, Object> responseBodyView(HttpServletRequest req) {

		SearchDTO searchDTO = new SearchDTO();

		//검색어 파라미터 받기
		String searchTxt = req.getParameter("searchTxt");
		// 검색어 파리미터가 없을시 공백문자열로 처리
		if (searchTxt == "null") {
			searchTxt = "";
		}
		//매퍼에 쓰기 위한 DTO 처리
		searchDTO.setSearchTxt(searchTxt);

		// 입점여부 플래그
		String exAFLTD = req.getParameter("구독여부");
		System.out.println("처음받은 AFLTD="+ exAFLTD);
		
		// 없을시 기본값인 0으로 초기화
		if (exAFLTD == null || exAFLTD.equals("null")) {
			exAFLTD = "0";
		}
		//파라미터 문자열 정수 변환
		int AFLTD = Integer.parseInt(exAFLTD);
		System.out.println("afltd="+AFLTD);		
		//매퍼에 쓰기 위한 DTO 셋팅
		searchDTO.setStore_afltd(AFLTD);
//		System.out.println(myStoreDTO.getSearchTxt());

		//마커에 쓰일 게시물 수 추출
		int totalRecordCount = sqlSession.getMapper(CafeSearchImpl.class).getTotalCountSearch(searchDTO);
		System.out.println("마커에 뜰 총 가게수 ="+totalRecordCount);


		//페이징 처리
		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;

		searchDTO.setStart(start);
		searchDTO.setEnd(end);

		//마커 인포윈도우에 들어갈 매장 정보 추출
		ArrayList<SearchDTO> lists = sqlSession.getMapper(CafeSearchImpl.class).listPageSearch(searchDTO);

		//매장정보값을 넘길 맵 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();

		//for문을 위한 변수 생성
		int i = 0;
		//추출된 가게 수 만큼 맵 객체에 저장
		for (SearchDTO dto : lists) {
			map.put("store_name" + i, dto.getStore_name());
			map.put("store_star" + i, dto.getStore_star());
			map.put("store_latitude" + i, dto.getStore_latitude());
			map.put("store_longitude" + i, dto.getStore_longitude());
			map.put("store_idx" + i, dto.getStore_idx());
			i++;
		}

		//호출된 곳으로 map 반환
		return map;

	}


	//카페상세
	@RequestMapping(value = "/cafe/info.do", method = RequestMethod.GET)
	public  String cafeinfo(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {

		int store_idx = Integer.parseInt(req.getParameter("store_idx"));
		cafeImpl = sqlSession.getMapper(CafeImpl.class);
		List<StoresDTO> resultList = cafeImpl.getCafeData(store_idx); 
		
		//태그
		ArrayList<TagDTO> check_tag = sqlSession.getMapper(TagImpl.class).check_tag(store_idx);
		System.out.println("check_tag:"+check_tag);
		
		//리뷰수
		int check_review = sqlSession.getMapper(CafeSNSImpl.class).getStoresReviewCount(store_idx);
		
		//별갯수 저장용
		int bar1= 0;
		int bar2= 0;
		int bar3= 0;
		int bar4= 0;
		int bar5= 0;
		
		//해당 가게 sns 별점을 찾습니다.
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setStore_idx(store_idx);
		ArrayList<ReviewDTO> reviewlists = sqlSession.getMapper(CafeSNSImpl.class).review_list(parameterDTO);
		
		for (ReviewDTO rdto : reviewlists) {
			//전체를 더해 나눕시다 ㅇㅁㅇ
			System.out.print(rdto.getReview_star()+"/");
			//별점갯수저장
			if(rdto.getReview_star().equals("1")) {
				bar1++;
			}if(rdto.getReview_star().equals("2")) {
				bar2++;
			}if(rdto.getReview_star().equals("3")) {
				bar3++;
			}if(rdto.getReview_star().equals("4")) {
				bar4++;
			}if(rdto.getReview_star().equals("5")) {
				bar5++;
			}
		}
		
		model.addAttribute("bar1", bar1);
		model.addAttribute("bar2", bar2);
		model.addAttribute("bar3", bar3);
		model.addAttribute("bar4", bar4);
		model.addAttribute("bar5", bar5);

		model.addAttribute("check_tag", check_tag);
		model.addAttribute("check_review", check_review);
		model.addAttribute("resultList", resultList);
		
		return "/user/cafe/info";
	}
	@ResponseBody
	@RequestMapping(value = "/cafe/review.do" , method = RequestMethod.POST)
	public Map<String, Object> review_info(HttpServletRequest req, @RequestParam(value = "store_idx")int store_idx,
			 @RequestParam(value = "type", defaultValue = "1")int type) {
		
		System.out.println(store_idx);
		HttpSession session = req.getSession();
		String user = String.valueOf(session.getAttribute("user_id")) ;
		
		ArrayList<HeartDTO> check_like = sqlSession.getMapper(CafeSNSImpl.class).check_like(user);
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setStore_idx(store_idx);

		ArrayList<ReviewDTO> lists;
		
		if(type == 1) {
			lists = sqlSession.getMapper(CafeSNSImpl.class).review_list(parameterDTO);
		}else if(type == 2) {
			lists = sqlSession.getMapper(CafeSNSImpl.class).review_list_type2(parameterDTO);
		}else if(type == 3) {
			lists = sqlSession.getMapper(CafeSNSImpl.class).review_list_type3(parameterDTO);
		}else if(type == 4) {
			lists = sqlSession.getMapper(CafeSNSImpl.class).review_list_type4(parameterDTO);
		}else {
			lists = sqlSession.getMapper(CafeSNSImpl.class).review_list(parameterDTO);
		}
		
		
//		System.out.println(review_list);
		
		Map<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("check_like", check_like);
		map.put("review_list",lists);
		
		System.out.println(map);
		return map;
	}

}
