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
				if(data.responseText){
					alert("error:" + data.responseText);
				}			
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
	//cookie的作用域
	var path = {path : '/'}
	$.cookie("mdtokenid",usersession.tokenId,path);
	$.cookie("mdname",usersession.name,path);
	$.cookie("mdphone",usersession.phone,path);
	$.cookie("mdtype",usersession.type,path);
};

function removecookie(){
	$.cookie("mdtokenid",null,path);
	$.cookie("mdname",null,path);
	$.cookie("mdphone",null,path);
	$.cookie("mdtype",null,path);
};
