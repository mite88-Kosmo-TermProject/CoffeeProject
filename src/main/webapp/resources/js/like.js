function like(x, idx){
var i = jQuery("i",x);
var t = jQuery("small", x);
console.log(x.style.color);
console.log(x.text);
		$.ajax({
		 url : "../like.do",
         type : "POST",
         data : { "review_idx" : idx
         },
	    success : (data)=> {
	       console.log(data);
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
