package com.coffice.user.controller;

import java.io.PrintWriter;
import java.lang.reflect.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.MemberDTO;
import com.coffice.dto.ParameterDTO;
import com.coffice.user.service.UserMemberImpl;

@Controller
public class UserMemberController {
	
	@Autowired
	private SqlSession sqlSession;
	private UserMemberImpl Membermapper;
	
	
	//로그인 폼
	@RequestMapping("/member/login.do")
	public String login(Model model) {
		return "user/member/login";
	}
	
	//로그인
//	@RequestMapping(value="/member/loginAction.do", method= {RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView loginaction(HttpServletRequest req, HttpSession session) {
//		
//		
//		MemberDTO vo= sqlSession.getMapper(UserMemberImpl.class).login(req.getParameter("mem_id"), req.getParameter("mem_pw"));
//		
//		//Model객체에 저장과 View반환을 동시에 처리할 수 있는 객체 생성
//		ModelAndView mv = new ModelAndView();
//		if(vo==null) {
//			//회원정보가 불일치 하는 경우 로그인 실패이므로 에러메세지를 저장한 후
//			//로그인 페이지를 다시 출력한다.
//			mv.addObject("LoginNG", "아이디/패스워드가 틀렸습니다.");
//			mv.setViewName("user/mebmer/login");
//			return mv;
//		}
//		else {
//			//로그인에 성공한 경우 세션영역에 MemberVO객체를 저장한다.
//			session.setAttribute("siteUserInfo", vo);
//		}
//		
//		//로그인 처리 후 backUrl이 있는 경우라면 해당 페이지로 이동시킨다.
//		//만약 값이 없다면 로그인 페이지로 이동시킨다.
//		//backUrl은 글쓰기 페이지로 진입시 로그인정보가 없는경우 파라미터로 전달된 쓰기페이지의
//		//View경로이다.
//		String backUrl = req.getParameter("backUrl");
//		if(backUrl==null||backUrl.equals("")) {
//			mv.setViewName("user/member/login");
//		}
//		else {
//			mv.setViewName(backUrl);
//		}
//		return mv;
//	}
	//로그인
	@RequestMapping(value="/member/loginAction.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String loginaction(HttpServletRequest req, HttpServletResponse resp,  HttpSession session, MemberDTO memberDTO) throws Exception{
		
		if(sqlSession.getMapper(UserMemberImpl.class).login(req.getParameter("mem_id"), req.getParameter("mem_pw"))==null) {
			 resp.setCharacterEncoding("utf-8");
		     PrintWriter writer = resp.getWriter();
		     writer.println("<script type='text/javascript'>");
		     writer.println("alert('아이디/비밀번호를 확인해주세요.');");
		     writer.println("history.back();");
		     writer.println("</script>");
		     writer.flush();
		     
		}
		else {
			session.setAttribute("siteUserInfo", memberDTO);
			session.setAttribute("user_id", memberDTO.getMem_id());
		}
		return "home";
	}

	//로그아웃
	@RequestMapping("/member/logout.do")
	public String logout(MemberDTO memberDTO, HttpSession session) throws Exception{
		
		//세션 영역 정보 지움 ㅎㅎ
		session.invalidate();
		
		return "home";
	}

	//아이디 찾기 페이지
	@RequestMapping("/member/findId.do")
	public String findId() throws Exception{
		return "/user/member/findId";
	}

