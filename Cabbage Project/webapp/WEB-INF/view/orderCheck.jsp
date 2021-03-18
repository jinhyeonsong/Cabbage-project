<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <c:import url="/WEB-INF/view/template/link.jsp" />
    <link rel="stylesheet" href="/css/orderCheck.css">
    <link rel="stylesheet" href="/css/giver_mypage_tab.css" />
	<link rel="stylesheet" href="/css/giver_header.css" />

</head>
<body>
<c:import url="/WEB-INF/view/template/giver_header.jsp" />
<div class="giver_mypage_container">
<c:import url="/WEB-INF/view/template/giver_mypage_tab.jsp">
	<c:param name="tabName" value="orderCheck" />
</c:import>
    <div id="container">
        <!-- Order inquiry == oi으로 줄임 -->
        <h1 class="oi_title">주문 조회</h1>

        <!-- 필터들이 담긴 box     -->
        <div class="io_filter_box">
            <form method="get">
      
            <div class="io_filter_term">
                <h2>조회 기간</h2>
                <ul class="io_term_list">
                    <li>
                        <input type="radio" id="termItem1" name="startDate" class="term_radio" value="${days7 }">
                        <label for="termItem1">최근 7일</label>
                    </li>
                    <li>
                        <input type="radio" id="termItem2" name="startDate" class="term_radio" value="${days30 }">
                        <label for="termItem2">30일</label>
                    </li>
                    <li>
                        <input type="radio" id="termItem3" name="startDate" class="term_radio" value="${days90 }">
                        <label for="termItem3">90일</label>
                    </li>
                    <li>
                        <input type="radio" id="termItem4" name="startDate" class="term_radio" value="${days180 }">
                        <label for="termItem4">180일</label>
                    </li>
                    <li>
                        <input type="radio" id="termItem5" name="startDate" class="term_radio" value="">
                        <label for="termItem5">전체</label>
                    </li>

                </ul><!--io_term_list-->
               <!--  <div class="calendar_box">
                    <input type="date" name="">
                    <span>~</span>
                    <input type="date" name="">
                </div>calendar_box -->
            </div><!--io_filter_box-->

            <!--id_filter_condition-->
            <div class="id_filter_condition">
                <h2>상세조건</h2>
                <select name="productNo" >
                    <option value="">전체</option>
                    <c:forEach items="${options }" var="option">
                    <option value="${option.no }">${option.name }</option>
                    </c:forEach>
                </select>
                <button id="ioFilterBtn">적용</button>
            </div>
            </form>
        </div><!--io_filter_box-->

        <div class="io_goods_box">
            <div class="io_goods_box_top">
                <div>목록 (총 ${count}개)</div>
                <button form="deleteSub" type="submit" id="ioSubscribeCancel">구독 취소</button>
            </div><!--io_goods_box_top-->

            <div class="content_goods_list_box">
                <div><!--table감싸기-->
                    <table class="goods_table">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="allCheck"></th>
                                <th>구독 상품명</th>
                                <th>구독 일시</th>
                                <th>배송주기</th>
                                <th>주소</th>
                                <th>옵션정보</th>
                                <th>업체요청 메세지</th>
                                <th>아이디</th>
                                <th>연락처</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="subscribe">
                            <tr>
                                <td><input form="deleteSub" type="checkbox" name="no" value="${subscribe.no }"></td>
                                <td>${subscribe.productName }</td>
                                <td>${subscribe.deliveryStart }</td>
                                <td><c:forEach items="${subscribe.days}" var="day" >${day.deliveryDay} </c:forEach></td>
                                <td>${subscribe.addr} ${subscribe.addrDetail }</td>
                                <td>${subscribe.addrOpt }</td>
                                <td><p>${subscribe.takerMsg }</p></td>
                                <td>${subscribe.id }</td>
                                <td>${subscribe.phoneTotal }</td>
                            </tr>
                       </c:forEach>
                       </tbody>
                    </table>
                </div><!--table감싸기-->
            </div><!--content_goods_list_box-->
        </div><!--io_goods_box-->
    </div><!--container-->
	<div class="popupWrap"></div>
    <!-- 업체요청 메세지 Detail 팝업창-->
    <!-- companyRequestMessage==crm으로 줄임-->
    <div id="crmDetailPopUp">
        <div><i class="fas fa-times"></i></div>
        <p></p>
    </div>
    
	<form id="deleteSub" method="post">
		<input type="hidden" name="_method" value="delete">
	</form>
</div>
    <script src="/js/jquery.js"></script>
    <script>
        //모두 체크하기 checkbox
        $allCheck=$("#allCheck");
        //배송요청메세지
        $crm=$(".goods_table td:nth-child(7) p");
        //배송요청 메세지 Detail
        $crmDetail=$("#crmDetailPopUp p");
        //배송요청 메세지 팝업창
        $crmDetailPopUp = $("#crmDetailPopUp");
        //배송요청 메세지 팝업창 닫기버튼
        $close = $("#crmDetailPopUp div");
        const $popupWrap = $(".popupWrap");

        //모두선택 클릭시 items 모두 체크/체크해제
        $allCheck.click(function () {
            if($("#allCheck").is(":checked")){
                $("input[name=no]").prop("checked",true);
            }
            else{
                $("input[name=no]").prop("checked",false);
            }
        });
        //요청메세지 나오게 하기
        $crm.click(function () {
            $crmDetailPopUp.css("display","block");
            $popupWrap.css("display","block");
            $crmDetail.text($(this).text());
        });
        //요청메세지 닫기버튼 클릭
        $close.click(function () {
            $crmDetailPopUp.css("display","none");
            $popupWrap.css("display","none");
        });
        
        //pop창 바깥부분 클릭시 popup 창 display none
        $popupWrap.click(function (){
            $crmDetailPopUp.css("display","none");
            $popupWrap.css("display","none");
        })
        
        //구독취소버튼 누를시
        $("#ioSubscribeCancel").click(function () {
        	
        	if($("input[name=no]").is(":checked")==false){
        		alert("선택된 리스트가 없습니다.");
        		return false;
        	}else{
        		confirm("구독을 취소하시겠습니까?");
        	}
        
        	
        });


        /* //필터적용 버튼
        $("#ioFilterBtn").click(function () {
            $.ajax({
                url: "data/list.json",//요청하는 서버주소
                type: "GET", //클라이언트 -> 서버 GET, POST
                dataType: "json", //서버->클라이언트 데이터타입
                error: function (xhr, code, type) {
                    alert("서버 점검중!");
                },
                success: function (json) {

                }//success() end
            });//ajax() end
        })//$("#ioFilterBtn").click() end

        //구독취소 버튼
        $("#ioSubscribeCancel").click(function () {
            $.ajax({
                url: "data/list.json",//요청하는 서버주소
                type: "GET", //클라이언트 -> 서버 GET, POST
                dataType: "json", //서버->클라이언트 데이터타입
                error: function (xhr, code, type) {
                    alert("서버 점검중!");
                },
                success: function (json) {

                }//success() end
            });//ajax() end
        })//$("#ioFilterBtn").click() end */
    </script>
</body>
</html>