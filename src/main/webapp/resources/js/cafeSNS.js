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
					console.log("콜백성공"+data);
					console.log(data[0].review_idx);
					/*append 부분*/
					$(data).each(function (index, data) {
						tableData +=""
						+'<div class="col-md-6 col-lg-4 mb-5">'
			            +'<div id="snsList">'
			            +    '<div class="username">'
			            +      '<img src="https://i.pinimg.com/236x/ec/f0/a1/ecf0a1fff1ddf788883644722b57d82c.jpg"/>'
			            +     '<span id="grade">'
			            +        '<div class="common-grade-badge d small has-text mb-2">'
			            +          '<i class="fas fa-coffee"></i>'
			            +          '<p>다이아</p>'
			            +        '</div>'
			            +      '</span>'
			            +      '<span id="name">'
			            +        '<b>'+data.memberDTO.mem_id+'</b>'
			            +           '</span>'
			            +      '<i class="fas fa-ellipsis-v"></i>'
			            +    '</div>'
			            +    '<div style="position: relative">'
			                   //사진
			            +      '<figure class="photoSet" data-count="2">'
			            +        '<a href="https://static-file.jejupass.com/download/781859?width=592&amp;height=473" '
			            +          'class="img-fluid"'
			            +          'data-lightbox="example-set">'
			            +          '<img src="https://static-file.jejupass.com/download/781859?width=592&amp;height=473"'
			            +           'class="img-fluid image"'
			            +            'id="post"/>'
			            +        '</a>'
			            +        '<a style="display: none"'
			            +         'href="https://static-file.jejupass.com/download/781860?width=592&amp;height=473"'
			            +         'class="img-fluid"'
			            +         'data-lightbox="example-set">'
			            +          '<img src="https://static-file.jejupass.com/download/781860?width=592&amp;height=473"'
			            +          'class="img-fluid image"'
			            +           'id="post"/>'
			            +        '</a>'
			            +      '</figure>'
			            +    '</div>'
			            +    '<div class="options">'
			            +      '<div class="username">'
			                    //업체정보
			            +        '<img src="https://i.pinimg.com/236x/ec/f0/a1/ecf0a1fff1ddf788883644722b57d82c.jpg"/>'
			            +        '<span id="cafename">'
			            + 		 '<b>'+data.storesDTO.store_name+'</b> </span>'
			            +        '<i class="far fa-heart fa-lg"'
			            +        'id="heart"'
			            +         'onclick="heart()"></i>'
			            +        '<span id="like">'
			            +'<i class="far fa-thumbs-up fa-lg" onclick="like()"></i>'
			            +          '<small>100</small></span></div></div>'
			            +    '<div class="info">'
			            +      '<div class="txt">'
			                    +data.review_content+
			                  '</div>'
			
			            +      '<span style="color: grey; font-size: 14px">별점:' +data.review_star+'</span>'
			            +    '</div>'
			            +    '<br />'
			            +  '</div>'
			            +'</div>'
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
					console.log("콜백성공"+data);
					console.log(data[0].review_idx);
					/*append 부분*/
					$(data).each(function (index, data) {
						tableData +=""
						+'<div class="col-md-6 col-lg-4 mb-5">'
			            +'<div id="snsList">'
			            +    '<div class="username">'
			            +      '<img src="https://i.pinimg.com/236x/ec/f0/a1/ecf0a1fff1ddf788883644722b57d82c.jpg"/>'
			            +     '<span id="grade">'
			            +        '<div class="common-grade-badge d small has-text mb-2">'
			            +          '<i class="fas fa-coffee"></i>'
			            +          '<p>다이아</p>'
			            +        '</div>'
			            +      '</span>'
			            +      '<span id="name">'
			            +        '<b>'+data.memberDTO.mem_id+'</b>'
			            +           '</span>'
			            +      '<i class="fas fa-ellipsis-v"></i>'
			            +    '</div>'
			            +    '<div style="position: relative">'
			                  //사진
			            +      '<figure class="photoSet" data-count="2">'
			            +        '<a href="https://static-file.jejupass.com/download/781859?width=592&amp;height=473" '
			            +          'class="img-fluid"'
			            +          'data-lightbox="example-set">'
			            +          '<img src="https://static-file.jejupass.com/download/781859?width=592&amp;height=473"'
			            +           'class="img-fluid image"'
			            +            'id="post"/>'
			            +        '</a>'
			            +        '<a style="display: none"'
			            +         'href="https://static-file.jejupass.com/download/781860?width=592&amp;height=473"'
			            +         'class="img-fluid"'
			            +         'data-lightbox="example-set">'
			            +          '<img src="https://static-file.jejupass.com/download/781860?width=592&amp;height=473"'
			            +          'class="img-fluid image"'
			            +           'id="post"/>'
			            +        '</a>'
			            +      '</figure>'
			            +    '</div>'
			            +    '<div class="options">'
			            +      '<div class="username">'
			                      //업체정보
			            +        '<img src="https://i.pinimg.com/236x/ec/f0/a1/ecf0a1fff1ddf788883644722b57d82c.jpg"/>'
			            +        '<span id="cafename">'
			            + 		 '<b>'+data.storesDTO.store_name+'</b> </span>'
			            +        '<i class="far fa-heart fa-lg"'
			            +        'id="heart"'
			            +         'onclick="heart()"></i>'
			            +        '<span id="like">'
			            +'<i class="far fa-thumbs-up fa-lg" onclick="like()"></i>'
			            +          '<small>100</small></span></div></div>'
			            +    '<div class="info">'
			            +      '<div class="txt">'
			                    +data.review_content+
			                  '</div>'
			
			            +      '<span style="color: grey; font-size: 14px">별점:' +data.review_star+'</span>'
			            +    '</div>'
			            +    '<br />'
			            +  '</div>'
			            +'</div>'
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
