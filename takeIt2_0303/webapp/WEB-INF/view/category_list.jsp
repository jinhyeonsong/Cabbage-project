<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 상품 목록</title>
<c:import url="/WEB-INF/view/template/link.jsp" />
<style>
#container {
	font-family: "AppleSDGothic", sans-serif;
	width: 1100px;
	margin:auto;
	padding-top:100px
}

select {
	font-family: "AppleSDGothic", sans-serif;
}
/*1차 카테고리 css start*/
.main_category_title {
	position: relative;
	margin-left: 20px;
	font-size: 30px;
	font-weight: 600;
	color: #4D0B18;
}

.main_menu_wrap {
	position: relative;
	height: 350px;
	margin-top: 30px;
}

.main_menu_wrap a {
	text-decoration: none;
	color: #424242;
	font-size: 30px;
}

.main_menu_wrap li {
	float: left;
	margin-left: 20px;
}

.main_menu_wrap span {
	display: block;
	width: 250px;
	height: 60px;
	line-height: 60px;
	text-align: center;
	background-color: rgb(243, 232, 229);
}

.menu_box {
	width: 250px;
	height: 250px;
	overflow: hidden;
}

.menu_item:hover img {
	transform: scale(1.2);
	transition: ease 0.2s;
} 
.category_img {
	width:250px;
	height: 250px;
}
/*1차 카테고리 css end*/

.second_categories_content {
	position: relative;
	margin: auto;
	width: 1100px;
	min-height: 600px;
	margin-top: 20px;
}

/*양말/스타킹 패션스타일링 탭 css */
.econd_categories_socks_and_stocking_list {
	position: relative;
	margin-left: 15px;
	color: #E2E0E4;
	font-weight: 600;
	display: inline-block;
	font-size: 25px;
	cursor: pointer;
}

.second_categories_socks_and_stocking_list li {
	float: left;
	margin-right: 20px;
}

/* 카테고리 박스 css */
.category_result_box {
	width: 1100px;
	min-height: 600px;
	margin: 30px auto;
}

.fashion_styling_box {
	display: none;
}

.search_filter_box {
	text-align: right;
	position: relative;
}

/*지역필터버튼 css start */
.search_specifics {
	position: absolute;
	top: 4px;
	right: 0;
	margin-right: 180px;
	font-size: 25px;
	color: #303030;
	border: none;
	cursor: pointer;
	outline: none;
}

.search_specifics li {
	float: right;
}

.search_specifics a {
	display: inline-block;
} /* 지역필터버튼 css end */

/*지역필터 팝업 css start */
.pop_where_wrap {
	/* 브라우저 기준 */
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .75);
	display: none;
	left: 0;
	top: 0;
}

.pop_where_wrap.on {
	display: block;
}

.pop_where_box {
	width: 360px;
	height: 560px;
	border-radius: 4px;
	border: 1px solid transparent;
	position: fixed;
	left: 50%;
	top: 50%;
	margin: -281px 0 0 -181px;
	background-color: #fafafa;
}

.pop_where_header_wrap {
	width: 360px;
	height: 58px;
	position: relative;
	border-bottom: 2px solid #eee;
}

.pop_where_header_title {
	position: absolute;
	top: 0;
	left: 16px;
	padding: 15.5px 0;
}

.pop_close_button {
	position: absolute;
	border: none;
	background-color: transparent;
	outline: none;
	right: 8px;
	top: 12px;
	color: #757575;
	cursor: pointer;
	font-size: 25px;
}

.filter_where {
	font-size: 25px;
}

.pop_where_container {
	width: 360px;
	height: 500px;
	overflow: hidden;
}

.korea_states {
	width: 105px;
	height: 500px;
	float: left;
	overflow: scroll;
	overflow-x: hidden;
	/*
    x축 스크롤 안보이게 하기 위해서 설정함
    */
}

.korea_states li {
	width: 90px;
	height: 50px;
	line-height: 50px;
	text-align: center;
}

.states_specifics {
	width: 255px;
	height: 500px;
	float: left;
	overflow: scroll;
	overflow-x: hidden;
}

.states_specifics>ul {
	display: none;
}

.states_specifics>ul.on {
	display: block;
}

