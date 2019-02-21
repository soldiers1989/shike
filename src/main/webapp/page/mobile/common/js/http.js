//封装post请求方法
function postdo(url,data,sucessdo,errdo,compdo) {
    // $("#loading").fadeIn();
	var tokenid = $.cookie("mdtokenid");
	$.ajax({
        type: "POST",
        dataType: "html",
        url: url,
        beforeSend: function(request) {
            request.setRequestHeader("tokenid", tokenid);
        },
		data : data,
		success : function(data) {
            $("#loading").fadeOut();
			var strresult = $.parseJSON(data);
			if (strresult.type == 'success') {
				if(sucessdo){
					sucessdo(strresult);
				}else{
                    myAlert(strresult.message);
				}		
			}else{
                myAlert(strresult.message);
			}
		},
		error : function(data) {
			if(errdo){
				errdo(data)
			}else{
				if(data.responseText){
                    myAlert("error:" + data.responseText);
				}
			}
            $("#loading").fadeOut();
		},
		complete : function(data) {
			if(compdo){
				compdo(data)
			}
            $("#loading").fadeOut();
		}
	});	
};

function addcookie(usersession){
	//cookie的作用域
	var path = {path : '/',expires:365}
	$.cookie("mdtokenid",usersession.tokenId,path);
	$.cookie("mdname",usersession.name,path);
	$.cookie("mdphone",usersession.phone,path);
	$.cookie("mdtype",usersession.type,path);
};

function addopenid(openid){
	var path = {path : '/',expires:365}
	$.cookie("mdopenid",openid,path);
};

function removecookie(){
	var path = {path : '/'}
	$.cookie("mdopenid",null,path);
	$.cookie("mdtokenid",null,path);
	$.cookie("mdname",null,path);
	$.cookie("mdphone",null,path);
	$.cookie("mdtype",null,path);
};
