package com.coffice.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.coffice.dto.EventDTO;
import com.coffice.dto.Event_ItemDTO;
import com.coffice.dto.PointDTO;
import com.coffice.dto.PointRuleDTO;

@Service
public interface AdminPointImpl {

	public ArrayList<PointRuleDTO> getRuleList ();
	public void setPointRule(@Param("paramMap") Map<String, Object> obj);
	public ArrayList<PointDTO> getPointList ();
	public ArrayList<PointDTO> getPointListToSearchFiled (@Param("search") int search);
	public void deletePoint(@Param("numList") ArrayList<String> str);
	public void insertPoint(Object obj1,Object obj2, Object obj3);
	public void setEventSetting(Object obj1,Object obj2, Object obj3);
	public ArrayList<EventDTO> loadEventSetting ();
	public ArrayList<Event_ItemDTO> loadEventItems();
	public void insertEventItems(@Param("arraylist") ArrayList<Map<String, Object>> objArray);
	
}
