package com.coffice.admin.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.coffice.admin.service.ChatDAO;
import com.coffice.dto.ChatDTO;


@RestController
public class AdminChatController {
	@Autowired
	ChatDAO dao;
	

	@RequestMapping("/admin/chat.json")
	public List<ChatDTO> list(@RequestParam("sender") String sender) {
		return dao.list(sender);
	}

	@RequestMapping("/admin/chat.user")
	public List<ChatDTO> listUser() {
		return dao.listUser();
	}

	@RequestMapping(value = "/admin/chat/insert", method = RequestMethod.POST)
	public int insert(ChatDTO chatDTO) {
		System.out.println(chatDTO.getSender());
		System.out.println(chatDTO.getMessage());
		System.out.println(chatDTO.getChat_id());

		dao.insert(chatDTO);
		int last = dao.last(chatDTO);
		System.out.println("last......." + last);
		return last;
	}

	@RequestMapping(value = "/admin/chat/delete", method = RequestMethod.POST)
	public void insert(int id) {
		dao.delete(id);
	}

	@RequestMapping("/admin/display")
	public byte[] display(String file, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
		String path = req.getRealPath("/resourecs/img/user");
		FileInputStream in = new FileInputStream(path + "/" + file);
		byte[] image = IOUtils.toByteArray(in);
		
		System.out.println("image:"+image);
		in.close();
		return image;
	}
}
