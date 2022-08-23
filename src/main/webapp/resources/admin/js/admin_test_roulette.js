var source = [];
		var eventname = document.getElementsByName("eventname")[0];
		var file = document.getElementsByName("file")[0];
		var desc = document.getElementsByName("desc")[0];
		var roulette = document.getElementById("roulette");
		var percentage = [];
		var JSONList = [];
		
		function setSource(){
			$.ajax({
				url:'../../admin/point/loadevent_item.do',
				dataType:'json',
				success:function(data){
					source = data;
					resetTabullet();
					
				},
				error:function(msg){
					console.log(msg);
				}
			});
		 }
		function loadEventSetting(){
			$.ajax({
				url:'../../admin/point/loadeventsetting.do',
				dataType:'json',
				success:function(data){					
					eventname.placeholder = data.name;
					desc.placeholder = data.desc;
				},
				error:function(msg){
					console.log(msg);
				}
			});
		}
		 function resetTabullet() {
             $("#table").tabullet({
                 data: source,
                 action: function (mode, data) {
                     console.dir(mode);
                     if (mode === 'save') {
                         source.push(data);
                     }
                     else if (mode === 'edit') {
                            	 console.log(data);
                         for (var i = 0; i < source.length; i++) {
                             if (source[i][0] == data[0]) {
                                 source[i] = data;
                             }
                         }
                     }
                     else if(mode === 'delete'){
                         for (var i = 0; i < source.length; i++) {
                             if (source[i][0] == data[0]) {
                                 source.splice(i,1);
                                 break;
                             }
                         }
                     }
					if(1 <= 2)
                     resetTabullet();
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
				Str +="var point = 0;"
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
			eval(Str);
			console.log(ratio);
			animateRoulette(ratio);
			console.log(point);

		 }
		 function calculateItemAndRatio(){
			var itemsNum = source.length;
			var itemPlusRatio = 360/source.length;
			var itemLineFirstRatio = itemPlusRatio/2;
			var firstItemRatio = 0;
			console.log(itemsNum);
			console.log(itemPlusRatio);
			console.log(itemLineFirstRatio);
			for(let i =0; i<itemsNum; i++){
				var data = new Object;
				data.itemNum = source[i][0];
				data.itemName = source[i][1];
				data.itemPercentage = source[i][2];
				data.itemPoint = source[i][3];
				data.itemRatio = firstItemRatio;
				data.itemLineRatio = itemLineFirstRatio;
				JSONList.push(data);
				itemLineFirstRatio = itemLineFirstRatio+itemPlusRatio;
				firstItemRatio = firstItemRatio+itemPlusRatio;
			}
			console.log(JSON.stringify(JSONList));
			addRouletteItens(JSONList);
			setRotate(JSONList);
		 }
		 function addRouletteItens(data){
			var itemStr = "";
			var itemLineStr = "";
			for(let i = 0; i<data.length; i++){
			 	itemStr += '<div class="item">'+data[i].itemName+'</div>\n';
				itemLineStr += '<div class="line"></div>\n';
					//document.getElementsByClassName("item")[s].style.transform = "rotate("+data.itemRatio+"deg)";
					//document.getElementsByClassName("line")[s].style.transform =  "rotate("+data.itemLineRatio+"deg)";
				}
			
			$("#item-wrapper").append(itemStr);
			$("#line-wrapper").append(itemLineStr);
			}
		 function setRotate(data){
			var rouletteitemsRatio = document.querySelectorAll("#item-wrapper > .item")
			var rouletteitemsLineRatio = document.querySelectorAll("#line-wrapper > .line")
			for(let i = 0; i<data.length; i++){
				let itemStyle = rouletteitemsRatio.item(i);
				itemStyle.style.transform = "rotate("+data[i].itemRatio+"deg)";
				console.log(data[i].itemRatio);
				let itemLineStyle = rouletteitemsLineRatio.item(i);
				itemLineStyle.style.transform = "rotate("+data[i].itemLineRatio+"deg)";
				console.log(data[i].itemLineRatio);
			}
		 }
		 function animateRoulette(ratio){
			var defaultratio = (-360*5) ;
			$("#roulette").css("rotate","0deg");
			 console.log('ratio:'+ratio);
			$("#roulette").animate({
				"rotate" : defaultratio+(-ratio)+"deg"
			},2000,"swing", console.log(defaultratio+(-ratio)));
		 }
		 function resetItem() {
			source = [];
			JSONList = [];
			var rouletteitemsRatio = document.querySelectorAll("#item-wrapper > .item");
			var rouletteitemsLineRatio = document.querySelectorAll("#line-wrapper > .line");
			var tableitems = document.querySelectorAll("#table > tbody > tr");
			console.log('source:'+source);
			for(let i = 1; i < tableitems.length; i++){
				let itemrow = tableitems.item(i);
				itemrow.remove();
			}
			for(let j =0; j < rouletteitemsRatio.length; j++){
				let item = rouletteitemsRatio.item(j);
				item.remove();
				let itemLine = rouletteitemsLineRatio.item(j);
				itemLine.remove();
			}
		}
		function insertEventItem(){
			$.ajax({
				url:'../../admin/point/insertevent.do',
				data:{"source":JSON.stringify(source)},
				success:function(){
					$.ajax({
						url:'../../admin/point/index2.do'
					});
				},
				error:function(msg){
					console.log(msg);
				}
			});
		}
		
		 	
	 $(function () {
		 //동적테이블 
		 setSource();
		 loadEventSetting();
     });