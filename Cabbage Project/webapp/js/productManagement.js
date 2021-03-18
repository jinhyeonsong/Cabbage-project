/**
 *  productManagement.jsp
 */
_.templateSettings = {interpolate : /\<\@\=(.+?)\@\>/gim, evaluate : /\<\@([\s\S]+?)\@\>/gim, escape : /\<\@\-(.+?)\@\>/gim};


	// 상품 전체 받아오기
	const totalProductListTmpl = _.template($("#totalProductListTmpl").html());
	const giverNo = $(".giver_no_val").val();
	const $listBody = $(".list_body");
	console.log(giverNo);
	let productType;
	$("input.type_select").change(function(){
		productType = $(this).val();
		getTotalProductList();
	});
	
	function getTotalProductList(){
		
		$.ajax({
			
			url:"/ajax/totalProductList",
			type: "GET",
			data: {giverNo: giverNo, type: productType},
			dataType: "JSON",
			error: function(){	alert('점검');		},
			success: function(json){
				$listBody.empty();
				$listBody.append(totalProductListTmpl({list:json}));
				console.log(json);
				console.log(Object.keys(json).length);
				
			}
			
			
		}); // ajax
		
		
	}// function 
	
	getTotalProductList();
	
	

