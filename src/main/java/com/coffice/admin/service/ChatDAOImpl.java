package com.coffice.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coffice.dto.ChatDTO;


@Repository
public class ChatDAOImpl implements ChatDAO{
	@Autowired
	SqlSession session;
	String namespace="mybatis.mapper.admin.ChatMapper";
	
	@Override
	public List<ChatDTO> list(String sender) {
		return session.selectList(namespace + ".list", sender);
	}

	@Override
	public void insert(ChatDTO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(int id) {
		session.delete(namespace + ".delete", id);
	}

	@Override
	public int last(ChatDTO vo) {
		return session.selectOne(namespace + ".last", vo);
	}

	@Override
	public List<ChatDTO> listUser() {
		return session.selectList(namespace + ".listUser");
	}

	
}
