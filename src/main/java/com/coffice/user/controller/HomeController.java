package com.coffice.user.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coffice.dto.*;
import com.coffice.user.service.HomeImpl;


@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		System.out.println("호출");
		ArrayList<StoresDTO>mainCafeList = new ArrayList<StoresDTO>();
		mainCafeList = sqlSession.getMapper(HomeImpl.class).getList();
		System.out.println(mainCafeList);
		model.addAttribute("mainCafeList",mainCafeList);
		return "home";
	}

	
	/*
	 * 상원
	 * 
	 * @RequestMapping("/edit.do") public String signup() {
	 * 
	 * return "/user/member/edit"; }
	 * 
	 * @RequestMapping("/ip.do") public String ip() {
	 * 
	 * return "/user/member/idpass"; }
	 * 
	 * @RequestMapping("/ns.do") public String ns() {
	 * 
	 * return "/user/member/nextsignup"; }
	 * 
	 * @RequestMapping("/id.do") public String id() {
	 * 
	 * return "/user/member/id"; }
	 * 
	 * @RequestMapping("/pw.do") public String pass() {
	 * 
	 * return "/user/member/pw"; }
	 * 
	 * @RequestMapping("/id2.do") public String id2() {
	 * 
	 * return "/user/member/id2"; }
	 * 
	 * @RequestMapping("/pw2.do") public String pass2() {
	 * 
	 * return "/user/member/pw2"; }
	 * 
	 * @RequestMapping("/naverid.do") public String naver() {
	 * 
	 * return "/user/member/naverid"; }
	 */

} 
















