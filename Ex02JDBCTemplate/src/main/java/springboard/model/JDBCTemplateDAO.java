package springboard.model;

import java.io.InputStream;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.Array;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.NClob;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.Ref;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.RowId;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementCreatorFactory;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;
/*
JdbcTemplate 관련 주요메서드

Object queryForObject(String sql, RowMapper rm)
	: 하나의 레코드나 결과값을 반환하는 select 계열의 쿼리문을 실행한다. 
	
List query(String sql, RowMapper rm)
	: 여러개의 레코드를 반환하는 select 계열의 쿼리문을 실행한다. 
	
int update(String sql)
	: update, delete, insert 쿼리문을 실행한다. 
*/
public class JDBCTemplateDAO {
	//멤버변수 : servlet-context에서 생성한 자바빈을 주입받아 사용
	JdbcTemplate template;
	public JDBCTemplateDAO() {
		/*
		BbsController에서 @Autowired를 통해 자동 주입 받았던 빈을 정적변수인
		JdbcTemplateConst.template에 할당하였으므로, DB연결정보를 DAO에서
		바로 사용할 수 있다. 
		 */
		this.template = JdbcTemplateConst.template;
		System.out.println("JDBCTemplateDAO() 생성자 호출");
	}
	public void close() {
		//JDBCTemplate에서는 자원해제를 하지않는다. 
	}
	//게시물의 갯수 카운트
	public int getTotalCount(Map<String, Object> map)
	{
		//count(*)함수를 통해 게시물의 갯수를 카운트
		String sql = "SELECT COUNT(*) FROM springboard ";
		//검색어가 있는경우 where절을 추가한다. 
		if(map.get("Word")!=null){
			sql +=" WHERE "+map.get("Column")+" "
				+ " 	LIKE '%"+map.get("Word")+"%' ";				
		}
		//쿼리문을 실행한 후 결과값을 정수형으로 반환한다. 
		return template.queryForObject(sql, Integer.class);
	}
	
