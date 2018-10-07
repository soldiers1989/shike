<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String typeid = (String)request.getAttribute("typeid");
	String id = (String)request.getAttribute("id");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">

<script src="<%=BusiConstant.context%>/wangEdit/wangEditor.min.js"></script>

<div class="shangjia_right elg-width">
                

<div class="clearfix right_bottom">
   <table id="home_silder_page_edit_table" width="100%">
    	<tr>
    		<td>
    			<input name="id" type="hidden" />
    		</td>
    	</tr>
        <tr>
            <td style="text-align: right;padding-right:20px;">
                标题：
            </td>
            <td>
                <input name="title" id="title" type="text" style="width: 80%" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right;padding-right:20px;">
               链接：
            </td>
            <td>
                <input name="url" id="url" type="text" style="width: 80%" />
                <form id="infoLogoForm2">
                 <input accept="image/*" name="file" id="gzbaobei" type="file" value="图片上传"/>
                 </form>
                
            </td>
        </tr>
          <tr>
            <td style="text-align: right;padding-right:20px;">
               排序：
            </td>
            <td>
                <input name="disorder" id="disorder" value="100" type="text" style="width: 80%" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 80%">
                <div id="home_silder_page_editer_toolbar" class="toolbar"></div>
                <div id="home_silder_page_editer" class="text" style="border: 1px #CCC solid; "></div>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
            </td>
        </tr>
    </table>
</div>

<!--right_bottom-->
            </div>

<script>
	
	$('#home_silder_page_editer').height(window.innerHeight * 0.8);
	var editor = new window.wangEditor('#home_silder_page_editer_toolbar', '#home_silder_page_editer');
	editor.customConfig.uploadImgServer = "<%=ApiUtil.getUrl("/baobei/addfiles.do")%>";
	editor.create();
	
	var cid = <%=id%>;


	function sucdo(data){
		var row = data.resultData.row;
		if(row){
			editor.txt.html(row.content);
			$("#title").val(row.title);
			$("#disorder").val(row.disorder);
			$("#url").val(row.url);
		}
		
	}

   function getc(){
	   var data = {id:cid};
	   var url = "<%=BusiConstant.sys_getcms_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   if(cid){
	   getc();
   }
   
   var uploading1 = false;
   $("#gzbaobei").on("change", function(){
       if(uploading1){
           alert("文件正在上传中，请稍候");
           return false;
       }
       $.ajax({
           url: "<%=BusiConstant.shike_addfile_do.getKey()%>",
           type: 'POST',
           cache: false,
           data: new FormData($('#infoLogoForm2')[0]),
           processData: false,
           contentType: false,
           dataType:"json",
           beforeSend: function(){
           	uploading1 = true;
           },
           success : function(data) {
               if (data.type == 'success') {
               	var d = "<%=BusiConstant.context%>"+data.resultData.row
               	$("#url").val( d );
               } else {
                   alert(data.msg);
               }
               uploading1 = false;
           }
       });
   });
   
   function save(){
	   var content = editor.txt.html();
	   var data = {id:cid,typeid:<%=typeid%>,title:$("#title").val(),disorder:$("#disorder").val(),url:$("#url").val(),content:content};
	   var url = "<%=BusiConstant.sys_savecms_do.getKey()%>";
	   postdo(url, data, savesucod,null, null);
   }
   
   function savesucod(data){
	   location.href = "<%=BusiConstant.shangjia_cms.getKey()%>?typeid=<%=typeid%>";
   }

</script>