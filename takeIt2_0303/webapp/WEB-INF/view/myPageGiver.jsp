<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>giver의 마이페이지</title>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/all.min.css"/>
    <link rel="stylesheet" href="/css/appleSDGothic.css"/>
    <link rel="stylesheet" href="/css/myPageGiver.css"/>
</head>
<body>
    <div class="container">
        <!-- 왼쪽의 공통 탭-->
        <div class="list_content">
            <div class="list_content_giver_wrap">
                <div class="list_content_giver_box">
                	<a href="">
                    <img id="giverProfileImg" alt="profile" src="/img/walle.png"/>
                    <div id="giverCompany">${giver.company }</div>
                    </a>
                </div><!-- .list_content_giver_box end-->
            </div><!-- .list_content end-->
            <ul class="management_list_wrap">
                <li class="management_list" data-tab="tab1"><a href="">상품 관리</a><p class="fas fa-chevron-right"></p></li>
                <li class="management_list " data-tab="tab2">판매 관리<span class="fas fa-chevron-right"></span></li>
                <li class="management_list " data-tab="tab3">매출 관리<span class="fas fa-chevron-right"></span></li>
                <li class="management_list " data-tab="tab4">판매자 정보<span class="fas fa-chevron-right"></span></li>
                <p class="qna">문의하기</p>
            </ul><!-- .management_list_wrap end-->

        </div><!-- .list_content end-->
        <div class="contents"><!-- contents start -->
            <!-- ========================오른쪽 탭 / 1. 상품 관리=============================== -->
            <div class="product_management content" id="tab1"> 이거슨 상품 관리 </div>
            <!-- ========================오른쪽 탭 / 2. 판매 관리=============================== -->
            <div class="sell_management content" id="tab2"> 이거슨 판매 관리 </div>
            <!-- ========================오른쪽 탭 / 3. 매출 관리=============================== -->
            <div class="sales_management content " id="tab3"> 이거슨 매출 관리</div>
            <!-- ========================오른쪽 탭 / 4. 판매자 정보=============================== -->
            <div class="giver_information content on" id="tab4">
                <div class="content_giver_information_wrap"><!--content_giver_information_wrap start  -->
                    <div class="giver_information_head_box">
                        <span class="giver_information_head_box_text">판매자 정보</span>
                    </div>
                    <div class="giver_information_body_box"><!--giver_information_body_box start  -->
                        <div class="giver_information_profile_box">
                            <div class="giver_profile_img_box">
                                <img class="giver_profile_img" src="/img/${giver.profileImg}.jpg">
                            	<div class="profile_msg"></div>
                            </div>
                            <label class="giver_information_box_head fas fa-camera">
                                <input type="file" accept="image/*" id="profileImg" name="profile" class="filter_radio" onchange="previewImage(this);" />
                            </label>
                        </div>
                        <div class="giver_information_box_body"><!--giver_information_box_body start  -->
                            <dl>
                                <dt>상호</dt>
                                <dd>${giver.company}</dd>
                            </dl>
                            <dl>
                                <dt>연락처</dt>
                                <dd><span class="giver_phone_num">${giver.phone }</span>
                                    <div class="giver_information_change_phone_num"><input class="change_phone_num_input hidden" placeholder="000-0000-0000 형태로 작성해주세요."/></div>
                                    <button class="giver_information btn change_phone_num" >수정</button>
                                	<div class="phone_num_notice"></div> 
                                	 <div id="phoneRequiredSpace"></div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>아이디</dt>
                                <dd>${giver.id}</dd>
                            </dl>
                        </div><!--//giver_information_box_body end-->
                    </div><!--//giver_information_body_box end -->
                </div><!--//content_giver_information_wrap end -->
            </div><!--//.giver_information_content end-->
        </div><!--//contents end -->
    </div><!--//container end-->
</body>
<script src="/js/jquery.js"></script>

<!-- 주소 변경을 위한 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
const $managementList = $(".management_list");
const $arrow = $(".fas.fa-chevron-right");
const $contents = $(".contents");
const $content = $(".content");

/* =====================오른쪽 탭 리스트 클릭 시, css & 탭 내용 변경 ================ */
// 리스트 클릭시
$managementList.on("click", function () {
    // css 변경
    $managementList.removeClass("on").css("fontSize","16px");
    $arrow.removeClass("on");
    $(this).addClass("on").css("fontSize","18px").children().addClass("on");

    //alert($(this).index());

    // 탭 변경을 위한 data-tab 속성 값 받아오기
    const onTab = $(this).attr("data-tab");

    // 왼쪽 컨텐츠를 선택한 리스트에 맞게 내용 변경
    $content.removeClass("on");
    $(this).addClass("on");
    $("#"+onTab).addClass("on");

}); // $$managementList click() end

/* ========================주소 변경===================================================================== */

/* 판매자 정보 탭에 나타나는 사업장 소재지 주소 */
const $giverAddress = $(".giver_information_giver_address");

