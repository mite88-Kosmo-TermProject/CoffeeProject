package com.coffice.admin.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coffice.admin.service.MemberDAOImpl;
import com.coffice.dto.MemberDTO;

@Controller
public class AdminHomeController {
	@Autowired
	private SqlSession sqlSession;

	// 어드민 로그인페이지
	@RequestMapping(value = "/admin/index.do", method = RequestMethod.GET)
	public String index() {

		return "/admin/index";
	}

	// 어드민 로그인
	@RequestMapping(value = "/admin/loginAction.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String loginaction(HttpServletRequest req, HttpServletResponse resp, HttpSession session,
			MemberDTO memberDTO, Model mode) throws Exception {
		int mem_case = Integer.parseInt(req.getParameter("mem_case"));
		String url_page="/admin/index.do";// 넘어갈 url
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		PrintWriter writer = resp.getWriter();
		System.out.println("mem_case:"+mem_case);
		
		//관리자
		if(mem_case==4) {
			if (sqlSession.getMapper(MemberDAOImpl.class).baselogin(req.getParameter("mem_id"),req.getParameter("mem_pw")) == null) {
				
				writer.println("<script type='text/javascript'>");
				writer.println("alert('아이디/비밀번호를 확인해주세요.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.flush();

			} else if(sqlSession.getMapper(MemberDAOImpl.class).baselogin(req.getParameter("mem_id"),req.getParameter("mem_pw")) 
					.getMem_case().equals("4")){
				
				System.out.println("관리자 회원 로그인완료");
				session.setAttribute("siteUserInfo", memberDTO);
				session.setAttribute("UserID", memberDTO.getMem_id());
				session.setAttribute("UserNAME", memberDTO.getMem_name());
				
			}else {
				writer.println("<script type='text/javascript'>");
				writer.println("alert('아이디/비밀번호를 확인해주세요.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.flush();
			}
			
			url_page= "/admin/index.do";
			//점주관리자
		}else if(mem_case==2) {
			if (sqlSession.getMapper(MemberDAOImpl.class).baselogin(req.getParameter("mem_id"),req.getParameter("mem_pw")) == null) {
				
				writer.println("<script type='text/javascript'>");
				writer.println("alert('아이디/비밀번호를 확인해주세요.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.flush();

			} else if(sqlSession.getMapper(MemberDAOImpl.class).baselogin(req.getParameter("mem_id"),req.getParameter("mem_pw")) 
					.getMem_case().equals("2")){
				
				//제휴
				System.out.println("점주 회원 로그인완료");
				session.setAttribute("siteUserInfo", memberDTO);
				session.setAttribute("UserID", memberDTO.getMem_id());
				session.setAttribute("UserNAME", memberDTO.getMem_name());
				
			}else if(sqlSession.getMapper(MemberDAOImpl.class).baselogin(req.getParameter("mem_id"),req.getParameter("mem_pw")) 
					.getMem_case().equals("3")){
				
				//승인전
				writer.println("<script type='text/javascript'>");
				writer.println("alert('승인이 필요한 계정입니다');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.flush();
				
			}else {
				writer.println("<script type='text/javascript'>");
				writer.println("alert('아이디/비밀번호를 확인해주세요.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.flush();
			}
			
			url_page= "/storeowner/index.do";
		}else {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('아이디/비밀번호를 확인해주세요.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.flush();
			
			
		}
		return "redirect:"+url_page;

	}

	// 어드민로그아웃
	@RequestMapping("/admin/logout.do")
	public String logout(MemberDTO memberDTO, HttpSession session) throws Exception {

		// 세션 영역 정보 지움 ㅎㅎ
		session.invalidate();

		return "redirect:/admin/main.do";
	}

	// 어드민 메인페이지
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public String main() {

		return "/admin/main";
	}

}
