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
const $profileImgInput = $("#profileImgInput");
const $profileImg = $(".profile_img_input");
const $profileCancleBtn = $(".profile_img_input_box>i");

$profileImgInput.on("change", function(){
    const file = this.files[0];

    if (/^image\//.test(file.type)) {
        const formData = new FormData();

        formData.append("uploadImg", file, file.name);
        formData.append("type", "P");

        $.ajax({
            url:"jsonTest/test1.json",
            processData : false,//multipart/form-data
            contentType : false,//multipart/form-data
            data : formData,//multipart/form-data
            type : 'POST',//multipart/form-data
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

$profileCancleBtn.click(function(){
    $profileImg.css("background-image", "");
    $profileImgInput.val("profile_img.gif");
});
//2021/02/28 박형우 작성---------------------------------------------------------------