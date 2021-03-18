<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제품의 상세 페이지</title>
	<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
	  <link rel="stylesheet" href="/css/subscribeDetail.css"/>
	  <link rel="stylesheet" href="/css/datepicker.css" />
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
    <div class="product_detail_page_container">
        <div class="product_detail_page_head_contents">
            <div class="product_detail_page_content_head">
                <div class="item_category_box">
                    <div class="category_box">
                        <p>
                        	<span class="category">
                        		<a href="">${ product.primaryCategoryName}</a>
                        	</span>>
                        	<span>
                        		<a href=""> ${product.categoryName}</a>
                        	</span>
                        </p>
                    </div>
                    <div class="subs_info_box">
                        <!--구독자 수-->
                        <div class="subs_num">구독 수: ${product.subCount } &nbsp;</div>
                        <!-- 평점 & 리뷰 수 -->
                        <div class="star_review_num">
                            <img class="star" src="/img/green_star.png"><div class="star_review">${product.star} (${product.revCount })</div>
                        </div>
                    </div>
                </div>
                <!-- 상단부의 기버 정보-->
                <div class="giver_information_box">
                    <div class="giver_information">
                        <!-- taker 가 보는 giver 상세 페이지로 이동 -->
                        <a href="/giver/${giver.no }/info">
                        	<img class="giver_profile_img" src="/img/${giver.profileImg }">
                        </a>
                        <a href="/giver/${giver.no }/info">
                        	<span>${giver.company }</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="product_detail_page_content_left">
                <!-- 구독 제품 대표 이미지-->
                <img class="product_thumbnail_img" src="/img/${product.photo }">
            </div>
            <div class="product_detail_page_content_right">
                <h2 class="subs_title">${product.name }</h2>
                <div class="item_info_box">
                    <dl>
                        <dt>배송 시작일</dt>
                        <!-- 데이터피커 이용-->
                        <form id="productForm" method="GET" action="/subscribe/${product.no }">
                        <dd><input name="delivery_start_date" type="text" id="datepicker"></dd>
                    </dl>
                    <dl>
                        <dt>배송일</dt>
                        <dd><!--월화수목금 표기.-->
                            <div class="deliver_date_box">         
                            	<div class="delivery_date  <c:forEach var="deliveryDay" items="${deliveryDays}"> 
                                    <c:choose>
                            		<c:when test="${deliveryDay.day==0}">selected</c:when>
                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
                            	</c:forEach>">일</div>
                                <div class="delivery_date  <c:forEach var="deliveryDay" items="${deliveryDays}"> 
                                    <c:choose>
                            		<c:when test="${deliveryDay.day==1}">selected</c:when>
                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
                            	</c:forEach>">월</div>
                                <div class="delivery_date  <c:forEach var="deliveryDay" items="${deliveryDays}"> 
                                    <c:choose>
                            		<c:when test="${deliveryDay.day==2}">selected</c:when>
                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
                            	</c:forEach>">화</div>
                                <div class="delivery_date  <c:forEach var="deliveryDay" items="${deliveryDays}"> 
                                    <c:choose>
                            		<c:when test="${deliveryDay.day==3}">selected</c:when>
                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
                            	</c:forEach>">수</div>
                                <div class="delivery_date  <c:forEach var="deliveryDay" items="${deliveryDays}"> 
                                    <c:choose>
                            		<c:when test="${deliveryDay.day==4}">selected</c:when>
                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
                            	</c:forEach>">목</div>
                                <div class="delivery_date  <c:forEach var="deliveryDay" items="${deliveryDays}"> 
                                    <c:choose>
                            		<c:when test="${deliveryDay.day==5}">selected</c:when>
                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
                            	</c:forEach>">금</div>
                                <div class="delivery_date  <c:forEach var="deliveryDay" items="${deliveryDays}"> 
                                    <c:choose>
                            		<c:when test="${deliveryDay.day==6}">selected</c:when>
                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
                            	</c:forEach>">토</div>
                           </div>
                        </dd>
                    </dl>
                    <!--기본가격에 옵션, 배송추가 가격 표시되면 좋을 것 같음-->
                    <dl>
                        <dt class="delivery_addr_option">배송지역 선택</dt>
                        <dd>
                        <c:forEach var="deliveryRegion" items="${deliveryRegions}">
                            <input name="deliveryAddrOption" value="${deliveryRegion.primaryRegionName} ${deliveryRegion.regionName}" id="deliveryAddrOption${deliveryRegion.no}" class="addr_option_input" type="radio">
                            <label for="deliveryAddrOption${deliveryRegion.no}" >${deliveryRegion.primaryRegionName} ${deliveryRegion.regionName} + 
                           		 <span class="deliveryRegion_price">${deliveryRegion.price}</span>원
                           		 <input type="hidden" value="${deliveryRegion.price}">
                            </label>                      
                        </c:forEach>
						</dd>
                    </dl>
                    <!-- 남은 수량이 9개 이하가 되면, 나타남 -->
                    <c:choose>
                    <c:when test="${product.salesQty<=9}">
                    <dl class="sold_out">
                        <dt>남은 수량</dt>
                        <dd class="last_qnt">${product.salesQty}개</dd>
                    </dl>
                    </c:when>
                    </c:choose>
                    <dl class="price_tag">
                        <dt>총 가격</dt>
                        <dd class="total_price"></dd>
                        <input type="hidden" value="${product.price-product.discount}" class="product_total_price">
                    </dl>
                    <!-- 일반 유저들이 보는 페이지에서는 구독 하기 버튼이 보임-->
                     </form>
                    <c:choose>
                    <c:when test="${loginMember.getType().equals('G')}">
                     <div class="giver_view_btn_box">
                        <button class="subscribe_pause">구독 일시정지</button>
                        <button class="subscribe_delete">구독 삭제</button>
                    </div>                
                    </c:when>                 
                    <c:otherwise> 
                    <!-- 이 구독 상품의 기버가 제품 상세 페이지에 들어왔을 때 보이는 버튼 -->
                    <button form="productForm" class="subscribeBtn" onclick = "location.href = '' ">구독하기</button>
                    </c:otherwise>
                    </c:choose>
                </div><!--item_info_box-->
            </div>
        </div>
        <div class="product_detail_page_body_contents">
            <ul class="product_detail_tab_wrap">
                <li class="product_detail_tab_box on" data-tab="tab1">상품 상세</li>
                <li class="product_detail_tab_box" data-tab="tab2">구매 안내</li>
                <li class="product_detail_tab_box" data-tab="tab3">리뷰</li>
            </ul>
            <!--  ------------------------상품 상세 정보----------------------- -->
            <div class="tab_product_detail content on" id="tab1">${product.details }</div>
            <!-- -------------------------구매 안내 정보-------------------------  -->
            <div class="tab_purchase_detail content" id="tab2">
                <img class="tab_purchase_detail_img" src="/img/${product.instruction }"/>
            </div>
            <!-- -------------------------------리뷰------------------------- -->
            <div class="tab_review content" id="tab3">
                <ul class="review_list">
                <c:forEach var="review" items="${reviews }">
                    <li class="review_item">
						<div class="review_wrap">
                            <div class="review_profile_box">
                                <img class="review_profile_img" src="/img/${review.takerProfileImg }" width="50" height="50"/>
                                <span class="review_user_nickname">${review.takerName }</span>
                                <span class="review_star_rating"><span style ="width:80%"></span></span>
                                <span class="review_regdate"><fmt:formatDate value="${review.regdate }" pattern="(YYYY. M. d. mm:ss)"/></span>
                                <p class="review_detail">${review.review }</p>
                                <!--//review_detail-->
                            </div>
                            <!--//review_profile_box-->
                            <div class="reply_detail_box">
                                <img class="reply_giver_profile_img" src="/img/${review.giverProfileImg }" width="50px" height="50px"/>
                                <div class="reply_detail">
                                	<span class="reply">${review.giverReply }</span>
                                	<p class="reply_regdate"><fmt:formatDate value="${review.replyRegdate}" pattern="(YYYY. M. d. mm:ss)"/></p>
                                </div>
                            </div>
                            <!--//reply_detail_box-->
                        </div>
                        <!--//review_wrap-->
					 </li>
			     </c:forEach>
                </ul>
            </div>
        </div>
    </div>
     <c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
