<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="header">

    <!-- 헤더 내용들 -->
    <div class="header_contents_box">
        <!-- hcb == header_contents_box를 줄인 단어 -->
        <!-- 로고 -->
        <div class="hcb_logo">
            <a href="/">
                <img src="/img/로고.png" class="header_logo_img">
                <span class="header_logo_font">TAKE IT</span>
            </a>
        </div> <!-- end hcb_logo -->

        <!-- 로그인 -->
        <div class="hcb_login">
        <c:choose>
        	<c:when test="${loginMember==null }">
            <div class="hcb_login_btn">
               <a href="/log">로그인</a>
            </div>
         	</c:when>
         	<c:otherwise>
            <div class="hcb_profile">
               <p>
                  <i class="fas fa-bars"></i> <i class="far fa-user-circle"></i>
               </p>
               </a>
            </div>
            <div class="hcb_mypage_and_logout">
               <ul>
                  <form id="logOutForm" action="/log" method="post">
                  <input type="hidden" name="_method" value="delete"/>
                  </form>
                  <li><button form="logOutForm" class="logout btn">로그아웃</button></li>
               </ul>
            </div>
         	</c:otherwise>
     	</c:choose>
     	</div>
        <!-- end hcb_login-->
    </div>
    <!-- end header_contents_box -->
</div>
<!--end herder-->

<script>

    $(function(){
        //스크롤을 얼마나 내렸을 때 명령을 실행할 것인지? shrinkHeader
        var shrinkHeader = 100;

        $(window).scroll(function(){
            var scroll = getCurrentScroll();
            if(scroll >= shrinkHeader){
                $('.hcb_category ul').css("display","none");
            }else{
                $('.hcb_category ul').css("display","block");
            }
        });
        //현재 스크롤값 가져오는 함수
        function getCurrentScroll(){
            return window.pageYOffset || document.documentElement.scrollTop;
        }
    });

    //로그인 했을경우 나오는 아이콘
    $hp = $(".hcb_profile");
    //아이콘 클릭시 나오는 리스트(마이페이지/로그아웃)
    $hmal = $(".hcb_mypage_and_logout");

    //리스트 display 체크변수
    let displayNum = 0;
    //아이콘 클릭시 리스트 display 변경함수
    $hp.click(function () {
        if(displayNum==0) {
            $hmal.css("display", "block")
            displayNum=1;
        }else{
            $hmal.css("display", "none")
            displayNum=0;
        }
    })//end hp.click
</script>
