<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Take It</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/appleSDGothic.css">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/searchResult.css">
    <link rel="stylesheet" href="/css/header.css"/>
	<link rel="stylesheet" href="/css/footer.css"/>
    <style>
        #container{
       		padding-top:80px;
            font-family: "AppleSDGothic",sans-serif;
            width: 1100px;
            margin: auto;
        }
        #hero_img_content{
            height: 500px;
            background-size: cover;
            background-repeat: no-repeat;
            background-image: url("img/히어로이미지.jpg");
            overflow: hidden;
        }
        .hero_cover{
            position: relative;
            margin-top: -200px;
            width: 1100px;
            height: 5000px;
            background-color: #424242;
            opacity: 0.35;
        }
        .hero_comment_wrap{
            user-select: none;
            display: inline-block;
            position: relative;
            left: 50%;
            top: 50%;
            margin-left: -200px;
            margin-top: -80px;
            z-index: 1;
        }
        .msg{
            color: #fff;
            font-weight: 100;
        }
        .main_msg{
            font-size: 50px;
            line-height: 60px;
        }
        .sub_msg{
            text-decoration: none;
            margin-top: 30px;
            font-size: 18px;
        }
        .main_menu_wrap{
            position: relative;
            height: 350px;
            margin-top: 50px;
            user-select: none;
        }
        .main_menu_wrap a{
            text-decoration: none;
            color: #424242;
            font-size: 30px;
        }
        .main_menu_wrap li{
            float: left;
            margin-left: 20px;
        }
        .main_menu_wrap span{
            display: block;
            width: 250px;
            height: 60px;
            line-height: 60px;
            text-align: center;
            background-color: rgb(243, 232, 229);
        }
        .menu_box{
            width: 250px;
            height: 250px;
            overflow: hidden;
        }
        .menu_item:hover img{
            transform: scale(1.2);
            transition: ease 0.2s;
        }
        .best_seller_content{
            clear: both;
            position: relative;
            height: 500px;
            margin-top: 75px;
        }
        .best_seller_msg{
            display: inline-block;
            width: 1100px;
            text-align: center;
            font-size: 40px;
            color: #424242;
            user-select: none;
        }
        .best_seller_wrap{
            margin-top: 80px;
        }

        .slide_box{
            margin-left: 60px;
            width: 990px;
            overflow: hidden;
        }
        .slide_box li{
            margin-right: 30px;
            float: left;
        }
        .slide_box ul{
            float: left;
            width: 3960px;
        }
        .prev{
            visibility: hidden;
        }
        .next{
            right: 0;
        }
        .kategorie{
            float: left;
            display: inline-block;
            margin-bottom: 20px;
            width: 1100px;
            font-size: 25px;
            text-align: center;
        }
        .steady_seller_content{
            margin-top: 200px;
            width: 1100px;
            height: 800px;
            margin-bottom: 100px;
            user-select: none;
            color: #424242;
        }
        .steady_seller_content span{
            display: inline-block;
            float: left;
            position: relative;
            height: 50px;
            width: 500px;
            font-size: 30px;
            line-height: 50px;
        }
        .slide_list{
            position: relative;
            user-select: none;
            transition: ease 0.2s;
            left: 0;
        }
        .slide_list a{
            text-decoration: none;
        }
        .steady_seller_content .btn{
            position: relative;
            display: block;
            width: 100px;
            height: 40px;
            color: #fff;
            background-color: #3C7166;
            text-decoration: none;
            line-height: 40px;
            text-align: center;
            margin-left: 950px;
        }
        .best_seller_wrap .btn{
            position: absolute;
            display: block;
            width: 50px;
            height: 50px;
            border: none;
            background-color: transparent;
            font-size: 30px;
            cursor: pointer;
            top:360px;
            user-select: none;
            outline: none;
        }
        .kategorie_box{
            width: 1100px;
            overflow: hidden;
        }
        .kategorie_list{
            left: 0;
            width: 4400px;
            position: relative;
            user-select: none;
            float: left;
            transition: 0.2s ease;
        }
        .slide_list a:hover .subscription_item_price {
            color:#424242;
        }
        .search_result_wrap{
            width:1100px;
            min-height: 600px;
            margin: 30px auto;
        }
        .search_result_list img{
            width: 250px;
            height: 250px;
        }
        .search_result_wrap .subscription_item_info{
            width:  250px;
        }
        .search_result_wrap .subscription_item_company{
            font-size: 15px;
        }
        .search_result_wrap .subscription_item_label{
            background-color: #cc5750;
            color:#f4fffd;
            width:45px;
            height:23px;
            font-size: 14px;
            font-weight: 700;
            line-height: 25px;
        }
        .search_result_wrap .subscription_item_name{
            font-size: 13px;
        }
        .search_result_wrap .subscription_item_price{
            font-size: 18px;
        }
        .search_result_list{
            margin-top: 75px;
        }
        .search_result_list li{
            margin: 0 12px;
            float: left;
        }
        .search_result_list a:hover .subscription_item_price {
            color:#424242;
        }
        </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
