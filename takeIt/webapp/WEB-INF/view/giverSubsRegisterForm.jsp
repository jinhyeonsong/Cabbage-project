<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/all.min.css"/>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/quill.core.css">
    <link rel="stylesheet" href="/css/quill.snow.css">
    <link rel="stylesheet" href="/css/apple.css"/>
    <link rel="stylesheet" href="/css/appleSDGothic.css"/>
    <link rel="stylesheet" href="/css/giverSubsRegisterForm.css"/>
    <link rel="stylesheet" href="/css/header.css"/>
    <link rel="stylesheet" href="/css/footer.css"/>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"/>
	<div id="container">
	    <form id="registerFormContent" method="post" action="/giver/subscription">
	        <h2 class="subtitle">구독 상품 등록</h2>
	        <fieldset class="subscribe_title">
	            <legend>구독 명</legend>
	            <input name="name" maxlength="20" class="subscribe_title_input">
	            <input class="countNum" value="0" readonly>
	            <div class="subscribe_caution">
	                <p>판매 상품과 직접 관련이 없는 다른 상품명, 스팸성 키워드 입력 시 관리자에 의해 판매 금지될 수 있습니다.</p>
	                <p>유명 상품 유사 문구를 무단으로 도용하여 ~스타일, ~st 등과 같이 기재하는 경우 별도 고지 없이 제재될 수 있습니다.</p>
	                <p>상품명을 검색 최적화 가이드에 잘 맞게 입력하면 검색 노출에 도움이 될 수 있습니다.</p>
	            </div>
	        </fieldset>
	        <fieldset class="category">
	            <legend>카테고리</legend>
	
	            <div id="categoryWrap">
	            	<c:forEach items="${categories }" var="category">
	            	<input type="radio" name="categoryNo" value="${category.no }" id="subcategory_${category.no }">
	                <label for="subcategory_${category.no }">${category.name }</label>	               
	            	</c:forEach>	            
	            </div>
	
	            <div class="subscribe_caution">
	                상품과 맞지 않는 카테고리에 등록할 경우 강제 이동되거나 판매중지, 판매금지될 수 있습니다.
	            </div>
	        </fieldset>
	        <fieldset class="delivery_price">
	            <legend>가격 및 배송</legend>
	            <div class="subscribe_price">
	                <label for="subscribePrice">구독 가격 <i class="fas fa-circle"></i></label>
	                <input id="subscribePrice" name="price" class="price_input" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> 원
	            </div>
	            <div class="discount_price">
	                <label for="discountPrice">할인 가격 <i class="fas fa-circle"></i></label>
	                <input id="discountPrice" name="discount" class="price_input" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> 원
	            </div>
	            <hr>
	            <div id="stateSelectWrap">
	                <div id="stateInputBox">
	                    <label class="available_region_title">배송 가능지역</label>
	                    <select id="stateSelect">
	                 	   <option value="0">전국</option>
	                 	   <c:forEach items="${states }" var="state">
	                 	   <option value="${state.no }">${state.name }</option>
	                 	   </c:forEach>
	                    </select>
	                    <select id="subStateSelect" disabled>
							
	                    </select>
	                    <input id="addedPrice" placeholder="배송추가금액" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> 원
	                    <button type="button" class="state_add_btn">+</button>
	                </div>
	                <ul id="selectedStateBox">
	
	                </ul>
	            </div>
	        </fieldset>
	        <fieldset class="delivery_checkbox">
	            <legend>배송일</legend>
	
	            <label class="delivery_checkbox_title">기간</label>
	            <div id="deliveryCheckboxWrap">
	                <input class="day_checkbox" id="sun" type="checkbox" name="days" value="0"/>
	                <label for="sun">일</label>
	
	                <input class="day_checkbox" id="mon" type="checkbox" name="days" value="1"/>
	                <label for="mon">월</label>
	
	                <input class="day_checkbox" id="tue" type="checkbox" name="days" value="2"/>
	                <label for="tue">화</label>
	
	                <input class="day_checkbox" id="wed" type="checkbox" name="days" value="3"/>
	                <label for="wed">수</label>
	
	                <input class="day_checkbox" id="thu" type="checkbox" name="days" value="4"/>
	                <label for="thu">목</label>
	
	                <input class="day_checkbox" id="fri" type="checkbox" name="days" value="5"/>
	                <label for="fri">금</label>
	
	                <input class="day_checkbox" id="sat" type="checkbox" name="days" value="6"/>
	                <label for="sat">토</label>
	            </div>
	            <hr>
	            <label class="available_day">당일로부터 신청 가능일<i class="fas fa-circle"></i></label>
	            <input name="dateAvail" id="availableDay" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> 일 후 부터
	
	        </fieldset>
	        <fieldset class="photo_sales_quantity">
	            <legend>사진 및 수량</legend>
	            <label class="main_photo_title">대표 이미지 </label>
	            <label for="mainPhoto" id="mainPhotoBtn" class="photo_btn">+</label>
	            <input type="file" id="mainPhoto" name="photo" class="photo_input main"/>
	            <hr>
	            <label>판매 수량 <i class="fas fa-circle"></i></label>
	            <input name="salesQty" id="salesQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>개
	        </fieldset>
	        <fieldset class="request_message">
	            <legend>업체 요청 메시지</legend>
	            <textarea id=requestMessage name="reqMsg" placeholder="내용을 입력해주세요." maxlength="166"></textarea>
	        </fieldset>
	
	        <h2 class="subtitle">상품 상세 소개</h2>
	        <input id="editorDetail" type="hidden" name="editorContent" />
	        <div id="editorContent">
	            <div id="toolbarWrap">
	    <span class="ql-formats">
	      <select class="ql-size">
	        <option>20px</option>
	        <option>28px</option>
	        <option>36px</option>
	        <option>48px</option>
	      </select>
	    </span>
	    <span class="ql-formats">
	      <button class="ql-bold"></button>
	      <button class="ql-italic"></button>
	      <button class="ql-underline"></button>
	      <button class="ql-strike"></button>
	    </span>
	    <span class="ql-formats">
	      <select class="ql-color"></select>
	      <select class="ql-background"></select>
	    </span>
	    <span class="ql-formats">
	      <button class="ql-list" value="ordered"></button>
	      <button class="ql-list" value="bullet"></button>
	      <button class="ql-indent" value="-1"></button>
	      <button class="ql-indent" value="+1"></button>
	    </span>
	    <span class="ql-formats">
	      <button class="ql-link"></button>
	      <button class="ql-image"></button>
	    </span>
	    </div>
	    <div id="editorWrap"></div>
	        </div>
	
	        <h2 class="subtitle purchase_guide">구매안내 (상품정보 안내공시를 첨부해주세요)</h2>
	        <label for="purchaseGuide" id="purchaseGuideBtn" class="photo_btn">+</label>
	        <input type="file" id="purchaseGuide" name="instruction" class="photo_input guide"/>
	
	        <div id="buttonWrap">
	            <button type="button" class="cancel_btn"><a href="">취소</a></button>
	            <button form="registerFormContent" class="register_btn">등록</button>
	        </div>
	    </form>
	</div>
<c:import url="/WEB-INF/view/template/footer.jsp" />
	<%--템플릿들 --%>
    <script type="text/template" id="subStateTmpl">
        <@_.each(subStates,function(subState){@>
        <option value="<@=subState.no@>"><@=subState.name@></option>
        <@})@>
    </script>
    <%-------------------------------------------------------------------------------- --%>

    <script src="/js/quill.min.js"></script>
    <script src="/js/jquery.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script>
        // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
        _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim, evaluate: /\<\@([\s\S]+?)\@\>/gim, escape: /\<\@\-(.+?)\@\>/gim};
    </script>
    <script src="/js/giverSubsRegisterForm.js"></script>
</body>
</html>