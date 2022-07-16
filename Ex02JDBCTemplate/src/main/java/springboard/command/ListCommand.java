package springboard.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;
import springboard.util.EnvFileReader;
import springboard.util.PagingUtil;

/*
BbsCommandImpl 인터페이스를 구현했으므로 execute()는 반드시 오버라이딩
해야한다. 또한 해당 객체는 부모타입인 BbsCommandImpl 객체로 참조할 수 있다.  
 */
public class ListCommand implements BbsCommandImpl {

	@Override
	public void execute(Model model) {
		
		System.out.println("ListCommand > execute() 호출");
	
		/*
		컨트롤러에서 인자로 인달한 Model 객체에는 request객체가 저장되어있다. 
		asMap() 메서드를 통해 Map컬렉션으로 변환한 후 모든 요청을 얻어온다. 
		 */
		Map<String, Object> paramMap = model.asMap();
		/*
		Model객체에 저장될때 Object타입으로 저장되므로, 사용을 위해 원래의
		타입으로 형변환 해야한다. Model객체는 4가지 영역과 동일한 특성을 가진다. 
		 */
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
 
		//DAO객체 생성
		JDBCTemplateDAO dao = new JDBCTemplateDAO();
		
		//검색어 처리
		String addQueryString = "";
		//request내장객체를 통해 파라미터를 받아온다. 
		String searchColumn = req.getParameter("searchColumn");				
		String searchWord = req.getParameter("searchWord");
		/*
		list.do					  => searchWord가 null인 상태
		list.do?searchWord=		  => 빈값인 상태
		list.do?searchWord=노트북   => '노트북'이라는 값을 가진 상태
		*/
		//만약 검색어가 있다면...(null이 아니고 동시에 빈값도 아닐때)
		if(searchWord!=null && searchWord!=""){			
			//쿼리스트링 형태의 문자열을 생성한다. 
			addQueryString = String.format("searchColumn=%s"
				+"&searchWord=%s&", searchColumn, searchWord);
			//Map컬렉션에 2개의 폼값을 저장한다. 
			paramMap.put("Column", searchColumn);
			paramMap.put("Word", searchWord);
		}

		//전체 게시물 갯수 카운트
		int totalRecordCount = dao.getTotalCount(paramMap);
		
		/** 페이징 관련 기능start **/
		//Environment 객체를 통한 properties 파일을 읽어온다. 
		//한 페이지에 출력할 게시물의 갯수 설정 값
		int pageSize = Integer.parseInt(
				EnvFileReader.getValue("SpringBbsInit.properties", 
						"springBoard.pageSize"));
		//한 블럭에 출력할 페이지번호의 갯수 설정 값
		int blockPage = Integer.parseInt(
				EnvFileReader.getValue("SpringBbsInit.properties", 
						"springBoard.blockPage"));
		//전체 페이지수를 계산(전체 레코드 수 / 페이지 사이즈)
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		//현제 페이지 번호. 목록에 첫 진입시에는 무조건 1페이지로 설정한다. 
		int nowPage = req.getParameter("nowPage")==null ? 1 :
			Integer.parseInt(req.getParameter("nowPage"));
		//목록에 출력할 게시물의 구간을 계산한다. select문의 between절에 사용함.
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;

		paramMap.put("start", start);
		paramMap.put("end", end);		
		/** 페이징 관련 기능end **/
				
		//View에 출력할 레코드 가져오기(페이지처리없음) 
		//ArrayList<SpringBbsDTO> listRows = dao.list(paramMap);
		
		//페이지 처리 후 레코드 가져오기
		ArrayList<SpringBbsDTO> listRows = dao.listPage(paramMap);
				
		//출력할 게시물에 가상번호 추가
		int virtualNum = 0;
		int countNum = 0;
		//DAO에서 반환된 List컬렉션을 반복하여 데이터를 가공한다. 
		for(SpringBbsDTO row : listRows) {
			//전체 게시물의 갯수를 하나씩 차감하여 가상번호를 부여한다.(페이지처리X) 
			//virtualNum = totalRecordCount --;
			
			//페이지O(현재 페이지에 따른 가상번호 계산)
			virtualNum = totalRecordCount
					- (((nowPage-1)*pageSize) + countNum++);	
			
			
			//가상번호를 setter를 통해 DTO에 저장한다. 
			row.setVirtualNum(virtualNum);
			
			//답변글 출력시의 제목 처리부분
			String reSpace = "";
			if(row.getBindent() > 0) {
				for(int i=0 ; i<row.getBindent() ; i++) {
					reSpace += "&nbsp;&nbsp;";
				}
				row.setTitle(reSpace 
						+ "<img src='../resources/images/re3.gif'>" 
						+ row.getTitle());
			}
		}	
		
		//모델에 저장한다. 
		model.addAttribute("listRows", listRows);
		
		
		//페이지번호 출력 및 게시물 갯수 저장
		System.out.println("!!!!"+req.getContextPath());
		
		
		String pageingImg = PagingUtil.pageingImg(totalRecordCount,
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/board/list.do?"+addQueryString);
		model.addAttribute("pageingImg", pageingImg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		//검색이 있는경우 쿼리스트링을 View로 전달한다. 
		model.addAttribute("addQueryString", addQueryString);
				
		//컨트롤러에서 View의 경로를 반환한다. 
		
		/*
		JdbcTemplate을 사용할때는 자원반납은 하지않는다.
		스피링 컨테이너가 시작될때 자동으로 연결되는 부분이므로 자원이 반납되면
		다시 연결할 수 없기 때문이다. 스프링 컨테이너가 알아서 자원관리를 해준다.
		 */
		//dao.close();
	}
}

