function(){
	
	var id = '<%=(String)session.getId()%>';
	if(id==null || id==''){
		alert('로그인 후 이용해주세요');
		return;
	}
	else{
		window.open("WebChat.do?chat_id="+id+"width=500,height=700");
	}
}