<%-- /** *
<pre>
 * 1. 프로젝트명 : /cafeSNS/review.jsp
 * 2. 작성일 : 2022. 8. 1. 오전 9:42:37
 * 3. 작성자 : 전옥주
 * 4. 설명 : 카페SNS 리스트
 * </pre
>
*/ --%> <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- header -->
    <%@ include file="/WEB-INF/views/user/layout/header.jsp"%>
    <meta charset="utf-8" />
    <!-- 여기에 새로운 css파일있으면 넣기 -->

    <style>
      #snsList {
        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 10%),
          0 2px 4px -1px rgb(0 0 0 / 6%);
      }

      .username {
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 15px;
        padding-right: 20px;
        border-bottom: 1px solid grey;
        display: inline-grid;
        width: 100%;
        grid-template-columns: 1fr 3fr 1fr;
      }

      .username img {
        height: 50px;
        border-radius: 100%;
        grid-row-start: 1;
        grid-row-end: 3;
        grid-column-start: 1;
        grid-column-end: 1;
      }

      .username span {
        font-size: 1rem;
      }

      .username span#grade,
      .username span#cafename {
        grid-row-start: 1;
        grid-row-end: 1;
        grid-column-start: 2;
        grid-column-end: 2;
      }

      .username span#name,
      .username span#cafeaddr {
        grid-row-start: 2;
        grid-row-end: 2;
        grid-column-start: 2;
        grid-column-end: 2;
      }
      .username i:not(.fa-thumbs-up) {
        float: right;
        grid-row-start: 1;
        grid-row-end: 3;
        grid-column-start: 3;
        grid-column-end: 3;
        display: inline-grid;
        justify-content: end;
        vertical-align: middle;
        align-items: center;
        /*padding-top: 10px; */
      }

      i#heart {
        float: right;
        grid-row-start: 1;
        grid-row-end: 3;
        grid-column-start: 3;
        grid-column-end: 4;
        display: inline-grid;
        justify-content: end;
        vertical-align: middle;
        align-items: center;
        /*padding-top: 10px; */
      }

      span#like {
        float: right;
        grid-row-start: 1;
        grid-row-end: 3;
        grid-column-start: 5;
        grid-column-end: 5;
        display: inline-grid;
        justify-content: end;
        vertical-align: middle;
        align-items: center;
        /*padding-top: 10px; */
      }

      span#like .fa-thumbs-up {
        grid-row-start: 1;
        grid-row-end: 1;
        grid-column-start: 1;
        grid-column-end: 1;
      }

      span#like small {
        grid-row-start: 1;
        grid-row-end: 1;
        grid-column-start: 2;
        grid-column-end: 2;
      }

      .image {
        width: 100%;
      }

      .options {
        padding: 10px;
      }

      .options i {
        padding: 5px;
        cursor: pointer;
      }

      .red {
        color: red;
      }

      .right {
        float: right;
      }

      .info {
        padding-left: 15px;
      }

      .info img {
        height: 20px;
        width: 20px;
        border-radius: 100%;
        border: 3px solid white;
      }

      .info img:first-child {
        position: relative;
        z-index: 4;
      }

      .info img:nth-child(2) {
        position: relative;
        margin-left: -15px;
        z-index: 3;
      }

      .info img:nth-child(3) {
        position: relative;
        margin-left: -15px;
        z-index: 2;
      }
    </style>

    <!-- 리뷰 css -->
    <link
      href="<%= request.getContextPath() %>/resources/css/review.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <!-- content -->
    <!-- sns -->
    <div class="container">
      <div class="container-xxl py-5">
        <div class="container">
          <div class="section-title text-center" id="cafe_snsList">
            <h1 class="display-6 mb-5">리뷰</h1>
          </div>
          <div class="row g-4" id="show_data">
            <!-- snsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->

            <!-- // -->
          </div>

          <!-- 더보기버튼 -->
          <div class="row g-4">
            <div class="col-12">
              <button type="button" id="testbtn" class="btn btn-primary w-100">
                더보기
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- footer -->
  	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>
      <!-- 좋아요 JS(정순만) -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/like.js"></script>
    <script
      type="text/javascript" src="<%=request.getContextPath() %>/resources/js/cafeSNS.js"></script>


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
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css"
    />
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
