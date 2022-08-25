package com.coffice.admin.service;

import java.util.ArrayList;

import com.coffice.dto.SubscriptionDTO;

public interface SubDAOlmpl {

	public ArrayList<SubscriptionDTO> listSub();
	public SubscriptionDTO viewSub(Object idx);
	public int modifySub(Object name, Object price, Object cup, Object idx);
	public int deleteSub(int idx);
	public int addSub(Object obj1, Object obj2, Object obj3);
}
