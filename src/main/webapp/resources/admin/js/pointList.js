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
				url:"../../admin/point/getpointlist.do",
				data:{"searchField" : searchField},
				type:'GET',
				},
				"columns": [
					{"data":"point_idx",
						orderable: false, 
						className: 'table-active dt-body-center',
						render: function (data) {
							return '<input class="box" type="checkbox" name="check" value="'+data+'">';
						}
					},
				{"data":"point_idx"},
				{ "data": "point_entry_exit" },
				{ "data": "mem_id" },
				{ "data": "point_postdate" },
				{ "data": "rule_idx" },
			  ]
		});
	}

	
		
	