	//아이디 찾기 결과
	@RequestMapping("/member/findIdResult.do")
	public String findIdResult(HttpServletRequest req, HttpServletResponse resp, HttpSession session, MemberDTO memberDTO) throws Exception{
		
		resp.setContentType("text/html;charset=utf-8");
		String id = sqlSession.getMapper(UserMemberImpl.class).findId(memberDTO);
		
		PrintWriter out = resp.getWriter();
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return "member/findId";
		} else {
			session.setAttribute("mem_id", id);
			return "/user/member/findIdResult";
		}
	}

	// 비밀번호 찾기 페이지
	@RequestMapping(value = "/member/findPw.do", method = RequestMethod.GET)
	public String findPw() {

		return "/user/member/findPw";
	}

	//비밀번호 찾기 결과
	@ResponseBody
	@RequestMapping("/member/findPwResult.do")
	public String findPwResult(@RequestParam("mem_email") String mem_email, @RequestParam("mem_id") String mem_id, HttpServletRequest req, HttpServletResponse response, MemberDTO memberDTO) throws Exception{
	
	int fpw =0; 
	
	if(sqlSession.getMapper(UserMemberImpl.class).check1(mem_id) == 0) {
		
		fpw = 1;
	}
	else if (sqlSession.getMapper(UserMemberImpl.class).check2(mem_email)== 0) {
		 
		fpw = 2;
	}
		
	else {
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		memberDTO.setMem_pw(pw);
		// 비밀번호 변경
		//manager.update_pw(memberDTO);
		sqlSession.getMapper(UserMemberImpl.class).updatepw(memberDTO);
		// 비밀번호 변경 메일 발송
		send_mail(memberDTO, "find_pw");
		fpw = 3;
	}
		System.out.println("결과"+fpw);
		return String.valueOf(fpw);
	}
	
	// 회원가입전1단계
	@RequestMapping(value = "/member/signup.do", method = RequestMethod.GET)
	public String signup() {

		return "/user/member/signup";
	}

	//회원가입 폼
	@RequestMapping("/member/join.do")
	public String write(Model model, HttpServletRequest req, HttpSession session) {
		return "/user/member/join";
	}
	
	//회원가입 결과
	@RequestMapping(value="/member/joinResult.do", 
			 method=RequestMethod.POST)
	public String joinAction(Model model, HttpServletRequest req, HttpSession session, MemberDTO memberDTO) {
		
		int result = sqlSession.getMapper(UserMemberImpl.class).join(memberDTO);
		
		System.out.println("입력결과:"+result);
		//return "redirect:/";
		return "/user/member/joinResult";
	}

	// 아이디 중복 검사(AJAX)
	@RequestMapping("/member/idCheck.do")
	@ResponseBody
	public void check_id(@RequestParam("mem_id") String mem_id , HttpServletResponse resp) throws Exception{
		System.out.println(mem_id+"!!");
		int cnt  = sqlSession.getMapper(UserMemberImpl.class).check_id(mem_id);
		System.out.println(cnt);
		
		PrintWriter out = resp.getWriter();
		out.println(cnt);
		out.close();
	}
	// 이메일 중복 검사(AJAX)
	@ResponseBody
	@RequestMapping(value = "/member/emailCheck.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("mem_email") String mem_email, HttpServletResponse resp) throws Exception{
		int cnt = sqlSession.getMapper(UserMemberImpl.class).check_email(mem_email);
		
		PrintWriter out = resp.getWriter();
		out.println(cnt);
		out.close();
	}
	
	/*
	 경로 재설정 필요!!!!!!!!! 
	 */
	
	//수정처리
	@RequestMapping("/member/modifyAction.do")
	public String modifyAction(HttpSession session, MemberDTO memberDTO) {
		
		
		//수정 처리를 위한 메서드 호출
		int applyRow = sqlSession.getMapper(UserMemberImpl.class).modify(memberDTO);
		System.out.println("수정처리된 레코드수:"+ applyRow);
		
		//방명록 게시판은 상세보기 페이지가 없으므로 수정완료시 리스트로 이동한다.
		return "redirect:../admin/member/list.do";
	}
	
	//수정페이지
	@RequestMapping("/member/modify.do")
	public String modify(Model model, HttpServletRequest req, HttpSession session) {
		
		
		/*
		파라미터를 전달하는 4번째 방법으로 DTO(혹은 VO) 객체에 파라미터를 저장한 후
		Mapper로 전달한다. 폼값을 한번에 받을 수 있는 커맨트 객체와 비슷한 기능이다.
		 */
		// DTO 객체 생성
		ParameterDTO parameterDTO = new ParameterDTO();
		// 게시물의 일련번호 저장
		parameterDTO.setMem_id(req.getParameter("mem_id"));
		
		System.out.println("!!"+req.getParameter("mem_id"));
		
		//Mapper의 view메서드를 호출한다. 이 때 DTO 객체를 인수로 전달한다.
		MemberDTO dto = sqlSession.getMapper(UserMemberImpl.class).view(parameterDTO);
		
		model.addAttribute("dto", dto);
		return "/user/member/modify";
	}

	//삭제처리
	@RequestMapping("/member/delete.do")
	public String delete(HttpSession session, HttpServletRequest req) {
		//로그인 확인
		
		int applyRow = sqlSession.getMapper(UserMemberImpl.class).delete
			(req.getParameter("mem_id"));
		
		System.out.println(req.getParameter("mem_id"));
		
		System.out.println("삭제된행의갯수:"+ applyRow);
		return "redirect:list.do";
	}
	
	//이메일 전송 처리
	public void send_mail(MemberDTO member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "god110273@naver.com";
		String hostSMTPpwd = "enc0403";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "god110273@naver.com";
		String fromName = "CoffePass";
		String subject = "";
		String msg = "";
		
		
		subject = "CoffePass 임시 비밀번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += member.getMem_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += member.getMem_pw() + "</p></div>";
		
		// 받는 사람 E-Mail 주소
		String mail = member.getMem_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	//카카오 로그인
	 @RequestMapping("/member/kakaologin.do")
	    public String kakao(MemberDTO dto, HttpServletRequest req, HttpSession session) throws Exception{
	    	System.out.println(req.getParameter("kakaoemail"));
	    	System.out.println(req.getParameter("kakaoname"));
	    	System.out.println(req.getParameter("kakaogender"));
	    	
	    	//넘어온 카카오이메일을 KI 변수에 집어넣고 @기준으로 split한다
	    	String[] KI = req.getParameter("kakaoemail").split("@");
	    	//@기준으로 split 된 인덱스 첫번째 를 kakaoid 변수로 초기화
	    	String kakaoid = KI[0];
	    	
	    	System.out.println(kakaoid);
	    	
	    	String kakaoname = req.getParameter("kakaoname");
	    	String kakaogender = req.getParameter("kakaogender");
	    	String kakaoemail = req.getParameter("kakaoemail");
	    	
	    	dto.setMem_id(kakaoid);
	    	dto.setMem_name(kakaoname);
	    	dto.setMem_gender(kakaogender);
	    	dto.setMem_email(kakaoemail);
	    	
	    	
	    	//dto에 세팅한 정보를 바탕으로 아이디 및 이메일이 있는지 유효성 검사
	    	if(sqlSession.getMapper(UserMemberImpl.class).check_id(kakaoid) == 0 && sqlSession.getMapper(UserMemberImpl.class).check_email(kakaoemail) == 0) {
	    		
	    		//중복 아이디 , 이메일 없으면 카카오 정보로 회원가입 이 때 mem_case는 1로 하드코딩 해놨음 나머지는 없어용
	    		sqlSession.getMapper(UserMemberImpl.class).kakaojoin(dto);
	    	}else {
	    		//중복 아이디 , 이메일이 있는 경우 세션에 저장시키고 메인 페이지로 이동
	    		session.setAttribute("siteUserInfo", dto);
	    	}
	    	//메인 페이지 redirect로 설정 해야함
	    	return "home";
	    	
	    }
}
