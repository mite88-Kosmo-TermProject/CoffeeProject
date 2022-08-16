package com.coffice.admin.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coffice.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	SqlSession session;
	String namespace="mybatis.mapper.admin.MemberMapper";
	
	@Override
	public MemberVO login(String mem_id) {
		return session.selectOne(namespace + ".login", mem_id);
	}

}
