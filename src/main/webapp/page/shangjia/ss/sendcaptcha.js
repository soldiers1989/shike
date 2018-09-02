//通用发送验证码方法
var _ctr, _m, _send, _send2;
function bindCaptcha(ctr, mobile) {
    _ctr = ctr;
    _send = function () {
        var reg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
        var m = $(mobile).val().trim();
        _m = m;
        if (m == null || m == "")
            m = $(mobile).text().trim();
        if (reg.test(m)) {
            showverdialog();
        } else {
            myAlert("手机号不正确");
        }
    };
    $(ctr).bind("click", function () { _send(); });
}

function showverdialog() {
    var html = '<div class="tchs" id="verification">' +
                    '<div class="lila_index" style="top: 200px">' +
                         '<div class="ling">' +
                            '<strong>' + '<img src="//www.meilipa.com/Content/images/lila.jpg" />' + '</strong>' +
                            '<a>' + '<img src="//www.meilipa.com/Content/images/xx.jpg" onclick="$(\'#verification\').remove();" />' + '</a>' +
                         '</div>' +
                         '<div class="ling_mian">' +
                            '<div class="clearfix" style="margin-top: 20px; margin-bottom: 20px;">' +
                                '<div style="width: 180px; height: 27px; float: left; line-height: 27px; text-align: right;">图形验证码：</div>' +
                                '<img id="captcha_img" onclick="$(this).attr(\'src\', \'/CommonBase/GetCaptchaImg?\'+Math.random())" style="cursor: pointer;height:27px;float:left" />' +
                            '</div>' +
                            '<div class="clearfix">' +
                                '<div style="width: 180px; height: 27px; float: left; line-height: 27px; text-align: right;">请输入图形验证码：</div>' +
                                '<input id="code" type="text" style="width:146px;height:27px;float:left" />' +
                            '</div>' +
                            '<a href="javascript:" onclick="afterVerification()" class="qdingann">确定</a>' +
                        '</div>' +
                    '</div>' +
            '</div>';
    $('body').append(html);
    $("#captcha_img").attr("src", '/CommonBase/GetCaptchaImg?' + Math.random());
}

function afterVerification() {
    var code = $('#code').val();
    if (code == "") {
        alert("请输入图形验证码");
        return;
    }
    $('#verification').remove();
    $(_ctr).unbind("click");
    $.post("/CommonBase/SendCaptcha", { mobile: _m, code: code }, function (data) {
        if (!data.Result) {
            alert(data.Message);
            $(_ctr).bind("click", function () { _send(); });
        } else {
            var i = 120;
            var timer = setInterval(function () {
                i--;
                if (i == 0) {
                    //$("#sendbtn").css("color", "#333");
                    $(_ctr).text("重新发送");
                    $(_ctr).bind("click", function () { _send(); });
                    clearInterval(timer);
                } else {
                    //$("#sendbtn").css("color", "#999");
                    $(_ctr).text(i + "秒后重新获取验证码");
                }
            }, 1000);
        }
    });
}

