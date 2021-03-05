/*배송지 관련*/    
    
    const $zipCodeBtn = $(".zip_code_btn");

	// 유저가 선택한 배송지 옵션
    let curAddrOptSido ='';
    let curAddrOptSigungu ='';
    
     // 배송 옵션에 따른 가격 변동
    const $optArea = $(".opt_area");
    
    // 배송지 옵션 선택 + 가격 변동
    
	$optArea.on("click", ".delivery_opt_label", function(){
		$(".total_price_input").val(this.dataset.price);
		$(".product_price").text(this.dataset.price);
 		
 		// 시도 / 시군구
		curAddrOptSido = this.dataset.sido;
    	curAddrOptSigungu = this.dataset.sigungu;
		
		console.log(this.dataset.sido);
		console.log(this.dataset.sigungu);
	});// on click

    
    $zipCodeBtn.on("click", function(){
    execAddrAPI();
    }); // on click

    function execAddrAPI() {
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
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            
            
            
            const addrSido = data.sido;
            const addrSigungu = data.sigungu;
            
            console.log(addrSido);
            console.log(addrSigungu);
            
            // 행정구까지 저장
            
            // 주소를 검색하여 선택할 때 유효성 검사, 배송지 == 배송지 옵션 이면 통과
            
            // 배송 옵션에 행정 시군구는 없고 시도만 있을 때 
            if(curAddrOptSigungu == null && addrSido === curAddrOptSido){
            
            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("zipCode").value = data.zonecode;
	            console.log(data.zonecode);
	            document.getElementById("roadAddr").value = roadAddr;
	            console.log(roadAddr);
	            document.getElementById("jibunAddr").value = data.jibunAddress;
	            console.log(data.jibunAddress);
	            
	             // 배송 옵션이 있고 시도 군구가 일치할 때
            } else if(curAddrOptSigungu != null && curAddrOptSigungu == addrSigungu && addrSido === curAddrOptSido){
            
            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("zipCode").value = data.zonecode;
	            console.log(data.zonecode);
	            document.getElementById("roadAddr").value = roadAddr;
	            console.log(roadAddr);
	            document.getElementById("jibunAddr").value = data.jibunAddress;
	            console.log(data.jibunAddress);
				
			} else {
				alert(`같은 지역만 배송 가능합니다. 선택한 배송지역의 주소(${curAddrOptSido + curAddrOptSigungu})를 선택해주세요.`);
			}

        }
        
    }).open();
    }

/*배송지 주소*/

    // 배송지 주소 탭
    $(".delivery_type_box li").on("change", function(){
        const $this = $(this);

        let idx = $this.index();

        $(".show").removeClass("show");
        $(".delivery_form_container").children().eq(idx).addClass("show");

    }); // on click


    // 배송지 목록 불러오기
    const $addrList = $(".addr_list");
    const $delPopOverlay = $("#delPopOverlay");
    const $popCloseBtn = $(".fas.fa-times");
    const $addrSettingBtn = $(".setting_btn");

    const $addrTbody = $(".tbl_delivery_list tbody");
    const addrListTmpl = _.template($("#addrListTmpl").html());

    $addrList.on("click", function(){
        $delPopOverlay.addClass("pop_show");
        
        // ajax로 목록 불러와서 템플릿 채움
        /*$.ajax({
            url: "/addrList",
            type: "GET",
            dataType: "JSON",
            error: function(){alert('아직구현안됨');},
            success: function(addrJson){
                // 언더스코어로 붙여넣어주면됨
                $addrTbody.html(addrListTmpl({addrList:addrJson}));
            }
        });*/
    }); // on click

    // 팝업닫기
    $popCloseBtn.on("click",function(){
        $(".pop_show").removeClass("pop_show");
        
        $("#paymentPopContainer input").val("");
    }); // on click
    
    // 배송지에서 선택했을 때 해당 주소를 입력하기
    // 중복 코드가 너무 많다. 나중에 정리하자
    $addrSettingBtn.on("click",function(){
        const $this = $(this);

        const $addrNick = $this.closest(".addr_item").find(".address_nick").text();
        const $recipient  =$this.closest(".addr_item").find(".recipient").text();
        const $zipCode = $this.closest(".addr_item").find(".zipCode").text();
        const $baseAddr  =$this.closest(".addr_item").find(".baseAddr").text();
        const $addrDetail = $this.closest(".addr_item").find(".addr_detail").text();
        const $phone = $this.closest(".addr_item").find(".tel_no").text();
        const $phone1  = $phone.substring(0,3);
        const $phone2  = $phone.substring(4,8);
        const $phone3  = $phone.substring(9,13);
        console.log($recipient);
        console.log($addrNick);
        console.log($phone1);
        console.log($phone2);
        console.log($phone3);
        console.log($zipCode);
        console.log($baseAddr);
        console.log($addrDetail);


        $(".new_delivery.delivery_txt1").val($recipient);
        $(".new_delivery.delivery_txt2").val($addrNick);

        $(".new_delivery.phone1_txt").val($phone1);
        $(".new_delivery.phone2_txt").val($phone2);
        $(".new_delivery.phone3_txt").val($phone3);

        $(".new_delivery.zip_code").val($zipCode);
        $(".new_delivery.addr").val($baseAddr);
        $(".new_delivery.addr_detail").val($addrDetail);

        $delPopOverlay.removeClass("pop_show");
    }); // on click


