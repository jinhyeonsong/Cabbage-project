<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>테이커 회원가입</title>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/signUpTaker.css"/>
    <link rel="stylesheet" href="/css/all.min.css"/>
    <link rel="stylesheet" href="/css/appleSDGothic.css"/>
  
</head>
<body>
<div id="container"><!--container start-->
    <div id="signUpTitleContent"><!--signUpTitleBox start-->
        <div class="sign_up_title"><span>Take It</span></div>
        <div class="sign_up_sub_title"><span>테이커 회원가입</span></div>
    </div><!--//signUpTitleBox end-->
    <form action="/taker/signUp" method="post"><!--//form start-->
        <div id="signUpInputContent"><!--sign_up_input_container start-->
            <div class="id_input_box"><!--idInputBox start-->
                <div class="id_input_title"><span>아이디</span></div>
                <input class="id_input" name="id" placeholder="이메일형식으로 입력 예)xxxx@gmail.com"/>
            	<div class="id_notice"><span></span></div>
            </div><!--//idInputBox end-->
            <div class="password_input_box"><!--passwordInputBox start-->
                <div class="password_input_title"><span>비밀번호</span></div>
                <input class="password_input" name="password" type="password" placeholder="영문 및 숫자, 특수문자 8~12자를 입력하세요"/>
                <div class="password_notice"><span></span></div>
            </div><!--//passwordInputBox end-->
            <div class="password_confirm_input_box"><!--passwordConfirmInputBox start-->
                <div class="password_confirm_input_title"><span>비밀번호 확인</span></div>
                <input class="password_confirm_input"  type="password" name="passwordConfirm" />
                <div class="password_confirm_notice"><span></span></div>
            </div><!--//passwordConfirmInputBox end-->
            <div class="name_input_box"><!--nameInputBox start-->
                <div class="name_input_title"><span>이름</span></div>
                <input class="name_input" name="name" />
            </div><!--//nameInputBox end-->
            <div class="nickname_input_box"><!--nicknameInputBox start-->
                <label class="nickname_input_title" for="nickname"><span>닉네임</span></label>
                <input class="nickname_input" name="nickname" placeholder="한/영 10자까지 가능합니다."/>
                <div class="nickname_notice"><span>닉네임은 한/영 10자까지 가능합니다.</span></div>
                <div class="nickname_notice"><span>중복되는 닉네임입니다.</span></div>
            </div><!--//nicknameInputBox end-->
            <div class="birthday_input_box"><!--birthdayInputBox start-->
                <div class="birthday_input_title"><span>생년월일</span></div>
                <input class="birth_year_input" name="birthYear" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /><div class="birth_year_title"><p>년</p></div>
                <input class="birth_month_input" name="birthMonth" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /><div class="birth_month_title"><p>월</p></div>
                <input class="birth_date_input" name="birthDate" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /><div class="birth_date_title"><p>일</p></div>
            </div><!--//birthdayInputBox end-->
            <div class="gender_input_box"><!--genderInputBox start-->
                <div class="gender_input_title"><span>성별</span></div>
                <input id="genderMaleBtn" name="gender" type="radio" value="M"/><label for="genderMaleBtn">남</label>
                <input id="genderFemaleBtn" name="gender" type="radio" value="F"/><label for="genderFemaleBtn">여</label>
            </div><!--//genderInputBox end-->
            <div class="profile_img_input_box"><!--profileImg_input_box start-->
                <div class="profile_img_input_title"><span>프로필</span></div>
                <label class="profile_img_input" for="profileImgInput"><i class="far fa-plus-square"></i></label>
                <!--input value를 기본프로필로 넘길 사진으로 해두면 된다.-->
                <input id="profileImgInput" name="profileImg" type="file" accept="image/*" value="profile_img.gif"/>
            </div><!--//profileImg_input_box end-->
        </div><!--//sign_up_input_container end-->
        <button class="sign_up_btn" type="submit">회원가입 하기</button>
    </form><!--//form end-->
</div><!---container end-->
<script src="/js/jquery.js"></script>

<script type="text/javascript">

/*======아이디========= */
//id 입력필드
const $id = $(".id_input");
//id에 대한 메세지
const $idMsg = $(".id_notice");

const idRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

$id.on("keyup",function() {
	
	//우선 검사중으로
	$idMsg.text("검사중..");	
	
	//유저가 입력한 id값을 얻어옴
	const id = $id.val();
	
	//우선 정규표현식으로 test
	if(idRegExp.test(id)) {
				//이때 ajax를 이용하여 데이터베이스에
				//이 아이디가 존재하는 지 확인!!
				$.ajax({
					url:"/ajax/check/id",//주소
					type:"get",//방식
					data:{"id":id},//파라미터
					dataType:"json",//응답의 자료형
					error:function(xhr,error){
						alert("서버 점검중!");
						console.log(error);
					},
					success:function(json){
						
						//alert("성공!!");
						//console.log(json);
						
						if(json.result) {
							$idMsg.text("이미 사용중이거나 탈퇴한 아이디입니다.");
							
						}else {
							$idMsg.text("아주 좋은 아이디네요!");
							
						}//if~else end
						
					}
				});//ajax end
				
			}else {
				//틀렸을때
				$idMsg.text("올바른 형식으로 입력해주세요.");
				
			}//if~else end
	
});//keyup() end

