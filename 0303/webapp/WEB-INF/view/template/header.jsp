<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="header">

    <!-- 헤더 내용들 -->
    <div class="header_contents_box">
        <!-- hcb == header_contents_box를 줄인 단어 -->
        <!-- 로고 -->
        <div class="hcb_logo">
            <a href="">
                <img src="img/로고.png" class="header_logo_img">
                <span class="header_logo_font">TAKE IT</span>
            </a>
        </div>
        <!-- end hcb_logo -->

        <!-- 카테고리 -->
        <div class="hcb_category">
            <ul>
                <li><a href="">의류</a></li>
                <li><a href="">식품</a></li>
                <li><a href="">주거</a></li>
                <li><a href="">기타</a></li>
            </ul>
        </div>
        <!-- end hcb_category -->

        <!-- 검색 -->
        <div class="hcb_search">
            <form>
                <div>
                    <input type="text">
                    <button><i class="fas fa-search"></i></button>
                </div>
            </form>
        </div>
        <!-- end hcb_search -->

        <!-- 로그인 -->
        <div class="hcb_login">
            <div class="hcb_login_btn"><a href="/log">로그인</a></div>
            <div class="hcb_profile">
                <p>
                    <i class="fas fa-bars"></i>
                    <i class="far fa-user-circle"></i>
                </p>
            </div>
            <div class="hcb_mypage_and_logout">
                <ul>
                    <li><a href="">마이페이지</a></li>
                    <li><a href="">로그아웃</a></li>
                </ul>
            </div>
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