/*배송지 수정*/

    const $defaultAddrEditBtn = $(".default_addr_edit_btn");
    const $defaultAddrForm = $(".addr_form.default_addr");
    const $newDeliveryAddrInput = $("#newDeliveryAddr");
    const $newAddrForm = $(".addr_form.new_addr");

    $defaultAddrEditBtn.on("click", function(){
        $defaultAddrForm.removeClass("show");
        $newAddrForm.addClass("show");

        // 탭 설정을 change로 해놔서 checked만 설정해줘도 탭 바뀐다
        $newDeliveryAddrInput.prop("checked", true);

        const $phoneNum = $(".default_addr .phone_num").text();

        const $recipient = $(".default_addr .recipient").text();
        const $deliveryName = $(".default_addr .delivery_name").text();
        const $phone1 = $phoneNum.substring(0,3);
        const $phone2 = $phoneNum.substring(4,8);
        const $phone3 = $phoneNum.substring(9,13);
        const $zipCode = $(".default_zip_code").text();
        const $addr = $(".default_addr_content").text();
        const $addrDetail = $(".default_addr_detail").text();
        console.log($recipient);
        console.log($deliveryName);
        console.log($phone1);
        console.log($phone2);
        console.log($phone3);
        console.log($zipCode);
        console.log($addr);
        console.log($addrDetail);

        //기본배송지의 값을 얻어와 신규 배송지에 세팅

        $(".new_delivery.delivery_txt1").val($recipient);
        $(".new_delivery.delivery_txt2").val($deliveryName);

        $(".new_delivery.phone1_txt").val($phone1);
        $(".new_delivery.phone2_txt").val($phone2);
        $(".new_delivery.phone3_txt").val($phone3);

        $(".new_delivery.zip_code").val($zipCode);
        $(".new_delivery.addr").val($addr);
        $(".new_delivery.addr_detail").val($addrDetail);

        //기본배송지로 체크됨
        $(".default_checkbox").prop("checked", true);

    }); // on click



/*결제 팝업*/

    const $paymentPopBtn = $(".payment_btn");
    const $paymentOverlay =$("#paymentOverlay");

    // 팝업
    $paymentPopBtn.on("click", function(){
        $paymentOverlay.addClass("pop_show");
        $("#cardDigit").focus();

    }); // on click



    // 카드번호 유효성 검사
    let verifyingMsg = $(".verifying_msg");
    const numOnly = /^[0-9]+$/;
    const $paymentInput = $("#paymentPopContainer input");
    

    $paymentInput.on("keyup", function(){
        const $this = $(this);

        if(!numOnly.test($this.val())) {
            verifyingMsg.html("숫자만 입력해주세요");
            $this.val("");
        }

        // 입력 다 되면 다음으로
        if($this.val().length == $this.attr("maxlength")){
            $this.next().focus();
        }
        
		let numCount =0;
		
        $("#paymentPopContainer .card_digit").each(function(){
            numCount += $(this).val().length;
        });

        console.log(numCount);
        let cardNum ='';
        // 모든 필드 입력개수 19
        if(numCount==19){
            
            // 파라미터 조합
            // 카드 번호 조합해서 받아옴
            
            $(".card_number_area input").each(function(){
                cardNum += $(this).val();
            });
            
            // 카드 번호에 값 넣어줌
            $(".total_card_num").val(cardNum);
            
            console.log(cardNum);

            // 결제 활성화 
            $(".submit_btn").prop("disabled", false).css("backgroundColor","#713C47");
            
            
            // 다 입력되면 포커스 잃고 readonly(계속 누르면 값 추가되므로)
            $paymentInput.blur();
            $("input.card_digit").prop("readonly", true);
            
		}
		
    }); // on keyup
    
    // 카드값 다시 수정하려 눌렀을 때
    $paymentInput.on("click", function(){
    
    	const $this = $(this);
    	$this.val("");
    	$paymentInput.prop("readonly", false);
    	$(".total_card_num").val("");
    	
    }); // on click
   
	
	// 전화번호 유효성 검사
		const $phone1= $(".phone1_txt");
		const $phone2= $(".phone2_txt");
		const $phone3= $(".phone3_txt");
		const $totalPhone = $(".total_phone_num");
		
	$(".phone_num_check").on("keyup", "input.new_delivery", function(){
		
		const $this = $(this);
		
		if(!numOnly.test($this.val())){
			alert("숫자만 입력가능합니다");
			$this.val("");
		}
		
		if($phone2.val().length == $this.attr("maxlength")){
			$(".phone3_txt").focus();
		}
		
		if($phone2.val().length+$phone3.val().length ==8){
			$totalPhone.val($phone1.val()+$phone2.val()+$phone3.val());
		}
		
		
	}); // on keyup
	
	// 결제하기 버튼 누를 때 배송지 ajax로 검사 (배송지가 없으면 추가하겠다고 함)
	
	
    
