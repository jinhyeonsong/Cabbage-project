<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<c:import url="/WEB-INF/view/template/link.jsp" />
<link rel="stylesheet" href="/css/giver_mypage_tab.css" />
<link rel="stylesheet" href="/css/giver_header.css" />
<link rel="stylesheet" href="/css/giver_mypage_review_management.css" />
</head>
<body>
<c:import url="/WEB-INF/view/template/giver_header.jsp" />
<div class="giver_mypage_container">
	<c:import url="/WEB-INF/view/template/giver_mypage_tab.jsp">
		<c:param name="tabName" value="reviews" />
	</c:import>

	<div id="container">
		<div class="title_content">
			<h2>리뷰관리</h2>
			<input class="giverNo" type="hidden" value="${giverNo }"
				name="giverNo" />
		</div>
		<!--//title_content-->
		<div class="review_content">
			<span class="review_title">리뷰목록</span> <span class="category_title">상품선택
				<select class="product_select">
					<c:forEach items="${products }" var="product">
						<option class="selectedProduct" value="${product.no }">${product.name }</option>
					</c:forEach>
			</select> <!--//category_select-->
			</span>
			<!--//category_title-->
			<hr />
			<ul class="review_list">

			<!-- 03-04 이소현 -->
			<!-- 리뷰 템플릿 -->
			<script type="text/template" id="reviewCardTmpl">
 				<@ _.each(reviewList,function(reviewCard) { @>
				<li class="review_item">
				
					<div class="review_container">
					<div class="review_wrap">
						<p class="review_sub_product_name">구독상품명&ensp;:&ensp;<@=reviewCard.productName@></p>
						<p class="review_sub_date">구독일시&ensp;:&ensp;2021-00-00</p>
						<div class="review_profile_box">
							<img class="review_profile_img" src="/img/<@=reviewCard.memberProfileImg@>" /> <span class="review_user_nickname"><@=reviewCard.takerNickname@></span>
							<span class="review_star_rating"><span style="width:<@=reviewCard.star*20@>%"></span></span>
							<span class="review_regdate">(<@=reviewCard.regdate@>)</span>
							<p class="review_detail"><@=reviewCard.review@></p>							
						</div><!--//review_profile_box	-->	
						<@ console.log("답글"+reviewCard.reply) @>
					<@ if(reviewCard.reply==null) { @>
						                      
						<div class="reply_register_box">
							<form action="/giver/comment/<@=reviewCard.giverNo@>" method="POST">
							<input type="hidden" name="giverNo" value="<@=reviewCard.giverNo@>"/>
								<textarea name="reply" class="reply_text" placeholder="리뷰를 남겨준 테이커에게 댓글을 남겨주세요."></textarea>
								<button type="submit" class="review_submit_btn">등록하기</button>
							</form>
						</div><!--//reply_register_box-->

					<@ } else { @>

						<div class="reply_detail_box">

                            <img class="reply_arrow" src="/img/reply_arrow.png"/>
                            <div class="reply_detail">
                                <span class="reply"><@=reviewCard.reply.reply@></span>
                                <button class="btn reply_edit_btn"><i class="fas fa-pencil-alst"></i></button>
                                <button class="btn reply_delete_btn" form="deleteForm"><i class="fas fa-times"></i></button>
                                <p class="reply_regdate">(<@=reviewCard.reply.regdate@>)</p>
                            </div>
 						</div> 
						<div class="reply_modify_box">
							<form action="/giver/comment/<@=reviewCard.giverNo@>" method="POST">
								<input type="hidden" name="_method" value="PUT">
								<input type="hidden" name="no" value="<@=reviewCard.no@>"/>
								<textarea name="reply" class="reply_text"><@=reviewCard.reply.reply@></textarea>
								<button type="submit" class="review_modify_btn">수정하기</button>
							</form>
						</div><!--//reply_register_box-->

					<@ } @>

					</div> <!--//review_wrap-->
					</div><!--//review_container-->
					
				</li><!--//review_item-->

			<@ })@>

			</script> 
					<form id="deleteForm" action="/giver/comment/<@=reviewCard.giverNo@>" method="POST">
						<input type="hidden" name="_method" value="DELETE"/>
					</form>	
						
			<!-- reviewCard.reply!=null일 경우에 이 div를 나타내고, 값을 출력하고 싶은데,
			if~else 문을 템플릿 안에서 어떻게 쓰는지 모르겠다
			 + 어쨌든 값이 이상한 것 같은데?
			 / 따로 템플릿을 빼서 넣을까도 잠시 생각해봤는데, 그러면 reviewCard 안의 reply이기 때문에
			 말이 안되는것 같아서 패쓰! 
			  
			 
 					 <div class="reply_detail_box">
						<@ _.each(reviewCard.reply,function(reply) { @>
                            <img class="reply_arrow" src="img/reply_arrow.png" width="50px" height="50px"/>
                            <div class="reply_detail">
                                <span class="reply"><@=reply.reply@></span>
                                <button class="btn reply_edit_btn"><i class="fas fa-pencil-alt"></i></button>
                                <button class="btn reply_delete_btn"><i class="fas fa-times"></i></button>
                                <p class="reply_regdate">(<@=reply.regdate@>)</p>
                            </div>
                        <@ })@>
                        </div> -->
			
	
			</ul><!--//review_list-->
		</div>
	</div>
