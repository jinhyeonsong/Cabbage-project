<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>��� ����������</title>
<link rel="stylesheet" href="/css/giverMyPageMain.css" />
<c:import url="/WEB-INF/view/template/link.jsp" />
<link rel="stylesheet" href="/css/visualize/visualize.css" />
<link rel="stylesheet" href="/css/visualize/visualize-light.css" />
<link rel="stylesheet" href="/css/giver_mypage_tab.css" />
<link rel="stylesheet" href="/css/giver_header.css" />
<style>
.visualize-key {
	display: none;
}

.visualize {
	margin: 32px 0;
	padding: 0 39px;
}

.visualize-labels-x, .visualize-labels-y {
	top: 0;
}

table {
	display: none;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/view/template/giver_header.jsp" />
<div class="giver_mypage_container">
<c:import url="/WEB-INF/view/template/giver_mypage_tab.jsp">
	<c:param name="tabName" value="main" />
</c:import>
	<div id="giverMyPageMainContainer">
		<!--giverMyPageMainContainer start-->
		<div class="product_register_content">
			<!--product_register_content start-->
			<div class="product_register_box">
				<!--product_register_box start-->
				<div class="product_register_title">
					<span>��ǰ���</span>
				</div>
				<i class="far fa-registered"></i> <i class="fas fa-chevron-right"></i>
			</div>
			<!--//product_register_box start-->
		</div>
		<!--//product_register_content end-->
		<div class="product_status_content">
			<!--product_status_content start-->
			<div class="product_delivery_status_wrap">
				<!--product_delivery_status_wrap start-->
				<div class="product_status_title_box">
					<!--product_status_title_box start-->
					<div class="product_status_title">�ֹ�/���</div>
				</div>
				<!--//product_status_title_box end-->
				<div class="product_status_box">
					<!--product_status_box start-->
					<i class="fas fa-shopping-bag"></i>
					<ul class="product_status_list">
						<!--product_status_list start-->

						<li class="new_subs_item"><span>�ű� ������</span><span>${todaySubscribersCount }��</span></li>
						<li class="subs_item"><span>������ ��</span><span>${ subscribersCount}��</span></li>
					</ul>
					<!--//product_status_list end-->
				</div>
				<!--//product_status_box end-->
			</div>
			<!--//product_delivery_status_wrap end-->
			<div class="product_current_status_wrap">
				<!--product_current_status_wrap start-->
				<div class="product_status_title_box">
					<!--product_status_title_box start-->
					<div class="product_status_title">��ǰ</div>
				</div>
				<!--product_status_title_box end-->
				<div class="product_status_box">
					<!--product_status_box start-->
					<i class="fas fa-shopping-cart"></i>
					<ul class="product_status_list">
						<!--product_status_list start-->
						<li class="saling_item"><span>�Ǹ����� ����</span><span>${productsCount }��</span></li>
					</ul>
					<!--//product_status_list end-->
				</div>
				<!--//product_status_box end-->
			</div>
			<!--//product_current_status_wrap end-->
		</div>
		<!--//product_status_content end-->
		<div class="sales_statistics_content">
			<!--sales_statistics_content start-->
			<div class="sales_statistics_wrap">
				<!--sales_statistics_wrap start-->
				<div class="sales_statistics_title_box">
					<!--sales_statistics_title_box start-->
					<div class="sales_statistics_title">
						<span>Take It ���� ���</span>
					</div>
				</div>
				<!--sales_statistics_wrap end-->
				<ul class="chart_btn_list">
					<!--chart_btn_list start-->
					<li class="subs_num_btn_item"><button type="button">�����ڼ�</button></li>
					<li class="payment_num_btn_item"><button type="button">�����Ǽ�</button></li>
					<li class="payment_price_btn_item"><button type="button">�����ݾ�</button></li>
				</ul>
				<!--//chart_btn_list end-->
				<div class="sales_statistics_box">
					<!--sales_statistics_box start-->
					<table id="chartSubsNum">
						<!--chartSubsNum start-->
						<thead>

							<tr class="chart_date">
								<c:forEach items="${dateList }" var="date">
									<th scope="col">${date.substring(4)  }</th>
								</c:forEach>
							</tr>

						</thead>
						<tbody>
							<tr class="chart_num">
								<th scope="row">�����ڼ�</th>
								<c:forEach items="${countListBysubscriber }" var="item">
									<td>${item.count}</td>
								</c:forEach>
								
							</tr>
						</tbody>

					</table>
					<!--chartSubsNum end-->
					<table id="chartPaymentNum">
						<!--chartPaymentNum start-->
						<thead>
							<tr class="chart_date">
								<c:forEach items="${dateList }" var="date">
									<th scope="col">${date.substring(4)  }</th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<tr class="chart_num">
								<c:forEach items="${countListByPayment }" var="item">
									<td>${item.count}</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
					<!--chartPaymentNum end-->
					<table id="chartPaymentPrice">
						<!--chartPaymentPrice start-->
						<thead>
							<tr class="chart_date">
								<c:forEach items="${dateList }" var="date">
									<th scope="col">${date.substring(4) }</th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<tr class="chart_num">
								<c:forEach items="${countListByPriceSum }" var="item">
									<td>${item.count}</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
					<!--chartPaymentPrice end-->
				</div>
				<!--sales_statistics_box end-->
			</div>
			<!--sales_statistics_wrap end-->
		</div>
		<!--sales_statistics_content end-->
	</div>
	<!--//giverMyPageMainContainer end-->
</div>
	<script src="/js/jquery.js" ></script>
	<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
	<script src="/js/visualize/visualize.jQuery.js"></script>
	<script src="/js/giverMyPageMain.js">
		
	</script>
</body>
</html>