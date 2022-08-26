<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
     <!-- header -->
    <%@ include file="/WEB-INF/views/user/layout/header.jsp"%>
    <meta charset="utf-8" />
    <!-- <link rel="icon" href="/favicon.ico" /> -->
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta name="description" content="Web site created using create-react-app" />
    <!-- <link rel="apple-touch-icon" href="/logo192.png" /> -->
    <link rel="manifest" href="/manifest.json" />
    <title>React App</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script defer="defer" src="<%= request.getContextPath() %>/resources/react/static/js/main.ead499dd.js"></script>
<link href="<%= request.getContextPath() %>/resources/react/static/css/main.8bbabe62.css" rel="stylesheet">
    
    
     <!-- 리뷰 css -->
    <link href="<%= request.getContextPath() %>/resources/css/review.css" rel="stylesheet"/>
</head>

<body>
    
    <div id="root"></div>
    
    
 	    <!-- footer -->
  	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
  <!-- 좋아요 JS(정순만) -->

    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/like.js"></script>
    

    <script>
      //찜(하트)
      function heart(x) {
        if (x.className === "far fa-heart fa-lg") {
          x.className = "fas fa-heart fa-lg";
          x.style.color = "red";
        } else {
          x.className = "far fa-heart fa-lg";
          x.style.color = "black";
        }
      }
      
    </script>

    <!-- 사진 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css"/>
    <script>
      $(function () {
        //사진보기
        lightbox.option({
          resizeDuration: 200,
          wrapAround: true,
          disableScrolling: false,
          fitImagesInViewport: false,
        });
        

      });
    </script>
    <!-- footer -->
   
  </body>
</html>