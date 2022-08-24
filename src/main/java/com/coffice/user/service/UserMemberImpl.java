package com.coffice.user.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
/*
해당 인터페이스는 컨트롤러와 DAO 사이에서 매개역할을 하는 서비스 객체로 사용된다.
@Service 어노테이션은 빈을 자동으로 생성하기 위한 용도이지만 여기서는 단순히
역할을 명시하기 위한 표현으로 사용되었다. 따라서 필수 사항은 아니다.
 */

import com.coffice.dto.MemberDTO;
import com.coffice.dto.ParameterDTO;
import com.coffice.dto.StoresDTO;


@Service
public interface UserMemberImpl {
	
	/*
	방명록에서 게시물의 갯수를 카운트한다. 매개변수가 없으므로 항상 전체 게시물을
	대상으로 카운트 한다. 
	*/
	public int getTotalCount();
	/*
	매개변수로 전달된 s, e에 해당하는 게시물을 select하여 List형으로 반환한다.
	*/
	public ArrayList<MemberDTO> listPage(int s, int e);
	
	/*
	@Param 어노테이션을 통해 파라미터를 Mapper에서 사용할 수 있는 별칭을 부여한다.
	해당 별칭으로 쿼리문의 인파라미터로 사용할 수 있다.
	<insert>엘리먼트가 쿼리 실행 후 결과값을 정수로 반환하므로 반환타입을 명시하는것이
	좋다.
	*/
	public int join(MemberDTO memberDTO);
	
	public MemberDTO view(ParameterDTO parameterDTO);
	public StoresDTO view2(StoresDTO storesDTO);
	//public MemberDTO view(String mem_id);
	public int modify(MemberDTO memberDTO);
	
	public int delete(String idx);
	
	public int getTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<MemberDTO> listPageSearch(ParameterDTO parameterDTO);
	
	
	public MemberDTO login(String id, String pass);
	
	public String findId(MemberDTO memberDTO);
	
	public int updatepw(MemberDTO memberDTO);
	
	//비밀번호 찾기시에 필요함
	public int check1(String mem_id);
	public int check2(String mem_email);
	
	//회원 가입시 아이디 및 이메일 유효성 검사용
	public int check_id(String mem_id);
	public int check_email(String mem_email);
	
	public int kakaojoin(MemberDTO memberDTO);
	public String pw(String mem_id, String mem_eamil);
	public MemberDTO view_one(String mem_id);

}
