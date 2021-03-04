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
        <form action="signupGiverStep3" method="GET">
        	<input id="businessNumInput" name="businessNum" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
       		<button class="nextBtn">다음</button>
        </form>
    </div><!--//singUpReadyContent end-->
</div><!--//container end-->
</body>
<script>
<c:if test="${msg!=null }">
alert("${msg }");
</c:if>
    $businessNumInput = $('#businessNumInput'); //사업자번호 입력공간
    $nextBtn = $('.nextBtn'); //다음 버튼
    myStorage = window.localStorage;

    
    $businessNumInput.on('keyup',(function () { //사업자 번호 input의 키보드 이벤트

        let nu = $businessNumInput.val(); //input의 값
    	
        if(nu.length==10){ //input의 입력값이 10개일 때
        	$nextBtn.css({
        		"background-color":"#0B4D40",
        		"pointer-events":"auto",
        		"box-shadow":"0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)"
        	})
        }else{
        	$nextBtn.css({
        		"background-color":"#424242",
        		"pointer-events":"none",
        		"box-shadow":"none"
        	})
        }//end else
    }))//end $businessNumInput.on()
    
    //$nextBtn.click(function() {
        //let nu = $businessNumInput.val(); //input의 값
    	//localStorage.setItem('businessNum', nu);
	//})Window.localStorage 활용하기 좋다.
	
</script>
</html>