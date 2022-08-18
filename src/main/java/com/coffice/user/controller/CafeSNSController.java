package com.coffice.user.controller;

import java.io.File;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.coffice.dto.ParameterDTO;
import com.coffice.dto.MemberDTO;
import com.coffice.dto.reviewDTO;
import com.coffice.user.service.CafeSNSImpl;


@Controller
public class CafeSNSController {

	@Autowired
	private SqlSession sqlSession;
	
	/*리뷰작성 페이지*/
	@ResponseBody
	@PostMapping("/cafeSNS/write.do")
	public String uploadReview(MultipartFile file, reviewDTO reviewDTO , HttpSession session ,HttpServletRequest req) {
		
		try {
			//로그인된 정보중에 id를 가져온다.
			String writer = ((MemberDTO)session.getAttribute("login")).getMem_id();
			
			//날짜별로 폴더를 생성해서 파일을 관리
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			java.util.Date date = new java.util.Date();
			String fileLoca = sdf.format(date);
			
			//저장할 폴더 경로 
			String uploadPath = "";
			
			File folder = new File(uploadPath);
			if(!folder.exists()) {
				folder.mkdir();//폴더가 존재하지 않는다면 생성해라.
			}
			
			String fileRealName = file.getOriginalFilename();
			
			//파일명을 고유한 랜덤 문자로 생성
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			
			//확장자를 추출합니다.
			String fileExtension = fileRealName.substring(fileRealName.indexOf("."),fileRealName.length());
			
			System.out.println("저장할 폴더 경로:" + uploadPath);
			System.out.println("실제 파일명:"+ fileRealName);
			System.out.println("폴더명:"+fileLoca);
			System.out.println("확장자:"+fileExtension);
			System.out.println("고유랜덤문자:"+ uuids);
			
			String fileName = uuids + fileExtension;
			System.out.println("변경해서 저장할 파일명:" + fileName);
			
			//업로드한 파일을 서버 컴퓨터의 지정한 경로 내에서 실제로 저장.
			File saveFile = new File(uploadPath + "\\"+ fileName);
			file.transferTo(saveFile);
			reviewDTO.setReview_content(req.getParameter("content"));
			reviewDTO.setMem_id(writer);
			reviewDTO.setStore_idx(req.getParameter("store_idx"));
			reviewDTO.setReview_img(fileName);
			//DB에 insert 작업을 진행.
			int insertReview = sqlSession.getMapper(CafeSNSImpl.class).insert(reviewDTO);
			System.out.println(insertReview);
			return "success";
		} catch (Exception e) {
			System.out.println("업로드 중 에러 발생:"+ e.getMessage());
		}
		
		
		
		return "view";
	}
	
	/*카페SNS페이지 연결*/
	@RequestMapping("/cafeSNS/review.do")
	public String goCafeSNS() {
		
		return "/user/cafeSNS/review";
	}
	

	//좋아요 버튼
	@RequestMapping("/cafeSNS/ajax_like.do")
	public String ajaxlike() {
		
		
		return "/cafeSNS/ajax_like.do";
	}
	
	
	@ResponseBody
	@RequestMapping("/cafeSNS/getList.do")
	public ArrayList<reviewDTO> getCafeList() {
		System.out.println("controller 연결성공");
		ArrayList<reviewDTO> getCafeList = sqlSession.getMapper(CafeSNSImpl.class).list();
		//내용 부분 줄바꿈 처리를 해준다.
		for(reviewDTO dto : getCafeList) {
			String temp = dto.getReview_content().replace("\r\n", "<br/>");
			dto.setReview_content(temp);
//			System.out.println(dto);
		}
		
		return getCafeList;
	}
	@ResponseBody
	@RequestMapping(value =  "/cafeSNS/newcafelist" , method = RequestMethod.POST)
	public ArrayList<reviewDTO> pagingCafeList(HttpServletRequest req 
			,@RequestParam(value = "list[]")ArrayList<String> review_idx
			,Model model) {
		
		System.out.println("ddd"+review_idx);
		ArrayList<reviewDTO> list = new ArrayList<reviewDTO>();
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setReview_idx(review_idx);
		int totalRecordCount =
				sqlSession.getMapper(CafeSNSImpl.class).getTotalCount(parameterDTO);
		
		System.out.println(totalRecordCount);
		int pageSize = 10;
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage -1) * pageSize +1;
		int end = nowPage * pageSize;
		System.out.println(nowPage);
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		ArrayList<reviewDTO> lists = sqlSession.getMapper(CafeSNSImpl.class).getnewList(parameterDTO);
		
		for(reviewDTO dto : lists) {
			String temp = dto.getReview_content().replace("\r\n", "<br/>");
			dto.setReview_content(temp);
			/* System.out.println(dto); */
		}
		
		return lists;
	}
}

