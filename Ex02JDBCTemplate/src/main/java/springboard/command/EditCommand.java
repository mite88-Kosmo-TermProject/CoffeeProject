package springboard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

public class EditCommand implements BbsCommandImpl {
	
	@Override
	public void execute(Model model) {
		//model을 Map컬렉션으로 변환한 후 request내장객체를 가져온다. 
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		//일련번호를 파라미터로 받는다. 
		String idx = req.getParameter("idx");
	 
		//DAO객체 생성 후 일련번호에 해당하는 게시물을 가져와서 model에 저장한다. 
		JDBCTemplateDAO dao = new JDBCTemplateDAO();		
		SpringBbsDTO dto = dao.view(idx);
		model.addAttribute("viewRow", dto);
		//dao.close();
	}
}





