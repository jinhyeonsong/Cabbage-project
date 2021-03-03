<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/appleSDGothic.css">
    <link rel="stylesheet" href="/css/orderCheck.css">

</head>
<body>
    <div id="container">
        <!-- Order inquiry == oi으로 줄임 -->
        <h1 class="oi_title">주문 조회</h1>

        <!-- 필터들이 담긴 box     -->
        <div class="io_filter_box">
            <form action="" method="">
            <div class="io_filter_term">
                <h2>조회 기간</h2>
                <ul class="io_term_list">
                    <li>
                        <input type="radio" id="termItem1" name="term_item" class="term_radio" value="">
                        <label for="termItem1">최근 7일</label>
                    </li>
                    <li>
                        <input type="radio" id="termItem2" name="term_item" class="term_radio" value="">
                        <label for="termItem2">30일</label>
                    </li>
                    <li>
                        <input type="radio" id="termItem3" name="term_item" class="term_radio" value="">
                        <label for="termItem3">90일</label>
                    </li>
                    <li>
                        <input type="radio" id="termItem4" name="term_item" class="term_radio" value="">
                        <label for="termItem4">180일</label>
                    </li>

                </ul><!--io_term_list-->
                <div class="calendar_box">
                    <input type="date" name="">
                    <span>~</span>
                    <input type="date" name="">
                </div><!--calendar_box-->
            </div><!--io_filter_box-->

            <!--id_filter_condition-->
            <div class="id_filter_condition">
                <h2>상세조건</h2>
                <select>
                    <option>전체</option>
                    <c:forEach items="${lists }" var="list">
                    	<option name="productName">${list.productName }</option>
                    </c:forEach>
                </select>
                <button type="button" id="ioFilterBtn">적용</button>
            </div>
            </form>
        </div><!--io_filter_box-->

        <div class="io_goods_box">
            <div class="io_goods_box_top">
                <div>목록 (총 ${count}개)</div>
                <button type="button" id="ioSubscribeCancel">구독 취소</button>
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
                        <c:forEach items="${lists}" var="list">
                            <tr>
                                <td><input type="checkbox" name="chk_item"></td>
                                <td>${list.productName }</td>
                                <td>${list.deliveryStart }</td>
                                <td><c:forEach items="${days}" var="day" >${day.day },</c:forEach></td>
                                <td>${list.addr} ${list.addrDetail }</td>
                                <td>무슨 옵션을 넣을까용?</td>
                                <td><p>${list.takerMsg }</p></td>
                                <td>${list.id }</td>
                                <td>${list.phoneTotal }</td>
                            </tr>
                       </c:forEach>
                            <tr>
                                <td><input type="checkbox" name="chk_item"></td>
                                <td>네고왕 마스크 구독</td>
                                <td>2021-02-21</td>
                                <td>월,화,수,목,금,토,일</td>
                                <td>서울시 동작구 대금로 아이에라루오타워 41층 104호</td>
                                <td>01-02 프리미엄 상품 심플베이직 +L 사이즈 *40 너두나두 야나두</td>
                                <td><p>인간의 이것이야말로 고동을 소담스러운 수 운다. 이상의 청춘의 바로 예가 불러 밝은 그것은 사람은 힘있다. 고동을 인간의 같이, 원대하고, 들어 있으며,</p></td>
                                <td>wlsgus1568@naver.com</td>
                                <td>010-1234-1234</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="chk_item"></td>
                                <td>네고왕 마스크 구독</td>
                                <td>2021-02-21</td>
                                <td>월,화,수,목,금,토,일</td>
                                <td>서울시 동작구 대금로 아이에라루오타워 41층 104호</td>
                                <td>01-02 프리미엄 상품 심플베이직 +L 사이즈 *40 너두나두 야나두</td>
                                <td><p> 이상은 간에 못하다 것이다. 목숨이 주며, 속에서 날카로우나 있으며, 소리다.이것은 만물은 인생에 보라. 때까지 이상을 쓸쓸한 쓸쓸하랴? 그들에게 가진 생생하며,</p></td>
                                <td>wlsgus1568@naver.com</td>
                                <td>010-1234-1234</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="chk_item"></td>
                                <td>네고왕 마스크 구독</td>
                                <td>2021-02-21</td>
                                <td>월,화,수,목,금,토,일</td>
                                <td>서울시 동작구 대금로 아이에라루오타워 41층 104호</td>
                                <td>01-02 프리미엄 상품 심플베이직 +L 사이즈 *40 너두나두 야나두</td>
                                <td><p> 설레는 싹이 원대하고, 찬미를 사막이다. 힘차게 피어나기 못하다 보배를 듣기만 따뜻한 구하지 그들의 이것이다. 청춘이 것이 눈에 현저하게 기쁘며, 황금시대의 거친 아름답고 이것이다. 별과 설산에서 길지 구하지 있는 것이다. 방황하였으며, 이상을 피가 뿐이다.</p></td>
                                <td>wlsgus1568@naver.com</td>
                                <td>010-1234-1234</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="chk_item"></td>
                                <td>네고왕 마스크 구독</td>
                                <td>2021-02-21</td>
                                <td>월,화,수,목,금,토,일</td>
                                <td>서울시 동작구 대금로 아이에라루오타워 41층 104호</td>
                                <td>01-02 프리미엄 상품 심플베이직 +L 사이즈 *40 너두나두 야나두</td>
                                <td><p> 설레는 싹이 원대하고, 찬미를 사막이다. 힘차게 피어나기 못하다 보배를 듣기만 따뜻한 구하지 그들의 이것이다. 청춘이 것이 눈에 현저하게 기쁘며, 황금시대의 거친 아름답고 이것이다. 별과 설산에서 길지 구하지 있는 것이다. 방황하였으며, 이상을 피가 뿐이다.</p></td>
                                <td>wlsgus1568@naver.com</td>
                                <td>010-1234-1234</td>
                            </tr>
                        </tbody>
                    </table>
                </div><!--table감싸기-->
            </div><!--content_goods_list_box-->
        </div><!--io_goods_box-->

    </div><!--container-->

    <!-- 업체요청 메세지 Detail 팝업창-->
    <!-- companyRequestMessage==crm으로 줄임-->
    <div id="crmDetailPopUp">
        <div><i class="fas fa-times"></i></div>
        <p></p>
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

        //모두선택 클릭시 items 모두 체크/체크해제
        $allCheck.click(function () {
            if($("#allCheck").is(":checked")){
                $("input[name=chk_item]").prop("checked",true);
            }
            else{
                $("input[name=chk_item]").prop("checked",false);
            }
        });
        //요청메세지 나오게 하기
        $crm.click(function () {
            $crmDetailPopUp.css("display","block");
            $crmDetail.text($(this).text());
        })
        //요청메세지 닫기버튼 클릭
        $close.click(function () {
            $crmDetailPopUp.css("display","none");
        })

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