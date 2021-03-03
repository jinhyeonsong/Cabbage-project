<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TakeIt</title>
    
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/login.css" />
    <link rel="stylesheet" href="css/appleSDGothic.css"/>
</head>
<body>
TEST 
<div id="wrap">
    <div id="header">
        <div class="logo_box">
            <div>
                <img class="logo_img" src="img/로고.png" width="140" height="50"/>
            </div>
            <div class="logo_title">Take it</div>
        </div><!--logo_box-->
    </div><!--header-->
    <div id="content">
       
        <div class="login_box">
            <div class="login_form taker show">
                <form id="taker" action="/log" method="post">
		             <div id="loginSelect">
				            <div>
				                <div>
				                    <input id="radioTaker" class="taker check_input" type="radio" checked name="type" value="T"/>
				                    <label for="radioTaker" class="taker check_label txt"> 테이커 </label>
				                </div>
				                <div>
				                    <input id="radioGiver" class="giver check_input" type="radio" name="type" value="G" />
				                    <label for="radioGiver" class="giver check_label txt"> 기버 </label>
				                </div>
				            </div>
			            </div>
	                    <div class="taker_id">
	                        <p>아이디</p>
	                        <input class="login_input" name="id" placeholder="ex) taketiallfromit@gmail.com"/>
	                    </div>
	                    <div class="taker_password">
	                        <p>비밀번호</p>
	                        <input class="login_input" name="password" placeholder="영문/숫자/특수문자 포함 8~10자"/>
	                    </div>
	                    <p class="validation_check">테스트</p>
	                    <button type="submit" class="taker_login_submit txt">로그인</button>
                </form>
            </div>
       </div>    
        <div class="login_footer">
            <div class="join_box">
                <button><a href="">회원가입</a> </button>
            </div>
            <div class="find_password">
                <button><a href="">비밀번호찾기</a></button>
            </div>
        </div>
    </div><!--content-->
</div> <!--wrap-->
<script src="js/jquery.js"></script>
<script>

    // 유효성 검사 불일치는 서버에서 하자


</script>
</body>
</html>