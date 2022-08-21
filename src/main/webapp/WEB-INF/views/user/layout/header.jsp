<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Coffee Pass</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="./resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<%= request.getContextPath() %>/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
	<link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<%= request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
    
  
</head>

<body>

<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->


	<!-- Topbar Start -->
	
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
		<a href="<%=request.getContextPath() %>"
			class="navbar-brand d-flex align-items-center px-4 px-lg-5">
			<h2 class="m-0 text-primary">Coffee Pass</h2>
		</a>
		<button type="button" class="navbar-toggler me-4"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<a href="<%=request.getContextPath() %>/cafe/map.do" class="nav-item nav-link active">검색</a> 
				<a href="<%=request.getContextPath() %>/cafeSNS/review.do" class="nav-item nav-link">카페SNS</a> 
				<a href="<%=request.getContextPath() %>/community/boardList.do" class="nav-item nav-link">게시판</a>
				<c:if test="${sessionScope.siteUserInfo!=null}">
               <span style="float:right;">
                  <a href="<%=request.getContextPath() %>/mypage/main.do?" class="nav-item nav-link">마이페이지</a>
               </span>
           		</c:if>
               <span style="float:right;">
                  <a href="<%=request.getContextPath() %>/order/subPay.do" class="nav-item nav-link">패스구매</a>
               </span>
				
				
				
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown">Pages</a>
					<div class="dropdown-menu fade-up m-0">
						<a href="feature.html" class="dropdown-item">Feature</a> <a
							href="quote.html" class="dropdown-item">Free Quote</a> <a
							href="team.html" class="dropdown-item">Our Team</a> <a
							href="testimonial.html" class="dropdown-item">Testimonial</a> <a
							href="404.html" class="dropdown-item">404 Page</a>
					</div>
				</div>

			</div>
			<c:if test="${sessionScope.siteUserInfo!=null}">
               <span style="float:right;">
                  <a href="<%=request.getContextPath() %>/member/logout.do">로그아웃</a>
                  
               </span>
            </c:if>
            <c:if test="${sessionScope.siteUserInfo==null}">
               <a href="<%= request.getContextPath() %>/member/login.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i>
			</a>
            </c:if>
		</div>
	</nav>
	<!-- Navbar End -->
</body>