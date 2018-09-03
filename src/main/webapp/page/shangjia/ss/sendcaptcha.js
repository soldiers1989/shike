//通用发送验证码方法
function sendSms(ctr, mobile) {
	var m = $(mobile).val().trim();
    if(checkMobile(m)){
    	afterVerification(ctr,m);
    }
    
}

function checkMobile(mobile) {
	var reg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
    if (reg.test(mobile)) {
    	return true;
    } else {
        alter("手机号不正确");
        return false;
    }
}



function afterVerification(_ctr,mobile) {
	if($(_ctr).text().indexOf("发送")!=-1){
	    $.post("/shike/user/sms.do", { mobile: mobile, type: 2 }, function (data) {
	        if (data.type != "success") {
	            alert(data.Message);
	        } else {
	            var i = 120;
	            var timer = setInterval(function () {
	                i--;
	                if (i == 0) {
	                    $(_ctr).text("重新发送");
	                    $(_ctr).bind("click", function () { _send(); });
	                    clearInterval(timer);
	                } else {
	                    $(_ctr).text(i + "秒后重新获取验证码");
	                }
	            }, 1000);
	        }
	    });
	}

}

