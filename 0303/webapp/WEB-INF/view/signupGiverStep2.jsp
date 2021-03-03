<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<link rel="stylesheet" href="css/signupGiverStep2.css"/>
</head>
<body>
<div id="container"><!--container start-->
    <div id="signUpReadyTitleContent"><!--signUpTitleContent start-->
        <img src="/img/로고.png" width="240"><span>Take It</span>
    </div><!--//signUpTitleContent end-->
    <div id="singUpReadyContent"><!--singUpReadyContent start-->
        <div class="head_sentence"><span>사업자 등록번호를 입력하세요.</span><span>사업자 번호로 등록여부를 확인합니다.</span></div>
        <input id="businessNumInput" name="businessNum" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
        <a href="">다음</a>
    </div><!--//singUpReadyContent end-->
</div><!--//container end-->
</body>
</html>