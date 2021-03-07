<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/all.min.css"/>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/apple.css"/>
    <link rel="stylesheet" href="/css/appleSDGothic.css"/>
    <link rel="stylesheet" href="/css/header.css"/>
    <link rel="stylesheet" href="/css/footer.css"/>
    <style>
        #container {
            min-height: 800px;
            padding-top: 90px;
            padding-bottom: 90px;
        }
        #categoryContent{
            width: 1000px;
            height: 700px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-left: -500px;
            margin-top: -350px;
            text-align: center;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        #container .category_title{
            width: 800px;
            height: 60px;
            background:#5885AF;
            text-align: center;
            line-height: 60px;
            border-radius: 8px;
            color: white;
            margin-left :100px;
            margin-top: 20px;
            font-size: 30px;
            font-weight: bold;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        #categoryWrap li{
            display: inline-block;
            position: relative;
            width: 220px;
            height: 510px;
            margin-right: 15px;
            margin-top: 25px;
            border-radius: 8px;
        }
        #categoryWrap li:hover{
            transform: scale(1.05);
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        /*질문. 코드 못줄이나*/
        #categoryWrap li:nth-child(1){
            background: rgba(239, 209, 159,0.5);
        }
        #categoryWrap li:nth-child(1):hover{
            background: rgba(239, 209, 159,1);
        }
        #categoryWrap li:nth-child(2){
            background: rgba(233, 205, 208,0.5);
        }
        #categoryWrap li:nth-child(2):hover{
            background: rgba(233, 205, 208,1);
        }
        #categoryWrap li:nth-child(3){
            background: rgba(198, 196, 210,0.5);
        }
        #categoryWrap li:nth-child(3):hover{
            background: rgba(198, 196, 210,1);
        }
        #categoryWrap li:nth-child(4){
            background: rgba(185, 220, 210,0.5);
            margin-right: 0;
        }
        #categoryWrap li:nth-child(4):hover{
            background: rgba(185, 220, 210,1);
        }

        #categoryWrap li a{
            width: 220px;
            height: 500px;
            display: block;
            text-decoration: none;
            position: absolute;
            border-radius: 8px;
        }
        #categoryWrap li a div{
            width: 90px;
            height: 60px;
            line-height: 60px;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            background:white;
            font-size: 30px;
            margin: auto;
            position: absolute;
            top: 150px;
            right: 65px;
        }
        #categoryWrap li a img{
            width: 150px;
            height: 150px;
            margin-top: 15px;
            margin-bottom: 0;
            opacity: 0.4;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"/>
<div id="container">
    <div id="categoryContent">
        <h2 class="category_title">등록할 구독 상품의 카테고리를 선택하세요</h2>
             <ul id="categoryWrap">
                 <li class="clothes_item"><a href="/subscription/1/register">
                     <img src="img/iconmonstr-clothing-12-240.png"/>
                     <img src="img/iconmonstr-clothing-18-240.png"/>
                     <div style="background:#FFC27B">의류</div>
                     <img src="img/iconmonstr-clothing-16-240.png"/>
                 </a></li>
                  <li class="food_item"><a href="/subscription/2/register">
                      <img src="img/iconmonstr-eat-4-240%20(1).png"/>
                      <img src="img/iconmonstr-fast-food-7-240.png"/>
                      <div style="background:#E3BEC3">식품</div>
                      <img src="img/iconmonstr-fast-food-18-240.png"/>
                  </a></li>
                  <li class="living_item"><a href="/subscription/3/register">
                      <img src="img/iconmonstr-bed-1-240.png"/>
                      <img src="img/iconmonstr-mobile-thin-240.png"/>
                      <div style="background:#D7B9E4">거주</div>
                      <img src="img/iconmonstr-customer-11-240.png"/>
                  </a></li>
                  <li class="other_item"><a href="/subscription/4/register">
                      <img src="img/iconmonstr-cat-4-240.png"/>
                      <img src="img/iconmonstr-marketing-15-240.png"/>
                      <div style="background:#A1D6CA">기타</div>
                      <img src="img/iconmonstr-party-22-240.png"/>
                  </a></li>
             </ul>
    </div>
</div>
<c:import url="/WEB-INF/view/template/footer.jsp" />
<script src="/js/jquery.js"></script>
<script>
    const $category = $("#categoryList li");
    const $categoryDiv = $("#categoryList div");

    $category.on('mouseover',function() {
        const selectedCategory = $categoryDiv.eq($(this).index());
        selectedCategory.css({})
    });
</script>
</body>
</html>