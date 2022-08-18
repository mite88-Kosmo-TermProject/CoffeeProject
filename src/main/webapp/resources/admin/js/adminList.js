	$(function() {
		makeJqueryTable(null);
		})
		function makeJqueryTable (searchField) {
			var table =	$('#example').DataTable({
				lengthChange : true,
				searching: true,
				ordering : true,
				info: true,
				paging : true,
				ajax :{
					url:"../../admin/getshoplist.do",
					data:{"searchField" : searchField},
					type:'GET',
					},
					"columns": [
					{
						orderable: false, 
						className: 'table-active dt-body-center',
						render: function (data) {
							return '<input type="checkbox" name="id[]" value="">';
						}
					},
					{"data":"storeInfo",
						"render":function(data){
							data = '<a href="../../admin/storeOwnerMember/view.do?store_idx='+data.storeNum+'">'+data.storeName+'</a>'
							return data;
						}
					},
					{ "data": "adress" },
					{ "data": "agree" },
					{ "data": "ownerId" },
					{ "data": "ownerName" },
				  ]
			});
		}
		function showselectoption (){
			var search = document.getElementById("searchField");
			var searchFiledIndex = document.getElementById("searchField").options.selectedIndex ;
			var searchField = search.options[searchFiledIndex].value;
			console.log(searchField);
			$('#example').DataTable().destroy();
			makeJqueryTable(searchField);
			
		}