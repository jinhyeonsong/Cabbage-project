<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- (기버의 마이페이지) 공통 탭-->
<div class="list_content">
	<div class="list_content_giver_wrap">
		<div class="list_content_giver_box">
			<img id="giverProfileImg" alt="profile" src="/img/${loginMember.profileImg}" />
			<div id="giverNickname">${giver.company}</div>
		</div>
		<!-- .list_content_giver_box end-->
	</div>
	<!-- .list_content end-->

	<ul class="management_list_wrap">
		<li class="management_list  <c:if test="${param.tabName =='products'}"> on</c:if>" data-tab="tab1">
			<a href="/giver/${giverNo}/products">상품 관리</a><span class="fas fa-chevron-right"></span>
		</li>
		<li class="management_list <c:if test="${param.tabName =='orderCheck'}"> on</c:if>" data-tab="tab2">
			<a href="/giver/${giverNo }/order/check"> 판매 관리</a><span class="fas fa-chevron-right"></span>
		</li>
		<li class="management_list <c:if test="${param.tabName =='sales'}"> on</c:if>" data-tab="tab3">
			<a href="/giver/${giverNo }/sales">매출 관리</a><span class="fas fa-chevron-right"></span>
		</li>
		<li class="management_list <c:if test="${param.tabName =='personalInfo'}"> on</c:if>" data-tab="tab4">
			<a href="/giver/${no }/personalInfo">판매자 정보</a><span class="fas fa-chevron-right"></span>
		</li>
		<li class="management_list <c:if test="${param.tabName =='reviews'}"> on</c:if>" data-tab="tab5" id="reivewManagement">
			<a href="/giver/${giverNo }/reviewManagement">리뷰 관리<span class="fas fa-chevron-right"></span></a>
		</li>
		<p class="qna">문의하기</p>
	</ul>
	<!-- .management_list_wrap end-->

</div><!-- .list_content end-->

<script>
	
	//탭 리스트 li 요소
	const $managementList = $(".management_list");
	// 리스트 li 요소 안의 화살표
	const $arrow = $(".fas.fa-chevron-right");
	
	// 리스트 클릭시
    $managementList.on("click", function () {
        // css 변경
        $managementList.removeClass("on").css("fontSize","16px");
        $arrow.removeClass("on");
        $(this).addClass("on").css("fontSize","18px").children().addClass("on");
        
    }); //$managementList click() end
        
</script>
