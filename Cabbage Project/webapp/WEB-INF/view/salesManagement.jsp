<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>�������������</title>
<c:import url="/WEB-INF/view/template/link.jsp" />
<link rel="stylesheet" href="/css/salesManagement.css" />
<link rel="stylesheet" href="/css/giver_mypage_tab.css" />
<link rel="stylesheet" href="/css/giver_header.css" />

</head>
<body>
<c:import url="/WEB-INF/view/template/giver_header.jsp" />
<div class="giver_mypage_container">
<c:import url="/WEB-INF/view/template/giver_mypage_tab.jsp">
	<c:param name="tabName" value="sales" />
</c:import>
	<!--���� ���� ��-->
	<div class="sales_content" id="salesTab">
		<div class="sales_wrap bar row">�������</div>
		<!--���� �ݾ� ��Ȳ-->
		<div class="sales_wrap cost">
			<!--���� ���� �ݾ� -->
			<div class="cost_text_box today row">
				<dl>
					<dt>���� ���� �ݾ� :</dt>
					<dd>${todaySales}��</dd>
					<br>
					<dt>���� �ű� ������ �� :</dt>
					<dd>${todaySubscribers}��</dd>
				</dl>
			</div>
			<!--end ���� ���� �ݾ�-->
			<!--�� ���� �ݾ� -->
			<div class="cost_text_box total row">
				<dl>
					<dt>�� ���� �ݾ� :</dt>
					<dd>${totalSales }��</dd>
					<br>
					<dt>���� ���� �� :</dt>
					<dd>${totalSubscribers }��</dd>
				</dl>
			</div>
			<!--end �� ���� �ݾ� -->
		</div>
		<!--end ���� �ݾ� ��Ȳ-->
		<div class="sales_wrap row graph sales_graph">
			<p>���� �ݾ� �׷���</p>
			<div class="date_choice_box">
				<div class="btn_box">
					<button class="sales_btn date_choice_btn" style="display: none">�Ⱓ����</button>
				</div>
				<div class="date_choice_popup">

					<!--�Ⱓ ����  -->
					<div class="date_choice">
						<!--������ -->
						<div class="first_date">
							<select name="salesFirstDateYear" class="first_date_year"></select>��
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
							</select>��
							<p>����</p>
						</div>
						<!--������ -->
						<div class="last_date">
							<select name="salesLastDateYear" class="last_date_year"></select>��
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
							</select>��
							<p>����</p>
						</div>
					</div>
					<!-- end �Ⱓ ����  -->

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
			<p>������ �� �׷���</p>
			<div class="date_choice_box">
				<div class="btn_box">
					<button class="sub_btn date_choice_btn" style="display: none">�Ⱓ����</button>
				</div>
				<div class="date_choice_popup">
					<!--�Ⱓ ����  -->
					<div class="date_choice">
						<!--������ -->
						<div class="first_date">
							<select name="subFirstDateYear" class="first_date_year"></select>��
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
							</select>��
							<p>����</p>
						</div>
						<!--������ -->
						<div class="last_date">
							<select name="subLastDateYear" class="last_date_year"></select>��
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
							</select>��
							<p>����</p>
						</div>
					</div>
					<!-- end �Ⱓ ����  -->

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
	<!--end ���� ���� ��-->
</div>

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
					labels : ["1��", "2��", "3��", "4��", "5��", "6��", "7��", "8��",
						"9��", "10��", "11��", "12��" ],
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
					labels : [ "1��", "2��", "3��", "4��", "5��", "6��", "7��", "8��",
						"9��", "10��", "11��", "12��" ],
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

					salesChart.data.labels.push(this.month.substr(4) +"��");
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

					subChart.data.labels.push(this.month.substr(4) +"��");
					})
					
					$(json).each(function() {
						console.log(this.count)
						subChart.data.datasets[0].data.push(this.count);
					
					})
					
					
					subChart.update();

				}
			});
			
		}
	
	
		// end ���� �Ⱓ ����
		//==========================================================================
		// ���� �����ϴ� �Լ� ����
	/*	function createYear($year) {
			// ���ظ� ����(����) �̷��� �ϸ� ���� �ð��� �������.
			const now = moment();
			// ������ ������ �⵵
			const year = $year.val();
			// �ϴ� ����ְ�
			$year.empty();
			// ���� ����
			for (let i = now.year(); i > 2020; i--) {
				// �ɼ� ��ü �����ϰ� �ؽ�Ʈ ������ year�� ����
				$("<option>").text(i).appendTo($year);
			}//for end
		}//createYearMonth() end

		createYear($firstDateYear);
		createYear($lastDateYear); */
		//===================================================================================
	</script>
</body>
</html>