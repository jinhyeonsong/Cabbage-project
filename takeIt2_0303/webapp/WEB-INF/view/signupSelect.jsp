<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>회원가입 유형 선택</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/signupSelect.css"/>
</head>
<body>
<div id="wrap">
    <div id="contents">
        <img class="logo" src="/img/로고.png" width="200px" height="50px" />
        <h2>회원가입 유형을 선택하세요</h2>
        <div class="signupSelectBox">
            <input type="radio" id="taker" name="signupSelect" value="taker" checked/>
            <label class="signLabel" for="taker">테이커 회원가입</label>
            <input type="radio" id="giver" name="signupSelect" value="giver"/>
            <label class="signLabel" for="giver">기버 회원가입</label>
        </div>
        <div class="takerIntroduce">
            <span>
                서비스를 이용하는 이용하는 일반회원입니다.</br>
                내 동네 구독 서비스를 한 눈에 볼 수 있고</br>
                편리하게 관리할 수 있습니다.
            </span>
            <a href="/taker/signUp" class="btn">next ></a>
        </div>
        <div class="giverIntroduce">
            <img src="img/giverIntroduce.JPG" width="1000px" height="650px" />
            <a href="/giver/signUp/step1" class="btn">next ></a>
        </div>
    </div>
</div>
</body>
<script src="js/jquery.js"></script>
<script>
    const $html = $("html");
    const $taker = $("#taker");
    const $giver = $("#giver");
    const $takerIntroduce = $(".takerIntroduce");
    const $giverIntroduce = $(".giverIntroduce");

    $taker.on("click",function (){
        $takerIntroduce.css("display","block");
        $giverIntroduce.css("display","none");
        $html.css("padding-right","17px");
    });
    $giver.on("click",function (){
        $takerIntroduce.css("display","none");
        $giverIntroduce.css("display","block");
        $html.css("padding-right","0");
    });
</script>
</html>