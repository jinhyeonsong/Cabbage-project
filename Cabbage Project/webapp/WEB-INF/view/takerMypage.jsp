<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Taker MyPage</title>
 <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/calendar.css"  />
    <style>
    
    #container{
    	height:1400px;
    }
    
     #content{
            width:1100px;
            position:relative;
            margin: 0 auto;
            font-family: AppleSDGothic, sans-serif;
            color: #424242;
            /*background-color: #425F9C;*/
        }
        .taker_my_page_header{
            position:relative;
            width: 300px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            /*background-color: #00bcd4;*/
            left: 20px;
            top: 30px;
        }

        .taker_my_page_header>h1{
            font-size: 35px;
        }

        /* 프로필, 예상 결제 금액 정보 관련 css */

        .taker_profile_payment_info {
            position: relative;
            width: 400px;
            height: 300px;
            /*background-color: #0e4271;*/
            left:70px;
            top: 50px;
        }

        .taker_profile_box{
            position:absolute;
            width: 170px;
            height: 170px;
            left: 20px;
            top: 30px;
            /*background-color: blue;*/
        }
        /*프로필 사진 유효성 검사 메시지 */
        .profile_msg{
            position:relative;
            text-align: center;
            top: 10px;
            color: #b00020;
        }
        /*닉네임 유효성 검사 메시지 */
        .nickname_msg{
            color: #b00020;
            position:relative;
            margin: 40px auto;
        }
        .apply_edited_nickname_btn{
            font-size: 20px;
            border: none;
            background-color: #3c7166;
            padding: 4px 12px;
            border-radius: 2px;
            color: #fff;
            position: absolute;
            bottom: 28px;
            left: 248px;
        }
        /*닉네임 수정 인풋 요소 */
        #nickname{
            line-height: 36px;
            position:relative;
            margin: 20px auto;
            top: 50px;
        }

        /*이번달 예상 결제 금액*/
        .monthly_payment_info{
            width: 198px;
            height: 38px;
            border: 1px solid #757575;
            /*background-color: #00C853;*/
            position:absolute;
            top: 90px;
            right:0;
            padding-top: 10px;
            padding-left: 4px;
        }

        .taker_profile>img{
            border-radius: 50%;
            width: 150px;
            height: 150px;
        }
        .profile_edit_label{
            display: inline-block;
            position: absolute;
            top: 110px;
            left: 100px;
            font-size: 40px;
            color: #616161;
        }

        /*풀캘린더 관련  css */

        .full_calendar_wrap{
            width: 500px;
            height: 400px;
            position: relative;
            left: 550px;
            top: -300px;
           
        }
        /* 여기에 풀캘린더 api 담을 것 임 */
        #calendar {
            width: 500px;
            height: 400px;
            background-color: #fff;
            position: relative;
        }
        /*풀캘린더 월 이동 버튼*/
        #calendar .fc-prev-button, #calendar .fc-next-button{
            background-color: #3c7166;
            border: none;
        }
        #calendar .fc-toolbar-chunk .fc-today-button{
            background-color: #0b4d40;
        }
        /* 풀캘린더 오늘 날짜 배경색 변경 */
        .fc .fc-daygrid-day.fc-day-today{
            background-color: rgba(60, 113, 102, 0.8);
        }



        /*taker 기본 정보 관련 css */
        .taker_basic_info {
         
            width: 998px;
            height: 218px;
            border: 1px solid #eee;
            border-radius: 4px;
         	margin:auto;
         	 margin-top:-250px;
         	
            background-color: #f6f6f6;
          
        }
        .taker_basic_info_header{
            position:relative;
            width: 300px;
            height: 40px;
            line-height: 40px;
            top: 10px;
            left: 50px;
            /*background-color: #3EB39D;*/
        }
        .taker_basic_info_header>h2{
            font-size: 30px;
        }
        .taker_basic_info_list{
            position: relative;
            height: 180px;
            width: 800px;
            left: 50px;
            top: 28px;
            /*background-color: #438676;*/
        }
        .taker_basic_info_list>dt{
            float: left;
            width: 100px;
            height: 40px;
            line-height: 40px;
            font-size: 20px;
        }
        .taker_basic_info_list>dd{
            float: left;
            width: 700px;
            height: 40px;
            line-height: 40px;
            font-size: 16px;
        }
        /* 닉네임 수정관련  css */
        .nickname_edit_btn, .phone_edit_btn{
            background-color: transparent;
            border: none;
            position: absolute;
            color: #424242;
        }

        /*개인 정보 수정 버튼 위치 조정 */
        .nickname_edit_btn{
            font-size: 16px;
            left: 200px;
            top: 50px;
        }
        .phone_edit_btn{
            left: 240px;
            top: 91px;
        }
        /* 구독 리스트 css */
        .subscribes{
            /*position: relative;*/
            width: 1000px;
          
            /*left: 50px;
            top: -250px;*/
          
            margin:auto;
            
              margin-top:50px;
            
        }
        /* 내 구독리스트, 구독 히스토리 탭 */
        .subscribes_tab{
          /*  position: relative;*/
            width: 1000px;
            height: 71px;
            /*background-color: #c75550;*/
            /*top: 0;
            left: 0;*/
         
            border-top: 2px solid #757575;
            border-bottom: 2px solid #757575;
            font-weight: 800;
        }
        
        
        /*/////////////////////////////////////////////*/
        .my_subscribe_list, .my_subscribe_history{a
          /* position:absolute;*/
          	display:inline-block;
            width:498px;
            height: 75px;
            line-height: 75px;
            text-align: center;
            font-size: 32px;
            float:left;
        }
        
         input[type=radio] + label:hover{
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        input[type=radio]:checked + label{
            color: #3C7166;
            border-color: #3C7166;
        }
      /*  .my_subscribe_list{
            border-right: 1px solid #757575;
        }
        .my_subscribe_list>a{
            text-decoration: underline;
            color: #3C7166;
            text-decoration-color: #3C7166;
        }
        .my_subscribe_list>a.nodeco{
            text-decoration: none;
            color: #424242;
        }

        .my_subscribe_history{
            left: 500px;
            border-left: 1px solid #757575;
        }*/
        /*
        .my_subscribe_history>a{
            text-decoration: none;
            color: #424242;
        }

        .my_subscribe_history>a.deco{
            text-decoration: underline;
            color: #3C7166;
            text-decoration-color: #3C7166;
        }
        .current_subscribes, .subscribes_history{
            position:relative;
            width: 1000px;
            top: 20px;
        }
        .current_subscribes{
            display: block; */
            /*background-color: darkgoldenrod;
        }*/
        /* 구독 히스토리 감춰놓기 */
       /* .subscribes_history{
            display: none;
            background-color: #438676;
        }*/

        /* 구독 item 관련 css */
        .one_subscribe{
            position: relative;
            width: 946px;
            height: 196px;
            left: 25px;
            border: 2px solid #BDBDBD;
            border-radius: 2px;
            margin-top:20px;
            /*background-color: #ffeb3b;*/
        }
        .my_subscribe_essentials{
            position: relative;
            height: 200px;
            width: 120px;
            /*background-color: #c75550;*/
        }
        .representative_image{
        	width:120px;
        	height:196px;	
        	position:absolute;
        	left:0;
        	top:0;
        }
        .representative_image img{
        	margin : 20px 10px;
        }
        .subscription_title{
            position: relative;
            text-align: center;
        }
        .my_subscribe_specifics{
            position: relative;
            font-size: 18px;
            height: 160px;
            width: 830px;
            left: 100px;
            top: -200px;
            /*background-color: yellowgreen;*/
        }

        .my_subscribe_specifics>dt{
            width: 140px;
            float:left;
            padding-left: 30px;
            padding-top: 10px;
        }
        .my_subscribe_specifics>dd{
            width: 650px;
            float: left;
            padding-top: 10px;
        }

        /*리뷰 작성, 구독 취소 a요소 css */
        #container .write_review_btn, #container .cancel_subscription_btn,#container .update_review_btn {
            display: block;
            position: absolute;
            right: 20px;
            top: 50px;
            width: 80px;
            text-align: center;
            height: 24px;
            line-height: 24px;
            background-color: #438676;
            padding: 6px 4px;
            border-radius: 2px;
            color: #fff;
        }
        #container .cancel_subscription_btn{
            top: 90px;
        }

        /* 리뷰 작성 팝업창, 닉네임 변경 팝업창 css */

        .write_review_pop_up,.nickname_edit_pop_up {
            z-index: 100;
            /* 브라우저 기준 */
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,.75);
            left: 0;
            top:0;
            /*리뷰 작성 버튼 누르기 전까지는 팝업창 보이지 않게하기 위함*/
            display: none;
        }
        .write_review_pop_up.write{
            display: block;
        }
        .nickname_edit_pop_up.edit{
            display: block;
        }

        .write_review_box, .nickname_edit_wrap{
            width: 568px;
            /*
            274*2 +10*2(양 옆 마진 10px 줄거임)
            */
            height:384px;
            border:2px solid transparent;
            border-radius: 4px;
            position:fixed;
            background-color: #fafafa;
            left:50%;
            top:50%;
            margin: -194px 0 0 -286px;
        }
        .review_submit_btn{
            position:absolute;
            bottom: 8px;
            left: 256px;
            border: none;
            padding: 1px 8px;
        }

        .pop_review_header_wrap,.nickname_edit_header_box{
            width:568px;
            height: 58px;
            position:relative;
            border-bottom: 2px solid #eee;
        }
        .pop_review_header_title, .pop_nickname_edit_header_title{
            position:absolute;
            top:0;
            left: 16px;
            padding: 15.5px 0;
        }
        .pop_nickname_edit_content>label{
            font-size: 16px;
            position: absolute;
            top: 48px;
            left: 170px;
        }
        .writing_review, .nickname_change {
            font-size: 25px;
        }
        .pop_review_content , .pop_nickname_edit_content {
            position:relative;
            margin: 10px 0 0 10px;
            width: 548px;
            height: 324px;
            text-align: center;
        }
        .subscription_product_name{
            font-size: 24px;
            position:relative;
        }
        .subscriber_review_box{
            position: relative;
            top: 100px;
        }
        .subscriber_review_box>label{
            font-size: 18px;
        }
        #subscriberReview{
            position: relative;
            resize: none;
            top: 20px;
        }
        /*팝업창 닫기 버튼*/
        .review_close_btn, .nickname_close_btn{
            position: absolute;
            border:none;
            background-color: transparent;
            outline: none;
            right:8px;
            top:12px;
            color:#757575;
            cursor: pointer;
            font-size: 25px;
        }
        /*별 평점 관련 css */
        .rating_box{
            position:absolute;
            top: 60px;
            left:230px;
        }
        .grade_star_box{
            font-size: 30px;
            position:relative;
            left: -48px;
        }
        
         /*라디오인풋 비활성화 */
        input[type=radio],input[type=checkbox]{
            display:none;
        }
        /*라디오인풋+라벨 CSS */
        
    </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
