package com.coffice.admin.service;

import java.util.List;

import com.coffice.dto.*;

public interface ChatDAO {
	public List<ChatDTO> list(String sender);
	public void insert(ChatDTO vo);
	public void delete(int id);
	public int last(ChatDTO vo);
	public List<ChatDTO> listUser();
}
