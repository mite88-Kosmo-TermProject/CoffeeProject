package com.coffice.admin.service;

import com.coffice.dto.*;

public interface MemberDAO {
	public MemberDTO login(String mem_id);
	public void join(MemberDTO memberDTO);
}
