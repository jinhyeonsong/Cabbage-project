//구 받아오기
const $stateSelect = $("#stateSelect");
const $subStateSelect = $("#subStateSelect");
const subStateTmpl = _.template($("#subStateTmpl").html());
$stateSelect.on('change', function () {
    //기존의 지역은 지운다
    $subStateSelect.empty();
    
    //선택한 시 번호를 가져온다
    let stateNo = $(this).val();
    if (stateNo == 0) {
        //전국을 선택하면 구를 선택할 수 없게한다.
        $subStateSelect.attr('disabled', true);
    }else{
        $subStateSelect.attr('disabled', false);
        $.ajax({
            url: "/ajax/subState",
            type: "get",
            dataType: "json",
            data: {"stateNo": stateNo},
            error: function () {
                alert("서버점검중")
            },
            success: function (json) {
                $subStateSelect.append(subStateTmpl({subStates: json}));
                
            }//success end
        })//ajax end
    }//if~else end
})//stateSelect end
//--------------------------------------------------------------

//플러스 버튼을 누르면 배송지역 및 가격 리스트가 추가됨
const $stateAddBtn = $(".state_add_btn");
const $selectedStateBox = $("#selectedStateBox");

$stateAddBtn.on('click', function () {

    let $selectedState = $("#stateSelect option:selected");
    let selectedStateText = $selectedState.text();
    let $selectedSubState = $("#subStateSelect option:selected");
    let selectedSubStateText = $selectedSubState.text();
    
    let addedPrice = $("#addedPrice").val();

    //5개 이상이면 추가 못하게하기
    const listCount = $("#selectedStateBox li").length
    if(listCount==5){
        alert("최대 5개까지 추가할 수 있습니다")
        return;
    }

    let optionList = selectedStateText + " " + selectedSubStateText + " (+" + addedPrice + "원)"
	let $selectStateItem = $("<li>" + optionList + "<span class='list_delete_btn'><i class=\"far fa-times-circle\"></i></span></li>");
    $selectedStateBox.append($selectStateItem);
	
	let $selectedSubStateInput = $("<input type='hidden' name='deliveryAvailSubState'>").appendTo($selectStateItem);
	$selectedSubStateInput.val($selectedSubState.val());
	let $selectedStateTax = $("<input type='hidden' name='deliveryAvailTax'>").appendTo($selectStateItem);
	$selectedStateTax.val(addedPrice);
});

//배송지역 및 가격 리스트에서 x버튼 누르면 삭제
$("#selectedStateBox").on('click', '.list_delete_btn', function () {
    $(this).parent().remove();
})//listDeleteBtn click end
//----------------------------------------------------------------

//구독명 입력에서 글자수 세는 cal함수 선언
function calc() {
    //input의 글자수를 센다.
    let countNum = $(".subscribe_title_input").val().length;
    let titleLength = $(".countNum").val(countNum);
}

const $subscribeTitleInput = $(".subscribe_title_input");

//keypress, keyup, keydown 할때마다 calc()이 실행되어야함
$subscribeTitleInput.on('keypress', function () {
    calc();
});
$subscribeTitleInput.on('keydown', function () {
    calc();
});
$subscribeTitleInput.on('keyup', function () {
    calc();
});
//--------------------------------------------------------------

