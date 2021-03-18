//비밀번호 유효성검사
const $passwordInput = $(".password_input");
const $passwordNotice = $(".password_notice");
const $passwordConfirmInput = $(".password_confirm_input");
const $passwordConfirmNotice = $(".password_confirm_notice");

let businessNameValidation = 0;
let idValidation = 0;
let passwordValidation = 0; 
let passwordConfirmValidation = 0; 
let phoneValidation = 0;
let profileImgValidation = 0;

const $signUpBtn = $(".sign_up_btn");

$signUpBtn.on("click",function(){

	if(businessNameValidation == 0){$businessName.css("border","1px solid red")}
	if(idValidation == 0){$id.css("border","1px solid red")}
	if(passwordValidation == 0){$passwordInput.css("border","1px solid red")}
	if(passwordConfirmValidation == 0){$passwordConfirmInput.css("border","1px solid red")}
	if(phoneValidation == 0){$phone.css("border","1px solid red")}
	if(profileImgValidation == 0){$profileImg.css("border","1px solid red")}
	
	if((businessNameValidation==1)&&(idValidation==1)&&(passwordValidation==1)&&(passwordConfirmValidation==1)&&(phoneValidation==1)&&(profileImgValidation==1)){$signUpBtn.prop("type","submit")}
})

function checkPassword(password){
    let passwordNum = password.search(/[0-9]/g);
    let passwordEng = password.search(/[a-z]/ig);
    let passwordSpe = password.search(/[~!@#$%^&*()_+|<>?:{}]/g);

    if((password.length < 8 || password.length > 12) || (passwordNum<0 || passwordEng<0 || passwordSpe<0)){
        $passwordNotice.show();
        $passwordNotice.css("color","crimson");
        $passwordNotice.children("span").text("영문 및 숫자, 특수문자 포함 8~12자입니다.");
        passwordValidation = 0;
    }else if(password.search(/\s/) != -1){
        $passwordNotice.show();
        $passwordNotice.css("color","crimson");
        $passwordNotice.children("span").text("공백은 허용되지 않습니다.");
        passwordValidation = 0;
    }else {
        $passwordNotice.show();
        $passwordNotice.css("color","blue");
        $passwordNotice.children("span").text("사용가능한 비밀번호입니다.");
        passwordValidation = 1;
        $passwordInput.css("border","1px solid #bababa");
    }
}
function checkPasswordConfirm(password, passwordConfirm){
    if(!password){
        $passwordConfirmNotice.show();
        $passwordConfirmNotice.css("color", "crimson");
        $passwordConfirmNotice.children("span").text("비밀번호를 입력하여주세요.");
        passwordConfirmValidation = 0;
    }else if(password==passwordConfirm){
        $passwordConfirmNotice.show();
        $passwordConfirmNotice.css("color", "blue");
        $passwordConfirmNotice.children("span").text("비밀번호가 일치합니다.");
        passwordConfirmValidation = 1;
        $passwordConfirmInput.css("border","1px solid #bababa");
        
    }else{
        $passwordConfirmNotice.show();
        $passwordConfirmNotice.css("color", "crimson");
        $passwordConfirmNotice.children("span").text("비밀번호가 일치하지 않습니다.");
        passwordConfirmValidation = 0;
    }
}

$passwordInput.blur(function(){
    checkPassword($passwordInput.val());
});
$passwordConfirmInput.blur(function(){
    checkPasswordConfirm($passwordInput.val(), $passwordConfirmInput.val());
});

//프로필 이미지 처리
const $profile = $("#profileImgInput");
const $profileImg = $(".profile_img_input");
const $profileCancleBtn = $(".profile_img_input_box>i");

$profile.on("change",function(){
		//File API 순수자바스크립트
		//input type=file요소에는
		//files라는 배열이 존재함
		
		//console.log(this.files);
		
		const file = this.files[0];
		
		//1) 파일의 크기가 0이상
		
		if(file.size==0) {
			alert("여기까지왔으면?");
			return;
		}//if end
		
		//alert("여기까지왔으면?");
		
		//2) 파일의 종류가 image
		if(!file.type.includes("image/")) {
			//파일이 image가 아닐때
	alert("여기까지왔으면?");
			return;
		}//if end

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
			url:"/ajax/profile",
			type:"post",
			processData:false,
			contentType:false,
			data:formData,
			dataType:"json",
			error:function(){
				alert("서버 점검중!")
			},
			success:function(json){
			
				//input hidden에 이름을 value로 
				//$profileName.val(json.profileName);
				
				  $profileImg.css({
				  "backgroundImage":"url(/img/upload/"+json.profileName+")",
				  "display":"block"
				  });
                  $profileImg.val(json.profileName);
				  profileImgValidation = 1;
				 $profileImg.css("border","none");
			}
		});//ajax() end
		
	});//change() end

	let $id = $(".id_input");