<div id="container"><!--container start-->
    <div id="content"><!--content start-->
        <div class="taker_my_page_header">
        <h1>테이커 마이페이지 </h1>
        </div>
        <div class="taker_profile_payment_info"><!--taker_profile_payment_info-->
            <div class="taker_profile_box"><!--taker_profile_box-->
                <div class="taker_profile">
                    <img src="img/taker_profile.jpg"/>
                </div>
                <label for="takerProfileEdit" class="profile_edit_label fas fa-plus-circle"></label>
                <input type="file" name="takerProfile" id="takerProfileEdit" class="profile_input screen_out"/>
                <div class="profile_msg"></div>
            </div><!--//taker_profile_box end-->
            <dl class="monthly_payment_info">
                <dt>이번달 총 예상 결제 금액</dt>
                <dd>10,000원</dd>
             </dl>
        </div><!--//taker_profile_payment_info end-->
        <div class="full_calendar_wrap"><!--full_calendar_wrap-->
            <div id="calendar"></div><!--full calendar 담을 박스-->
        </div><!--//full_calendar_wrap-->
        <div class="taker_basic_info"><!--taker_basic_info-->
            <div class="taker_basic_info_header">
                <h2>테이커 정보</h2>
            </div>
            <dl class="taker_basic_info_list"><!--taker_basic_info_list-->
                <dt>이름</dt>
                <dd>정진하</dd>
                <dt>별명</dt>
                <dd class="taker_nickname">찐니</dd>
                <button class="nickname_edit_btn fas fa-edit"></button>

                <dt>이메일</dt>
                <dd>jinha4ever@gmail.com</dd>
            </dl><!--//taker_basic_info_list-->
        </div><!--//taker_basic_info-->
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <div class="subscribes"><!--subscribes-->
            <div class="subscribes_tab">
                <input id="current" type="radio" name="status" value="current" checked/>
                	<label for="current" class="my_subscribe_list">내 구독 리스트</label>
                <input id="history" type="radio" name="status" value="history" />
                	<label for="history" class="my_subscribe_history">구독 히스토리</label>
        	 </div>
            
            <div id="subItemList">
            <%--현재 내 구독 리스트 /////////////////////////////////////////////////////////////////////--%>
           <%--<ul class="current_subscribes"><!--current_subscribes-->
                <li class="one_subscribe"><!--one_subscribe-->
                    <dl class="my_subscribe_essentials">
                        <dt class="screen_out">대표사진</dt>
                        <dd class="representative_image"><img src="img/masks.jpg" width="100" height="100">
                        <span class="subscription_title">마스크 네고</span></dd>
                      
                    </dl>
                    <dl class="my_subscribe_specifics">
                        <dt>가격</dt>
                        <dd class="subscription_price">5,900</dd>
                        <dt>배송 요일</dt>
                        <dd class="delivery_day">월, 수</dd>
                        <dt>배송지 주소</dt>
                        <dd class="delivery_address">서울시 관악구 남부순환로 1820 에그옐로우빌딩 14층</dd>
                        <dt>구독 시작일</dt>
                        <dd class="subscription_start_date">2020월 1월 11일</dd>
                        <dt>다음 결제일</dt>
                        <dd class="next_payment_date">2020월 2월 11일</dd>
                    </dl>
                    <a class="write_review_btn" href="">리뷰 작성</a>
                    <a class="cancel_subscription_btn" href="">구독 취소</a>
                </li><!--//one_subscribe-->
                    
                <li class="one_subscribe"><!--one_subscribe-->
                    <dl class="my_subscribe_essentials">
                        <dt class="screen_out">대표사진</dt>
                        <dd class="representative_image"><img src="img/masks.jpg" width="100" height="100">
                        <span class="subscription_title">마스크 네고</span></dd>
                      
                    </dl>
                    <dl class="my_subscribe_specifics">
                        <dt>가격</dt>
                        <dd class="subscription_price">5,900</dd>
                        <dt>배송 요일</dt>
                        <dd class="delivery_day">월, 수</dd>
                        <dt>배송지 주소</dt>
                        <dd class="delivery_address">서울시 관악구 남부순환로 1820 에그옐로우빌딩 14층</dd>
                        <dt>구독 시작일</dt>
                        <dd class="subscription_start_date">2020월 1월 11일</dd>
                        <dt>다음 결제일</dt>
                        <dd class="next_payment_date">2020월 2월 11일</dd>
                    </dl>
                    <a class="write_review_btn" href="">리뷰 작성</a>
                    <a class="cancel_subscription_btn" href="">구독 취소</a>
                </li><!--//one_subscribe-->
                    
                    
                   
            </ul><!--//current_subscribes--> --%> 
             <%-- end 현재 내 구독 리스트 /////////////////////////////////////////////////////////////////////--%>
            </div>
            
            
        </div><!--//subscribes end-->
    </div><!--//content end-->
