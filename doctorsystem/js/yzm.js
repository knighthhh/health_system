//手机号验证
function PhoneMobile() {
    var user_phone = document.all("user_phone").value;
    if (user_phone.match(/^(13[0-9]|14(5|7)|15(0|1|2|3|5|6|7|8|9)|18[0-9])\d{8}$/) != null) {
        //verificationMobile();
    } else {
        $("#user_phone").val("输入的手机号不正确");
        $("#user_phone").css("color", "red")
    }
}
//验证码
function verificationMobile() {
    var btn = document.getElementById('code');
    btn.onclick = function() {
        var sleep = 60,
            interval = null;
        PhoneMobile();
        if ($("#user_phone").val() != "输入的手机号不正确") {
            CallAction();
            if (!interval) {
                this.disabled = "disabled";
                this.style.cursor = "wait";
                this.value = "重新发送 (" + sleep-- + ")";
                interval = setInterval(function() {
                    if (sleep == 0) {
                        if (!!interval) {
                            clearInterval(interval);
                            interval = null;
                            sleep = 60;
                            btn.style.cursor = "pointer";
                            btn.removeAttribute('disabled');
                            btn.value = "获取验证码";
                            btn.style.backgroundColor = '';
                        }
                        return false;
                    }
                    btn.value = "重新发送 (" + sleep-- + ")";
                }, 1000);
            }
        }
    }
}
//验证码请求
function CallAction() {
    var data = 你的数据请求连接;
    $.ajax({
        async: true,
        url: '网站连接',
        data: data,
        dataType: 'jsonp',
        type: 'get',
        callback: successCallback,
        timeout: 10000,
        complete: function(XMLHttpRequest, status) {
            if (status == 'timeout') {
                //超时,status还有success,error等值的情况 
                alert("方法查询异常！");
            }
        }
    });
}
