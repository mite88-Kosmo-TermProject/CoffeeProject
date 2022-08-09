var nowPage=0;
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
	        let distance = getdistance(latitude , longitude , list[i].storeDTO.store_latitude ,list[i].storeDTO.store_longitude ,"K");
	        list[i].distance = distance;

	        console.log(list[i].distance); 
	        //5 키로미터 이내의 카페를 저장해준다.
	        if(list[i].distance < 500){
	            newcafelist.push(list[i].review_idx);
	        }
	    }
	        console.log(newcafelist);
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
						+"<tr>"
						+"	<td>가게이름: "+data.storeDTO.store_name+"</td>"
						+"	<td>유저아이디: "+data.memberDTO.mem_id+"</td>"
						+"	<td>별점: "+data.review_star+"</td>"
						+"	<td>리뷰: "+data.review_content+"</td>"
						+"</tr>";
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
