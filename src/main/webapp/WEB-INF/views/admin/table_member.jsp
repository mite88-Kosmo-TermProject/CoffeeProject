

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table id="example" class="display" style="width: 100%">
	<thead>
		<tr>
			<th>회원구분</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>전화번호</th>
			<th>Email</th>
			<th>성별</th>
			<th>가입날짜</th>
			<th>-</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${member_list }" var="list">
		<tr>
			<c:choose>
				<c:when test="${list.mem_case eq 1 }"><td>일반회원</td></c:when>
				<c:when test="${list.mem_case eq 2 }"><td>제휴점주</td></c:when>
				<c:when test="${list.mem_case eq 3 }"><td>일반점주</td></c:when>
				<c:when test="${list.mem_case eq 4 }"><td>관리자</td></c:when>
			</c:choose>
			<td>${list.mem_id }</td>
			<td>${list.mem_pw }</td>
			<td>${list.mem_name }</td>
			<td>${list.mem_nickname }</td>
			<td>${list.mem_phone }</td>
			<td>${list.mem_email }</td>
			<td>${list.mem_gender }</td>
			<td>${list.mem_regidate }</td>
			<td><a href="../member/view.do">회원정보</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>