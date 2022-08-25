var nowPage=1;
//거리 계산해주는 함수...


    
function getdistance(lat1, lon1, lat2, lon2, unit) {
    if ((lat1 == lat2) && (lon1 == lon2)) {
        return 0;
    }
    else {
        var radlat1 = Math.PI * lat1/180;
        var radlat2 = Math.PI * lat2/180;
        var theta = lon1-lon2;
        var radtheta = Math.PI * theta/180;
        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        if (dist > 1) {
            dist = 1;
        }
        dist = Math.acos(dist);
        dist = dist * 180/Math.PI;
        dist = dist * 60 * 1.1515;
        if (unit=="K") { dist = dist * 1.609344 }
        if (unit=="N") { dist = dist * 0.8684 }
        return dist;
    }
}
$(function(){
   
      $.ajax({
      type : 'get',
      url : '../cafeSNS/getList.do',
      dataType : "json",
      async : false,
      success : getCafeList,
      error : function (error) {
         console.log("ajax에러 발생" + error);
      }
   });
});

function getCafeList(list){
   for(let i=0; i<list.length; i++){
      /* console.log(list[i]); */
   }
   navigator.geolocation.getCurrentPosition(showPosition, showError);
   // 위치얻기에 성공한 경우 호출되는 콜백함수
   function showPosition(position){
       // 위도와 경도를 얻어와서 변수에 저장
       var latitude = position.coords.latitude;
       var longitude = position.coords.longitude;
       var newcafelist = [];
       
       //거리계산..
       for(let i=0; i<list.length; i++){
           let distance = getdistance(latitude , longitude , list[i].storesDTO.store_latitude ,list[i].storesDTO.store_longitude ,"K");
           list[i].distance = distance;

           console.log(list[i].distance); 
           //5 키로미터 이내의 카페를 저장해준다.
           if(list[i].distance < 50){
               newcafelist.push(list[i].review_idx);
           }
       }
           console.log(newcafelist);
          $(function(){
           $.ajax({
              type : 'POST',
              url : '../cafeSNS/newcafelist?nowPage='+nowPage,
              data :{"list": newcafelist},
              async : false,
              dataType : 'json',
              success : function (data) {
                 let tableData="";
               //console.log("콜백성공"+data);
               //console.log(data[0].review_idx);
               var user = data.user;
               console.log(user);
               var check_like = data.check_like;
               console.log(check_like);
               
               /*append 부분*/
               $(data.lists).each(function (index, data) {
               var star = data.review_star;
					var star_txt = "";
					for (var i = 1; i < 6; i++) {
						if(i<= star){
							star_txt += '<i class="fas fa-star" style="color:orange;"></i>';
						}
						else{
							star_txt += '<i class="far fa-star" style="color:orange;"></i>';
						}
					}
               var color = "black";
               for(var i =0; i<check_like.length; i++){
               		if(check_like[i].review_idx == data.review_idx){
               			console.log(check_like[i].review_idx+"==="+ data.review_idx);
               			color = "red";
               			break;
               		}
               }
               
               if(data.imageDTO.image_save!=null){
				console.log(data);
	
                  var files = data.imageDTO.image_save.split("/");
                  console.log(files[0]);
                   tableData +=""
                  +'<div class="col-md-6 col-lg-4 mb-5">'
                     +'<div id="snsList">'
                     +    '<div class="username">'
        			 +      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" />'
                     +     '<span id="grade">'
                     +        '<div class="common-grade-badge d small has-text mb-2">'
                     +          '<i class="fas fa-coffee"></i>'
                     +          '<p>카페리뷰</p>'
                     +		  '<input type="hidden" id="review_idx" value="'+data.review_idx+'"/>'
                     +        '</div>'
                     +      '</span>'
                    +      '<span id="name">';
                     if (data.memberDTO.mem_nickname == null ||
					   data.memberDTO.mem_nickname == undefined ||
					   data.memberDTO.mem_nickname == "null") {
					   tableData += '<b>비회원</b>';
				   } else {
					   tableData += '<b>' + data.memberDTO.mem_nickname + '</b>';
				   }
				   tableData += '</span>'
                     +      '<i class="fas fa-ellipsis-v"></i>'
                     +    '</div>'
                     +    '<div style="position: relative">'
                          //사진
                     +      '<figure class="photoSet" data-count="2">'
                     +        '<a href="../resources/img/review/'+files[0]+'?max-width=592&amp;height=473" '
                     +          'class="img-fluid"'
                     +          'data-lightbox="example-set'+data.review_idx+'">'
                     +          '<img src="../resources/img/review/'+files[0]+'?max-width=592&amp;height=473"'
                     +           'class="img-fluid image"'
                     +            'id="post"/>'
                     +        '</a>'
                     +        '<a style="display: none"'
                     +         'href="../resources/img/review/'+files[1]+'?max-width=592&amp;height=473"'
                     +         'class="img-fluid"'
                     +         'data-lightbox="example-set'+data.review_idx+'">'
                     +          '<img src="../resources/img/review/'+files[1]+'?max-width=592&amp;height=473"'
                     +          'class="img-fluid image"'
                     +           'id="post"/>'
                     +        '</a>'
                     +      '</figure>'
                     +    '</div>'
                     +    '<div class="options">'
                     +      '<div class="username">'
                             //업체정보
        			 +      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" />'
                     +        '<span id="cafename">'
                     +        '<a href="../cafe/info.do?store_idx='+data.storesDTO.store_idx+'" style="color:#222;"><b>'
                     +data.storesDTO.store_name+'</b> </a></span>'
                     //+        '<i class="far fa-heart fa-lg"'
                     //+        'id="heart"'
                     //+         'onclick="heart(this)"></i>'
                     +        `<span name="like" id="like" onclick="like(this,`+ data.review_idx+`,'`+user+`')">`
                     +		'<i class="far fa-thumbs-up fa-lg" id="thumb" style="color:'+color+' ;"  ></i>'
                     +          '<small name="hit" id="hit">'+data.like_hit+'</small></span>'
                     +		'</div>'
                     +'</div>'
                     +    '<div class="info">'
                     +      '<div class="txt">'
                             +data.review_content+
                           '</div>'
                     +	'<div class="rating-box" style="text-align: left;">'
					 + star_txt
					 +		'</div></div>'
                     +    '</div>'
                     +    '<br />'
                     +  '</div>'
                     +'</div>'
               }
               else{
                  tableData +=""
                  +'<div class="col-md-6 col-lg-4 mb-5">'
                     +'<div id="snsList">'
                     +    '<div class="username">'
        			+      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" />'
                     +     '<span id="grade">'
                     +        '<div class="common-grade-badge d small has-text mb-2">'
                     +          '<i class="fas fa-coffee"></i>'
                     +          '<p>카페리뷰</p>'
                     +        '</div>'
                     +      '</span>'
                     +      '<span id="name">';
                     if (data.memberDTO.mem_nickname == null ||
					   data.memberDTO.mem_nickname == undefined ||
					   data.memberDTO.mem_nickname == "null") {
					   tableData += '<b>비회원</b>';
				   } else {
					   tableData += '<b>' + data.memberDTO.mem_nickname + '</b>';
				   }
				   tableData += '</span>'
                     +      '<i class="fas fa-ellipsis-v"></i>'
                     +    '</div>'
                     +    '<div style="position: relative">'
                          //사진
                     +      '<figure class="photoSet" data-count="2">'
                     +        '<a href="https://static-file.jejupass.com/download/781859?max-width=592&amp;height=473" '
                     +          'class="img-fluid"'
                     +          'data-lightbox="example-set'+data.review_idx+'">'
                     +          '<img src="https://static-file.jejupass.com/download/781859?max-width=592&amp;height=473"'
                     +           'class="img-fluid image"'
                     +            'id="post"/>'
                     +        '</a>'
                     +        '<a style="display: none"'
                     +         'href="https://static-file.jejupass.com/download/781860?max-width=592&amp;height=473"'
                     +         'class="img-fluid"'
                     +         'data-lightbox="example-set'+data.review_idx+'">'
                     +          '<img src="https://static-file.jejupass.com/download/781860?max-width=592&amp;height=473"'
                     +          'class="img-fluid image"'
                     +           'id="post"/>'
                     +        '</a>'
                     +      '</figure>'
                     +    '</div>'
                     +    '<div class="options">'
                     +      '<div class="username">'
							//like에 보낼 리뷰 idx 값(정순만)
                     +		  '<input type="hidden" id="review_idx" value="'+data.review_idx+'"/>'
        			      +      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" />'
                     +        '<span id="cafename">'
                    +        '<a href="../cafe/info.do?store_idx='+data.storesDTO.store_idx+'" style="color:#222;"><b>'
                     +data.storesDTO.store_name+'</b> </a></span>'
                    // +        '<i class="far fa-heart fa-lg"'
                    // +        'id="heart"'
                    // +         'onclick="heart()"></i>'
                     +        `<span name="like" id="like" onclick="like(this,`+ data.review_idx+`,'`+user+`')">`
                     +		'<i class="far fa-thumbs-up fa-lg" id="thumb" style="color:'+color+' ;"  ></i>'
                     +          '<small name="hit" id="hit">'+data.like_hit+'</small></span>'
                     +		'<i class="bi bi-trash3">리뷰삭제</i>'
                     +		'</div></div>'
                     +    '<div class="info">'
                     +      '<div class="txt">'
                             +data.review_content+
                           '</div>'
         			 +	'<div class="rating-box" style="text-align: left;">'
					 + star_txt
					 +		'</div></div>'
                     +    '</div>'
                     +    '<br />'
                     +  '</div>'
                     +'</div>'
                  }
               });
               $('#show_data').append(tableData);
               
            },
              error : function (err) {
               console.log("에러발생" + err.status);
            }
           })});
           $('#testbtn').on("click",function(){
              nowPage++;
           $.ajax({
              type : 'POST',
              url : '../cafeSNS/newcafelist?nowPage='+nowPage,
              data :{"list": newcafelist},
              async : false,
              dataType : 'json',
              success : function (data) {
                 let tableData="";
               //console.log("콜백성공"+data);
               //console.log(data[0].review_idx);
               var user = data.user;
               var check_like = data.check_like;
               /*append 부분*/
               $(data.lists).each(function (index, data) {
                var star = data.review_star;
					var star_txt = "";
					for (var i = 1; i < 6; i++) {
						if(i<= star){
							star_txt += '<i class="fas fa-star" style="color:orange;"></i>';
						}
						else{
							star_txt += '<i class="far fa-star" style="color:orange;"></i>';
						}
					}
               var color = "black";
               for(var i =0; i<check_like.length; i++){
               		if(check_like[i].review_idx == data.review_idx){
               			console.log(check_like[i].review_idx+"==="+ data.review_idx);
               			color = "red";
               			break;
               		}
               }
               
               if(data.imageDTO.image_save!=null){
                  var files = data.imageDTO.image_save.split("/");
                  console.log(files[0]);
                   tableData +=""
                  +'<div class="col-md-6 col-lg-4 mb-5">'
                     +'<div id="snsList">'
                     +    '<div class="username">'
        			+      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" />'
                     +     '<span id="grade">'
                     +        '<div class="common-grade-badge d small has-text mb-2">'
                     +          '<i class="fas fa-coffee"></i>'
                     +          '<p>카페리뷰</p>'
                     +		  '<input type="hidden" id="review_idx" value="'+data.review_idx+'"/>'
                     +        '</div>'
                     +      '</span>'
                    +      '<span id="name">';
                     if (data.memberDTO.mem_nickname == null ||
					   data.memberDTO.mem_nickname == undefined ||
					   data.memberDTO.mem_nickname == "null") {
					   tableData += '<b>비회원</b>';
				   } else {
					   tableData += '<b>' + data.memberDTO.mem_nickname + '</b>';
				   }
				   tableData += '</span>'
                     +      '<i class="fas fa-ellipsis-v"></i>'
                     +    '</div>'
                     +    '<div style="position: relative">'
                          //사진
                     +      '<figure class="photoSet" data-count="2">'
                     +        '<a href="../resources/img/review/'+files[0]+'?max-width=592&amp;height=473" '
                     +          'class="img-fluid"'
                     +          'data-lightbox="example-set'+data.review_idx+'">'
                     +          '<img src="../resources/img/review/'+files[0]+'?max-width=592&amp;height=473"'
                     +           'class="img-fluid image"'
                     +            'id="post"/>'
                     +        '</a>'
                     +        '<a style="display: none"'
                     +         'href="../resources/img/review/'+files[1]+'?max-width=592&amp;height=473"'
                     +         'class="img-fluid"'
                     +         'data-lightbox="example-set'+data.review_idx+'">'
                     +          '<img src="../resources/img/review/'+files[1]+'?max-width=592&amp;height=473"'
                     +          'class="img-fluid image"'
                     +           'id="post"/>'
                     +        '</a>'
                     +      '</figure>'
                     +    '</div>'
                     +    '<div class="options">'
                     +      '<div class="username">'
                             //업체정보
        			 +      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" />'
                     +        '<span id="cafename">'
                     +        '<a href="../cafe/info.do?store_idx='+data.storesDTO.store_idx+'" style="color:#222;"><b>'
                     +data.storesDTO.store_name+'</b> </a></span>'
                     //+        '<i class="far fa-heart fa-lg"'
                     //+        'id="heart"'
                     //+         'onclick="heart(this)"></i>'
                     +        `<span name="like" id="like" onclick="like(this,`+ data.review_idx+`,'`+user+`')">`
                     +		'<i class="far fa-thumbs-up fa-lg" id="thumb" style="color:'+color+' ;"  ></i>'
                     +          '<small name="hit" id="hit">'+data.like_hit+'</small></span>'
                     +		'</div></div>'
                     
                     +    '<div class="info">'
                     +      '<div class="txt">'
                             +data.review_content+
                           '</div>'
         			 +	'<div class="rating-box" style="text-align: left;">'
					 + star_txt
					 +		'</div></div>'
                     +    '</div>'
                     +    '<br />'
                     +  '</div>'
                     +'</div>'
               }
               else{
                  tableData +=""
                  +'<div class="col-md-6 col-lg-4 mb-5">'
                     +'<div id="snsList">'
                     +    '<div class="username">'
        			 +      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" />'
                     +     '<span id="grade">'
                     +        '<div class="common-grade-badge d small has-text mb-2">'
                     +          '<i class="fas fa-coffee"></i>'
                     +          '<p>카페리뷰</p>'
                     +        '</div>'
                     +      '</span>'
                     +      '<span id="name">';
                     if (data.memberDTO.mem_nickname == null ||
					   data.memberDTO.mem_nickname == undefined ||
					   data.memberDTO.mem_nickname == "null") {
					   tableData += '<b>비회원</b>';
				   } else {
					   tableData += '<b>' + data.memberDTO.mem_nickname + '</b>';
				   }
				   tableData += '</span>'
                     +      '<i class="fas fa-ellipsis-v"></i>'
                     +    '</div>'
                     +    '<div style="position: relative">'
                          //사진
                     +      '<figure class="photoSet" data-count="2">'
                     +        '<a href="https://static-file.jejupass.com/download/781859?max-width=592&amp;height=473" '
                     +          'class="img-fluid"'
                     +          'data-lightbox="example-set'+data.review_idx+'">'
                     +          '<img src="https://static-file.jejupass.com/download/781859?max-width=592&amp;height=473"'
                     +           'class="img-fluid image"'
                     +            'id="post"/>'
                     +        '</a>'
                     +        '<a style="display: none"'
                     +         'href="https://static-file.jejupass.com/download/781860?max-width=592&amp;height=473"'
                     +         'class="img-fluid"'
                     +         'data-lightbox="example-set'+data.review_idx+'">'
                     +          '<img src="https://static-file.jejupass.com/download/781860?max-width=592&amp;height=473"'
                     +          'class="img-fluid image"'
                     +           'id="post"/>'
                     +        '</a>'
                     +      '</figure>'
                     +    '</div>'
                     +    '<div class="options">'
                     +      '<div class="username">'
							//like에 보낼 리뷰 idx 값(정순만)
        			      +      '<img src="../resources/img/user/'+data.memberDTO.mem_img+'"   onerror="this.style.display=&#39;none&#39;" />'
                     +        '<span id="cafename">'
                     +        '<a href="../cafe/info.do?store_idx='+data.storesDTO.store_idx+'" style="color:#222;"><b>'
                     +data.storesDTO.store_name+'</b> </a></span>'
                     //+        '<i class="far fa-heart fa-lg"'
                     //+        'id="heart"'
                     //+         'onclick="heart()"></i>'
                     +        `<span name="like" id="like" onclick="like(this,`+ data.review_idx+`,'`+user+`')">`
                     +		'<i class="far fa-thumbs-up fa-lg" id="thumb" style="color:'+color+' ;"  ></i>'
                     +          '<small name="hit" id="hit">'+data.like_hit+'</small></span>'
                     +		'</div></div>'
                     
                     +    '<div class="info">'
                     +      '<div class="txt">'
                             +data.review_content+
                           '</div>'
                     +	'<div class="rating-box" style="text-align: left;">'
					 + star_txt
					 +		'</div></div>'
                     +    '</div>'
                     +    '<br />'
                     +  '</div>'
                     +'</div>'
                  }
               });
               $('#show_data').append(tableData);
            },
              error : function (err) {
               console.log("에러발생" + err.status);
            }
           })});

   };
   // 실패했을때 호출되는 콜백함수
   var showError = function(error){
       switch(error.code){
           case error.UNKNOWN_ERROR:
               span.innerHTML ="알수없는 오류 발생";break;
               case error.PERMISSION_DENIED:
               span.innerHTML ="권한이 없습니다.";break;
               case error.POSITION_UNAVAILABLE:
               span.innerHTML ="위치 확인불가";break;
               case error.TIMEOUT:
               span.innerHTML ="시간초과";break;
       }
   }
}