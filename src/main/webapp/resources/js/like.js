function like(x, idx , id){
var i = jQuery("i",x);
var t = jQuery("small", x);
console.log(id);
if(id==="null" || id===""){
	alert("로그인 후 이용해주세요");
	return false;
}
		$.ajax({
		 url : "../like.do",
         type : "POST",
         data : { "review_idx" : idx
         },
	    success : (data)=> {
	        if (data.likecheck==0) {
	           i.css("color","red");
	           t.text(data.like_hit);
	        } else {
	          i.css("color","black");
	          t.text(data.like_hit);
	        }
         },
         error : function () {
            console.log("실패");
         },

		});
}
