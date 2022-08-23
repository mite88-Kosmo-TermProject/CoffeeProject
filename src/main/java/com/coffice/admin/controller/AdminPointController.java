package com.coffice.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.coffice.dto.EventDTO;
import com.coffice.dto.Event_ItemDTO;
import com.coffice.dto.PointDTO;
import com.coffice.dto.PointRuleDTO;
import com.coffice.service.AdminPointImpl;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;

import netscape.javascript.JSObject;

@Controller
public class AdminPointController {
	@Autowired
	private SqlSession sqlsession;
	// 어드민 포인트기본설정
	@RequestMapping(value = "/admin/point/index1.do", method = RequestMethod.GET)
	public String index1() {

		return "/admin/point/index1";
	}
	
		@RequestMapping(value = "/admin/point/list.do", method = RequestMethod.GET)
		public String iist() {

			return "/admin/point/list";
		}
	
	//어드민 포인트규칙보기(ajax)
	@RequestMapping(value = "/admin/point/getPointRule.do",method = RequestMethod.GET)
	@ResponseBody
	public JSONArray getPointRuleList() {
		JSONArray objLists = new JSONArray();
		ArrayList<PointRuleDTO> ruledto = sqlsession.getMapper(AdminPointImpl.class).getRuleList();
		System.out.println(ruledto);
		for(PointRuleDTO dto : ruledto ) {
			JSONObject ruleObj = new JSONObject();
			ruleObj.put("rule_name", dto.getRule_name());
			ruleObj.put("rule_point", dto.getRule_point());
			objLists.add(ruleObj);
		}
		return objLists;
	}
	
	//어드민페이지 포인트규칙설정
	@RequestMapping(value = "/admin/point/updatePointRule.do" , method = RequestMethod.GET)
	@ResponseBody
	public void setPointRule (HttpServletRequest req) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("회원가입", Integer.parseInt(req.getParameter("register")));
		paramMap.put("추천인", Integer.parseInt(req.getParameter("recommand")));
		paramMap.put("리뷰작성", Integer.parseInt(req.getParameter("review")));
		paramMap.put("리뷰삭제", Integer.parseInt(req.getParameter("deletereview")));
		
