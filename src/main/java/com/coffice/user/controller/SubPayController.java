package com.coffice.user.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffice.dto.MemberDTO;
import com.coffice.dto.MemberSubInfoDTO;
import com.coffice.dto.SubParameterDTO;
import com.coffice.dto.SubPayDTO;
import com.coffice.dto.SubscriptionDTO;
import com.coffice.user.service.SubPaylmpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Controller
public class SubPayController {

	//Mybatis를 사용하기 위한 빈 자동주입
	@Autowired
	public SqlSession sqlSession;
	@Autowired
	public ReqPaymentScheduler scheduler;
	@Autowired
	PaymentFind find;
	
	// 패스구매(로그인 상태에서만 이용가능)
	@RequestMapping(value = "/order/subPay.do", method = RequestMethod.GET)
	public String subPay(Model model, HttpSession session, HttpServletRequest req, MemberDTO memberDTO) {

		//만약 세션영역에 siteUserInfo속성이 없다면 로그아웃 상태이므로...
		if(session.getAttribute("siteUserInfo")==null) {
			
			//로그인 완료후 진입을 위한 backUrl
			model.addAttribute("backUrl", "/user/order/subPay");
			//로그인 페이지로 이동한다. 
			return "redirect:/member/login.do";
		}
		
		//회원정보 결제창에 가져오기
		memberDTO = sqlSession.getMapper(SubPaylmpl.class)
			.user(((MemberDTO)session.getAttribute("siteUserInfo")).getMem_id());
		
		ArrayList<SubscriptionDTO> lists = sqlSession.getMapper(SubPaylmpl.class).subList();
		
		model.addAttribute("lists", lists);
		model.addAttribute("dto", memberDTO);
		
		//로그인상태라면 패스구매페이지 진입
		return "/user/order/subPay";
	}

	//첫결제
	@RequestMapping(value = "/order/insertSubscribe.do", method = RequestMethod.POST)
	public void insertSubscribe(HttpSession session, HttpServletRequest req, SubParameterDTO subParameterDTO) throws WriterException, IOException {
		
		long timestamp = 0;
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MINUTE, +1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm", Locale.KOREA);
		String date = sdf.format(cal.getTime());
		try {
			Date stp = sdf.parse(date);
			timestamp = stp.getTime()/1000;
			System.out.println("timestamp="+timestamp);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		} 
		System.out.println("timestamp===up===="+timestamp);
		subParameterDTO.setPay_next_order_date(String.valueOf(timestamp));
		
		
				
				
		
		subParameterDTO.setSub_coffee_num_left(Integer.parseInt(subParameterDTO.getSub_name().replaceAll("[^\\d]", "")));
		
		
		
		
		
		
		
		String root = req.getSession().getServletContext().getRealPath("resources"); // 현재 서비스가 돌아가고 있는 서블릿 경로의
		String roottest = req.getServletContext().getRealPath("resources"); // 현재 서비스가 돌아가고 있는 서블릿 경로의
																							// resources 폴더 찾기
		System.out.println("root = " + root);
		System.out.println("roottest = " + roottest);
		
		
		String savePath = root + "\\img\\qrcode\\"; // 파일 경로

		// 파일 경로가 없으면 생성하기
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdirs();
		}

		// 링크로 할 URL주소
		String url = "http://localhost:8082/CoffeeProject/order/subUsing.do";
		// 파일명
		String storeName = req.getParameter("storeName");
		
		System.out.println("url:"+url);

		// 링크 생성값
		String codeurl = new String(url.getBytes("UTF-8"), "ISO-8859-1");

		// QRCode 색상값
		int qrcodeColor = 0xFF2e4e96;
		// QRCode 배경색상값
		int backgroundColor = 0xFFFFFFFF;

