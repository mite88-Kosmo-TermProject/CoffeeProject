<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="layout">
   		<form action="/board/writepro" method="post" enctype="application/x-www-form-urlencoded">
   			<input name="title" type="text">
   			<textarea name="content"></textarea>
   			<input type="file">
   			<button type="submit">작성</button>
   		</form>
   </div>
</body>
</html>