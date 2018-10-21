/*
* 该js为 图片存qiniu
* */

//通用上传图片方法
function bindUploadImage(div, callback, isMultiple, compressType, checkSize) {
    var file;
    var form = $('<form action="/shike/baobei/addfile.do' + '"  method="post"></form>');
    file = $('<input id="'+div+'" type="file" accept="image/*;" name="file" style="display:none"/>');
    $(div).bind('click', function () { file.click();});
    $('body').append(form);
    $(form).append(file);
    file.bind('change', function () {
        // form.submit();
        UpladFile(div, callback);
    });
    if (isMultiple) {
        file.attr("multiple", "multiple");
    }
}

/*
        三个参数
        file：一个是文件(类型是图片格式)，
        w：一个是文件压缩的后宽度，宽度越小，字节越小
        objDiv：一个是容器或者回调函数
        photoCompress()
         */
function photoCompress(file,w,objDiv){
    var ready=new FileReader();
    /*开始读取指定的Blob对象或File对象中的内容. 当读取操作完成时,readyState属性的值会成为DONE,如果设置了onloadend事件处理程序,则调用之.同时,result属性中将包含一个data: URL格式的字符串以表示所读取文件的内容.*/
    ready.readAsDataURL(file);
    ready.onload=function(){
        var re=this.result;
        canvasDataURL(re,w,objDiv)
    }
}
function canvasDataURL(path, obj, callback){
    var img = new Image();
    img.src = path;
    img.onload = function(){
        var that = this;
        // 默认按比例压缩
        var w = that.width,
            h = that.height,
            scale = w / h;
        w = obj.width || w;
        h = obj.height || (w / scale);
        var quality = 0.7;  // 默认图片质量为0.7
        //生成canvas
        var canvas = document.createElement('canvas');
        var ctx = canvas.getContext('2d');
        // 创建属性节点
        var anw = document.createAttribute("width");
        anw.nodeValue = w;
        var anh = document.createAttribute("height");
        anh.nodeValue = h;
        canvas.setAttributeNode(anw);
        canvas.setAttributeNode(anh);
        ctx.drawImage(that, 0, 0, w, h);
        // 图像质量
        if(obj.quality && obj.quality <= 1 && obj.quality > 0){
            quality = obj.quality;
        }
        // quality值越小，所绘制出的图像越模糊
        var base64 = canvas.toDataURL('image/jpeg', quality);
        // 回调函数返回base64的值
        callback(base64);
    }
}
/**
 * 将以base64的图片url数据转换为Blob
 * @param urlData
 *            用url方式表示的base64图片数据
 */
function convertBase64UrlToBlob(urlData){
    var arr = urlData.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while(n--){
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new Blob([u8arr], {type:mime});
}

//上传文件方法
function UpladFile(id, callBackTo) {
    $("#loading").fadeIn();
    var fileObj = document.getElementById(id).files[0]; // js 获取文件对象
    var fileName = fileObj.name;

    var url = "/shike/qiniu/token.do";

    if(fileObj.size/500 > 1025) { //大于500k，进行压缩上传
        photoCompress(fileObj, {
            quality: 0.2
        }, function(base64Codes){
            var bl = convertBase64UrlToBlob(base64Codes);

            postdo(url, {}, function (data) {
                uploadToQiniu(data.resultData.row, bl,  fileName, callBackTo);
            },null, null);
        });
    }else{ //小于等于500k 原图上传

        postdo(url, {}, function (data) {
            uploadToQiniu(data.resultData.row, fileObj, fileName, callBackTo);
        },null, null);
    }
}

// upload to qiniu
function uploadToQiniu(token, picFile, fileName, callback) {

    var key = guid() + ".jpg";
    // var key = new Date().getTime() + "_" + fileName;

    var putExtra = {
        fname: "",
        params: {},
        mimeType: [] || null
    };
    var config = {
        useCdnDomain: false,
        region: null
    };

    var observer = {
        next(res){
        },
        error(err){
            myAlert("上传失败！");
            $("#loading").fadeOut();
        },
        complete(res){
            // callback($("#qiniu").val() + key)
            callback("http://pgp5wv0s2.bkt.clouddn.com/" + key)
            $("#loading").fadeOut();
        }
    }

    var observable = qiniu.upload(picFile, key, token, putExtra, config)

    var subscription = observable.subscribe(observer) // 上传开始
}

//用于生成uuid
function S4() {
    return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
}
function guid() {
    var guid = (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
    return guid.replace(/-/g,"");
}