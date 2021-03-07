<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>매출관리페이지</title>
<c:import url="/WEB-INF/view/template/link.jsp" />
<link rel="stylesheet" href="/css/salesManagement.css" />

</head>
<body>
	<!--매출 관리 탭-->
	<div class="sales_content" id="salesTab">
		<div class="sales_wrap bar row">매출관리</div>
		<!--매출 금액 현황-->
		<div class="sales_wrap cost">
			<!--오늘 결제 금액 -->
			<div class="cost_text_box today row">
				<dl>
					<dt>오늘 결제 금액 :</dt>
					<dd>${todaySales}원</dd>
					<br>
					<dt>오늘 신규 구독자 수 :</dt>
					<dd>${todaySubscribers}명</dd>
				</dl>
			</div>
			<!--end 오늘 결제 금액-->
			<!--총 매출 금액 -->
			<div class="cost_text_box total row">
				<dl>
					<dt>총 매출 금액 :</dt>
					<dd>${totalSales }원</dd>
					<br>
					<dt>현재 구독 수 :</dt>
					<dd>${totalSubscribers }명</dd>
				</dl>
			</div>
			<!--end 총 매출 금액 -->
		</div>
		<!--end 매출 금액 현황-->
		<div class="sales_wrap row graph sales_graph">
			<p>매출 금액 그래프</p>
			<div class="date_choice_box">
				<div class="btn_box">
					<button class="sales_btn date_choice_btn" style="display: none">기간선택</button>
				</div>
				<div class="date_choice_popup">

					<!--기간 선택  -->
					<div class="date_choice">
						<!--시작일 -->
						<div class="first_date">
							<select name="salesFirstDateYear" class="first_date_year"></select>년
							<select name="salesFirstDateMonth" class="first_date_month">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>월
							<p>부터</p>
						</div>
						<!--종료일 -->
						<div class="last_date">
							<select name="salesLastDateYear" class="last_date_year"></select>년
							<select name="salesLastDateMonth" class="last_date_month">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>월
							<p>까지</p>
						</div>
					</div>
					<!-- end 기간 선택  -->

					<div>
						<i class="fas fa-times"></i>
					</div>
				</div>
			</div>

			<div class="graphBox">

				<canvas id="salesGraph" width="800" height="210"></canvas>

			</div>
		</div>
		<div class="sales_wrap row graph sub_graph">
			<p>구독자 수 그래프</p>
			<div class="date_choice_box">
				<div class="btn_box">
					<button class="sub_btn date_choice_btn" style="display: none">기간선택</button>
				</div>
				<div class="date_choice_popup">
					<!--기간 선택  -->
					<div class="date_choice">
						<!--시작일 -->
						<div class="first_date">
							<select name="subFirstDateYear" class="first_date_year"></select>년
							<select name="subFirstDateMonth" class="first_date_month">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>월
							<p>부터</p>
						</div>
						<!--종료일 -->
						<div class="last_date">
							<select name="subLastDateYear" class="last_date_year"></select>년
							<select name="subLastDateMonth" class="last_date_month">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>월
							<p>까지</p>
						</div>
					</div>
					<!-- end 기간 선택  -->

					<div>
						<i class="fas fa-times"></i>
					</div>
				</div>
			</div>

			<div class="graphBox">

				<canvas id="subGraph" width="800" height="210"></canvas>

			</div>
		</div>

	</div>
	<!--end 매출 관리 탭-->

	<script src="/js/jquery.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script>
		// ============================


		let salesChart;
		let subChart;
		//================================
		salesGraph();
		subGraph();

		function salesGraph() {
			let config = {
				type : 'line',
				data : {
					labels : ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
					datasets : [ {
						fill : true,
						data : [ 3445665, 865563, 234500, 998653, 123467,
								647280, 567568, 3445665, 865563, 234500,
								998653, 123467 ],
						borderColor : "#3C7166",
						lineTension : 0
					} ]
				},
				options : {
					legend : {
						display : false
					},
					tooltips : {
						callbacks : {
							label : function(tooltipItem) {
								return tooltipItem.yLabel;
							}
						}
					}
				},
				
			};
			const ctx = document.getElementById("salesGraph").getContext("2d");
			salesChart = new Chart(ctx, config);
			salesGraphAjax();
		}

		function subGraph() {
			let config = {
				type : 'line',
				data : {
					labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				datasets : [ {
					fill : true,
					data : [ 3445665, 865563, 234500, 998653, 123467,
							647280, 567568, 3445665, 865563, 234500,
							998653, 123467 ],
					borderColor : "#3C7166",
					lineTension : 0
				} ]
				},
				options : {
					legend : {
						display : false
					},
					tooltips : {
						callbacks : {
							label : function(tooltipItem) {
								return tooltipItem.yLabel;
							}
						}
					}
				}
			};
			const ctx = document.getElementById("subGraph").getContext("2d");
			subChart = new Chart(ctx, config);
			subscriberChartAjax();
			
		}


		function salesGraphAjax(){
			$.ajax({
				url : "/ajax/giver/${giverNo}/salesGraph",
				error : function() {

				},
				success : function(json) {

					const datas = salesChart.data.datasets[0].data;

					$(datas).each(function() {
						salesChart.data.labels.pop();
						salesChart.data.datasets[0].data.pop();
		
					});

					$(json).each(function() {
						console.log(this.month)

					salesChart.data.labels.push(this.month.substr(4) +"월");
					})
					
					$(json).each(function() {
						console.log(this.count)
						salesChart.data.datasets[0].data.push(this.count);
					
					})
					
					
					salesChart.update();

				}
			});

		}//ajax function end
		
		function subscriberChartAjax(){

			$.ajax({
				url : "/ajax/giver/${giverNo}/subGraph",
				error : function() {

				},
				success : function(json) {

					const datas = subChart.data.datasets[0].data;

					$(datas).each(function() {
						subChart.data.labels.pop();
						subChart.data.datasets[0].data.pop();
		
					});

					$(json).each(function() {
						console.log(this.month)

					subChart.data.labels.push(this.month.substr(4) +"월");
					})
					
					$(json).each(function() {
						console.log(this.count)
						subChart.data.datasets[0].data.push(this.count);
					
					})
					
					
					subChart.update();

				}
			});
			
		}
	
	
		// end 구독 기간 선택
		//==========================================================================
		// 년을 생성하는 함수 선언
	/*	function createYear($year) {
			// 올해를 얻어옴(현재) 이렇게 하면 현재 시간이 얻어진다.
			const now = moment();
			// 유저가 선택한 년도
			const year = $year.val();
			// 일단 비워주고
			$year.empty();
			// 년을 생성
			for (let i = now.year(); i > 2020; i--) {
				// 옵션 객체 생성하고 텍스트 설정후 year에 붙임
				$("<option>").text(i).appendTo($year);
			}//for end
		}//createYearMonth() end

		createYear($firstDateYear);
		createYear($lastDateYear); */
		//===================================================================================
	</script>
</body>
</html>