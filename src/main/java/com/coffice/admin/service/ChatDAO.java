package com.coffice.admin.service;

import java.util.List;

import com.coffice.dto.ChatVO;

public interface ChatDAO {
	public List<ChatVO> list(String sender);
	public void insert(ChatVO vo);
	public void delete(int id);
	public int last(ChatVO vo);
	public List<ChatVO> listUser();
}
