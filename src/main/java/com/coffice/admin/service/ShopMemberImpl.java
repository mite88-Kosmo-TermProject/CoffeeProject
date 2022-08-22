package com.coffice.admin.service;

import java.util.ArrayList;
import java.util.List;

import com.coffice.dto.StoresDTO;

public interface ShopMemberImpl {
	public ArrayList<StoresDTO> getshopLists() throws Exception;
	public int update_Agree(String mem_id, String store_owner, int store_idx);
	public void update_User(String mem_id);
	public ArrayList<StoresDTO> check_name(String store_name);
}
