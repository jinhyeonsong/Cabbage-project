<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기버정보더보기</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<style>
 body{
            font-family: 'AppleSDGothic', sans-serif;
        }
        /* 판매자 정보 더보기 CSS      ///////////////////////////////////////////////////////////////////////////////////*/


		#container{
		
		padding-top:80px;
		}

        /* 판매자 정보 box*/
        #giverMoreView{
            border:1px solid #424242;
            width:1100px;
            height: 1000px;
            margin:auto;

        }
        /* end 판매자 정보 box*/



        /*판매자 정보 헤더*/
        .inform_header{
            color: #fff;
            background-color: #3C7166;
        }
        /*end 판매자 정보 헤더*/

        /*상품 리스트 바*/
        .item_list_bar{
            background-color: #f4fffd;
            color: #713C47;
            font-weight: bold;
            border-bottom: 5px solid #3C7166;
        }
        /*end 상품 리스트 바*/

        /*판매자 정보, 상품 리스트 바*/
       #informWrap .bar{
            height:60px;
            line-height: 60px;
            font-size: 20px;
        }
        /*end 판매자 정보, 상품 리스트 바*/

        .box div{
            float: left;
            height:200px;
            background-color: #f4fffd;
        }

        /*상단 기버 정보*/
        .box .image_box{
            width:30%;
            text-align: center;
        }
        .profile.image{
            display: inline-block;
            margin-top:25px;
            border-radius: 100px;
        }
        .box .score{
            width:20%;
        }
        .box .inform{
            width:50%;
        }
        .profile.box{
            height:200px;
        }
        .profile .score ul{
            text-align: center;
            margin-top: 40px;
        }
        .profile .score ul li{
            margin: 10px;
        }
        .profile .score .fa-star{
            font-size: 80px;
            color: #FAD02C
        }
        .profile.inform.list{
            margin-top: 30px;
            margin-left: 40px;
        }
        .profile.inform.list dt{
            margin-left: -20px;
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
        }
        .profile.inform.list dd{
            margin-top: 5px;
        }
        /*end 상단 기버 정보*/


        /*기버 상품 리스트*/
        #giverItemWrap{
            margin:40px;
            height:475px;
        }

        #giverItemWrap .paging{
            /*나중에 페이징 하고 지우세요*/
            border: 1px solid #000;
            height:50px;
            /*----------------------*/
            width: 300px;
           margin:30px auto;
        }

        #giverItemWrap .radio_box{
            height:50px;
            width: 800px;
            margin-left: 65px;
            margin-bottom:40px;
        }
        /*   라벨  CSS */
        .sort{
            width: 100px;
            height: 30px;
            color: black;
            padding: 0px;
            border: 1px solid #424242;
            background-color: white;
            border-radius: 25px;
            font-size: 13px;
            font-weight: bold;
            outline: none;
        }
        /*라디오인풋 비활성화 */
        input[type=radio],input[type=checkbox]{
            display:none;
        }
        /*라디오인풋+라벨 CSS */


        /* +: 다음요소 선택자*/
        input[type=radio] + label {
            display:inline-block;
            border: 1px solid black;
            border-radius: 25px;
            cursor:pointer;
            user-select:none;
            margin:10px 5px;
            text-align: center;
            line-height: 30px;
        }
        input[type=radio] + label:hover{
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        input[type=radio]:checked + label{
            color: #3C7166;
            border-color: #3C7166;
        }

        #giverItemWrap .item_list{
            height:350px;
            width:870px;
            /*위치 확인용 배경색 입니다. 상품 카드 넣고 나면 지워주세요*/
            background-color: #3C7166;
            /*/////////////////////////////////*/
            margin:auto;
        }
        #giverItemWrap .item_list li{
            width:250px;
            height:300px;
            margin:20px;
            background-color: #fff;
            float: left;
        }
        /*end 기버 상품 리스트*/
        /* end  판매자 정보 더보기 CSS      ///////////////////////////////////////////////////////////////////////////////////*/

</style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>

<div id="container">
    <div id="giverMoreView" class="inform_content">
        <!-- 판매자 정보 -->
        <div id="informWrap" class="inform_wrap">
            <div class="inform_header bar">&nbsp 판매자 정보</div>

            <!--판매자 프로필 (사진, 평균평점, 정보들)-->
            <div class="profile box">
                <div class="profile image_box">
                    <img class="profile image" src="img/${giver.profileImg } title="판매자 사진" width="150" height="150" >
                </div>
                <div class="profile score">
                    <ul>
                        <li><i class="fas fa-star"></i></li>
                        <li>4.8(100)</li>
                        <li>현재 구독자수 : 98 명</li>
                    </ul>
                </div>
                <div class="profile inform">
                    <dl class="profile inform list">
                        <dt>상호</dt>
                        <dd>${giver.company } </dd>
                        <dt>사업장 소재지</dt>
                        <dd>서울시 관악구 남부순환로</dd>
                        <dt>연락처</dt>
                        <dd>${giver.phone } </dd>
                    </dl>
                </div>
            </div>
            <!--end 판매자 프로필 (사진, 평균평점, 정보들)-->

            <!--상품 리스트-->
            <div class="item_list_bar bar">&nbsp 상품 리스트</div>

        </div>
        <!--end 판매자 정보-->

        <!--기버가 만든 상품 리스트 -->
        <div id="giverItemWrap">
            <div class="radio_box">
                <input id="sub" type="radio" name="sort" value="sub" checked/>
                <label for="sub" class="sort">구독순</label>
                <input id="date" type="radio" name="sort" value="date"/>
                <label for="date" class="sort">최신순</label>
                <input id="lowPrice" type="radio" name="sort" value="lowPrice"/>
                <label for="lowPrice" class="sort">낮은 가격순</label>
                <input id="highPrice" type="radio" name="sort" value="highPrice"/>
                <label for="highPrice" class="sort">높은 가격순</label>
                <input id="score" type="radio" name="sort" value="score"/>
                <label for="score" class="sort">평점순</label>
            </div>

            <ul class="item_list">
                <li>상품 1</li>
                <li>상품 2</li>
                <li>상품 3</li>
            </ul>
            <div class="paging">상품 리스트 페이징</div>
        </div>
        <!--end 기버가 만든 상품 리스트-->

    </div><!--informBox end-->
</div>
<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
<script>
	$("input[type=radio]").on("change",function(){
	    let sort=$("input:radio[name='sort']:checked").val();
	    $.ajax({
	       url:"ajax/itemList.json",
	        data:sort,
	       error:function () {
	           alert("해당 서비스 점검중 입니다. 나중에 다시 시도해주세요");
	       },
	        success:function () {
	           alert("성공입니다.");
	        }
	    });
	});

</script>
</body>
</html>