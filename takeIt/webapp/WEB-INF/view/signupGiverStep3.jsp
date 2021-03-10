<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/signupGiverStep3.css"/>
</head>
<body>

<div id="container"><!--container start-->
    <div id="signUpTitleContent"><!--signUpTitleBox start-->
        <div class="sign_up_title"><span>Take It</span></div>
        <div class="sign_up_sub_title"><span>기버 회원가입</span></div>
    </div><!--//signUpTitleBox end-->
    <form action="/giver/signUp/step3" method="post"><!--//form start-->
        <div id="signUpInputContent"><!--sign_up_input_container start-->
            <div class="business_name_input_box"><!--business_name_input_box start-->
                <div class="business_name_input_title"><span>상호명</span></div>
<input class="business_name_input" placeholder="2~10글자" name="company" />
                <div class="business_name_notice"><span></span></div>
            </div><!--//business_name_input_box end-->
            <div class="business_number_input_box"><!--business_name_input_box start-->
                <div class="business_number_input_title"><span>사업자등록번호</span></div>
                <div class="business_number">${giver.businessNum} </div>
<input type="hidden" value="${giver.businessNum}" name="businessNum"/>
            </div><!--//business_name_input_box end-->
            <div class="id_input_box"><!--idInputBox start-->
                <div class="id_input_title"><span>아이디</span></div>
<input class="id_input" name="id" />
                <div class="id_notice"><span></span></div>
            </div><!--//idInputBox end-->
            <div class="password_input_box"><!--passwordInputBox start-->
                <div class="password_input_title"><span>비밀번호</span></div>
<input class="password_input" maxlength="12" name="password" type="password" placeholder="영문 및 숫자, 특수문자 8~12자를 입력하세요"/>
                <div class="password_notice"><span></span></div>
            </div><!--//passwordInputBox end-->
            <div class="password_confirm_input_box"><!--passwordConfirmInputBox start-->
                <div class="password_confirm_input_title"><span>비밀번호 확인</span></div>
				<input class="password_confirm_input" maxlength="12" type="password" />
                <div class="password_confirm_notice"><span></span></div>
            </div><!--//passwordConfirmInputBox end-->

            <div class="phone_input_box"><!--passwordConfirmInputBox start-->
                <div class="phone_input_title"><span>연락처</span></div>
 <input class="phone_input" maxlength="11" name="phone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="'-'를 빼고 입력해주세요"/>
                <div class="phone_notice"><span></span></div>
            </div><!--//passwordConfirmInputBox end-->

            <div class="profile_img_input_box"><!--profileImg_input_box start-->

                <div class="profile_img_input_title"><span>프로필</span></div>
                <label class="profile_img_input" for="profileImgInput" ><i class="far fa-plus-square"></i></label>
<input id="profileImgInput" name="profileImg" type="file" accept="image/*"/>       
            </div><!--//profileImg_input_box end-->
        </div><!--//sign_up_input_container end-->
        <button class="sign_up_btn" type="button">회원가입 하기</button>
    </form><!--//form end-->
</div><!---container end-->

<script src="/js/signUpGiver.js"></script>
</body>
</html>