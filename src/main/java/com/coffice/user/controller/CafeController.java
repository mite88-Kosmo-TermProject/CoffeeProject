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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.SearchDTO;
import com.coffice.dto.StoresDTO;
import com.coffice.user.service.CafeImpl;
import com.coffice.user.service.CafeSearchImpl;

import util.PagingUtil;

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

	// 카페상세
	@RequestMapping(value = "/cafe/info.do", method = RequestMethod.GET)
	public String cafeinfo(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {

		System.out.println("상세보기 컨트롤러 왔니?");
		int store_idx = Integer.parseInt(req.getParameter("store_idx"));
		System.out.println("idx 잘잡았니?" + store_idx);
		cafeImpl = sqlSession.getMapper(CafeImpl.class);
		List<StoresDTO> resultList = cafeImpl.getCafeData(store_idx);

		System.out.println("!!" + resultList);

		System.out.println("!!" + store_idx);

		model.addAttribute("resultList", resultList);
		return "/user/cafe/info";
	}
	@ResponseBody
	@RequestMapping(value = "/jjim.do" , method = RequestMethod.POST)
	public Map<String, Object> jjim(@RequestParam("review_idx") int idx, @RequestParam("user_id") String id) {
		
		int check_jjim = sqlSession.getMapper(CafeImpl.class).check_jjim(id, idx);
		if(check_jjim==1) {
			System.out.println("찜 취소");
			sqlSession.getMapper(CafeImpl.class).delete_jjim(idx, id);
			sqlSession.getMapper(CafeImpl.class).storeDelete_jjim(idx);
			
		}
		else {
			System.out.println("찜 하기");
			sqlSession.getMapper(CafeImpl.class).insert_jjim(idx, id);
			sqlSession.getMapper(CafeImpl.class).storeInsert_jjim(idx);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("check", check_jjim);
		System.out.println(map);
		return map;
	}

}