// 주소 변경 버튼 클릭시 함수 호출.
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr +  ')';
            }

            //유저가 선택한 값을 원래 주소가 작성되어있던 자리에 변경해준다.
            $giverAddress.text(roadAddr);
        }
    }).open();
}//function DaumPostcode() end

/* =============================전화번호 변경===============================*/

/* (전화번호) 수정 버튼 */
const $changePhoneNumBtn  = $(".change_phone_num");
/* 기존의 기버 전화번호 */
const $giverPhoneNum = $(".giver_phone_num");
/* 전화번호 변경을 위한 input */
const $changePhoneNumInput = $(".change_phone_num_input");

/* 전화번호 정규표현식*/
const phoneNumRegExp = /^01(?:0|1|[6-9])\d{3,4}\d{4}$/;

// (전화번호) 수정 버튼 누르면,
$changePhoneNumBtn.on("click", function () {

    $changePhoneNumInput.toggleClass("hidden");
    $giverPhoneNum.toggleClass("hidden");
    
    $changePhoneNumInput.on("keyup",function() {
		const phoneNum = $changePhoneNumInput.val();
    	
	});//ajax end
    
});// $changePhoneNumBtn click() end

//전화번호 유효성검사 시작


/* =========================프로필 이미지 변경==================================*/
//프로필 사진 인풋요소 상수선언
 const $profileInput = $("#profileImg");

//프로필 사진 업로드 관련 메세지
 const $profileMsg = $(".profile_msg");

/* 기버의 프로필 이미지 */
const $giverProfileImg = $(".giver_profile_img");

$profileInput.on("change",function () {

    //File API 순수자바스크립트
    //input type=file요소에는
    //files라는 배열이 존재함

    //console.log(this.files);

    const file = this.files[0];

    //1) 파일의 크기가 0이상

    if(file.size==0) {
        $profileMsg.text("제대로 된 파일을 선택해주세요.");
        return;
    }//if end

    //2) 파일의 종류가 image
    if(!file.type.includes("image/")) {
        //파일이 image가 아닐때
        $profileMsg.text("이미지를 선택해주세요.");
        return;
    }//if end

    $profileMsg.text("파일 업로드중...");

    //3) FormData객체 생성
    const formData = new FormData();

    //4) formdata에 파라미터를 추가

    //?type=P 파라미터
    formData.append("type","P");

    //파일을 append
    formData.append("profile",file,file.name);

    //$.ajax의 enctype의 기본값은
    //application/x-www-form-urlencoded
    //enctype :
    //multipart/form-data로 넘겨야함
    //1) post방식
    //2) processData : false
    //3) contentType : false
    $.ajax({
        url:"/ajax/giver/${loginMember.no}/profile",
        type:"POST",
        processData:false,
        contentType:false,
        data:formData
        dataType:"json",
        error:function(){
            alert("서버 점검중!")
        },
        success:function(json){

            //img요소의 src속성을 넘어온 이미지로 변경
            $giverProfileImg.attr("src","/img/"+json.profileName);

            //메세지 제거
            $profileMsg.text("");

            //input hidden에 이름을 value로

            //$profileName.val(json.profileName);

            //서버단에서 vo에 설정된 프로필사진 멤버필드 명과 다른 이름으로
            //인풋타입 히든으로 name 넘겨야 함.

        }
    });//ajax() end

});//change end


//프로필 사진 등록 미리보기 함수 선언 (실제로는 서버에 바로 업로드해서 보여줌)
function previewImage(f){

    let file = f.files;

    // 확장자 체크
    if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
        alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

        // 선택한 파일 초기화
        f.outerHTML = f.outerHTML;

        document.getElementById('profile').innerHTML = '';

    } else {

        // FileReader 객체 사용
        let reader = new FileReader();

        // 파일 읽기가 완료되었을때 실행
        reader.onload = function(rst){
            $giverProfileImg.attr("src",rst.target.result);
        }

        // 파일을 읽는다
        reader.readAsDataURL(file[0]);

    }//if~else end
}//function previewImage(f) end

/* 기버 프로필 이미지 감싸는 box*/
const $giverInformationProfileBox = $(".giver_information_profile_box");
/* 기버 프로필 이미지 제거를 위한 close 버튼 */
const $profileBoxCloseBtn = $(".giver_information_profile_box .close_btn");


//마우스를 프로필 이미지에 hover 할 때,  x버튼 보여주기
$giverInformationProfileBox.hover(
    function () {
        if ($giverProfileImg.attr("src") !== "img/profile_img_default.jpg") {
            $profileBoxCloseBtn.removeClass("hidden")
        }//if end
    }, function () {
        $profileBoxCloseBtn.addClass("hidden")
    }
); //$giverInformationProfileBox hover end

//x버튼 누르면 기본 이미지로 변경하기
$profileBoxCloseBtn.on("click",function (){
    $giverProfileImg.attr("src","img/profile_img_default.jpg");
    $profileBoxCloseBtn.addClass("hidden");
}); //$profileBoxCloseBtn click() end

</script>

</html>