<div id="container">
    <div id="hero_img_content">
        <div class="hero_comment_wrap">
            <p class="main_msg msg">구독은 TAKE IT<br/>
                과 함께
            </p>
            <a class="sub_msg" href=""><p class="msg">클릭 한 번으로  편리하게 생활하세요</p></a>
        </div>
        <div class="hero_cover"></div>
    </div>
    <!--//hero_img_content-->
    <div id="main_menu_content">
        <div class="main_menu_wrap">
            <ul>
                <li class="menu_item"><a href="">
                    <div class="menu_box"><img src="img/의.jpg" width="250px" height="250px"/></div><span>의</span>
                </a></li>
                <li class="menu_item"><a href="">
                    <div class="menu_box"><img src="img/식.jpg" width="250px" height="250px"/></div><span>식</span>
                </a></li>
                <li class="menu_item"><a href="">
                    <div class="menu_box"><img src="img/주.jpg" width="250px" height="250px"/></div><span>주</span>
                </a></li>
                <li class="menu_item"><a href="">
                    <div class="menu_box"><img src="img/기타.jpg" width="250px" height="250px"/></div><span>기타</span>
                </a></li>
            </ul>
        </div>
    </div>
    <!--//main_menu_content-->
    <div class="best_seller_content">
        <span class="best_seller_msg">금주의 Best 구독</span>
        <div class="best_seller_wrap">
            <div class="kategorie_box">
                <ul class="kategorie_list">
                    <li><span class="kategorie">의</span></li>
                    <li><span class="kategorie">식</span></li>
                    <li><span class="kategorie">주</span></li>
                </ul>
            </div>
            <div class="slide_box">
                <ul class="slide_list">                
                    <c:forEach items="${hotCProducts }" var="hotCProduct">
                    <li>
                        <a href="">
                            <img src="img/${hotCProduct.photo }.jpg"/>
                            <div class="subscription_item_info"><!--subscription_item_info start -->
                                <div class="subscription_item_company_and_label"><!--subscription_item_company_and_label start -->
                                    <div class="subscription_item_company">${hotCProduct.company }</div>
                                    <div class="subscription_item_label">인기</div>
                                </div><!--//subscription_item_company_and_label end -->
                                <div class="subscription_item_name">${hotCProduct.name }</div>
                                <div class="subscription_item_price_and_rate_box"><!--subscription_item_price_and_rate_box start -->
                                    <div class="subscription_item_price">${hotCProduct.price }</div>
                                    <div class="subscription_item_rate"><!--subscription_item_rate start -->
                                        <div class="grade_star box">
                                            <div class="inner_star box" style="width:${star*20}%"></div>
                                        </div>
                                    </div><!--//subscription_item_rate end -->
                                </div><!--//subscription_item_price_and_rate_box end -->
                            </div><!--//subscription_item_info end -->
                        </a>
                    </li>
                    </c:forEach>
                    <c:forEach items="${hotFProducts }" var="hotFProduct">
                    <li>
                        <a href="">
                            <img src="img/${hotFProduct.photo }"/>
                            <div class="subscription_item_info"><!--subscription_item_info start -->
                                <div class="subscription_item_company_and_label"><!--subscription_item_company_and_label start -->
                                    <div class="subscription_item_company">${hotFProduct.company }</div>
                                    <div class="subscription_item_label">인기</div>
                                </div><!--//subscription_item_company_and_label end -->
                                <div class="subscription_item_name">${hotFProduct.name }</div>
                                <div class="subscription_item_price_and_rate_box"><!--subscription_item_price_and_rate_box start -->
                                    <div class="subscription_item_price">${hotFProduct.price }</div>
                                    <div class="subscription_item_rate"><!--subscription_item_rate start -->
                                        <div class="grade_star box">
                                            <div class="inner_star box" style="width:${hotFProduct.star*20}%"></div>
                                        </div>
                                    </div><!--//subscription_item_rate end -->
                                </div><!--//subscription_item_price_and_rate_box end -->
                            </div><!--//subscription_item_info end -->
                        </a>
                    </li>
                    </c:forEach>
                    <c:forEach items="${hotHProducts }" var="hotHProduct">
                    <li>
                        <a href="">
                            <img src="img/${hotHProduct.photo }"/>
                            <div class="subscription_item_info"><!--subscription_item_info start -->
                                <div class="subscription_item_company_and_label"><!--subscription_item_company_and_label start -->
                                    <div class="subscription_item_company">${hotHProduct.company }</div>
                                    <div class="subscription_item_label">인기</div>
                                </div><!--//subscription_item_company_and_label end -->
                                <div class="subscription_item_name">${hotHProduct.name }</div>
                                <div class="subscription_item_price_and_rate_box"><!--subscription_item_price_and_rate_box start -->
                                    <div class="subscription_item_price">${hotHProduct.price }원</div>
                                    <div class="subscription_item_rate"><!--subscription_item_rate start -->
                                        <div class="grade_star box">
                                            <div class="inner_star box" style="width:${hotHProduct.star*20}%"></div>
                                        </div>
                                    </div><!--//subscription_item_rate end -->
                                </div><!--//subscription_item_price_and_rate_box end -->
                            </div><!--//subscription_item_info end -->
                        </a>
                    </li>
                    </c:forEach>
            </ul>
        </div>
    </div>
    <!--//best_seller_content-->
    <div class="steady_seller_content">
        <span>인기있는 구독</span>
        <a href="" class="btn">더보기</a>
        <div class="search_result_wrap">
            <ul class="search_result_list">
            	<c:forEach items="${currentProducts }" var="currentProduct">
                <li>
                    <a href="">
                        <img src="/img/${currentProduct.photo }"/>
                        <div class="subscription_item_info"><!--subscription_item_info start -->
                            <div class="subscription_item_company_and_label"><!--subscription_item_company_and_label start -->
                                <div class="subscription_item_company">${currentProduct.company }</div>
                                <div class="subscription_item_label">인기</div>
                            </div><!--//subscription_item_company_and_label end -->
                            <div class="subscription_item_name">${currentProduct.name }</div>
                            <div class="subscription_item_price_and_rate_box"><!--subscription_item_price_and_rate_box start -->
                                <div class="subscription_item_price">${currentProduct.price}원</div>
                                <div class="subscription_item_rate"><!--subscription_item_rate start -->
                                    <div class="grade_star box">
                                        <div class="inner_star box" style="width:${currentProduct.star*20}%"></div>
                                    </div>
                                </div><!--//subscription_item_rate end -->
                            </div><!--//subscription_item_price_and_rate_box end -->
                        </div><!--//subscription_item_info end -->
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!--//steady_seller_content-->
</div>
    <c:import url="/WEB-INF/view/template/footer.jsp"></c:import>

</div>
</body>
<script src="js/jquery.js"></script>
<script>

    let left=0;
    let kategorieLeft = 0;
    const $kategorieList =  $(".kategorie_list");
    const $next = $(".next");
    const $prev = $(".prev");
    const $slide_list = $(".slide_list");

    //다음버튼눌렀을때
    $next.on("click",function () {
        $prev.css("visibility","visible");
        left -= 990;
        kategorieLeft -=1100;
        $kategorieList.css("left",kategorieLeft);
        console.log(left);


        $slide_list.css("left",left);
        if(left == -2970){
            $next.css("visibility","hidden");
            console.log(left);
        }
    });

    //이전버튼눌렀을때
    $prev.on("click",function () {
        $next.css("visibility","visible");
        left +=990;
        kategorieLeft +=1100;
        $kategorieList.css("left",kategorieLeft);
        console.log(left);

        $slide_list.css("left",left);
        if(left==0){
            $prev.css("visibility","hidden");
        }
    });

</script>
</html>