</div>
	<!--  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■여기부터 자바스크립■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  -->
	<script>
	
	// 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
	_.templateSettings = {interpolate : /\<\@\=(.+?)\@\>/gim, evaluate : /\<\@([\s\S]+?)\@\>/gim, escape : /\<\@\-(.+?)\@\>/gim};	

	
		const $productName = $(".product_select");
		const selectedProductNo = $(".product_select option:selected").val();

		console.log(selectedProductNo)

		const $reviewCard = $(".review_item");
		
		const $reviewWrap = $(".review_wrap");
		
		const $reviewList = $(".review_list");
		
		const reviewCardTmpl = _.template($("#reviewCardTmpl").html());
		
		getReview();
		
		//상품 바꾸면 함수 호출
		$productName.change(getReview);


		// ==========================제품 select로 선택하면 그게 맞는 리뷰 나타내기=======================
		function getReview() {

			// 변화될 때 이 값을 받아오고 싶은 거니까 함수 안에 넣어준다. (밖에 빼면, 처음 받아온 값이 계속 나타난다.)
			const selectedProductNo = $(".product_select option:selected").val();
			console.log(selectedProductNo);
			
			//console.log(selectedProductNo);
			
			$.ajax({
				url : "/ajax/reviews",
				type : "GET",
				data : {
					"productNo" : selectedProductNo
				},
				dataType : "json",
				error : function(xhr) {
					alert("점검중");
				},
				success : function(json) {

					console.log(json);
					
					//리뷰 붙이기 전에 비우기
					$reviewList.empty();
					
					//리뷰카드(템플릿)를 ul에 붙이기
					$reviewList.append(reviewCardTmpl({reviewList : json}));
					
				} //success end

			}); //$.ajax() end

		}//getReview() end
	

		/* textarea 높이 자동조절 함수 */
		const $reply_text = $(".reply_text")

		/* 바로바로 수정되도록 keyup, keydown 둘다 사용*/
		$reply_text.keyup(function() {

			$(this)[0].style.height = "auto";

			var textEleHeight = $(this).prop('scrollHeight');
			$(this).css('height', textEleHeight);

		}); 
		$reply_text.keydown(function() {

			$(this)[0].style.height = "auto";

			var textEleHeight = $(this).prop('scrollHeight');
			$(this).css('height', textEleHeight);

		});

		/* ============================리뷰 등록버튼 클릭시====================================== */
		/* const $html = $("html");

		 $html.on("click", ".review_submit_btn", function() {

		
			var comment = $(this).parent().find("textarea").val();
			var registerBtn = $(this);

			// 내용 비었으면, 
			if (comment == "") {
				alert("내용을 입력하세요");

			} else { // 내용이 입력되어 있으면, 
				$.ajax({
					url : "/ajax/comment",
					type : "POST",
					data : {
						comment : comment
					},
					dataType : "json",
					error : function() {
						alert("점검중");
					},
					success : function(json) {
						alert("성공!");
						console.log($(this));
						registerBtn.parent().parent().css("display", "none");
						registerBtn.parent().parent().parent().find(
								".reply_detail_box").css("display", "block");
					}

				})
			}

		});  */

		const $html = $("html");
		
		/* ================================리뷰 수정========================================== */
		
		//리뷰 수정 버튼 클릭시,
		
		$html.on("click", ".reply_edit_btn", function() {

			confirm("답글을 수정하시겠습니까?");

			$(this).parent().parent().css("display", "none");
			$(this).parent().parent().parent().find(".reply_modify_box").css(
					"display", "block");

		});

		/* =================================리뷰 삭제=========================================== */
		
		//리뷰 삭제 버튼 클릭시, 
		
		$html.on("click", ".reply_delete_btn", function() {

			confirm("답글을 삭제하시겠습니까?");

			$(this).parent().parent().css("display", "none");
			$(this).parent().parent().parent().find(".reply_register_box").css("display", "block");

		});
	</script>
	<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
</body>
</html>