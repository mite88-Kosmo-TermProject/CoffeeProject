package com.coffice.user.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.coffice.dto.BoardDTO;
import com.coffice.dto.MemberDTO;
@Service
public interface BoardImpl {

	public ArrayList<BoardDTO> listPage(int s, int e, String board_flag);
	
	public int getTotalCountSearch(BoardDTO boardDTO);
	public int boardWrite(String board_title, String board_content, String mem_id, String board_flag);
	public int boardEdit(BoardDTO boardDTO);
	public int visitcountUp(int board_idx);
	public int boardDelete(BoardDTO boardDTO);
	public ArrayList<BoardDTO> listPageSearch(BoardDTO boardDTO);
	public ArrayList<BoardDTO> boardView(BoardDTO boardDTO);
	
	public int getTotalCountFlag(@Param("_flag") String board_flag);

	public ArrayList<MemberDTO> getMem(String mem_id);
}