</div><!--//container end-->

<!--리뷰작성 팝업창 -->
<div class="write_review_pop_up"><!--write_review_pop_up-->
<form action="/taker/review" method="post">
    <div class="write_review_box"><!--write_review_box start-->
        <div class="pop_review_header_wrap">
            <div class="pop_review_header_title">
                <span class="writing_review">리뷰 작성</span>
            </div>
            <button type="button" class="review_close_btn fas fa-times"></button>
        </div>
        <div class="pop_review_content"><!--pop_review_content start-->
            <div class="subscription_product_name">구독 상품 명: 
            <input id="productNo" type="hidden" name="productNo" ><span>마스크 네고</span></div>
            <div class="rating_box">
             <div class="grade_star_box">
                 <div class="fas fa-star"></div>
                 <div class="fas fa-star"></div>
                 <div class="fas fa-star"></div>
                 <div class="fas fa-star"></div>
                 <div class="fas fa-star"></div>
             </div>
             <input id="score" name="star" type="hidden"  >
            </div>
            <div class="subscriber_review_box">
            	<input type="hidden" name="takerNo" id="inputTakerNo" value="${loginMember.no}">
                <label for="subscriberReview">구독자 리뷰</label>
                <textarea id="subscriberReview" name="review" rows="5" cols="60"
                placeholder="구독 후기를 작성해주세요."></textarea>
            </div>
        </div><!--//pop_review_content end -->
        <button type="submit" class="review_submit_btn">완료</button>
    </div><!--//write_review_box end -->
    </form>
