//차트 생성
$(function() {
    $("#chartSubsNum").visualize({
        type: "line",
        width: "710",
        height: "440",
        colors:["#c0392b"],
        textColor: "#bababa"
    });
    $("#chartPaymentNum").visualize({
        type: "line",
        width: "710",
        height: "440",
        colors:["#713C47"],
        textColor: "#bababa"
    });
    $("#chartPaymentPrice").visualize({
        type: "line",
        width: "710",
        height: "440",
        colors:["#0B4D40"],
        textColor: "#bababa"
    });

    //차트 버튼
    const $subsNumBtn = $(".subs_num_btn_item>button");
    const $paymentNumBtn = $(".payment_num_btn_item>button");
    const $paymentPriceBtn = $(".payment_price_btn_item>button");

    const $subsNumChart = $(".visualize").eq(0);
    const $paymentNumChart = $(".visualize").eq(1);
    const $paymentPriceChart = $(".visualize").eq(2);

    $paymentNumChart.hide();
    $paymentPriceChart.hide();

    $subsNumBtn.on("click", function () {
        $subsNumChart.show();
        $paymentNumChart.hide();
        $paymentPriceChart.hide();
    });
    $paymentNumBtn.on("click", function () {
        $subsNumChart.hide();
        $paymentNumChart.show();
        $paymentPriceChart.hide();
    });
    $paymentPriceBtn.on("click", function () {
        $subsNumChart.hide();
        $paymentNumChart.hide();
        $paymentPriceChart.show();
    });
});
//2021/02/28 박형우 작성---------------------------------------------------------------