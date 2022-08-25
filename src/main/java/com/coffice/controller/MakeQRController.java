package com.coffice.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

//QR코드
@Controller
public class MakeQRController {
	
	@RequestMapping(value = "/makeOR.do", method = RequestMethod.GET)
	public String makeOR(HttpServletRequest request, HttpSession session) throws WriterException, IOException {

		return "/makeOR";

	}

	@ResponseBody
	@RequestMapping("/order/makeQRajax.do")
	public String makeQRajax(HttpServletRequest request, HttpSession session) throws WriterException, IOException {

		String root = request.getSession().getServletContext().getRealPath("resources"); // 현재 서비스가 돌아가고 있는 서블릿 경로의
		String roottest = request.getServletContext().getRealPath("resources"); // 현재 서비스가 돌아가고 있는 서블릿 경로의
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
		String url = request.getParameter("url");
		// 파일명
		String storeName = request.getParameter("storeName");
		
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = storeName +"_"+ sdf.format(new Date());

		// 파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
		File temp = new File(savePath + fileName + ".png");

		System.out.println(savePath + fileName + ".png");

		// ImageIO를 사용하여 파일쓰기
		ImageIO.write(bufferedImage, "png", temp);

		// 리턴은 사용자가 원하는 값을 리턴한다.
		// 작성자는 QRCode 파일의 이름을 넘겨주고 싶었음.
		return fileName + ".png";

	}
	
	//차감하기
	@RequestMapping(value = "/PayQR.do", method = RequestMethod.GET)
	public String PayQR(HttpServletRequest request, HttpSession session, Model model) throws WriterException, IOException {

		//String img = request.getParameter("img");
		return "/PayQR";

	}


}
