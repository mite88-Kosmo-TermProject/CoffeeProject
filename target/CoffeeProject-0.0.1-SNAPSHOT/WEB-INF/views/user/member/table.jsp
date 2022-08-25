<%--
/**
게시판 페이지
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/img/icon.ico" />
<!DOCTYPE html>
<html lang="en">

<head>
<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>

<meta charset="utf-8">
<!-- 여기에 새로운 js,css파일있으면 넣기 -->
<link href="<%=request.getContextPath()%>/resources/assets/css/table.css" rel="stylesheet" type="text/css">
</head>



<!-- content -->
<body>

<br><br>
<br><br>
<br><br>
<br><br>
	<div class="table-users">
   <div class="header">공지사항</div>
   
   <table cellspacing="0">
      <tr>
         <th>Name</th>
         <th>Email</th>
         <th>Phone</th>
         <th width="230">Comments</th>
      </tr>

      <tr>
         <td>Jane Doe</td>
         <td>jane.doe@foo.com</td>
         <td>01 800 2000</td>
         <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </td>
      </tr>

      <tr>
         <td>John Doe</td>
         <td>john.doe@foo.com</td>
         <td>01 800 2000</td>
         <td>Blanditiis, aliquid numquam iure voluptatibus ut maiores explicabo ducimus neque, nesciunt rerum perferendis, inventore.</td>
      </tr>

      <tr>
         <td>Jane Smith</td>
         <td>jane.smith@foo.com</td>
         <td>01 800 2000</td>
         <td> Culpa praesentium unde pariatur fugit eos recusandae voluptas.</td>
      </tr>
      
      <tr>
         <td>John Smith</td>
         <td>john.smith@foo.com</td>
         <td>01 800 2000</td>
         <td>Aut voluptatum accusantium, eveniet, sapiente quaerat adipisci consequatur maxime temporibus quas, dolorem impedit.</td>
      </tr>
   </table>
</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
</body>



</html>