package com.coffice.admin.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.coffice.dto.*;

@Service
public interface MemberDAOImpl {
	public MemberDTO login(String mem_id);
	public int join(MemberDTO memberDTO);
	public MemberDTO login(String mem_id, String mem_pw, int mem_case);
	public MemberDTO baselogin(String mem_id, String mem_pw);
	public ArrayList<MemberDTO> Alliancelist();
}