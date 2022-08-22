$(function(){
	$(document).on("click","span[name='like']",()=>{
		$.ajax({
		 url : "../like.do",
         type : "POST",
         data : { "review_idx" : $('#review_idx').val()
         },
	    success : (data)=> {
	       console.log(data);
           var x = $('#thumb');
	        if (data.likecheck==0) {
	          x.className = "fas fa-thumbs-up fa-lg";
	           $('#thumb').css("color","red");
	           $("#hit").text(data.like_hit);
	        } else {
	          x.className = "far fa-thumbs-up fa-lg";
	          $('#thumb').css("color","black");
	          $("#hit").text(data.like_hit);
	        }
         },
         error : function () {
            console.log("실패");
         },

		});
	});
});