//selectLocalImage함수
function selectLocalImage() {

    const input = $("<input type='file'>");
    input.click();

    input.on("change", function () {

        const file = this.files[0];

        if (/^image\//.test(file.type)) {

            //여기에 오면 파일이 있고 사진임;

            //multipart/form-data에 필요함
            const formData = new FormData();

            formData.append("uploadImg", file, file.name);
            formData.append("type", "E");

            //여기서 ajax로 파일 업로드 수행
            $.ajax({
                url: "/ajax/uploadImage",
                processData: false,//multipart/form-data
                contentType: false,//multipart/form-data
                data: formData,//multipart/form-data
                type: 'POST',//multipart/form-data
                dataType: "json",
                error: function (xhr, error, code) {
                    alert("에러:" + code);
                },
                success: function (json) {
                    const range = quill.getSelection();

                    let idx = 0;
                    if (range != null) {
                        idx = range.index;
                    }

                    quill.insertEmbed(idx, 'image', "/img/upload/"+json.imageName); //선택한 파일을 quill editor에 첨부하는 코드
                    quill.insertText(quill.getSelection() + 1, ' ', Quill.sources.SILENT); //질문..무슨역할
                    
                }
            });
        } else {
            alert("이미지를 선택해주세요!");
        }
    })//input change function end
}//selectLocalImage() end

//quillEditor 설정
let quill = new Quill('#editorWrap', {
    modules: {
        toolbar: {
            container: '#toolbarWrap',
            //이미지 선택시 파일 업로드를 위해서
            handlers: {
                'image': selectLocalImage
            }
        }
    },
    theme: 'snow'
});

//등록버튼을 눌렀을 때 유효성검사 진행하기
const $registerFormContent = $("#registerFormContent");
const $registerFormInput = $registerFormContent.find("input");
console.log($registerFormInput);

$registerFormInput.on("keydown", function(e){
	if(e.keyCode === 13) {
   		e.preventDefault();
  	};
});

$registerFormContent.on("submit", function (e) {

    //가격을 숫자로 입력했는지 검사하기
    let subscribePrice = $("#subscribePrice").val();
    let discountPrice = $("#discountPrice").val();
    let availableDay = $("#availableDay").val();
    let salesQuantity = $("#salesQuantity").val();
    if(!($.isNumeric(subscribePrice)&& $.isNumeric(discountPrice))){
        alert("가격은 숫자로만 입력해주세요")
        $(".delivery_price .fa-circle").css("display","inline-block");
        return;
    }else{
        $(".delivery_price .fa-circle").css("display","none");
    }

    if(!($.isNumeric(availableDay))){
        alert("신청 가능일은 숫자로 입력해주세요")
        $(".available_day .fa-circle").css("display","inline-block");
        return;
    }else{
        $(".available_day .fa-circle").css("display","none");
    }

    if(!($.isNumeric(salesQuantity))){
        alert("판매수량은 숫자로 입력해주세요")
        $(".photo_sales_quantity .fa-circle").css("display","inline-block");
        return;

    }else{
        $(".photo_sales_quantity .fa-circle").css("display","none");
    }

    //quill editor 검사하기
    const contents = $(".ql-editor").html();
	
	//input type=hidden에 value로 세팅
    $("#editorDetail").val(contents);
    console.log($("#editorContent").val());
       
    return true;
       
    
});//#writeForm submit() end
//----------------------------------------------------------

//이미지 업로드
$(".photo_input").on('change',function(){

    const file = this.files[0];

    if (/^image\//.test(file.type)) {

        //multipart/form-data에 필요함
        const formData = new FormData();

        formData.append("uploadImg", file, file.name);

        let $photoBtn;
        if($(this).hasClass("main")){
            $photoBtn = $("#mainPhotoBtn");
        }else if($(this).hasClass("guide")){
            $photoBtn = $("#purchaseGuideBtn");
        }
        formData.append("type", "PR");

        //여기서 ajax로 파일 업로드 수행
        $.ajax({
            url: "/ajax/uploadImage",
            processData: false,//multipart/form-data
            contentType: false,//multipart/form-data
            data: formData,//multipart/form-data
            type: 'POST',//multipart/form-data
            dataType: "json",
            error: function (xhr, error, code) {
                alert("에러:" + code);
            },
            success: function (json) {

                $photoBtn.css("background","url('/img/resize/"+json.imageName+"')");

            }//success end
        });//ajax end
    } else {
        alert("이미지를 선택해주세요!");
    }
});
