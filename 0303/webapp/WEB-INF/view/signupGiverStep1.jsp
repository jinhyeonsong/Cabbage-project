<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/signupGiverStep1.css"/>
</head>
<body>
<div id="container"><!--container start-->
    <div id="signUpReadyTitleContent"><!--signUpTitleContent start-->
        <img src="/img/로고.png" width="240"><span>Take It</span>
    </div><!--//signUpTitleContent end-->
    <div id="singUpReadyContent"><!--singUpReadyContent start-->
        <div class="head_sentence"><span>기버로 가입하기 위해서는 아래와 같은 서류가 필요합니다.</span></div>
        <div class="giver_prepare_list_box"><!--giver_prepare_list_box start-->
            <ul class="giver_prepare_list"><!--giver_prepare_list start-->
                <li class="giver_prepare_item">사업자 등록증 사본 1부</li>
                <li class="giver_prepare_item">대표자 법인 명의 통장 사본 1부</li>
                <li class="giver_prepare_item">(필요한 경우)인감증명서 사본 1부</li>
            </ul><!--//giver_prepare_list end-->
        </div><!--//giver_prepare_list_box end-->
        <a href="/giver/signUp/step2">다음</a>
    </div><!--//singUpReadyContent end-->
</div><!--//container end-->
</body>
</html>