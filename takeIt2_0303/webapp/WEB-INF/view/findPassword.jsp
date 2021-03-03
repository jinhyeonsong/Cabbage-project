<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>TakeIt | 비밀번호 찾기</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/appleSDGothic.css"/>
<link rel="stylesheet" href="/css/findPassword.css"/>
</head>
<body>

<div id="wrap">
    <div id="header">
        <div class="logo_box">
            <div>
                <img class="logo_img" src="img/로고.png" width="140" height="50"/>
            </div>
            <div class="logo_title">Take it</div>
        </div><!--logo_box-->
    </div><!--header-->
    <div id="container">
        <div class="login_box">
            <div class="login_form taker show">
                <p>비밀번호 찾기</p>
                <form action="/find/password" method="post" class="findPwForm">
                	<input type="hidden" name="_method" value="put">
                    <div class="id_box">
                        <input class="login_input" type="email" name="id" placeholder=" 가입시 등록한 이메일을 입력하세요" maxlength="35"/>
                    </div>
                    <button class="taker_login_submit txt">비밀번호 전송</button>
                </form>
            </div>
            <div class="btn_box">
                <a href="" class="btn">홈으로</a>
            </div>
        </div> <!--login_box-->
        <div class="login_footer">
        </div>
    </div><!--content-->
</div> <!--wrap-->
<script src="/js/jquery.js"></script>
<script>
	const $findBtn =  $(".taker_login_submit");
	const $findPwForm =  $(".findPwForm");

	 $findBtn.click(function (){
		confirm("해당 메일로 비밀번호를 전송하시겠습니까?");        
	 });
	 
	 $findPwForm.submit(function(){
		alert("비밀번호를 전송하였습니다.");
	 })
	

</script>
</body>
</html>