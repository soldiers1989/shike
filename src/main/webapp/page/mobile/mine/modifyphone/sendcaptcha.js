//通用发送验证码方法
var _ctr, _m, _send, _send2, _ctr1;
var canGet = false;
var codeValide = '';
function getCode(data) {
    if (data.res = "success") {
        canGet = true;
        codeValide = data
    }
}
function bindCaptcha(ctr, mobile,cttr) {
    _ctr = ctr;
    _ctr1 = cttr;
    _send = function () {
        var reg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
        var m = $(mobile).val().trim();
        _m = m;
        if (m == null || m == "")
            m = $(mobile).text().trim();
        if (reg.test(m)) {
            afterVerification();
        } else {
            myAlert("手机号不正确");
        }
    };
    $(ctr).bind("click", function () {
        checkCaptcha()
    });
}


function checkCaptcha() {
    // if (canGet) {
        _send();
    // } else {
    //     myAlert("")
    // }
}

function afterVerification() {
    
    $('#verification').remove();
    $(_ctr).unbind("click");
    sendSmsCode();

    //$.post("/shike/user/sms.do", { mobile: _m, type: 1, code: codeValide }, function (data) {
    // $.post("/shike/user/sms.do", { mobile: _m, type: 1, code: codeValide }, function (data) {
    //     if (!data.Result) {
    //         alert(data.Message);
    //         canGet = false;
    //         LUOCAPTCHA.reset()
    //         $(_ctr).bind("click", function () {
    //             checkCaptcha()
    //         });
    //     } else {
    //         var i = 120;
    //         var timer = setInterval(function () {
    //             i--;
    //             if (i == 0) {
    //                 canGet = false;
    //                 LUOCAPTCHA.reset()
    //                 $(_ctr).bind("click", function () {
    //                     checkCaptcha()
    //                 });
    //                 $(_ctr1?_ctr1:_ctr).text("重新发送");
    //                 clearInterval(timer);
    //             } else {
    //                 //$("#sendbtn").css("color", "#999");
    //                 $(_ctr1 ? _ctr1 : _ctr).text(i + "秒后重新获取验证码");
    //             }
    //         }, 1000);
    //     }
    // });

}

function sendSmsCode() {
    var data = {mobile: $("#mobile").val(), type: 1};
    var url = "/shike/user/sms.do";
    postdo(url, data, sendSmsCodeCallBack,null, null);
}

function sendSmsCodeCallBack(data) {
    if (data.type == 'success') {
        myAlert("发送成功");
        canGet = false;
        LUOCAPTCHA.reset()
        $(_ctr).bind("click", function () {
            checkCaptcha()
        });
    } else {
        var i = 120;
        var timer = setInterval(function () {
            i--;
            if (i == 0) {
                canGet = false;
                LUOCAPTCHA.reset()
                $(_ctr).bind("click", function () {
                    checkCaptcha()
                });
                $(_ctr1?_ctr1:_ctr).text("重新发送");
                clearInterval(timer);
            } else {
                //$("#sendbtn").css("color", "#999");
                $(_ctr1 ? _ctr1 : _ctr).text(i + "秒后重新获取验证码");
            }
        }, 1000);
    }
}