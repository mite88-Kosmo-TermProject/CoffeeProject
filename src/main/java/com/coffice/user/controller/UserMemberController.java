package com.coffice.user.controller;

import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserMemberController {

	// 로그인
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String login() {

		return "/user/member/login";
	}

	// 로그아웃
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public String logout() {

		return "/user/member/logout";
	}

	// 아이디 찾기
	@RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
	public String findId() {

		return "/user/member/findId";
	}

	// 아이디 찾기 결과
	@RequestMapping(value = "/member/findIdResult.do", method = RequestMethod.GET)
	public String findIdResult() {

		return "/user/member/findIdResult";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/member/findPw.do", method = RequestMethod.GET)
	public String findPw() {

		return "/user/member/findPw";
	}

	// 비밀번호 찾기 결과
	@RequestMapping(value = "/member/findPwResult.do", method = RequestMethod.GET)
	public String findPwResult() {

		return "/user/member/findPwResult";
	}
	
	// 회원가입전1단계
	@RequestMapping(value = "/member/signup.do", method = RequestMethod.GET)
	public String signup() {

		return "/user/member/signup";
	}

	// 회원가입
	@RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
	public String join() {

		return "/user/member/join";
	}

	// 아이디체크
	@RequestMapping(value = "/member/idCheck.do", method = RequestMethod.GET)
	public String idCheck() {

		return "/user/member/idCheck";
	}

	// 회원가입결과
	@RequestMapping(value = "/member/joinResult.do", method = RequestMethod.GET)
	public String joinResult() {

		return "/user/member/joinResult";
	}

	// 회원수정
	@RequestMapping(value = "/member/modify.do", method = RequestMethod.GET)
	public String modify() {

		return "/user/member/modify";
	}

	// 회원삭제
	@RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
	public String delete() {

		return "/user/member/delete";
	}
}
