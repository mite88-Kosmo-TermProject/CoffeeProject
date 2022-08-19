package com.coffice.user.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.HTMLDocument.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.coffice.dto.ImageDTO;
import com.coffice.dto.ParameterDTO;
import com.coffice.dto.ReviewDTO;
import com.coffice.user.service.CafeSNSImpl;


@Controller
public class CafeSNSController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/cafeSNS/writePage.do")
	public String writePage(HttpServletRequest req ,Model model) {
		String idx = req.getParameter("store_idx");
		model.addAttribute("idx",idx);
		System.out.println(idx);
		return "/user/cafeSNS/write";
	}
	
	public static String getUuid(){
		//생성된 원본 그대로 출력하기. 하이픈이 포함된 문자열임. 
		String uuid = UUID.randomUUID().toString();		
		//하이픈을 제거한 상태로 출력하기.
		uuid = uuid.replaceAll("-", "");
		return uuid;
	}
	/*리뷰작성 페이지*/
	@ResponseBody
	@PostMapping("/cafeSNS/write.do")
	public String uploadReview(Model model , MultipartHttpServletRequest req) {
		
		//다운로드 경로
//		String path = req.getSession().getServletContext().getRealPath("/resources/img/review");
		String path = "C:/Users/jungs/git/CoffeeProject/src/main/webapp/resources/img/review";
		MultipartFile mfile = null;
		List<Object> resultList = new ArrayList<Object>();
		try {
			//게시물 idx 얻기
			String idx = req.getParameter("idx");
			//내용 얻기
			String content = req.getParameter("content");
			//별점 얻기
			String star = req.getParameter("star");
			
			//reviewDTO에 해당 값 저장
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setStore_idx(idx);
			reviewDTO.setReview_content(content);
			reviewDTO.setStore_idx(idx);
			reviewDTO.setReview_star(star);
			System.out.println(reviewDTO);
			int writeReview = sqlSession.getMapper(CafeSNSImpl.class).insert(reviewDTO);
//			System.out.println("리뷰작성완료 개수"+writeReview);
			int review_idx = sqlSession.getMapper(CafeSNSImpl.class).getIdx(reviewDTO);
//			System.out.println(review_idx);
			//제목 폼값을 얻어온다. 
			//업로드폼의 file속성의 input상자가 2개이므로 갯수만큼 반복한다. 
			java.util.Iterator<String> itr = req.getFileNames();
			String imgfiles = "";
			while(itr.hasNext()) {
				//서버로 전송된 파일명을 읽어온다. 
				mfile = req.getFile(itr.next().toString());
				//한글깨짐방지 처리 후 전송된 파일명을 가져온다. 
				String originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				//서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다. 
				if("".equals(originalName)) continue;
				//파일명에서 확장자를 따낸다. 
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				
				//UUID를 통해 생성된 문자열과 확장자를 결합해서 저장할 파일명을 생성한다. 
				String saveFileName = getUuid() + ext;
				
				//물리적경로에 새롭게 생성된 파일명으로 저장한다. 
				mfile.transferTo(new File(path + File.separator + saveFileName));
				if(imgfiles.equals("")) {
					imgfiles += saveFileName;
				}
				else {
					imgfiles += "/"+saveFileName;
				}
			}
			System.out.println(imgfiles);
			ImageDTO imageDTO = new ImageDTO();
			imageDTO.setReview_idx(review_idx);
			imageDTO.setStore_idx(idx);
			imageDTO.setImage_save(imgfiles);
			System.out.println(imageDTO);
			int image_insert = sqlSession.getMapper(CafeSNSImpl.class).imgInsert(imageDTO);
			System.out.println("이미지삽입완료:"+image_insert);
//			System.out.println(resultList);
		}		 
		catch(Exception e) {
			e.printStackTrace();
		}
		//필요한 정보를 Model에 저장한 후 View반환
		model.addAttribute("resultList", resultList);
		return "view";
	}
	
	/*카페SNS페이지 연결*/
	@RequestMapping("/cafeSNS/review.do")
	public String goCafeSNS() {
		
		return "/user/cafeSNS/review";
	}
	
	
	@ResponseBody
	@RequestMapping("/cafeSNS/getList.do")
	public ArrayList<ReviewDTO> getCafeList() {
		System.out.println("controller 연결성공");
		ArrayList<ReviewDTO> getCafeList = sqlSession.getMapper(CafeSNSImpl.class).list();
		//내용 부분 줄바꿈 처리를 해준다.
		for(ReviewDTO dto : getCafeList) {
			String temp = dto.getReview_content().replace("\r\n", "<br/>");
			dto.setReview_content(temp);
//			System.out.println(dto);
		}
		
		return getCafeList;
	}
	@ResponseBody
	@RequestMapping(value =  "/cafeSNS/newcafelist" , method = RequestMethod.POST)
	public ArrayList<ReviewDTO> pagingCafeList(HttpServletRequest req 
			,@RequestParam(value = "list[]")ArrayList<String> review_idx
			,Model model) {
		
		System.out.println(review_idx);
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
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
		
		ArrayList<ReviewDTO> lists = sqlSession.getMapper(CafeSNSImpl.class).getnewList(parameterDTO);
		
		for(ReviewDTO dto : lists) {
			String temp = dto.getReview_content().replace("\r\n", "<br/>");
			dto.setReview_content(temp);
			/* System.out.println(dto); */
		}
		
		return lists;
	}
}