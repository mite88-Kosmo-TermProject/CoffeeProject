package springboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import springboard.command.BbsCommandImpl;
import springboard.command.DeleteActionCommand;
import springboard.command.EditActionCommand;
import springboard.command.EditCommand;
import springboard.command.ListCommand;
import springboard.command.ReplyActionCommand;
import springboard.command.ReplyCommand;
import springboard.command.ViewCommand;
import springboard.command.WriteActionCommand;
import springboard.model.JDBCTemplateDAO;
import springboard.model.JdbcTemplateConst;
import springboard.model.SpringBbsDTO;
 
/*
기본패키지로 설정한 곳에 컨트롤러를 선언하면 요청이 들어왔을때 
Auto scan된다. 이를 통해 요청을 전달할 메서드를 찾는다. 해당 설정은
servlet-context.xml에서 추가한다.  
 */
@Controller
public class BbsController {
	 
	/*
	@Autowired 
		: 스프링 설정파일에서 미리 생성한 빈을 자동으로 주입받고 싶을때 사용한다. 
		빈의 타입을 기반으로 자동주입되며, 만약 해당 타입의 빈이 존재하지 않으면
		에러가 발생되어 서버를 시작할 수 없다. 
		-생성자, 멤버변수, 메서드(setter)에서 사용할 수 있다. 
		-타입을 이용해서 자동으로 프로퍼티 값을 설정한다. 
		-해당 어노테이션은 메서드 내의 지역변수에는 적용할 수 없다. 
		-타입을 통해 주입되므로 같은 타입이 2개 이상 존재해도 예외가 발생한다. 
	 */
	private JdbcTemplate template; 
	@Autowired 
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired=>JdbcTemplate 연결성공");
		/*
		template을 sevice객체에서 사용하기 위해 static으로 선언한 변수에
		할당한다. static 변수는 프로그램 시작시에 로딩되어 언제든 접근할 수 있는
		특징이 있다. 
		 */
		JdbcTemplateConst.template = this.template;
	}
	
	/*
	멤버변수로 선언하여 클래스에서 전역적으로 사용할 수 있다. 해당 클래스의 
	모든 Command(서비스)객체는 해당 인터페이스를 구현하여 정의한다. 
	 */
	BbsCommandImpl command = null;	
	 
	@RequestMapping("/board/list.do")
	public String list(Model model, HttpServletRequest req) {
		/*
		사용자로부터 받은 모든 요청은 request객체에 저장되고, 이를 
		ListCommand객체로 전달하기 위해 Model객체에 저장한 후 매개변수로
		전달한다. 
		 */
		//request객체 자체를 Model에 저장한다. 
		model.addAttribute("req", req);
		//Service객체인 ListCommand를 생성한다. 
		command = new ListCommand();
		//Service객체로 Model을 전달한다. 
		command.execute(model);
		
		return "bootSkin/listT";
	}

	//글쓰기 페이지로 진입하기 위한 매핑처리	
	@RequestMapping("/board/write.do")
	public String write(Model model) {
		return "bootSkin/writeT";
	}
	//전송방식이 post  이므로 value, method까지 같이 기술해서 매핑한다.
	@RequestMapping(value="/board/writeAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, 
			SpringBbsDTO springBbsDTO) {
		/*
		글쓰기 페이지에서 전송된 모든 폼값은 SpringBbsDTO객체를 통해 한번에
		전송 받을 수 있다. 이와같은 클래스를 커맨드객체라고 표현한다. 
		 */
		//request, DTO객체를 Model에 저장
		model.addAttribute("req", req);
		model.addAttribute("springBbsDTO", springBbsDTO);
		//Service객체 생성 후 매개변수로 전달
		command = new WriteActionCommand();
		command.execute(model);
		
		//View를 반환하지 않고, 지정된 URL(요청명)로 이동한다. 
		return "redirect:list.do?nowPage=1";
	}
	//글 내용보기
	@RequestMapping("/board/view.do")
	public String view(Model model, HttpServletRequest req)
	{
		//사용자의 요청을 저장한 request객체를 Model객체에 저장한 후 전달한다. 
		model.addAttribute("req", req);
		command = new ViewCommand();
		command.execute(model);

		return "bootSkin/viewT";
	}
	//패스워드 검증 페이지 매핑	
	@RequestMapping("/board/password.do")
	public String password(Model model,	HttpServletRequest req)
	{
		//일련번호는 request를 통해 전달받은후 Model에 저장
		model.addAttribute("idx", req.getParameter("idx"));
		return "bootSkin/passwordT";
	}
	//패스워드 검증 후 수정 혹은 삭제 처리
	@RequestMapping("/board/passwordAction.do")
	public String passwordAction(Model model, HttpServletRequest req)
	{
		//파라미터가 많은 경우 별도의 VO(DTO)를 생성하여 한번에 받는게 좋음.
		String modePage = null;
		String mode = req.getParameter("mode");
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		String pass = req.getParameter("pass");
		
		//DAO에서 일련번호와 패스워드를 통해 검증
		JDBCTemplateDAO dao = new JDBCTemplateDAO();		
		int rowExist = dao.password(idx, pass);
		
		if(rowExist<=0) {
			//패스워드 검증에 실패한 경우 이전페이지인 패스워드검증 페이지로 돌아간다. 
			//Model객체에 에러메세지를 저장한 후 view로 전달한다. 
			model.addAttribute("isCorrMsg", "패스워드가 일치하지 않습니다");
			//idx는 컨트롤러에서 받아 model에 저장한 후 View에서 EL로 출력한다. 
			//따라서 검증에 실패한 경우 idx는 별도로 model에 저장한후 View를 호출해야한다.
			model.addAttribute("idx", idx);
			modePage = "bootSkin/passwordT";
		}
		else {
			//검증에 성공한 경우 수정 혹은 삭제 처리를 한다. 
			System.out.println("검증완료");	
			
			if(mode.equals("edit")){
				//수정을 선택한 경우라면 수정페이지로 진입해야한다. 
				//모든 요청을 model에 저장한 후 View를 반환한다. 
				model.addAttribute("req", req);
				command = new EditCommand();
				command.execute(model);
				modePage = "bootSkin/editT";
			}
			else if(mode.equals("delete")){
				//삭제를 선택한 경우라면 별도의 이동없이 즉시 삭제하면 된다. 
				model.addAttribute("req", req);
				command = new DeleteActionCommand();
				command.execute(model);
				//삭제를 완료하면 리스트로 이동한다. 
				model.addAttribute("nowPage", req.getParameter("nowPage"));
				modePage = "redirect:list.do";			
			}			
		} 

		return modePage;
	}	
	
	//수정 처리
	@RequestMapping("/board/editAction.do")
	public String editAction(HttpServletRequest req, Model model, 
			SpringBbsDTO springBbsDTO){
		/*
		request내장객체와 전송된 폼값을 한꺼번에 받을수 있는 커맨드객체인 DTO클래스를
		매개변수로 선언하고, 전달을 위해 model객체에 저장한다. 
		 */
		model.addAttribute("req", req);
		model.addAttribute("springBbsDTO", springBbsDTO);
		command = new EditActionCommand();
		command.execute(model);
		
		/*
		수정이 완료되면 상세보기 화면으로 이동한다. 이때 게시물의 일련번호가 
		파라미터로 필요한데, model객체에 저장한 후 redirect 하면
		"view.do?idx=xxx&nowPage=xxx"와 같이 URL이 생성된다. 
		 */
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:view.do";
	}
	
	//답변글 작성폼
	@RequestMapping("/board/reply.do")
	public String reply(HttpServletRequest req, Model model){

		model.addAttribute("req", req);
		command = new ReplyCommand();
		command.execute(model);

		model.addAttribute("idx", req.getParameter("idx"));
		return "bootSkin/replyT";
	}
	
	//답변글 쓰기 처리
	@RequestMapping("/board/replyAction.do")
	public String replyAction(HttpServletRequest req, Model model, 
			SpringBbsDTO springBbsDTO){
		
		model.addAttribute("springBbsDTO", springBbsDTO);
		model.addAttribute("req", req);
		command = new ReplyActionCommand();
		command.execute(model);

		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:list.do";
	} 
	
}
