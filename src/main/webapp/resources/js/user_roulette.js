		var source = [];
		var roulette = document.getElementById("roulette");
		var percentage = [];
		var JSONList = [];
		var rouletteitemsRatio = document.querySelectorAll("#item-wrapper > .item");
		var rouletteitemsLineRatio = document.querySelectorAll("#line-wrapper > .line");
		var pass = document.getElementById("pass").value;
		var modalTitle = document.getElementById("modal-title"); 
		var modalBody = document.getElementById("modal-body");
		var point = 0;
		
		function setSource(){
			$.ajax({
				url:'../admin/point/loadevent_item.do',
				dataType:'json',
				success:function(data){
					source = data;
					calculateItemAndRatio(data);
					setRotate(JSONList);
				},
				error:function(msg){
					console.log(msg);
				}
			});
		 }
		function loadEventSetting(){
			$.ajax({
				url:'../admin/point/loadeventsetting.do',
				dataType:'json',
				success:function(data){		
					console.log(data.name);			
					modalTitle.innerText = data.name;
					modalBody.style.background = "url('/CoffeeProject/resources/img/event/"+data.img+"')"
					modalBody.style.backgroundSize = "90%";
				},
				error:function(msg){
					console.log(msg);
				}
			});
		}
		 
		 function resoretdarray(){
			if(percentage.length <= 0){
			for(let i =0; i<source.length; i++){
				percentage.push(source[i][2]) ;
				percentage.sort(compaer);
				}
				
			}
			else{
				return;
			}
		 }
		 function compaer(a,b){
			return a-b;
		 }
		 
		 function MakeSetRouletteStr(){
			 	resoretdarray();
				var itemPlusRatio = 360/source.length;
				Str = "";
				Str +="var ratio = 0; \n"
				Str +="var ranNum = Math.floor(Math.random()*100);"
				Str +="var maxRatio =0 ;"
				Str +="var minRatio =0 ;"
				Str += "console.log(percentage);"
				Str += "console.log('ranNum:'+ranNum);"
				Str +="if(ranNum <= percentage[0]) {\n"
				Str +="minRatio =(JSONList[JSONList.length-1].itemLineRatio)+1 ;\n"
				Str +="maxRatio = 360+(JSONList[0].itemLineRatio) \n"
				Str +="ratio = Math.floor((Math.random()*(maxRatio-minRatio))+minRatio);\n"
				Str +="for(let a =0; a<JSONList.length; a++) { \n"	
				Str +="if(JSONList[a].itemPercentage === percentage[0] ) {\n"
				Str +="point = JSONList[a].itemPoint\n"
				Str +="console.log('point:'+point);"
				Str +="}\n"
				Str +="}\n"
				Str +="}\n"		
				for(let j = 1 ; j<source.length; j++){
				Str +="else if( ranNum <= percentage["+j+"]) {\n"
				Str +="for(let a =0; a<JSONList.length; a++) { \n"
				Str +="if(JSONList[a].itemPercentage === percentage["+j+"] ) {\n"
				Str +="minRatio =(JSONList[a-1].itemLineRatio)+1 ;\n"
				Str +="console.log('min:'+minRatio);"
				Str +="maxRatio = JSONList[a].itemLineRatio \n"
				Str +="console.log('max:'+maxRatio);"
				Str +="point = JSONList[a].itemPoint\n"
				Str +="console.log('point:'+point);"
				Str +="}\n"
				Str +="}\n"
				Str +="ratio = Math.floor((Math.random()*(maxRatio-minRatio))+minRatio);\n"
				Str +="}\n"
				}
				/*Str +="else {\n"
				Str +="\n"
				Str +="}\n"*/
			eval(Str);
			console.log(ratio);
			animateRoulette(ratio);
			

		 }
		 function calculateItemAndRatio(data){
			var itemsNum = data.length;
			var itemPlusRatio = 360/data.length;
			var itemLineFirstRatio = itemPlusRatio/2;
			var firstItemRatio = 0;
			console.log(itemsNum);
			console.log(itemPlusRatio);
			console.log(itemLineFirstRatio);
			for(let i =0; i<itemsNum; i++){
				var datas = new Object;
				datas.itemNum = data[i][0];
				datas.itemName = data[i][1];
				datas.itemPercentage = data[i][2];
				datas.itemPoint = data[i][3];
				datas.itemRatio = firstItemRatio;
				datas.itemLineRatio = itemLineFirstRatio;
				JSONList.push(datas);
				itemLineFirstRatio = itemLineFirstRatio+itemPlusRatio;
				firstItemRatio = firstItemRatio+itemPlusRatio;
			}
			console.log(JSON.stringify(JSONList));
			addRouletteItens(JSONList);
		 }
		 function addRouletteItens(data){
			var itemStr = "";
			var itemLineStr = "";
			console.log(source.length);
			for(let i = 0; i<source.length; i++){
			 	itemStr += '<div class="item">'+data[i].itemName+'</div>\n';
				itemLineStr += '<div class="line"></div>\n';
					//document.getElementsByClassName("item")[s].style.transform = "rotate("+data.itemRatio+"deg)";
					//document.getElementsByClassName("line")[s].style.transform =  "rotate("+data.itemLineRatio+"deg)";
				}
			
			$("#item-wrapper").append(itemStr);
			$("#line-wrapper").append(itemLineStr);
			}
		 function setRotate(data){
			for(let i = 0; i<data.length; i++){
				document.querySelectorAll("#item-wrapper > .item")[i].style.transform = "rotate("+data[i].itemRatio+"deg)";
				let itemLineStyle = rouletteitemsLineRatio.item(i);
				document.querySelectorAll("#line-wrapper > .line")[i].style.transform = "rotate("+data[i].itemLineRatio+"deg)";
			}
		 }
		 function animateRoulette(ratio){
			var defaultratio = (-360*5) ;
			$("#roulette").css("rotate","0deg");
			 console.log('ratio:'+ratio);
			$("#roulette").animate({
				"rotate" : defaultratio+(-ratio)+"deg"
			},4000,"swing",
			function(){
				$.ajax({
					url:'../member/inserteventpoint.do',
					data:{"point":point},
					success:function(data){
						alert(point+"포인트적립!");
						$('#myModal').modal('hide');
					}
				});
				
			});
		 }

	 $(function () {
		setSource();
		loadEventSetting();
		if(pass === "false"){
			$('#myModal').modal('show',{backdrop: 'static', keyboard: false})
		}
		else{
			return;
		}
		});
		
    