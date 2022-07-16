<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./commons/header.jsp" %>
<body> 
<div class="container">
    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>게시판 작성 - <small>자유게시판</small></h3>
            
            <form name="writeFrm" method="post" action="./replyAction.do"
			onsubmit="return checkValidate(this);">

			<input type="hidden" name="idx" value="${replyRow.idx}" /> <input
				type="hidden" name="nowPage" value="${param.nowPage}" /> <input
				type="hidden" name="bgroup" value="${replyRow.bgroup}" /> <input
				type="hidden" name="bstep" value="${replyRow.bstep}" /> <input
				type="hidden" name="bindent" value="${replyRow.bindent}" />

			<table class="table table-bordered">
				<colgroup>
					<col width="25%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="name" class="form-control" style="width: 50%;" /></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pass" class="form-control" style="width: 30%;" />
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" class="form-control" style="width: 90%;"
						value="${replyRow.title }" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="contents"
							style="width: 90%; height: 200px;">${replyRow.contents }</textarea>
					</td>
				</tr>
                </tbody>
                </table>

                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
                    	<button type="submit" class="btn btn-primary">작성완료</button>
						<button type="reset" class="btn btn-dark">RESET</button>
						<button type="button" class="btn btn-warning" onclick="location.href='./list.do';">
							리스트바로가기</button>
							
                        
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Copyright영역 -->
    <%@ include file="./commons/copyright.jsp" %>
</div>
</body>
</html>