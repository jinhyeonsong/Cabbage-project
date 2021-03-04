<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제품의 상세 페이지</title>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/appleSDGothic.css"/>
    <link rel="stylesheet" href="css/datepicker.css" />
    <style>
        /* ======================페이지 공통 css==================*/
        body {
            font-family: "AppleSDGothic", sans-serif;
            font-weight: 300;
            user-select: none;
        }
        input, button {
            font-family: "AppleSDGothic", sans-serif;
            font-weight: 300;
        }
        a:visited, a{
            color: black;
            text-decoration: none;
        }
        /* =============페이지 전체 감싸는 container======*/
        .product_detail_page_container {
            width: 1000px;
            margin: auto;
            /*background-color: #4c9384;*/
        }
        /* =====================페이지 상단 contents=====================*/
        .product_detail_page_head_contents {
            width: 1000px;
            height: 545px;
            /*background-color: #9e9e9e;*/
            margin: 150px 0 115px 0 ;
            overflow: hidden;
        }
        /* 상단 content 의 head content*/
        .product_detail_page_content_head {
            height: 55px;
            /*background-color: orange;*/
            overflow: hidden;
        }
        .item_category_box {
            float: left;
            padding: 10px 15px;
            width: 475px;
            height: 25px;
            overflow: hidden;
        }
        .category_box {
            float: left;
        }
        .subs_info_box {
            width: 130px;
            height: 30px;
            line-height: 30px;
            float: right;
            display: flex;
            vertical-align: middle;
        }
        .star_review_num {
            display: flex;
            height: 25px;
            line-height: 25px;
        }
        .star {
            width: 25px;
            height: 25px;
        }
        .subs_num, .star_review {
            width: 50px;
            height: 30px;
            line-height: 30px;
        }
        .star_review {
            margin-left: 5px;
        }
        .giver_information_box {
            width: 495px;
            /*background-color: blanchedalmond;*/
            float: left;
        }

        .giver_information {
            width: 180px;
            height: 50px;
            line-height: 50px;
            float: right;
        }
        .giver_profile_img {
            width: 30px;
            height: 30px;
            border-radius: 100%;
            vertical-align: middle;
            margin: 0 5px;
        }

        /* 상단 content 의 왼쪽 content */
        .product_detail_page_content_left {
            float: left;
            /*background-color: #c0392b;*/
            width: 505px;
            height: 490px;
        }
        .product_thumbnail_img{
            width: 490px;
            height: 490px;
            padding: 0 7px;
        }
        /* 상단 content 의 오른쪽 content */
        .product_detail_page_content_right {
            float: left;
            /*background-color: darkolivegreen;*/
            width: 495px;
            height:490px ;
        }
        .subs_title {
            width:495px;
            height:70px ;
            line-height: 70px;
            text-align: center;
            font-size: 35px;
            font-weight: 500;
            margin: 20px 0  10px 0;
        }
        .item_info_wrap .item_img_box img{
            vertical-align: middle;
        }

        .item_info_box dl{
            width: 500px;
            font-size: 22px;
            overflow: hidden;
        }

        .item_info_box .delivery_addr_option{
            height: 110px;
            /*background-color: #cca872;*/
            margin-bottom: 15px;
        }

        .addr_option_input {
            display: none;
        }
        .addr_option_input+label {
            margin: 0 5px 5px 0;
            display: inline-block;
            background-color: #f3f3f3;
            width: 120px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-size: 14px;
            cursor: pointer;
            float: left;
            border-radius: 4px;
            border: 1px solid #3C7166;
        }
        .addr_option_input:checked+label {
            background-color: #3C7166;
            color: white;
        }
        .deliver_date_box {
            overflow: hidden;
        }
        .delivery_date{
            width: 40px;
            height: 40px;
            float: left;
            color: #9e9e9e;
        }
        .delivery_date.selected {
            color: #333333;
            font-weight: 600;
        }
        .item_info_box .price_tag{
            margin-top: 10px;
        }
        .item_info_box .price_tag dd{
            font-size: 28px;
            color: #3C7166;
            font-weight: 700;
        }
        .item_info_box dl dt{
            font-weight: 700;
            width: 200px;
            height: 50px;
            margin-left: 20px;
            float: left;
        }
        .item_info_box dl dt dd{
            width: 200px;
            float: right;
        }
        .item_info_box .item_dropdown{
            width: 150px;
            height: 30px;
        }
        .sold_out {
            display: none;
        }
        /* 구독하기 버튼 */
        .subscribeBtn {
            width: 440px;
            height: 50px;
            background-color:#264a43;
            color: #fff;
            border-radius: 4px;
            font-size: 20px;
            font-weight: 500;
            margin-left: 20px;
            cursor: pointer;
        }
        /* ------------기버가 보는 상세페이지에서 나타내는 버튼 박스------------*/
        .giver_view_btn_box {
            display: none;
            margin-left: 15px;
        }
        .subscribe_pause, .subscribe_delete {
            width: 213px;
            height: 50px;
            background-color:#264a43;
            color: #fff;
            border-radius: 4px;
            font-size: 20px;
            font-weight: 500;
            cursor: pointer;
            margin: 0 5px;
        }

        /* ============================================하단부======================================== */
        .product_detail_tab_wrap {
            overflow: hidden;
            margin: auto;
            width: 918px;
        }
        .product_detail_tab_box {
            float: left;
            width: 300px;
            height: 60px;
            line-height: 60px;
            text-align: center;
            background-color:#f4fffd;
            margin: 0 3px 20px 3px;
            font-size: 22px;
            cursor: pointer;
        }
        .product_detail_tab_box.on {
            background-color: #264a43;
            color: #fff;
        }

        .content {
            width: 918px;
            margin: auto;
            display: none;
        }
        .content.on {
            display: block;
        }
        .tab_product_detail {
            margin: 20px auto;
            text-align: center;

        }
        /* ==========상품 정보 이미지========================*/
        .tab_product_detail_img {
            width: 900px;
            height: 1040px;
        }
        /* =================구매 정보 이미지-==================*/
        .tab_purchase_detail_img {
            width: 900px;
            height: 1800px;
            margin-top: 20px;
        }

        /* ========================리뷰 css=================================================*/
        .review_list{
            color: black;
            width: 700px;
            margin: auto;
        }
        .review_user_nickname{
            display: inline-block;
            /*float: left;*/
            margin-left: 10px;
            line-height: 50px;
            height: 50px;
            width: 100px;
        }
        .review_profile_img{
            display: inline-block;
            float: left;
            border-radius: 50px;
        }
        .review_wrap{
            width: 650px;
            margin: auto;
            padding: 10px;
        }
        .review_regdate{
            float: right;
            line-height: 50px;
            font-size: 14px;
            color: #424242;
        }
        .review_detail{
            margin-top: 30px;
            line-height: 25px;
        }
        .review_item{
            margin-top: 30px;
            margin-bottom: 20px;
            background-color: #b9b9b9;
        }
        /* 리뷰_ 기버가 남기는 댓글 box*/
        .reply_detail_box {
            width: 650px;
            margin: 20px 0 30px 10px;
        }
        .reply_detail{
            display: inline-block;
            position: relative;
            width: 570px;
            background-color: #fff;
            box-shadow: 2px 2px 2px #424242;
        }
        /* 리뷰 _ 기버 프로필 이미지*/
        .reply_giver_profile_img{
            vertical-align: top;
            width: 50px;
            height: 50px;
            border-radius: 100%;
        }
        .reply_regdate{
            float: right;
        }
        .reply_detail .btn{
            position: absolute;
            top: 3px;
            border: none;
            width: 30px;
            height: 30px;
            background-color: transparent;
            cursor: pointer;
            outline: none;
        }
        .reply_regdate{
            position: absolute;
            margin: 0;
            font-size: 14px;
            right: 10px;
            bottom: 10px;
        }
        .reply {
            padding: 20px;
            margin-left: 10px;
            margin-bottom: 30px;
            display: inline-block;
            width: 440px;
            line-height: 22px;
            letter-spacing: 0.03em;
        }

    </style>
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
                            <img class="star" src="img/green_star.png"><div class="star_review">4.2 (36)</div>
                        </div>
                    </div>
                </div>

                <!-- 상단부의 기버 정보-->
                <div class="giver_information_box">
                    <div class="giver_information">
                        <!-- taker 가 보는 giver 상세 페이지로 이동 -->
                        <a href=""><img class="giver_profile_img" src="img/walle.png"></a>
                        <a href=""><span>패션의완성양말</span></a>
                    </div>
                </div>
            </div>

            <div class="product_detail_page_content_left">
                <!-- 구독 제품 대표 이미지-->
                <img class="product_thumbnail_img" src="img/rr.png">
            </div>
            <div class="product_detail_page_content_right">
                <h2 class="subs_title">귀염뽀짝 양말 구독하기</h2>
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
                                <div class="delivery_date selected">월</div>
                                <div class="delivery_date ">화</div>
                                <div class="delivery_date">수</div>
                                <div class="delivery_date">목</div>
                                <div class="delivery_date">금</div>
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
                <img class="tab_product_detail_img" src="img/pp.jpg">
            </div>
            <!-- -------------------------구매 안내 정보-------------------------  -->
            <div class="tab_purchase_detail content" id="tab2">
                <img class="tab_purchase_detail_img" src="img/purchase_info.png"/>
            </div>
            <!-- -------------------------------리뷰------------------------- -->
            <div class="tab_review content" id="tab3">
                <ul class="review_list">
                    <li class="review_item">
                        <div class="review_wrap">
                            <div class="review_profile_box">
                                <img class="review_profile_img" src="img/walle.png" width="50" height="50"/>
                                <span class="review_user_nickname">가나다라마바사</span>
                                <span class="review_star_rating"><span style ="width:80%"></span></span>
                                <span class="review_regdate">(2020.02.10. 03:20)</span>
                                <p class="review_detail">
                                    먼저, 처음 사용해서 그런걸 수도 있지만 같은 온도에서 조리시간이 오래걸리는 느낌이 있어요. 그리고 바닥 망이 분리가 되서 세척이 편하지만 식기세척기 사용은 안되는 제품인걸 알고 사셔야해요(기존 제품은 가능) 또한 바닥망이 꽉 고정되지 않다보니 음식(고구마, 감튀 등) 뒤집을때 손목 스냅을 이용해서 한번에 뒤집을 수 없고 일일이 집게로 뒤집어 줘야함. 생각보다 에어프라이가 무겁기도 하구요. 기존제품은 오래사용하다보니 손잡이 쇠부분에 녹이 슬었는데, 이 모델도 그런지는 장기간 사용해야만 판단이 되는 부분일것 같구요.
                                    먼저, 처음 사용해서 그런걸 수도 있지만 같은 온도에서 조리시간이 오래걸리는 느낌이 있어요. 그리고 바닥 망이 분리가 되서 세척이 편하지만 식기세척기 사용은 안되는 제품인걸 알고 사셔야해요(기존 제품은 가능) 또한 바닥망이 꽉 고정되지 않다보니 음식(고구마, 감튀 등) 뒤집을때 손목 스냅을 이용해서 한번에 뒤집을 수 없고 일일이 집게로 뒤집어 줘야함. 생각보다 에어프라이가 무겁기도 하구요. 기존제품은 오래사용하다보니 손잡이 쇠부분에 녹이 슬었는데, 이 모델도 그런지는 장기간 사용해야만 판단이 되는 부분일것 같구요.
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

<script src="js/jquery.js"></script>
<script src="js/tui-date-picker.min.js"></script>
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
            minDate: 3,
            /* 뭔가 이거는 다같이 얘기 해봐야 하지 않을까? 최대 기간 정해두는 게 나을 것 같다. */
            maxDate: 14
        });

    }); //function() end


</script>
</html>