</div><!--//write_review_pop_up end-->

<!--닉네임 팝업창 -->
<div class="nickname_edit_pop_up"><!--nickname_edit_pop_up start-->
    <div class="nickname_edit_wrap"><!--nickname_edit_box start-->
        <div class="nickname_edit_header_box">
            <div class="pop_nickname_edit_header_title">
                <span class="nickname_change">닉네임 변경</span>
            </div>
            <button class="nickname_close_btn fas fa-times"></button>
        </div>
        <div class="pop_nickname_edit_content"><!--pop_nickname_edit_content start-->
                <label class="label" for="nickname">새로운 별명을 입력해주세요.</label>
                <input id="nickname"
                       autocomplete="off"
                       placeholder="5자 내로 한글,숫자 입력"
                       title="5자 내로 한글,숫자 입력"
                       name="nickname"/>
                <div class="nickname_msg"></div>
            <button disabled="disabled" class="apply_edited_nickname_btn">수정</button>
        </div><!--//pop_nickname_edit_content end -->
    </div><!--//nickname_edit_box end -->
</div><!--//nickname_edit_pop_up end-->

<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
<script src="/js/main.js"></script>
<script id="itemTmpl" type="text/template">
<ul class="current_subscribes">
	<@ _.each(itemList,function(item) { @>
	  <li class="one_subscribe">
                    <dl class="my_subscribe_essentials">
                        <dt class="screen_out">대표사진</dt>
                        <dd class="representative_image"><img src="/img/<@=item.photo@>.JPG" width="100" height="100">
                        <span class="subscription_title"><@=item.productName@></span></dd>
                    </dl>
                    <dl class="my_subscribe_specifics">
                        <dt>가격</dt>
                        <dd class="subscription_price"><@=item.price@></dd>
                        <dt>배송 요일</dt>
                        <dd class="delivery_day"><@=item.deliveryDaysStr@></dd>
                        <dt>배송지 주소</dt>
                        <dd class="delivery_address"><@=item.addr@> <@=item.addrDetail@></dd>
                        <dt>구독 시작일</dt>
                        <dd class="subscription_start_date"><@=item.startDateOnly@></dd>
                        <dt>다음 결제일</dt>
                        <dd class="next_payment_date"><@=item.nextPayment@></dd>
                    </dl>
					<@if(item.reviewOnOff==0){@>
                    <button data-no="<@=item.productNo@>" data-name="<@=item.productName@>" 
						class="write_review_btn" >리뷰 작성</button>
                    <@}else{@>
					<button data-no="<@=item.productNo@>" data-name="<@=item.productName@>" 
						class="update_review_btn" >리뷰 수정</button>
					<@}@>
					<form id="cancelSub" action="/taker/subscription/<@=item.no@>" method="POST">
					<input type="hidden" name="_method" value="PUT">
					<@if(item.status=="Y"){@>
					<button class="cancel_subscription_btn">구독 취소</button>
					<@}@>
					</form>
                </li>
<@})@>
</ul>
  <div class="paging"><@=paginate@></div>
