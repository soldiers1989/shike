﻿//通用上传图片方法
function bindUploadImage(div, callback, isMultiple, compressType, checkSize) {
    var file;
    var form = $('<form action="/shike/baobei/addfile.do' + (compressType != null ? "?compressType=" + compressType : "") + '"  method="post"></form>');
    //if (window.attachEvent) {//判断是否是低版本IE
    //万恶的低版本IE如果绑定按钮click事件来触发file的click事件会提示拒绝访问，只能把file控件隐藏在按钮下面
    //    file = $('<input type="file" accept="image/*" id="file" name="file" style="position:absolute;cursor: pointer;left:0;top:0;width: 55px;filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);opacity:0"/>');
    //    file.css({ "width": $(div).width(), "height": $(div).height() });
    //    $(div).css("position", 'relative');
    //    $(div).append(form);
    //} else {
    file = $('<input type="file" accept="image/*;" name="file" style="display:none"/>');
    $(div).bind('click', function () { file.click(); });
    $('body').append(form);
    //}
    $(form).append(file);
    file.bind('change', function () { form.submit(); });
    if (isMultiple) {
        file.attr("multiple", "multiple");
    }
    form.ajaxForm({
        beforeSubmit: function () {
            //if (!window.attachEvent) {
            var check = true;
            $.map(file.get(0).files, function (f) {
                var filepath = f.name;
                var extStart = filepath.lastIndexOf(".");
                var ext = filepath.substring(extStart, filepath.length).toUpperCase();
                if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
                	alert("图片限于bmp,png,gif,jpeg,jpg格式");
                    check = false;
                    return;
                }
                if (f.size > 1024 * 1024) {
                	alert("图片大小不能超过1M");
                    check = false;
                    return;
                }
            });
            return check;
            //}
            //return true;
        },
        success: function (data) {
            file.val("");
            $("#loading").fadeOut();
          
            if (!data.resultData) {
            	alert(d.message);
            } else if (callback != null) {  
            	callback("/shike/"+data.resultData.row); 
            }
        },
        error: function () {
            file.val("");
            $("#loading").fadeOut();
            alert("图片上传失败");
        }
    });
}

