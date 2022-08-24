package com.coffice.storeowner.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.coffice.dto.ImageDTO;
import com.coffice.dto.StoresDTO;
import com.coffice.user.service.CafeImpl;
import com.coffice.user.service.UserMemberImpl;

@Controller
public class StoreownerCafeController {

	@Autowired
	SqlSession sqlSession;

	// 카페정보 입력
	@RequestMapping(value = "/storeowner/cafe/edit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cafe_Edit(HttpServletRequest req, Model model, StoresDTO storesDTO, HttpSession session) {
		req.getParameter("mem_id");
		System.out.println("mem_id=" + req.getParameter("mem_id"));

		System.out.println(session.getAttribute("siteUserInfo"));
		StoresDTO edit = sqlSession.getMapper(UserMemberImpl.class).view2(storesDTO);
		System.out.println(edit);
		model.addAttribute("edit", edit);

		return "/storeowner/cafe/edit";

	}

	public static String getUuid() {
		// 생성된 원본 그대로 출력하기. 하이픈이 포함된 문자열임.
		String uuid = UUID.randomUUID().toString();
		System.out.println("생성된UUID-1:" + uuid);
		// 하이픈을 제거한 상태로 출력하기.
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된UUID-2:" + uuid);
		return uuid;
	}

	// 카페 정보 작성하기
	@RequestMapping(value = "/storeowner/cafe/editaction.do", method = RequestMethod.POST)
	public String edit(MultipartHttpServletRequest req, StoresDTO storesDTO, ImageDTO imageDTO, Model model,
			@RequestParam("file") MultipartFile file, @RequestParam HashMap<String, Object> commandMap
			,@RequestParam("multiFile") List<MultipartFile> multiFileList)
			throws Exception {

		storesDTO.setStore_idx(Integer.parseInt(req.getParameter("store_idx")));

		storesDTO.setStore_zipcode(req.getParameter("addr1"));
		storesDTO.setStore_roadaddr(req.getParameter("addr2"));
		storesDTO.setStore_localaddr(req.getParameter("addr3"));

		String tag = commandMap.get("arrayParam").toString();
		System.out.println(tag);
		storesDTO.setStore_tag(tag);

		sqlSession.getMapper(CafeImpl.class).edit(storesDTO);
		
		//다중 업로드
		String imgfiles = "";
		List<MultipartFile> fileList = req.getFiles("multiFile");
		System.out.println(fileList);
		System.out.println(fileList.get(0).getOriginalFilename());
		if (fileList.get(0).getOriginalFilename() != "") {
			String path = "C:/02Workspaces/k12Spring/CoffeeProject/src/main/webapp/resources/img/owner";
			//sqlSession.getMapper(CafeImpl.class).menuimgMD(storesDTO);

			for (MultipartFile mf : fileList) {
				String originalName = new String(mf.getOriginalFilename().getBytes(), "UTF-8");
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				String saveFileName = getUuid() + ext;
				mf.transferTo(new File(path + File.separator + saveFileName));
				
				
				if (imgfiles.equals("")) {
					imgfiles += saveFileName;
				} else {
					imgfiles += "/" + saveFileName;
				}
				
			}
			imageDTO.setImage_save(imgfiles);
			sqlSession.getMapper(CafeImpl.class).imgED(imageDTO);
			//sqlSession.getMapper(CafeImpl.class).imgin(storesDTO);
		}
		//단일 업로드
		file = req.getFile("file");
		String orf = file.getOriginalFilename();
		
		System.out.println("originFileName : " + orf);
		String path = "C:/02Workspaces/k12Spring/CoffeeProject/src/main/webapp/resources/img/owner/menu";
		String safeFile = getUuid() + orf;
		
		 try {
	            file.transferTo(new File(path+ File.separator +safeFile));
	            
	            storesDTO.setStore_menu(safeFile);
	            sqlSession.getMapper(CafeImpl.class).menuimgMD(storesDTO);
	            
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

		sqlSession.getMapper(UserMemberImpl.class).view2(storesDTO);

		int idx = storesDTO.getStore_idx();
		storesDTO.setStore_idx(idx);
		sqlSession.getMapper(CafeImpl.class).tagED(storesDTO);

		return "/storeowner/index";
	}

	// 카페 정보 수정하기
	@RequestMapping(value = "/storeowner/cafe/updateaction.do", method = RequestMethod.POST)
	public String update(MultipartHttpServletRequest req, StoresDTO storesDTO, ImageDTO imageDTO, Model model,
			@RequestParam HashMap<String, Object> commandMap,
			@RequestParam("file") MultipartFile file, @RequestParam("multiFile") List<MultipartFile> multiFileList) throws Exception {

		storesDTO.setStore_idx(Integer.parseInt(req.getParameter("store_idx")));
		imageDTO.setStore_idx((req.getParameter("store_idx")));

		storesDTO.setStore_zipcode(req.getParameter("addr1"));
		storesDTO.setStore_roadaddr(req.getParameter("addr2"));
		storesDTO.setStore_localaddr(req.getParameter("addr3"));

		String tag = commandMap.get("arrayParam").toString();

		System.out.println("Tag : " + tag);
		storesDTO.setStore_tag(tag);

		// 사진 업로드
		String imgfiles = "";
		List<MultipartFile> fileList = req.getFiles("multiFile");
		System.out.println(fileList);
		System.out.println(fileList.get(0).getOriginalFilename());
		if (fileList.get(0).getOriginalFilename() != "") {
			String path = "C:/02Workspaces/k12Spring/CoffeeProject/src/main/webapp/resources/img/owner";
			//sqlSession.getMapper(CafeImpl.class).menuimgMD(storesDTO);

			for (MultipartFile mf : fileList) {
				String originalName = new String(mf.getOriginalFilename().getBytes(), "UTF-8");
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				String saveFileName = getUuid() + ext;
				mf.transferTo(new File(path + File.separator + saveFileName));
				
				
				if (imgfiles.equals("")) {
					imgfiles += saveFileName;
				} else {
					imgfiles += "/" + saveFileName;
				}
				System.out.println("123123 : "+imgfiles);
				imageDTO.setImage_save(imgfiles);
				
			}
			sqlSession.getMapper(CafeImpl.class).imgMD(imageDTO);
		}
		file = req.getFile("file");
		String orf = file.getOriginalFilename();
		
		System.out.println("originFileName : " + orf);
		String path = "C:/02Workspaces/k12Spring/CoffeeProject/src/main/webapp/resources/img/owner/menu";
		String safeFile = getUuid() + orf;
		
		 try {
			 	file.transferTo(new File(path+ File.separator +safeFile));
	            
	            storesDTO.setStore_menu(safeFile);
	            sqlSession.getMapper(CafeImpl.class).menuimgMD(storesDTO);
	            
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

		/*
		 * MultipartFile mfile = null; List<Object> resultList = new
		 * ArrayList<Object>(); try { // 제목 폼값을 얻어온다. // 업로드폼의 file속성의 input상자가 2개이므로
		 * 갯수만큼 반복한다. java.util.Iterator<String> itr = req.getFileNames(); while
		 * (itr.hasNext()) { // 서버로 전송된 파일명을 읽어온다. mfile =
		 * req.getFile(itr.next().toString()); // 한글깨짐방지 처리 후 전송된 파일명을 가져온다. String
		 * originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");
		 * // 서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다. if ("".equals(originalName)) continue;
		 * // 파일명에서 확장자를 따낸다. String ext =
		 * originalName.substring(originalName.lastIndexOf('.'));
		 * 
		 * // UUID를 통해 생성된 문자열과 확장자를 결합해서 저장할 파일명을 생성한다. String saveFileName = getUuid()
		 * + ext;
		 * 
		 * System.out.println("SAVEFILE : " + saveFileName);
		 * 
		 * // storesDTO.setStore_menu(saveFileName); // 물리적경로에 새롭게 생성된 파일명으로 저장한다.
		 * mfile.transferTo(new File(path + File.separator + saveFileName)); if
		 * (imgfiles.equals("")) { imgfiles += saveFileName; } else { imgfiles += "/" +
		 * saveFileName; } } System.out.println("IMGFILES : " + imgfiles); String[]
		 * files = imgfiles.split("/");
		 * 
		 * 
		 * System.out.println("asdfsfsd" + storesDTO);
		 * sqlSession.getMapper(CafeImpl.class).menuimgMD(storesDTO); } catch (Exception
		 * e) { e.printStackTrace();
		 * 
		 * }
		 */
		sqlSession.getMapper(CafeImpl.class).cafemodify(storesDTO);
		StoresDTO edit = sqlSession.getMapper(UserMemberImpl.class).view2(storesDTO);
		model.addAttribute("edit", edit);

		int idx = storesDTO.getStore_idx();
		if (req.getParameter("store_tag") != null) {

			sqlSession.getMapper(CafeImpl.class).tagMD(storesDTO);
		}

		return "/storeowner/index";
	}

}
