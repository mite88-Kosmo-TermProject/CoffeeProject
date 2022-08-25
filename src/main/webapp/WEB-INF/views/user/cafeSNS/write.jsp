<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/img/icon.ico" />

<!DOCTYPE html>
<html lang="en">

<head>
<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>
<meta charset="UTF-8">
<title>리뷰작성</title>
<style type="text/css">

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
</style>
</head>
<body>
	<section class="review_write section py-5">
		<div class="container">
			<div class="row">
				<div class="col-12">
				<h2 class="mb-3">리뷰쓰기</h2>				
					<form name="fileFrm" method="post" action="<%=request.getContextPath()%>/cafeSNS/write.do" enctype="multipart/form-data">
						<input type="hidden" value="${idx }" name="idx">
						
					
						<div class="mb-3 form-floating">
						  <textarea class="form-control" placeholder="Leave a comment here" id="content" name="content"" style="height: 100px"></textarea>
						  <label for="content">내용</label>
						</div>
						
						  <div class="mb-3" style="display: inline-block;">
						    <label for="exampleInputEmail1" class="star">별점</label>
						    <div class="form-floating">
							  	<fieldset class="rating">
								    <input type="radio" id="star5" name="star" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
								    <input type="radio" id="star4" name="star" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
								    <input type="radio" id="star3" name="star" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
								    <input type="radio" id="star2" name="star" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
								    <input type="radio" id="star1" name="star" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
								</fieldset>
							</div>
						    
						  </div>
						
						
						<div class="mb-3">
						  <label for="userfile1" class="form-label">첨부파일1</label>
						  <input class="form-control" type="file" id="userfile1" name="userfile1">
						</div>
						
						<div class="mb-3">
						  <label for="userfile1" class="form-label">첨부파일2</label>
						  <input class="form-control" type="file" id="userfile2" name="userfile2">
						</div>
						
						<button type="submit" class="btn btn-danger">파일업로드</button>
						

					<%-- 	<table class="table table-bordered" style="width: 500px;">
							<colgroup>
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tr>
								<th>내용</th>
								<td><textarea name="content">
   			내용입력해주세요.
   			</textarea></td>
							</tr>
							<tr>
								<th>별점</th>
								<td><select name="star">
										<optgroup label="별점선택">별점선택
										</optgroup>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
								</select></td>
							</tr>
							<tr>
								<th>첨부파일1</th>
								<td><input type="file" name="userfile1" /></td>
							</tr>
							<tr>
								<th>첨부파일2</th>
								<td><input type="file" name="userfile2" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<button type="submit" class="btn btn-danger">파일업로드</button>
								</td>
							</tr>
						</table> --%>
					</form>
				</div>
			</div>

		</div>

	</section>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
</body>
</html>