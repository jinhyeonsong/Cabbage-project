<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구독상품관리</title>
    <c:import url="/WEB-INF/view/template/link.jsp" />
    <link rel="stylesheet" href="/css/productManagement.css" />
    <link rel="stylesheet" href="/css/giver_mypage_tab.css" />
    <link rel="stylesheet" href="/css/giver_header.css" />
    
    
</head>
<body>
<c:import url="/WEB-INF/view/template/giver_header.jsp" />
<div class="giver_mypage_container">
	<c:import url="/WEB-INF/view/template/giver_mypage_tab.jsp">
		<c:param name="tabName" value="products" />
	</c:import>
	<div id="container">
	
	    <!--produvt_management == pm으로 줄임-->
	    <h1 class="pm_title">상품 관리</h1><!--pm_title-->
	    
		<input class="giver_no_val" type="hidden" name="giverNo" value="${loginMember.no }" />
		
	    <!-- 카운터 리스트 -->
	    <div class="pm_count_list">
	        <div class="count_box">
	          	<input class="type_select" id="typeSelectT" type="radio" name="type" value="T"/><label for="typeSelectT">  전체 ${total }</label>
	        </div> 
	        <div class="count_box">
				<input class="type_select" id="typeSelectN" type="radio" name="type" value="N"/><label for="typeSelectN">  판매중 ${onSale }</label>
			</div>
			<div class="count_box">
				<input class="type_select" id="typeSelectP" type="radio" name="type" value="P"/><label for="typeSelectP">  판매중지 ${onHold }</label>
			</div>
			<div class="count_box">
				<input class="type_select" id="typeSelectE" type="radio" name="type" value="E"/><label for="typeSelectE">  판매종료 ${ended }</label>
			</div>
	
	    </div><!--pm_count_list-->
	
	    <!-- 상품리스트 -->
	    <div class="pm_goods_box">
	
	        <div class="pm_goods_box_top">
	            <div>상품목록 (총 ${total})</div>
	        </div>
			
	        <!-- 상품 item이 담겨있는 box -->
	        <div class="pm_goods_list_box">
	            <div><!--table감싸기-->
	                <table class="pm_goods_table">
	                    <thead>
	                        <tr>
	                            <th>구독 상품명</th>
	                            <th>판매가</th>
	                            <th>할인가</th>
	                            <th>남은 수량</th>
	                            <th>배송주기</th>
	                        </tr>
	                    </thead>
	                    <tbody class="list_body">
	                   
	                    </tbody>
	                </table>
	            </div><!--table감싸기-->
	        </div><!--pm_goods_list_box-->
	    </div><!--pm_goods_box-->
	    
	
	</div><!--container-->
</div>
<%-- 모든 상품 받아오기 tmpl --%>
<script type="text/template" id="totalProductListTmpl">

<@ _.each(list, function(item){ @>
                        <tr>
                            <td><@=item.name@></td><!--구독 상품명-->
                            <td><@=item.price@>원</td><!--판매가-->
                            <td><@=item.discount@>원</td><!--할인가-->
                            <td><@=item.salesQty@>개</td><!--남은 수량-->
                            <td>
								<@_.each(item.days, function(day){ @>
								<span><@=day.deliveryDay@></span>	
								<@})@>
							</td><!--배송주기-->
                        </tr>
<@ }) @>
</script>
<script src="/js/productManagement.js"></script>
</body>
</html>