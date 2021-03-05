<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="product_detail_page_container">
        <div class="product_detail_page_head_contents">
            <div class="product_detail_page_content_head">
                <div class="item_category_box">
                    <div class="category_box">
                        <p><span class="category"><a href="">의</a></span> > <span><a href=""> 양말/스타킹</a></span></p>
                    </div>
                    <div class="subs_info_box">
                        <!--구독자 수-->
                        <div class="subs_num">100 &nbsp;</div>
                        <!-- 평점 & 리뷰 수 -->
                        <div class="star_review_num">
                            <img class="star" src="/img/green_star.png"><div class="star_review">${product.star} (36)</div>
                        </div>
                    </div>
                </div>

                <!-- 상단부의 기버 정보-->
                <div class="giver_information_box">
                    <div class="giver_information">
                        <!-- taker 가 보는 giver 상세 페이지로 이동 -->
                        <a href=""><img class="giver_profile_img" src="/img/walle.png"></a>
                        <a href=""><span>${giver.company }</span></a>
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
                        <dd> <input name="delivery_start_date" type="text" id="datepicker"></dd>
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
                            <input name="deliveryAddrOption" value="서울시 관악구" id="deliveryAddrOption1" class="addr_option_input" type="radio" checked><label for="deliveryAddrOption1" >서울시 관악구</label>
                            <input name="deliveryAddrOption" value="서울시 관악구" id="deliveryAddrOption2" class="addr_option_input" type="radio"><label for="deliveryAddrOption2">서울시 관악구</label>
                            <input name="deliveryAddrOption" value="서울시 관악구" id="deliveryAddrOption3" class="addr_option_input" type="radio"><label for="deliveryAddrOption3">서울시 관악구</label>
                            <input name="deliveryAddrOption" value="서울시 관악구" id="deliveryAddrOption4" class="addr_option_input" type="radio"><label for="deliveryAddrOption4">서울시 관악구</label>
                            <input name="deliveryAddrOption" value="서울시 관악구" id="deliveryAddrOption5" class="addr_option_input" type="radio"><label for="deliveryAddrOption5">서울시 관악구</label>
                        </dd>
                    </dl>
                    <!-- 남은 수량이 9개 이하가 되면, 나타남 -->
                    <dl class="sold_out">
                        <dt>남은 수량</dt>
                        <dd class="last_qnt">9 개</dd>
                    </dl>
                    <dl class="price_tag">
                        <dt>총 가격</dt>
                        <dd name="total_price">9900원</dd>
                    </dl>
                    <!-- 일반 유저들이 보는 페이지에서는 구독 하기 버튼이 보임-->
                    <button class="subscribeBtn" onclick = "location.href = '' ">구독하기</button>
                    <!-- 이 구독 상품의 기버가 제품 상세 페이지에 들어왔을 때 보이는 버튼 -->
                    <div class="giver_view_btn_box">
                        <button class="subscribe_pause">구독 일시정지</button>
                        <button class="subscribe_delete">구독 삭제</button>
                    </div>

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
            <div class="tab_product_detail content on" id="tab1">
                <!--제품 등록에서 퀼 에디터로 저장하는 것 보여주는 div (현재는 사진하나로 퉁쳐놨다)-->
                <img class="tab_product_detail_img" src="/img/pp.jpg">
            </div>
            <!-- -------------------------구매 안내 정보-------------------------  -->
            <div class="tab_purchase_detail content" id="tab2">
                <img class="tab_purchase_detail_img" src="/img/${product.instruction }"/>
            </div>
            <!-- -------------------------------리뷰------------------------- -->
            <div class="tab_review content" id="tab3">
                <ul class="review_list">
                    <li class="review_item">
                        <div class="review_wrap">
                            <div class="review_profile_box">
                                <img class="review_profile_img" src="/img/walle.png" width="50" height="50"/>
                                <span class="review_user_nickname">가나다라마바사</span>
                                <span class="review_star_rating"><span style ="width:80%"></span></span>
                                <span class="review_regdate">(2020.02.10. 03:20)</span>
                                <p class="review_detail">
                              
                                </p>
                                <!--//review_detail-->
                            </div>
                            <!--//review_profile_box-->
                            <div class="reply_detail_box">
                                <img class="reply_giver_profile_img" src="img/profile_img_default.jpg" width="50px" height="50px"/>
                                <div class="reply_detail">
                                <span class="reply">이용해주셔서 감사감사이용해주셔서이용해주셔서이용해주셔서이용해
                                    주셔서이용해주셔서이용해주셔서이용해주셔서이용해주셔서이용해주셔서이용해주셔서이
                                    용해주셔서이용해주셔서이용해주셔서이용해주셔서이용해주셔서이용해주셔서</span>
                                    <p class="reply_regdate">(2020. 02. 10. 03:20)</p>
                                </div>
                            </div>
                            <!--//reply_detail_box-->
                        </div>
                        <!--//review_wrap-->
                    </li>
                </ul>
            </div>

        </div>
    </div>


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
            /*
                선택할 수 있는 최소 날짜 (3이면 현재 날짜로부터 3일 이후부터 가능)
                => 나중에 서버에서 기버가 배송 가능한 날짜 선택하면
                그 값 받아서 나타내면 될 듯!
             */
            minDate: ${product.dateAvail},
            /* 뭔가 이거는 다같이 얘기 해봐야 하지 않을까? 최대 기간 정해두는 게 나을 것 같다. */
            maxDate: 14
        });

    }); //function() end


</script>
</html>