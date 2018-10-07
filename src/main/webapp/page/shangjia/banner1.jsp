<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>

<div id="SuperSlide" class="SuperSlide" style="display: block;width: 1190px; height: 90px; margin: 20px auto;overflow: hidden;">
        <div class="bd">
            <ul id="bnid">
                   
                   
            </ul>
        </div>
        <a class="superprev" href="javascript:void(0)"><i></i></a>
        <a class="supernext" href="javascript:void(0)"><i></i></a>
    </div>
    
  <script>
   function bannersucdo(data){
		var rows = data.resultData.rows;
		if(rows){		
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var html  = "<li style='display: list-item;'>";
				html +="<a href='<%=BusiConstant.shike_cms.getKey()%>/"+row.id+"' target='_blank' style='transition: transform 3s linear; transform: scaleX(1.1) scaleY(1.1);'>";
				html +="   <img src='"+row.url+"' style='width: 1190px; height: 90px;'>";
				html +="</a></li>";
				
				$("#bnid").append(html);
			}
		}
	}

  function bannerlist(){
	   var data = {typeid:5};
	   var url = "<%=BusiConstant.sys_cmslist_do.getKey()%>";
	   postdo(url, data, bannersucdo,null, null);
  }
  bannerlist();
   </script>