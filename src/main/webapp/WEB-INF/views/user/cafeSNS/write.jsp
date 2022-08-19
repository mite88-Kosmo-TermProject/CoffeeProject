<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <h2>파일업로드 폼</h2>
    
    <form name="fileFrm" method="post" action="<%=request.getContextPath() %>/cafeSNS/write.do" 
               enctype="multipart/form-data">
   	<input type="hid den" value="${idx }" name="idx">
    <table class="table table-bordered" style="width:500px;">
   	 <colgroup>
   		 <col width="20%" />
   		 <col width="*" />   		 
   	 </colgroup>
   	 <tr>
   		 <th>내용</th>
   		 <td>
   			<textarea name="content">
   			내용입력해주세요.
   			</textarea>
   		 </td>   		 
   	 </tr>
   	 <tr>
   	 	<th>별점</th>
   	 	<td>
   	 	<select name="star">
   	 		<optgroup label="별점선택">별점선택</optgroup>
   	 		<option value="1" >1</option>
   	 		<option value="2" >2</option>
   	 		<option value="3" >3</option>
   	 		<option value="4" >4</option>
   	 		<option value="5" >5</option>
   	 	</select>
   	 	</td>
   	 </tr>
   	 <tr>
   		 <th>첨부파일1</th>
   		 <td>
   			 <input type="file" name="userfile1" />
   		 </td>   		 
   	 </tr>
   	 <tr>
   		 <th>첨부파일2</th>
   		 <td>
   			 <input type="file" name="userfile2" />
   		 </td>   		 
   	 </tr>
   	 <tr>
   		 <td colspan="2" style="text-align:center;">
   			 <button type="submit" class="btn btn-danger">파일업로드</button>
   		 </td>   		 
   	 </tr>
    </table>
    </form>
</div>
</body>


</html>