</body>
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■이제부터 자바스크립트 영역■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script src="/js/tui-date-picker.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    /* ======================탭 내용 & css 변경========================= */
    /* 탭 */
    const $tab = $(".product_detail_tab_box");
    /* 탭 안의 컨텐츠 */
    const $content = $(".content");

    /* 탭 클릭 시 css 변경 & 변경된 탭 내용 보여주기 */
    $tab.on("click", function () {
        $tab.removeClass("on");
        $(this).addClass("on");

        const onTab = $(this).attr("data-tab");

        $content.removeClass("on");
        $(this).addClass("on");
        $("#"+onTab).addClass("on");

    }); //$tab click() end
    /* ==========================datepicker 이용================================= */
    /* datepicker 한글로 변경 */
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
    $(function() {
        //오늘 날짜를 출력
        $("#today").text(new Date().toLocaleDateString());
        $("#datepicker").datepicker({       
            minDate: ${product.dateAvail},
            maxDate: 14
        });
    }); //function() end
//라벨 클릭시 총가격 바뀌는 코드
    const $label = $("label"); //라벨
    const $productPrice = $(".product_total_price").val(); //상품가격
    const $totalPrice = $(".total_price");  //총 가격 (상품가격+배송비)
    let total = 0;
    $totalPrice.text(${product.price-product.discount}+"원");   
    $label.on("click",function(){
    	const $deliveryRegionPrice = $(this).children('input[type="hidden"]').val();
    	total = parseInt($productPrice)+parseInt($deliveryRegionPrice);
    	$totalPrice.text(total+"원"); 
    })
//라벨 클릭시 총가격 바뀌는 코드
</script>
</html>