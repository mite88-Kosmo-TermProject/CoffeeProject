package com.coffice.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coffice.dto.MemberDTO;

@Service
public class MemberDAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	// 아이디 중복 검사
	public int check_id(String id) throws Exception{
		return sqlsession.selectOne("member.check_id", id);
	}
	
	// 이메일 중복 검사
	public int check_email(String email) throws Exception{
		return sqlsession.selectOne("member.check_email", email);
	}
	
	
	@Transactional
	public int update_pw(MemberDTO member) throws Exception{
		return sqlsession.update("member.update_pw", member);
	}
	
	public MemberDTO login(String id) throws Exception{
		return sqlsession.selectOne("member.login", id);
	}
	
}
