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
	
			}
		});//ajax() end
		
	});//change() end
//2021/02/28 박형우 작성---------------------------------------------------------------