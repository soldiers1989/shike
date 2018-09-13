//封装post请求方法
function postdo(url,data,sucessdo,errdo,compdo) {
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
			var strresult = $.parseJSON(data);
			if (strresult.type == 'success') {
				if(sucessdo){
					sucessdo(strresult);
				}else{
					alert(strresult.message);
				}		
			}else{
				 alert(strresult.message);
			}
		},
		error : function(data) {
			if(errdo){
				errdo(data)
			}else{
				alert("error:" + data.responseText);
			}
		},
		complete : function(data) {
			if(compdo){
				compdo(data)
			}
		}
	});	
};

function addcookie(usersession){
	$.cookie("mdtokenid",usersession.tokenId);
	$.cookie("mdname",usersession.name);
	$.cookie("mdphone",usersession.phone);
	$.cookie("mdtype",usersession.type);
};
