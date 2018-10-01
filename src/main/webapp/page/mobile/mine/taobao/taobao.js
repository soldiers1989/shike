$(function () {
    $("#PayBtnSubmit").click(function () {
        var arrayTB = "";
        if ($(".Validform_wrong").length < 1) {
            $("[name='sk_taobao']").each(function () {
                arrayTB += "≌✿" + $(this).val();
            });
            if (!inputBlur()) {
                return;
            }
            $.post('/CommonBase/ModifyTaobaoSubmit', { taobao: arrayTB, shopType: param }, function (data) {
                if (data.Result) {
                    //var url = returnurl != "" ? returnurl : "/UserAccount/AccountSecurity";
                    var url = location.href;
                    myAlert(data.Message, function () {
                        location.replace(url);
                    });
                    
                } else {
                    myAlert(data.Message);
                    return;
                }
            });
        }
    });

    $("#addTB").click(function () {
        var div = '<section class="clearfix"><input onblur="inputBlur()" style="width: 75%" name="sk_taobao" class="auto-input it lf" type="text" placeholder="请填写' + (param == 0 ? "淘宝" : "京东") + '账号" datatype="*" maxlength="50"/> <img src="./remove.png" onclick="delTb(this) " /></div>  </section>';
        $("#addTB").before(div);
    });
})

function inputBlur() {
    var arr = [];
    $("#form input.auto-input").each(function (index, value) {
        arr.push(value.value);
    });
    var i = 0, length = arr.length;
    var isBreak = false;
    for (i; i < length; i++) {
        var j = 0, length2 = i;
        for (j; j < length2; j++) {
            if (arr[i] && arr[j] && arr[i] == arr[j]) {
                myAlert(arr[j] + "账号重复", function () {
                });
                isBreak = true;
                break;
            }
        }
        if (isBreak) { return false; break; }
    }
    return true;
}