.states_specifics>ul>li {
	width: 220px;
	height: 50px;
	line-height: 50px;
	margin-left: 20px;
} /*지역필터 팝업 css end */

/*검색 정렬 필터 css */
.search_order_filter {
	color: #303030;
	font-size: 25px;
	text-align: center;
	border: none;
	outline: none;
	cursor:pointer;
}


/* 의류 탭 박스 css*/
.category_result_box {
	width: 1100px;
	min-height: 600px;
	margin: 30px auto;
}

.search_result_item {
	float: left;
	margin-left: 12px;
	margin-right: 12px;
	margin-bottom: 50px;
}

.search_result_item img {
	width: 250px;
	height: 300px;
	margin-bottom: 15px;
}

.subscription_item_info {
	position: relative;
	width: 250px;
}
/*구독 서비스 회사명 */
.subscription_item_company {
	font-size: 15px;
	font-weight: 900;
	display: inline-block;
	color: #3c7166;
}
/*구독 서비스 라벨 */
.subscription_item_label {
	background-color: #cc5750;
	color: #f4fffd;
	width: 45px;
	height: 23px;
	font-size: 14px;
	font-weight: 700;
	display: inline-block;
	position: absolute;
	top: -5px;
	right: 0;
	text-align: center;
	line-height: 25px;
	border-radius: 5px;
}
/*구독 서비스 상품명 */
.subscription_item_name {
	font-size: 13px;
	margin-top: 15px;
	color: #424242;
}
/*구독 서비스 가격 */
.subscription_item_price {
	font-size: 18px;
	margin-top: 15px;
	font-weight: 700;
	display: inline-block;
}

.subscription_item_price_and_rate_box {
	position: relative;
}
/*평점표시 css start*/
.subscription_item_rate {
	display: inline-block;
	right: 0;
	bottom: 0;
	position: absolute;
}

.box {
	background-image: url("img/ico_newsview_200522.png");
	height: 16px;
}

.grade_star {
	width: 88px;
	background-position: 0 -300px;
}