</script>
<script>
    //탭버튼, 구독 리스트 상수 선언
    const $mySubscribeList = $(".my_subscribe_list");
    const $mySubscribeListText = $(".my_subscribe_list>a")
    const $mySubscribeHistory = $(".my_subscribe_history");
    const $mySubscribeHistoryText = $(".my_subscribe_history>a");
    const $currentSubscribes = $(".current_subscribes");
    const $subscribesHistory = $(".subscribes_history");

 
   
    //리뷰작성버튼
    const $writingReviewBtn = $(".write_review_btn");
    //리뷰작성 팝업창
    const $writeReviewPopUp = $(".write_review_pop_up");
    //리뷰작성 팝업창 닫기 버튼
    const $reviewCloseBtn = $(".review_close_btn");
    const $gradingByStar = $(".grade_star_box>div");

    // 리뷰 작성 별점 
    const $reviewStar=$("#score");
    
    
    $writingReviewBtn.click(function (e) {
       // e.preventDefault();
     
        $writeReviewPopUp.addClass("write");
    });
    //닫기 버튼 누르면 리뷰 팝업창 닫히게하기
    $reviewCloseBtn.click(function () {
        $writeReviewPopUp.removeClass("write");
        $('.grade_star_box>div').css('color','#424242');
    });

    //리뷰 별표 클릭한 만큼 체크
    $gradingByStar.click(function () {
       const num = $(this).index();
       const index = num +1;
       for(let i=1; i< index+1 ; i++){
           $('.grade_star_box>div:nth-child('+i+')').css('color','#b00020');
       }//for end
       
       $reviewStar.val(index);

    });



    //프로필 사진 인풋요소 상수선언
    const $profileInput = $("#takerProfileEdit");
    //프로필 사진 업로드 관련 메세지
    const $profileMsg = $(".profile_msg");
    //테이커 프로파일 담기는 img 요소
    const $takerProfileImage = $(".taker_profile>img");

    $profileInput.on("change",function () {

        //File API 순수자바스크립트
        //input type=file요소에는
        //files라는 배열이 존재함

        //console.log(this.files);

        const file = this.files[0];

        //1) 파일의 크기가 0이상

        if(file.size==0) {
            $profileMsg.text("제대로 된 파일을 선택해주세요.");
            return;
        }//if end

        //2) 파일의 종류가 image
        if(!file.type.includes("image/")) {
            //파일이 image가 아닐때
            $profileMsg.text("이미지를 선택해주세요.");
            return;
        }//if end

        $profileMsg.text("파일 업로드중...");

        //3) FormData객체 생성
        const formData = new FormData();

        //4) formdata에 파라미터를 추가

        //?type=P 파라미터
        formData.append("type","P");

        //파일을 append
        formData.append("profile",file,file.name);

        //$.ajax의 enctype의 기본값은
        //application/x-www-form-urlencoded
        //enctype :
        //multipart/form-data로 넘겨야함
        //1) post방식
        //2) processData : false
        //3) contentType : false
        $.ajax({
            url:"/ajax/profile",
            type:"post",
            processData:false,
            contentType:false,
            data:formData,
            dataType:"json",
            error:function(){
                alert("서버 점검중!")
            },
            success:function(json){

                //img요소의 src속성을 넘어온 이미지로 변경
                $takerProfileImage.attr("src","/img/members/"+json.profileName);

                //메세지 제거
                $profileMsg.text("");

                //input hidden에 이름을 value로

                //$profileName.val(json.profileName);

                //서버단에서 vo에 설정된 프로필사진 멤버필드 명과 다른 이름으로
                //인풋타입 히든으로 name 넘겨야 함.


            }
        });//ajax() end

    });//change end

    //닉네임 수정 팝업창
    const $nicknameEditPopUp = $(".nickname_edit_pop_up");
    //닉네임 수정 버튼
    const $nicknameEditBtn = $(".nickname_edit_btn");
    //닉네임 인풋요소
    const $nickname = $("#nickname");
    //닉네임 메시지 박스
    const $nicknameMsg = $(".nickname_msg");
    //닉네임 팝업창 닫기 버튼
    const $nicknameCloseBtn = $(".nickname_close_btn");
    //닉네임 텍스트 부분
    const $takerNicknameDd = $(".taker_nickname");
    //닉네임 수정 팝업창 수정 버튼
    const $appliedNicknameBtn = $(".apply_edited_nickname_btn");


    $nicknameEditBtn.click(function () {
        $nicknameEditPopUp.addClass("edit");
    });
    $nicknameCloseBtn.click(function () {
        $nicknameEditPopUp.removeClass("edit");
        //입력 도중에 닫았을 시 다시 클릭하면 인풋 요소 비워져있게 하기 위함.
        $nickname.val("");
        //유효성 검사 메시지 비워주기
        $nicknameMsg.text("");
    });

    //nickname의 정규표현식
    const nicknameRegExp = /^[가-힣|0-9]{2,8}$/;

    //nickname에 글자를 쓸때
    $nickname.on("keyup",function() {

        //우선 검사중으로
        $nicknameMsg.text("검사중...");

        //유저가 입력한 id값을 얻어옴
        const nickname = $nickname.val();

        //우선 정규표현식으로 test
        if(nicknameRegExp.test(nickname)) {

            //이때 ajax를 이용하여 데이터베이스에
            //이 아이디가 존재하는 지 확인!!
            $.ajax({
                url:"/ajax/check/nickname",//주소
                type:"get",//방식
                data:{"nickname":nickname},//파라미터
                dataType:"json",//응답의 자료형
                error:function(xhr,error){
                    alert("서버 점검중!");
                    console.log(error);
                },
                success:function(json){

                    //alert("성공!!");
                    //console.log(json);

                    if(json.result) {
                        $nicknameMsg.text("이미 사용중인 닉네임입니다.");

                    }else {
                        $nicknameMsg.text("아주 좋은 닉네임이군요!");

                        //유효성 검사 통과하면 수정 버튼 활성화시키기.
                        $appliedNicknameBtn.removeAttr("disabled");

                    }//if~else end

                }
            });//ajax end

        }else {
            //틀렸을때
            $nicknameMsg.removeClass("ok")
                .text("한글, 숫자로 5글자 이상 입력해주세요. ㅠ-ㅠ");

        }//if~else end

    });//keyup() end

    $appliedNicknameBtn.click(function () {

        $nicknameEditPopUp.removeClass("edit");
        const nickname = $nickname.val();
        $takerNicknameDd.text(nickname);
 	
    });
 	 	
    
    // 현재 구독 중인지 히스토리인지 //////////////////////////////////////////////////////////
    
   
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
let page=1;	
const itemTmpl = _.template($("#itemTmpl").html());
const $itemListBox = $("#subItemList");
const $inputProductNo=$("#productNo");
const $inputTakerNo=$("#inputTakerNo");
const $writingReviewBar=$(".writing_review");
const $subscriberReview=$("#subscriberReview");

	// 상품 목록 가져오는 함수 정의 
	function  getSubList(){
		let status=$("input:radio[name='status']:checked").val();
	    $.ajax({
	       url:"/taker/"+${loginMember.no}+"/items",
	       type:"get",
	       data:{status:status,page:page},
	       error:function () {
	           alert("해당 서비스 점검중 입니다. 나중에 다시 시도해주세요");
	       },
	       success:function (json) {
	           console.log(json);
	           $itemListBox.html(itemTmpl(json));
	        }
	    });
	}
    
	// 리뷰 쓰기 버튼 
	$itemListBox.on("click",".write_review_btn",function(){
		const name =this.dataset.name;
		const no=this.dataset.no;
		// 해당 상품 이름 설정 
		$writeReviewPopUp.find(".subscription_product_name span").text(name);
		$inputProductNo.val(no);
		$writeReviewPopUp.addClass("write");
	});
	
	//0314 작성 //////////////////////////////////////////////////////////////////
	// 리뷰 수정 버튼 
	$itemListBox.on("click",".update_review_btn",function(){
		const name =this.dataset.name;
		const no=this.dataset.no;
		
		// 해당 상품 이름 설정 
		$writeReviewPopUp.find(".subscription_product_name span").text(name);
		$inputProductNo.val(no);
	
		$writingReviewBar.text("리뷰 수정");

		$.ajax({
			url:"/review",
			data:{
				productNo:no,
				takerNo:takerNo
			},
			type:"get",
			error:function(){
				alert("실패에용");	
			},
			success:function(json){
				// 별 채워 넣기			
				for(let i=1; i< json.star+1 ; i++){
			          $('.grade_star_box>div:nth-child('+i+')').css('color','#b00020');
			    }//for end
			    $reviewStar.val(json.star);
			    // 리뷰 써넣기
				$subscriberReview.val(json.review);
			}

		})
		
		// 제품 번호와 테이커 번호 이용해서 리뷰 가져와서 텍스트로 뿌려주면 괜찮을 거 같다. 
		// 그리고 인풋요소 하나 만들어서 거기에 방식이 put인거 붙여주면 괜찮을 거 같다. 
		$writeReviewPopUp.find("form").prepend("<input type=\"hidden\" name=\"_method\" value=\"PUT\" />");
		$writeReviewPopUp.addClass("write");
	});
    ////////////////////////////////////////////////////////////////////////////
    getSubList();
    

	//cancel_subscription_btn
	//구독 취소 버튼 클릭시 
	$itemListBox.on("click",".cancel_subscription_btn",function(){
		
	})
    
    
    // 라디오 누를 때
	$("input[type=radio]").on("change",function(){
	   
	    getSubList();
	});
	
    //////////////////////////////////////////////////////////////////////////////////////////


</script>

</body>
</html>