/*==========비밀번호============= */
//비밀번호 유효성검사
const $passwordInput = $(".password_input");
const $passwordNotice = $(".password_notice");
const $passwordConfirmInput = $(".password_confirm_input");
const $passwordConfirmNotice = $(".password_confirm_notice");

function checkPassword(password){
    let passwordNum = password.search(/[0-9]/g);
    let passwordEng = password.search(/[a-z]/ig);
    let passwordSpe = password.search(/[~!@#$%^&*()_+|<>?:{}]/g);

    if((password.length < 8 || password.length > 12) || (passwordNum<0 || passwordEng<0 || passwordSpe<0)){
        $passwordNotice.show();
        $passwordNotice.css("color","crimson");
        $passwordNotice.children("span").text("영문 및 숫자, 특수문자 포함 8~12자입니다.");
    }else if(password.search(/\s/) != -1){
        $passwordNotice.show();
        $passwordNotice.css("color","crimson");
        $passwordNotice.children("span").text("공백은 허용되지 않습니다.");
    }else {
        $passwordNotice.show();
        $passwordNotice.css("color","blue");
        $passwordNotice.children("span").text("사용가능한 비밀번호입니다.");
    }
}
function checkPasswordConfirm(password, passwordConfirm){
    if(!password){
        $passwordConfirmNotice.show();
        $passwordConfirmNotice.css("color", "crimson");
        $passwordConfirmNotice.children("span").text("비밀번호를 입력하여주세요.");
    }else if(password==passwordConfirm){
        $passwordConfirmNotice.show();
        $passwordConfirmNotice.css("color", "blue");
        $passwordConfirmNotice.children("span").text("비밀번호가 일치합니다.");
    }else{
        $passwordConfirmNotice.show();
        $passwordConfirmNotice.css("color", "crimson");
        $passwordConfirmNotice.children("span").text("비밀번호가 일치하지 않습니다.");
    }
}

$passwordInput.blur(function(){
    checkPassword($passwordInput.val());
});
$passwordConfirmInput.blur(function(){
    checkPasswordConfirm($passwordInput.val(), $passwordConfirmInput.val());
});
//2021/02/25 박형우 작성---------------------------------------------------------------

//닉네임 유효성 검사
const $nicknameInput = $(".nickname_input");
const $nicknameNotice = $(".nickname_notice");


//nickname 정규표현식
const nicknameRegExp = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-zA-Z]{1,10}$/;

//nickname에 글자를 쓸때	
	$nicknameInput.on("keyup",function() {
	
	//우선 검사중으로
	$nicknameNotice.children("span").text("검사중..");	
	
	//유저가 입력한 id값을 얻어옴
	const nickname = $nicknameInput.val();
	
	//우선 정규표현식으로 test
	if(nicknameRegExp.test(nickname)) {
		
		//이때 ajax를 이용하여 데이터베이스에
		//이 아이디가 존재하는 지 확인!!
		$.ajax({
			url:"/ajax/check/nickname",//주소
			type:"get",//방식
			data:{"nickname":nickname},//파라미터
			dataType:"json",//응답의 자료형
			error:function(xhr,error){
				alert("서버 점검중!");
				console.log(error);
			},
			success:function(json){
				
				if(json.result) {
					$nicknameNotice.show();
                    $nicknameNotice.css("color", "crimson");
                    $nicknameNotice.children("span").text("중복되는 닉네임입니다.");
					
				}else {
					 $nicknameNotice.show();
                     $nicknameNotice.css("color", "blue");
                     $nicknameNotice.children("span").text("사용가능한 닉네임입니다.");
					
				}//if~else end
				
			}
		});//ajax end
		
	}else {
			$nicknameNotice.show();
	        $nicknameNotice.css("color", "crimson");
	        $nicknameNotice.children("span").text("올바른 형식으로 입력해주세요.");
		
	}//if~else end
	
});//keyup() end


$nicknameInput.blur(function(){
    checkNickname($nicknameInput.val());
});

//2021/02/25 박형우 작성---------------------------------------------------------------

//프로필 이미지 처리
const $profileImgInput = $("#profileImgInput");
const $profileImg = $(".profile_img_input");

$profileImgInput.on("change", function(){
   		const file = this.files[0];
   		
    
    	if (/^image\//.test(file.type)) {
        const formData = new FormData();

		formData.append("type", "P");
        formData.append("uploadImg", file, file.name);

        $.ajax({
        url:"/ajax/profile",
        type : 'POST',//multipart/form-data
        processData : false,//multipart/form-data
        contentType : false,//multipart/form-data
        data : formData,//multipart/form-data
        dataType : "json",
        error : function(xhr, error, code) {
            alert("에러:" + code);
        },
        success:function(json) {
            $profileImg.css("background-image","url(img/"+json.img+")");
            $profileImgInput.val(json.img);
        }
    });
    } else {
        alert("이미지를 선택해주세요!");
    }
});

//2021/02/28 박형우 작성---------------------------------------------------------------

</script>
</body>
</html>