.inner_star {
	width: 0px;
	background-position: 0 -320px;
} /*평점표시 css end*/
.text_strong {
	color: #3c7166;
	font-weight: 800;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp" />
	<div id="container">
		<!--container start -->
		<div id="main_menu_content">
			<!--main_menu_content start -->
			<div class="main_category_title">
				<!--main_category_title start -->
				<span>Category</span>
			</div>
			<!--//main_category_title end -->
			<div class="main_menu_wrap">
				<!--main_menu_wrap start -->
				<ul>
					<li class="menu_item"><a href="">
							<div class="menu_box">
								<img class="category_img" src="/img/clothing.jpg"/>
							</div>
							<span>의</span>
					</a></li>
					<li class="menu_item"><a href="">
							<div class="menu_box">
								<img class="category_img"  src="/img/food.jpg"/>
							</div>
							<span>식</span>
					</a></li>
					<li class="menu_item"><a href="">
							<div class="menu_box">
								<img  class="category_img" src="/img/living.jpg"/>
							</div>
							<span>주</span>
					</a></li>
					<li class="menu_item"><a href="">
							<div class="menu_box">
								<img class="category_img" src="/img/etc.jpg"/>
							</div>
							<span>기타</span>
					</a></li>
				</ul>
			</div><!--//main_menu_wrap end -->
		</div><!--// main_menu_content end -->
		
		<div class="second_categories_content">	<!-- second_categories_content start-->
			<div class="second_categories_header">	<!-- second_categories_header start-->
				<ul class="second_categories_socks_and_stocking_list">
					<c:forEach items="${categories}" var="category">
						<li class="category_tab text_strong"><a href="/${category.name}/${category.no}">${category.name }</a></li>
					</c:forEach>
				</ul>
				<div class="search_filter_box">
					<!--search_filter_box start -->
					<ul class="search_specifics">
						<li class="where">지역 전체</li>
					</ul>
					<select class="search_order_filter"><i class="fas fa-chevron-down"></i>
						<option value="LAT" selected="selected">최신순</option>
						<option value="SEL">구독순</option>
						<option value="HPR">높은가격순</option>
						<option value="LPC">낮은가격순</option>
						<option value="HRA">평점순</option>
					</select>
				</div>
				<!--//search_filter_box end -->
			</div><!--// second_categories_header end -->
			
			<!-- ==================================1차 카테고리 박스================================== -->
			
			<div class="category_result_box">
			
				<!-- ----------------------2차 카테고리 박스---------------------- -->
				
				<a class="socks_stocking_box" href="/${category }">
					<ul class="search_result_list">
					
					 
					<c:forEach items="${subsList}" var="subs">
					
						 <a class="search_result_detail_link" href="">
                        <li class="search_result_item">
                            <img src="/img/${subs.photo}"/>
                            <div class="subscription_item_info"><!--subscription_item_info start -->
                                <div class="subscription_item_company_and_label"><!--subscription_item_company_and_label start -->
                                    <div class="subscription_item_company">${subs.company}</div>
                                    <div class="subscription_item_label">인기</div>
                                </div><!--//subscription_item_company_and_label end -->
                                <div class="subscription_item_name">${subs.name}</div>
                                <div class="subscription_item_price_and_rate_box"><!--subscription_item_price_and_rate_box start -->
                                    <div class="subscription_item_price">${subs.realPrice}</div>
                                    <div class="subscription_item_rate"><!--subscription_item_rate start -->
                                        <div class="grade_star box">
                                            <div class="inner_star box" style="width:${subs.star*20}%"></div>
                                        </div> 
                                    </div><!--//subscription_item_rate end -->
                                </div><!--//subscription_item_price_and_rate_box end -->
                            </div><!--//subscription_item_info end -->
                        </li>
                    </a>
					</c:forEach> 
					<!-- =================================제품 카드 템플릿=================================  -->
				
					
					
					
					
					<script type="text/template" id="subsCardTmpl">
  					<@ _.each(subsCardList,function(subsCard) { @>
						
						
						<li class="search_result_item">
							<a class="search_result_detail_link" href=""><img src="img/미하이삭스.jpg" />
								<div class="subscription_item_info">
									<!--subscription_item_info start -->
									<div class="subscription_item_company_and_label">
										<!--subscription_item_company_and_label start -->
										<div class="subscription_item_company">미하이삭스</div>
										<div class="subscription_item_label">인기</div>
									</div>
									<!--//subscription_item_company_and_label end -->
									<div class="subscription_item_name">양말정기배송 - 비즈니스 패키지(남성용)</div>
									<div class="subscription_item_price_and_rate_box">
										<!--subscription_item_price_and_rate_box start -->
										<div class="subscription_item_price">6,200원</div>
										<div class="subscription_item_rate">
											<!--subscription_item_rate start -->
											<div class="grade_star box">
												<div class="inner_star box" style="width: 60%"></div>
											</div>
										</div>
										<!--//subscription_item_rate end -->
									</div>
									<!--//subscription_item_price_and_rate_box end -->
								</div><!--//subscription_item_info end -->
						</a>	
					</li>
						
					<@ })@>             
        			</script>
        									
					</ul>
				</div>
				${paginate }
				
			</div><!--//category_result_box end -->
		</div><!-- second_categories_content end-->
	</a><!--// container end -->
	
	<!-- ========================지역 팝업 창==============================  -->
	
	<div class="pop_where_wrap">	<!--pop_where_wrap start-->
		<div class="pop_where_box">
			<!--pop_where_box start-->
			<div class="pop_where_header_wrap">
				<!--pop_where_header_wrap start-->
				<div class="pop_where_header_title">
					<span class="filter_where">지역</span>
				</div>
				<button name="close_btn" type="button"
					class="pop_close_button fas fa-times"></button>
			</div><!--//pop_where_header_wrap end-->
			<div class="pop_where_container">
				<!--pop_where_container start-->
				</div><!--//states_specifics end-->
			</div><!--//pop_where_container end-->
		</div><!--//pop_where_box end-->
	</div><!--//pop_where_wrap end-->

	<!-- ==========================시도구군 템플릿====================================== -->
<script type="text/template" id="whereTmpl">
    <ul class="korea_states">
    <@ _.each(sidoList,function(sido) {@>
		<li><a href="">전국구</a></li>
        <li><a href=""><@=sido.name@></a></li>
    <@}) @>
    </ul>
    <div class="states_specifics"><!--states_specifics start-->
    <@ _.each(gugunList,function(guguns,idx) { @>
		<ul class="select_all">
			<li><a href="">전체</a></li>
		</ul>
        <ul class="specifics_list <@ if(idx==0){ @> on<@ } @>" >
        <@ _.each(guguns,function(gugun) {@>
            <li><a href=""><@=gugun.name@> <span><@=gugun.size@></span></a></li>
       <@ })@>
        </ul>
    <@ })@>
    </div>
</script>
	
	<!--  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■여기부터 자바스크립■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  -->
	<script>
	
	// 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
	_.templateSettings = {interpolate : /\<\@\=(.+?)\@\>/gim, evaluate : /\<\@([\s\S]+?)\@\>/gim, escape : /\<\@\-(.+?)\@\>/gim};	

	
	
	//양말 스타킹 탭
	const $socksAndStockingTab = $(".socks_and_stocking_tab");
	// 양말, 스타킹 박스
	const $socksAndStockinngBox = $(".socks_stocking_box");
	//패션 스타일링 탭
	const $fashionStylingTab = $(".fashion_styling_tab");
	//패션,스타일링 박스
	const $fashionStylingBox = $(".fashion_styling_box");
	
		//탭 자바스크립트 start
		$socksAndStockingTab.click(function() {
			$fashionStylingBox.css("display", "none");
			$socksAndStockinngBox.css("display", "block");
			$fashionStylingTab.removeClass("text_strong");
			$(this).addClass("text_strong");
		});//click() end
		
		$fashionStylingTab.click(function() {
			$fashionStylingBox.css("display", "block");
			$socksAndStockinngBox.css("display", "none");
			//패션스타일링탭 클래스에 text_strong를 추가한것
			$(this).addClass("text_strong");
			$socksAndStockingTab.removeClass("text_strong");
		});//탭 자바스크립트 end

		//-------------------지역 필터 팝업----------------------
		
		//한 지역 누르면 세부 지역 뜨게 하기
		$(".korea_states li").click(function(e) {
			e.preventDefault();
			const sequence = $(this).index();
			$(".states_specifics>ul").removeClass("on");
			$(".states_specifics>ul").eq(sequence).addClass("on");

			$.ajax({
				url : "ajax/location.json",
				type : "POST",
				dataType : "json",
				error : function() {
					alert("점검중");
				},
				success : function(json) {
					//지역필터 시 보여줄 부분
					alert("성공");
				}
			});
		});//click() end

		//어디서 버튼 누르면 팝업창 뜰 수 있도록 함
		$(".search_specifics .where").click(function(e) {
			$(".pop_where_wrap").addClass("on");
			$("html").addClass("on");
		});//click() end

		//엑스버튼 누르면 꺼지도록
		$(".pop_close_button").click(function() {
			$(".pop_where_wrap").removeClass("on");
			//다시 눌렀을 때 빈 상태에서 다시 시작하게 하기 위함.
			$(".states_specifics>ul").removeClass("on");
			$("html").removeClass("on");
		});//click() end
		
		
		/*  ========================카테고리에 따라서 구독 상품 카드 목록 나타내기================================ */

		//상품카드 템플릿 붙일 ul 요소
		const $resultUl = $(".search_result_list");
		//상품카드
		const $subsCard = $(".search_result_item");
		//상품카드템플릿
		const $subsCardTmpl = _.template($("#subsCardTmpl").html());
		
		//카테고리 선택시 ajax
		$(".select_category").change(function() {
			$.ajax({
				url : "/ajax/category/result",
				type : "POST",
				dataType : "json",
				error : function() {
					alert("점검중");
				},
				success : function(json) {
					//카테고리 선택에 따른 검색결과 list 보여주기
					alert("성공");
					
					//이전 데이터 지우기
					$resultUl.empty();
					//상품 카드 템플릿
					$resultUl.append(subsCardTmpl({subsCardList : json}));
					
				}// success end
			}); // $.ajax() end
			
		});//change() end

		//정렬필터 선택시 ajax
		$(".search_order_filter").change(function() {
			$.ajax({
				url : "ajax/location.json",
				type : "POST",
				dataType : "json",
				error : function() {
					alert("점검중");
				},
				success : function(json) {
					//정렬 필터 선택에 따른 검색결과 list 보여주기
					alert("성공");
				}
			});
			
		});//change() end
		
	</script>
</body>
</html>