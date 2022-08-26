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

import com.coffice.dto.BoardDTO;
import com.coffice.dto.MemberDTO;
import com.coffice.dto.SearchDTO;
import com.coffice.user.service.BoardImpl;
import com.coffice.user.service.CafeSearchImpl;

import util.PagingUtil;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	// 게시판 리스트
	@RequestMapping(value = "/community/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model, HttpServletRequest req,  HttpServletResponse resp) {
		
		BoardDTO boardDTO = new BoardDTO();
		
		System.out.println("처음 컨트롤러는 실행?");
		
		String board_flag = req.getParameter("board_flag");
		if(board_flag == null) {
			board_flag = "1";
		}
		System.out.println("플래그 알려주세요"+board_flag);
		boardDTO.setBoard_flag(board_flag);
		
		model.addAttribute("board_flag",board_flag);
		int totalRecordCount;
		
			totalRecordCount = sqlSession.getMapper(BoardImpl.class).getTotalCountFlag(board_flag);
		


		//검색어없는 게시물의 총개수를 출력 
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
		ArrayList<BoardDTO> lists = sqlSession.getMapper(BoardImpl.class).listPage(start, end, board_flag);

		for (BoardDTO dto : lists) {
			String temp = dto.getBoard_content().replace("\r\n","<br/>");
			dto.setBoard_content(temp);
		}
		//페이지 버튼 누를시 이동할 경로 선택
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/community/boardList.do?board_flag="+board_flag+"&&");
		//페이지 str 모델객체에 저장
		model.addAttribute("pagingImg", pagingImg);
		//목록용 나우페이지
		model.addAttribute("nowPage",nowPage);
		//게시물 정보 저장
		model.addAttribute("lists", lists);
		//지도 검색 페이지 이동
		return "user/community/boardList";
	}

	// 검색 기반 게시판 리스트
		@RequestMapping(value = "/community/searchList.do", method = RequestMethod.GET)
		public String searchList(Model model, HttpServletRequest req,  HttpServletResponse resp) {
			
			BoardDTO boardDTO = new BoardDTO();
			
			System.out.println("처음 컨트롤러는 실행?");
			
			String searchField = req.getParameter("searchField");
			System.out.println("검색영역="+ searchField);
			String searchTxt = req.getParameter("searchTxt");
			System.out.println("검색단어="+ searchTxt);
			String board_flag = req.getParameter("board_flag");
			System.out.println("널초기화전 플래그"+ board_flag);
			if(board_flag == null) {
				board_flag = "1";
			}
			System.out.println("플래그 알려주세요"+board_flag);
			boardDTO.setBoard_flag(board_flag);
			boardDTO.setSearchField(searchField);
			boardDTO.setSearchTxt(searchTxt);
			System.out.println("세팅된 dto="+boardDTO);
	
			
			model.addAttribute("board_flag",board_flag);
			int totalRecordCount = sqlSession.getMapper(BoardImpl.class).getTotalCountFlagSearch(boardDTO);
			System.out.println("검색된 게시물 갯수"+totalRecordCount);

			//검색어없는 게시물의 총개수를 출력 
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

			boardDTO.setStart(start);
			boardDTO.setEnd(end);
			System.out.println("세팅된 dto2="+boardDTO);
			
			
			//전체게시물 출력
			ArrayList<BoardDTO> lists = sqlSession.getMapper(BoardImpl.class).listPageSearch(boardDTO);
			System.out.println(lists);
			for (BoardDTO dto : lists) {
				String temp = dto.getBoard_content().replace("\r\n","<br/>");
				dto.setBoard_content(temp);
			}
			//페이지 버튼 누를시 이동할 경로 선택
			String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
					req.getContextPath() + "/community/searchList.do?searchField="+searchField+"&&searchTxt="+searchTxt+"&&board_flag="+board_flag+"&&");
			//페이지 str 모델객체에 저장
			model.addAttribute("pagingImg", pagingImg);
			//목록용 나우페이지
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("board_flag", board_flag);
			//게시물 정보 저장
			model.addAttribute("lists", lists);
			//지도 검색 페이지 이동
			return "user/community/boardList";
		}

	
	// 게시물 상세
	@RequestMapping(value = "/user/community/boardView.do", method = RequestMethod.GET)
	public String boardView(Model model, HttpServletRequest req,  HttpServletResponse resp,
			HttpSession session) {
		
		BoardDTO boardDTO = new BoardDTO();
		
		String board_idx = req.getParameter("board_idx");
		String board_flag = req.getParameter("board_flag");
		String nowPage = req.getParameter("nowPage");
		System.out.println("현재페이지="+ nowPage);
		boardDTO.setBoard_idx(Integer.parseInt(board_idx));
		
		ArrayList<BoardDTO> list = sqlSession.getMapper(BoardImpl.class).boardView(boardDTO);
		try {
			sqlSession.getMapper(BoardImpl.class).visitcountUp(Integer.parseInt(board_idx));	
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("조회수 처리 오류");
			}
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberDTO mem = (MemberDTO) session.getAttribute("siteUserInfo");
		if(mem != null) {
			String mem_id = mem.getMem_id();

			ArrayList<MemberDTO> member = sqlSession.getMapper(BoardImpl.class).getMem(mem_id);
			System.out.println("멤버정보="+member);
			
			
			for (MemberDTO memberDTO : member) {
				map.put("mem_case", memberDTO.getMem_case() );
			}

			model.addAttribute("sessionMem_id"+mem_id);
		}
		for (BoardDTO dto : list) {
			String temp = dto.getBoard_content().replace("\r\n","<br/>");
			dto.setBoard_content(temp);
		}
		for ( BoardDTO dto : list) {
			map.put("board_title", dto.getBoard_title());
			map.put("board_content", dto.getBoard_content());
			map.put("mem_id", dto.getMem_id());
			map.put("board_visitcount", dto.getBoard_visitcount());
			map.put("board_postdate", dto.getBoard_postdate());
			map.put("board_title", dto.getBoard_title());
		}

		
		model.addAttribute("board_idx", board_idx);
		model.addAttribute("map", map);
		//목록용 나우페이지
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("board_flag",board_flag);
		
		return "/user/community/boardView";
	}
	
	
	
	
	// 게시물 작성 페이지 이동
		@RequestMapping(value = "/community/boardWrite.do", method = RequestMethod.GET)
		public String boardWrite(Model model, HttpServletRequest req,  HttpServletResponse resp,
				HttpSession session) {
			if(session.getAttribute("siteUserInfo")==null) {
				return "redirect:/member/login.do";
			}
			MemberDTO mem = (MemberDTO) session.getAttribute("siteUserInfo");
			String mem_id = mem.getMem_id();

			ArrayList<MemberDTO> member = sqlSession.getMapper(BoardImpl.class).getMem(mem_id);
			System.out.println("멤버정보="+member);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			String mem_case = "";
			for (MemberDTO memberDTO : member) {
				map.put("mem_case", memberDTO.getMem_case() );
				mem_case = memberDTO.getMem_case();
			}
			System.out.println("mem_case"+mem_case);
			model.addAttribute("map", map);
			String mode = "write";
			String nowPage = req.getParameter("nowPage");
			String board_flag = req.getParameter("board_flag");
			
			if(board_flag.equals("1") || board_flag.equals("2") ) {
				if(!(mem_case.equals("4"))) {
					model.addAttribute("mode", mode);
					//목록용 나우페이지
					model.addAttribute("nowPage",nowPage);
					model.addAttribute("board_flag",board_flag);
					return "/user/community/boardError";
				}
			}
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("board_flag",board_flag);
			System.out.println("컨트롤러 호출됨??");
			return "/user/community/boardWrite";
			
		}
		
		
		
		// 작성 처리
		@RequestMapping(value = "/community/boardWriteAction.do", method = RequestMethod.POST)
		public String boardWriteAction(Model model, HttpServletRequest req,  HttpServletResponse resp,
				HttpSession session) {
			
			MemberDTO mem = (MemberDTO) session.getAttribute("siteUserInfo");
			String mem_id = mem.getMem_id();
			System.out.println("멤버아디="+mem_id);
			String mode = req.getParameter("mode");
			System.out.println("작성모드="+mode);
			String nowPage = req.getParameter("nowPage");
			System.out.println("현재페이지="+nowPage);
			String board_title = req.getParameter("board_title");
			System.out.println("게시물 제목="+board_title);
			String board_content = req.getParameter("board_content");
			System.out.println("게시물 내용="+board_content);
			String board_flag = req.getParameter("board_flag");
			System.out.println("카테고리="+board_flag);
			
			
			
			sqlSession.getMapper(BoardImpl.class).boardWrite(board_title, board_content, mem_id, board_flag);

		
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("mode", mode);
			model.addAttribute("board_flag",board_flag);
			return "/user/community/boardDone";
			
		}
		
		// 게시글 수정 페이지
		@RequestMapping(value = "/community/boardEdit.do", method = RequestMethod.GET)
		public String boardEdit(Model model, HttpServletRequest req,  HttpServletResponse resp,
				HttpSession session) {
			if(session.getAttribute("siteUserInfo")==null) {
				return "redirect:/member/login.do";
			}
			
			BoardDTO boardDTO = new BoardDTO();
			
			String board_idx = req.getParameter("board_idx");
			String board_flag = req.getParameter("board_flag");
			String nowPage = req.getParameter("nowPage");
			String mode = req.getParameter("mode");
			
			System.out.println("현재페이지="+ nowPage);
			boardDTO.setBoard_idx(Integer.parseInt(board_idx));
			
			ArrayList<BoardDTO> list = sqlSession.getMapper(BoardImpl.class).boardView(boardDTO);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			MemberDTO mem = (MemberDTO) session.getAttribute("siteUserInfo");
			String sessionMem_id = mem.getMem_id();

			ArrayList<MemberDTO> member = sqlSession.getMapper(BoardImpl.class).getMem(sessionMem_id);
			System.out.println("멤버정보="+member);
			
			String postMem_id = "";
			String mem_case ="";
			for (MemberDTO memberDTO : member) {
				map.put("mem_case", memberDTO.getMem_case() );
				mem_case = memberDTO.getMem_case();
			}
				for ( BoardDTO dto : list) {
					map.put("board_title", dto.getBoard_title());
					map.put("board_content", dto.getBoard_content());
					map.put("mem_id", dto.getMem_id());
					map.put("board_postdate", dto.getBoard_postdate());
					map.put("board_title", dto.getBoard_title());
					 postMem_id = dto.getMem_id();
				}
			
			if(!(sessionMem_id.equals(postMem_id))) {
				if(!(mem_case.equals("4"))){
					model.addAttribute("mode", mode);
					//목록용 나우페이지
					model.addAttribute("nowPage",nowPage);
					model.addAttribute("board_flag",board_flag);
					return "/user/community/boardError";
				}
			}

			model.addAttribute("sessionMem_id"+sessionMem_id);
			model.addAttribute("board_idx", board_idx);
			model.addAttribute("map", map);
			model.addAttribute("mode", mode);
			//목록용 나우페이지
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("board_flag",board_flag);
			
			
			return "/user/community/editView";
		}
		
		//수정처리
		@RequestMapping(value = "/community/boardEditAction.do", method = RequestMethod.POST)
		public String boardEditAction(Model model, HttpServletRequest req,  HttpServletResponse resp,
				HttpSession session) {
			
			BoardDTO boardDTO = new BoardDTO();
			
			String board_idx = req.getParameter("board_idx");
			String board_title = req.getParameter("board_title");
			String board_content = req.getParameter("board_content");
			String board_flag = req.getParameter("board_flag");
			String nowPage = req.getParameter("nowPage");
			String mode = req.getParameter("mode");
			
			boardDTO.setBoard_idx(Integer.parseInt(board_idx));
			boardDTO.setBoard_title(board_title);
			boardDTO.setBoard_content(board_content);
			
			try {
			sqlSession.getMapper(BoardImpl.class).boardEdit(boardDTO);	
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("수정처리 오류");
			}
			
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("mode", mode);
			model.addAttribute("board_flag",board_flag);
			return "/user/community/boardDone";
		}
		
		//삭제 페이지 이동
		@RequestMapping(value = "/community/boardDelete.do", method = RequestMethod.GET)
		public String boardDelete(Model model, HttpServletRequest req,  HttpServletResponse resp,
				HttpSession session) {
			
			BoardDTO boardDTO = new BoardDTO();
			String board_idx = req.getParameter("board_idx");
			String board_flag = req.getParameter("board_flag");
			String nowPage = req.getParameter("nowPage");
			String mode = req.getParameter("mode");
			
			if(session.getAttribute("siteUserInfo")==null) {
				return "redirect:/member/login.do";
			}
			
			MemberDTO mem = (MemberDTO) session.getAttribute("siteUserInfo");
			
			String sessionMem_id = mem.getMem_id();
			ArrayList<MemberDTO> member = sqlSession.getMapper(BoardImpl.class).getMem(sessionMem_id);
			System.out.println("멤버정보="+member);
			
			boardDTO.setBoard_idx(Integer.parseInt(board_idx));
			ArrayList<BoardDTO> list = sqlSession.getMapper(BoardImpl.class).boardView(boardDTO);
			System.out.println("삭제용 글작성자 정보"+list);
			Map<String, Object> map = new HashMap<String, Object>();
			
			String postMem_id = "";
			String mem_case ="";
			for (MemberDTO memberDTO : member) {
				map.put("mem_case", memberDTO.getMem_case() );
				mem_case = memberDTO.getMem_case();
			}
				for ( BoardDTO dto : list) {

					 postMem_id = dto.getMem_id();
				}
			System.out.println("로그인된아이디="+sessionMem_id);
			System.out.println("작성자아이디="+postMem_id);
			if(!(sessionMem_id.equals(postMem_id))) {
				if(!(mem_case.equals("4"))){
					model.addAttribute("mode", mode);
					//목록용 나우페이지
					model.addAttribute("nowPage",nowPage);
					model.addAttribute("board_flag",board_flag);
					return "/user/community/boardError";
				}
			}

			
			
			model.addAttribute("board_idx", board_idx);
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("mode", mode);
			model.addAttribute("board_flag",board_flag);
			return "/user/community/deleteConfirm";
		}
		
		//삭제 처리
		@RequestMapping(value = "/community/deleteAction.do", method = RequestMethod.GET)
		public String Delete(Model model, HttpServletRequest req,  HttpServletResponse resp,
				HttpSession session) {
			
			MemberDTO mem = (MemberDTO) session.getAttribute("siteUserInfo");
			String sessionMem_id = mem.getMem_id();
			
			BoardDTO boardDTO = new BoardDTO();
			String board_idx = req.getParameter("board_idx");
			String board_flag = req.getParameter("board_flag");
			String nowPage = req.getParameter("nowPage");
			String mode = req.getParameter("mode");
			
			boardDTO.setBoard_idx(Integer.parseInt(board_idx));
			
			try {
				sqlSession.getMapper(BoardImpl.class).boardDelete(boardDTO);	
				}
				catch (Exception e) {
					e.printStackTrace();
					System.out.println("삭제처리 오류");
				}

			model.addAttribute("nowPage",nowPage);
			model.addAttribute("mode", mode);
			model.addAttribute("board_flag",board_flag);
			return "/user/community/boardDone";
		}
}