	//게시판 리스트 페이지 처리 없이 가져오기
	public ArrayList<SpringBbsDTO> list(Map<String, Object> map){
		
		//쿼리문 작성 및 검색어 처리
		String sql = "SELECT * FROM springboard ";				
		if(map.get("Word")!=null){
			sql +=" WHERE "+map.get("Column")+" "
				+ " LIKE '%"+map.get("Word")+"%' ";				
		}
		//답변글 처리 없는 일반적인 목록을 출력할때 사용
		//sql += " ORDER BY idx DESC";
		//답변글 기능을 추가했을때의 목록 출력
		sql += " ORDER BY bgroup DESC, bstep ASC";
		/*
		RowMapper가 select를 통해 얻어온 ResultSet을 갯수만큼 반복하여 
		DTO에 저장한 후 List컬렉션에 추가하여 반환한다. 그러므로 DAO에서
		개발자가 반복적으로 작성했던 코드를 생략할 수 있다. 	
		 */
		return (ArrayList<SpringBbsDTO>)template
				.query(sql, new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
	}	
	
	//리스트 가져오기(페이지 처리O)
	public ArrayList<SpringBbsDTO> listPage(Map<String, Object> map){
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM ("
				+"    SELECT Tb.*, rownum rNum FROM ("
				+"        SELECT * FROM springboard ";				
			if(map.get("Word")!=null){
				sql +=" WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' ";				
			}			
			sql += " ORDER BY bgroup DESC, bstep ASC "			
			+"    ) Tb"
			+")"
			//+" WHERE rNum BETWEEN ? and ?";
			+" WHERE rNum BETWEEN "+start+" and "+end;
 	
		return (ArrayList<SpringBbsDTO>)template.query(
				sql,				
				new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
		/*new Object[]{start, end},*/
	}
	
	//글쓰기 처리
	public int write(final SpringBbsDTO springBbsDTO) {
		 
		int result = template.update(new PreparedStatementCreator() {			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) 
					throws SQLException {
				
				//인파라미터가 있는 insert 쿼리문 작성
				String sql = "INSERT INTO springboard ("
					+ " idx, name, title, contents, hits "
					+ " ,bgroup, bstep, bindent, pass) "
					+ " VALUES ("
					+ " springboard_seq.NEXTVAL,?,?,?,0,"
					+ "	springboard_seq.NEXTVAL,0,0,?)";
				//익명클래스 내부에서 prepared객체 생성
				PreparedStatement psmt = con.prepareStatement(sql);
				//쿼리문에 인파라미터 설정
				psmt.setString(1, springBbsDTO.getName());
				psmt.setString(2, springBbsDTO.getTitle());
				psmt.setString(3, springBbsDTO.getContents());
				psmt.setString(4, springBbsDTO.getPass());
				//설정 후 완성된 쿼리문을 반환하면 update()메서드가 실행한 후 결과값 반환
				return psmt;
			}
		});		
		return result;
	}
	//조회수 증가하기
	public void updateHit(final String idx)
	{
		//인파라미터가 있는 쿼리문을 작성한 후 update() 메서드의 첫번째 인자로 전달한다. 
		String sql = "UPDATE springboard SET "
			+ " hits=hits+1 "
			+ " WHERE idx=? ";
		//PreparedStatementSetter를 익명클래스로 선언한 후 오버라이딩 한 
		//setValues() 메서드에서 인파라미터를 설정한다. 
		template.update(sql, new PreparedStatementSetter() {			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(idx));				
			}
		});
		//update()메서드는 int형의 반환값이 있지만 필요없는 경우 사용하지 않아도 된다. 
	}	
	//게시물 내용보기
	public SpringBbsDTO view(String idx)
	{		
		//조회수 증가 위한 메서드 호출
		updateHit(idx);		
		
		//일련번호에 해당하는 게시물을 얻어오기 위해 select 쿼리문 작성
		SpringBbsDTO dto = new SpringBbsDTO();		
		String sql = "SELECT * FROM springboard "
				+ " WHERE idx="+idx;	 
		/*
		queryForObject() 메서드는 쿼리문을 실행한 후 반드시 하나의 결과를 
		반환해야 한다. 그렇지 않으면 예외가 발생하므로 예외처리를 반드시 해줘야 한다.
		 */
		try {			 
			dto = template.queryForObject(sql, 
					new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
			/*
			BeanPropertyRowMapper 클래스는 쿼리의 실행결과를 DTO에 저장해주는 
			역할을 한다. 이때 테이블의 컬럼명과 DTO의 멤버변수명은 일치해야 한다. 
			 */
		}
		catch (Exception e) {
			System.out.println("View()실행시 예외발생");		 
		}
		return dto;
	}
	//패스워드 검증
	public int password(String idx, String pass) {
		int retNum = 0; 		
		String sql = "SELECT * FROM springboard "
				+ " WHERE pass='"+pass+"' AND idx="+idx;
		System.out.println(sql);
		try {
			//패스워드와 일련번호의 조건에 만족하는 레코드가 없는 경우 예외가 발생하므로
			//반드시 예외처리를 해야한다. 
			SpringBbsDTO dto = template.queryForObject(sql, 
				new BeanPropertyRowMapper<SpringBbsDTO>(
					SpringBbsDTO.class));
			/*
			일련번호는 시퀀스를 사용하므로 반드시 1이상의 값을 가지게 된다. 
			따라서 0이 반환된다면 패스워드 검증에 실패한 것으로 판단할 수 있다.
			 */
			retNum = dto.getIdx();
		}
		catch (Exception e) { 
			System.out.println("password() 예외발생");
		}
		
		return retNum;
	}

	//수정 처리
	/*
	메서드의 매개변수로 전달된 값을 익명클래스 내부에서 사용하려면 반드시
	final로 선언해야 한다는 Java의 문법이 있다. 하지만 현재(JDK11)는 
	에러가 발생하지 않으므로 아래에서 final을 제거해도 에러가 발생하지 않는다. 
	 */
	public void edit(final SpringBbsDTO dto)
	{
		//인파라미터가 있는 update 쿼리문 생성
		String sql = "UPDATE springboard "
			+ " SET name=?, title=?, contents=?"
			+ " WHERE idx=? AND pass=?";
		//첫번째 인자로 sql문, 두번째 인자로 인파라미터 설정을 위한 Object형 배열을 기술한다.
		template.update(sql, new Object[] {
			dto.getName(), dto.getTitle(), dto.getContents(),
			dto.getIdx(), dto.getPass()
		});
				 
//		template.update(sql, new PreparedStatementSetter() {
//			@Override
//			public void setValues(PreparedStatement ps) 
//					throws SQLException {
//				ps.setString(1, dto.getName());
//				ps.setString(2, dto.getTitle());
//				ps.setString(3, dto.getContents());
//				ps.setInt(4, dto.getIdx());
//				ps.setString(5, dto.getPass());
//			}			
//		});
		
	}
	
	//삭제처리
	public void delete(final String idx, final String pass){
		
		//인파라미터를 포함한 쿼리문 작성
		String sql = "DELETE FROM springboard "
			+ " WHERE idx=? AND pass=?";
		
		//인파라미터를 미리 세팅한다. 
		Object[] obj = new Object[] {idx, pass};
		
		//세팅된 변수를 매개변수로 전달한다. 
		template.update(sql, obj);
	
//		template.update(sql, new PreparedStatementSetter() {
//			@Override
//			public void setValues(PreparedStatement ps) 
//					throws SQLException {
//				ps.setString(1, idx);
//				ps.setString(2, pass);
//			}
//		});
	}

	public void reply(final SpringBbsDTO dto){
		
		//replyPrevUpdate(dto.getBgroup(), dto.getBstep());
		/*
		글쓰기의 경우 원본글이므로 idx와 bgroup은 같은 값을 가진다. 
		답변글은 원본글을 기반으로 작성되므로 idx는 새로운 시퀀스를 사용하면되고
		bgroup은 원본글과 동일한 값을 입력해야 한다. 
		 */
		String sql = "INSERT INTO springboard "
			+ " (idx, name, title, contents, pass, "
			+ "	bgroup, bstep, bindent) "
			+ " VALUES "
			+ " (springboard_seq.nextval, ?, ?, ?, ?,"
			+ " ?, ?, ?)";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getTitle());
				ps.setString(3, dto.getContents());
				ps.setString(4, dto.getPass());
				ps.setInt(5, dto.getBgroup());
				/*
				답변글은 원본글 하위에 노출되어야 하고, 또한 들여쓰기되어야 한다. 
				따라서 원본글에 +1 처리한 후 입력한다. 
				 */
				//동일 그룹내에서의 정렬순서
				ps.setInt(6, dto.getBstep()+1);
				//답변글 출력시 들여쓰기 깊이
				ps.setInt(7, dto.getBindent()+1); 
			}
		});
	}
	
	
	public void replyPrevUpdate(int gBroup, int bStep) {
		String sql = "update set springboard bstep=bstep+1 "
				+ " where bgroup=? and bstep=?";
		
		template.update(sql, new Object[] {
				
			});
	}
}