//이메일 유효성 검사
function chkEmail(str) {
    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if (regExp.test(str)) return true;
    else return false;
}
$idNotice = $(".id_notice");
$idNoticeSpan = $(".id_notice span");
//id 유효성 검사
$id.on("keyup",function () {
    let emailChk = chkEmail($id.val());
    if(emailChk==true){
    	$.ajax({
			url:"/ajax/giver/check/id",//주소
			type:"get",//방식
			data:{"id":$id.val()},//파라미터
			dataType:"json",//응답의 자료형
			error:function(xhr,error){
				alert("서버 점검중!");
				console.log(error);
			},
			success:function(json){
				if(json.result) {
					$idNotice.css("display","block");
					$idNoticeSpan.text("이미 등록된 아이디 입니다.").css("color","red");;
					idValidation = 0;
				}else {
					$idNotice.css("display","block");
					$idNoticeSpan.text("좋은 아이디 입니다.").css("color","blue");;
					idValidation = 1;
					 $id.css("border","1px solid #bababa");
				}//if~else end
			}//end success
		});//end ajax 
    }
    else{
    	$idNotice.css("display","block");
		$idNoticeSpan.text("이메일 형식으로 해주세요");
		idValidation = 0;
    }
})//end $id.on()
//상호명 유효성 검사
let $businessName = $(".business_name_input");
let $businessNameNotice = $(".business_name_notice");
let $businessNameNoticeSpan = $(".business_name_notice span");

$businessName.on("keyup",function () {
    if ($businessName.val().length <= 1) {
    	 $businessNameNotice.css("display","block");
		 $businessNameNoticeSpan.text("2글자 이상으로 해주세요!").css("color","red");;
    }else{
    	$.ajax({
			url:"/ajax/check/businessName",//주소
			type:"get",//방식
			data:{"businessName":$businessName.val()},//파라미터
			dataType:"json",//응답의 자료형
			error:function(xhr,error){
				alert("서버 점검중!");
				console.log(error);
			},
			success:function(json){
			if(json.result) {
				$businessNameNoticeSpan.text("이미 등록된 상호명입니다.").css("color","red");;
				businessNameValidation = 0;
			}//end success
			else{
				$businessNameNoticeSpan.text("좋은 상호명입니다.").css("color","blue");;
				businessNameValidation = 1;
				$businessName.css("border","1px solid #bababa");
				}
			}
		});//end ajax 
    }//end else
})//end $businessName.on()


let $phone = $(".phone_input");
let $phoneNotice = $(".phone_notice");
let $phoneNoticeSpan = $(".phone_notice span");

$phone.on("keyup",function () {
    if ($phone.val().length <= 9) {
    	 $phoneNotice.css("display","block");
		 $phoneNoticeSpan.text("올바른 번호를 입력해주세요.");
		 phoneValidation = 0;
    }else{
    	 $phoneNoticeSpan.text("");
    	 phoneValidation = 1;
    	 $phone.css("border","1px solid #bababa");
    }//end else
})//end $phone.on()





	