		sqlsession.getMapper(AdminPointImpl.class).setPointRule(paramMap);
		
	}


	// 어드민 포인트조회
	@RequestMapping(value = "/admin/point/getpointlist.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getPointlist(HttpServletRequest req) {
		JSONObject data = new JSONObject();
		JSONArray arr = new JSONArray();

		ArrayList<PointDTO> pointlist = sqlsession.getMapper(AdminPointImpl.class).getPointList();
		for(PointDTO dto : pointlist) {
			JSONObject data2 = new JSONObject();
			data2.put("point_idx", dto.getPoint_idx());
			data2.put("point_entry_exit", dto.getPoint_entry_exit());
			data2.put("mem_id", dto.getMem_id());
			data2.put("point_postdate", dto.getPoint_postdate());
			int rule = dto.getPoint_sources();
			String rulestr = null;
			switch (rule) {
				case 1:
					rulestr = "회원가입";
					break;
			
				case 2:
					rulestr = "리뷰작성";
					break;
				
				case 3:
					rulestr = "추천인";
					break;
				
				case 4:
					rulestr = "리뷰삭제";
					break;
			}
			data2.put("rule_idx", rulestr);
			arr.add(data2);
		}
		data.put("data", arr);
		return data;
	}
	// 어드민 포인트조건조회
		@RequestMapping(value = "/admin/point/getPointListToSearchFiled.do", method = RequestMethod.GET)
		@ResponseBody
		public JSONObject getPointlistToSearchFiled(HttpServletRequest req) {
			JSONObject data = new JSONObject();
			JSONArray arr = new JSONArray();
					
			ArrayList<PointDTO> pointlist = sqlsession.getMapper(AdminPointImpl.class).getPointList();
			for(PointDTO dto : pointlist) {
				JSONObject data2 = new JSONObject();
				data2.put("point_idx", dto.getPoint_idx());
				data2.put("point_entry_exit", dto.getPoint_entry_exit());
				data2.put("mem_id", dto.getMem_id());
				data2.put("point_postdate", dto.getPoint_postdate());
				int rule = dto.getPoint_sources();
				String rulestr = null;
				switch (rule) {
					case 1:
						rulestr = "회원가입";
						break;
				
					case 2:
						rulestr = "리뷰작성";
						break;
					
					case 3:
						rulestr = "추천인";
						break;
					
					case 4:
						rulestr = "리뷰삭제";
						break;
						
					case 5:
						rulestr = "출석체크";
						break;
				}
				data2.put("rule_idx", rulestr);
				arr.add(data2);
			}
			data.put("data", arr);
			return data;
		}
		
		// 어드민 회원포인트삭제하기
		@RequestMapping(value = "/admin/point/deletePoint.do", method = RequestMethod.GET)
		@ResponseBody
		public void deletePoint(HttpServletRequest req) throws ParseException {
			ArrayList<String> list = new ArrayList<String>();
			String param = req.getParameter("values");
			JSONParser jsonParse = new JSONParser();
			JSONArray jsonArr = (JSONArray) jsonParse.parse(param);
			jsonArr.toArray();
			for(int i =0; i<jsonArr.size(); i++) {
			list.add(jsonArr.get(i).toString());
			System.out.println("지우기");
			}
			sqlsession.getMapper(AdminPointImpl.class).deletePoint(list);
		}
		// 어드민 회원포인트insert하기
		@RequestMapping(value = "/admin/point/insertPoint.do", method = RequestMethod.GET)
		@ResponseBody
		public void insertPoint(HttpServletRequest req) {
			String user_name = req.getParameter("user");
			int point = Integer.parseInt(req.getParameter("point"));
			int select = Integer.parseInt(req.getParameter("select"));
			
			sqlsession.getMapper(AdminPointImpl.class).insertPoint(user_name, point, select);
		}
	// 어드민 출책이벤트설정(룰렛)
	@RequestMapping(value = "/admin/point/index2.do", method = RequestMethod.GET)
	public String index2() {
		
		return "/admin/point/index2";
	}

	// 이벤트 설정변경
	@RequestMapping(value = "/admin/point/eventSetting.do", method = RequestMethod.POST)
	public String eventSetting(@RequestParam("file") MultipartFile file , HttpServletRequest req)throws IllegalStateException {
		ServletContext servletContext = req.getSession().getServletContext();
	    String realPath = servletContext.getRealPath("/resources/img/event").replace( "\\" , "/");
		String eventName = req.getParameter("eventname");
		String eventImg = file.getOriginalFilename();
		String fileType = eventImg.substring(eventImg.lastIndexOf("."));
		String eventDesc = req.getParameter("desc");
		
		sqlsession.getMapper(AdminPointImpl.class).setEventSetting(eventName, fileType, eventDesc);
		
		if(! file.getOriginalFilename().isEmpty()) {
			try {
				file.transferTo(new File(realPath,"이벤트이미지"+fileType)) ;
			
			} catch (IOException e) {
				System.out.println("업로드실패");
				e.printStackTrace();
			}
				System.out.println("업로드성공!");  
		}
		return "/admin/point/index2";
	}
	//이벤트 환경설정미리보기
	@RequestMapping("/admin/point/loadeventsetting.do")
	@ResponseBody
	public JSONObject loadEventSetting () {
		ArrayList<EventDTO> evedto = sqlsession.getMapper(AdminPointImpl.class).loadEventSetting();
		JSONObject eventobj = new JSONObject();
		for(EventDTO dto : evedto) {
			eventobj.put("name", dto.getEvent_name());
			eventobj.put("desc", dto.getEvent_explanation());
		}
		return eventobj;
		
	}
	//이벤트 아이템항목 가져오기
	@RequestMapping("/admin/point/loadevent_item.do")
	@ResponseBody
	public JSONArray loadEventItem () {
		JSONArray topArray = new JSONArray();
		
		ArrayList<Event_ItemDTO> itemdto = sqlsession.getMapper(AdminPointImpl.class).loadEventItems();
		for(Event_ItemDTO dto : itemdto) {
			int i = 0;
			JSONArray arr = new JSONArray();
			arr.add(i++ , dto.getEvent_items_num());
			arr.add(i++ ,dto.getEvent_items_name());
			arr.add(i++ , dto.getEvent_items_prbbl());
			arr.add(i++ , dto.getEvent_items_result());
			topArray.add(arr);
			
		}
		return topArray;	
	}
	@RequestMapping("/admin/point/insertevent.do")
	public String insertEventItem (HttpServletRequest req) throws ParseException, JsonMappingException, JsonProcessingException {
		String data = req.getParameter("source");
		JSONParser dataparse = new JSONParser();
		JSONArray dataArr = (JSONArray)dataparse.parse(data);
		ArrayList<Map<String, Object>> objArray = new ArrayList<Map<String,Object>>();
		for(int i =0; i<dataArr.size(); i++) {
			System.out.println(dataArr.size());
			JSONArray eventItemArr = new JSONArray();
			eventItemArr = (JSONArray) dataArr.get(i);
			for(int j =0; j<1; j++) {
				Map<String, Object> map = new HashMap<String, Object>();
				JSONObject eventItemObj = new JSONObject();
				eventItemObj.put("event_items_num", eventItemArr.get(0));
				eventItemObj.put("event_items_name", eventItemArr.get(1));
				eventItemObj.put("event_items_prbbl", eventItemArr.get(2));
				eventItemObj.put("event_items_result", eventItemArr.get(3));
				System.out.println("eventItemArr[0]"+eventItemArr.get(0));
				System.out.println("eventItemObj"+j+":"+eventItemObj);
				map = new ObjectMapper().readValue(eventItemObj.toString(), Map.class);
				objArray.add(map);
			}
		}
		System.out.println(objArray);
		sqlsession.getMapper(AdminPointImpl.class).insertEventItems(objArray);
		
		return "redirect:/admin/point/index2";
		
	}
	


	// 어드민 회원포인트지급
	@RequestMapping(value = "/admin/point/pay.do", method = RequestMethod.GET)
	public String pay() {

		return "/admin/point/pay";
	}

}