		// QRCode 생성
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE, 200, 200); // 200,200은 width, height

		MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor, backgroundColor);
		BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);

		// 파일 이름에 저장한 날짜를 포함해주기 위해 date생성
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = storeName +"_"+ sdfm.format(new Date());

		// 파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
		File temp = new File(savePath + fileName + ".png");

		System.out.println(savePath + fileName + ".png");

		// ImageIO를 사용하여 파일쓰기
		ImageIO.write(bufferedImage, "png", temp);

		// 리턴은 사용자가 원하는 값을 리턴한다.
		// 작성자는 QRCode 파일의 이름을 넘겨주고 싶었음.
		String fn = fileName + ".png";
		
		subParameterDTO.setSub_qr_code(fn);
		
		int row = sqlSession.getMapper(SubPaylmpl.class).paymentInfo(subParameterDTO);
		System.out.println("입력된 구독수 = "+ row);
		
	}
	
	//정기결제 예약
	@RequestMapping(value = "/order/payment.do", method = RequestMethod.POST)
	@ResponseBody
	public void payment(@RequestParam Map<String, Object> map)
			throws JsonMappingException, JsonProcessingException {
		String customer_uid = (String)map.get("customer_uid");
		String price = (String)map.get("price");
		String merchant_uid = (String)map.get("merchant_uid");
		String sub_name = (String)map.get("sub_name");
		scheduler.startScheduler(customer_uid, price, merchant_uid, sub_name);
	}
	
	//예약 중지
	@RequestMapping(value = "/order/subStop.do", method = RequestMethod.GET)
	public String subStop() {
		System.out.println("subStop()들어옴");
		scheduler.stopScheduler();
		System.out.println("예약 중지함");
		
		/////돌아가는 경로 바꿀 필요있음.
		return "/user/order/subPayResult";
	}
	
	// 패스구매완료
	@RequestMapping(value = "/order/subPayResult.do", method = RequestMethod.GET)
	public String subPayResult(MemberSubInfoDTO memberSubInfoDTO, Model model, HttpServletRequest req) {
			
		return "/user/order/subPayResult";
	}
	
	//WebHook 으로 정기결제 정보받아서 저장
	@RequestMapping(value = "/order/subResult.do", method = RequestMethod.POST)
	public void subResult(@RequestBody JSONObject jsonObject, SubParameterDTO subParameterDTO) {
		
		//예약결제의 경우 imp_uid의 값이 imps_ 로 시작함. -> 첫결제시 중복으로 DB에 insert하려는걸 막기위한 if문
		if(jsonObject.get("imp_uid").toString().contains("imps_")) {
			
			System.out.println("jsonObject.get()="+ jsonObject.get("imp_uid"));
			String imp_uid = jsonObject.get("imp_uid").toString();
			//웹훅으로 데이터 받아오기
			String json = find.paymentFind(imp_uid);
			
			//다음 결제일 계산
			long timestamp = 0;
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MINUTE, +1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm", Locale.KOREA);
			String date = sdf.format(cal.getTime());
			try {
				Date stp = sdf.parse(date);
				timestamp = stp.getTime()/1000;
				System.out.println("timestamp="+timestamp);
			} catch (java.text.ParseException e) {
				e.printStackTrace();
			} 
			System.out.println("timestamp===down===="+timestamp);
			subParameterDTO.setPay_next_order_date(String.valueOf(timestamp));
			
			//JSON분해
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = null;
			try {
				jsonObj = (JSONObject) jsonParser.parse(json);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JSONObject resultJson = (JSONObject) jsonObj.get("response");
			
			//데이터 뽑기
			subParameterDTO.setPay_idx(resultJson.get("merchant_uid").toString());
			subParameterDTO.setMem_id(resultJson.get("customer_uid").toString());
			subParameterDTO.setPay_import_key(resultJson.get("imp_uid").toString());
			subParameterDTO.setPay_price(resultJson.get("amount").toString());
			subParameterDTO.setPay_result_status(resultJson.get("status").toString());
			subParameterDTO.setSub_name(resultJson.get("name").toString());
			subParameterDTO.setPay_successed_at(resultJson.get("paid_at").toString());
			subParameterDTO.setPay_case(resultJson.get("pg_provider").toString());
			
			subParameterDTO.setSub_coffee_num_left(Integer.parseInt(subParameterDTO.getSub_name().replaceAll("[^\\d]", "")));
			
			int result = sqlSession.getMapper(SubPaylmpl.class).paymentInfo(subParameterDTO);
			
			System.out.println("정기구독 입력수 = "+ result);
		}
	}
}
