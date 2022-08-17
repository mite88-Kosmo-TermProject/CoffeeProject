package com.coffice.storeowner.controller;

import java.io.FileInputStream;
import java.net.http.HttpRequest;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.coffice.admin.service.*;
import com.coffice.dto.*;


@RestController
public class StoreownerChatController {
	@Autowired
	ChatDAO dao;
	

	@RequestMapping("/storeowner/chat.json")
	public List<ChatVO> list(@RequestParam("sender") String sender) {
		return dao.list(sender);
	}

	@RequestMapping("/storeowner/chat.user")
	public List<ChatVO> listUser() {
		return dao.listUser();
	}

	@RequestMapping(value = "/storeowner/chat/insert", method = RequestMethod.POST)
	public int insert(ChatVO chatvo) {
		System.out.println(chatvo.getSender());
		System.out.println(chatvo.getMessage());
		System.out.println(chatvo.getChat_id());

		dao.insert(chatvo);
		int last = dao.last(chatvo);
		System.out.println("last......." + last);
		return last;
	}

	@RequestMapping(value = "/storeowner/chat/delete", method = RequestMethod.POST)
	public void insert(int id) {
		dao.delete(id);
	}

	@RequestMapping("/storeowner/display")
	public byte[] display(String file, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
		String path = req.getRealPath("/resourecs/img/user");
		FileInputStream in = new FileInputStream(path + "/" + file);
		byte[] image = IOUtils.toByteArray(in);
		in.close();
		return image;
	}
}
