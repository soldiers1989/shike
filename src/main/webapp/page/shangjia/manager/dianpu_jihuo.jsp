<%@page import="com.kensure.mycom.config.service.MyConfigService"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.dianpu.model.SKDianPu"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String shangjiacss = BusiConstant.shangjiacss;
	String name = BusiConstant.name;
	String id = (String)request.getAttribute("id");
	List<SKDianPu> dplist = (List<SKDianPu>)request.getAttribute("dplist");
	
%>
                
<link rel="stylesheet" type="text/css" href="<%=shangjiacss%>/zhanghuanquan.css">

<div class="shangjia_right elg-width">
	
	<div class="clearfix acco_center">
            <div class="modify_mian">
                
            
                <!--modify_top-->
                <div class="modify_bottom">
                    <div class="mod_tv" >
                        <span class="mod_cs">店铺选择：</span>
                        <select id="sktype" style="width:auto;">
                        	<%for(SKDianPu dianpu:dplist){ 
                        		String vid = dianpu.getId()+"";
                        		String temp  = vid.equals(id)?"selected":"";
                        	 	%>
				                <option value="<%=dianpu.getId()%>" "<%=temp%>" ><%=dianpu.getName()%></option>
				            <%} %>
				        </select>  
                    </div>
                   
                   <div class="recharge">
        
        <ul class="cat">
            <li class="act">
                 <span>原价</span> <span class="red" style='text-decoration: line-through'>￥99.0</span> 
                 <span>活动价</span><span class="red"><%=MyConfigService.getMyConfig("dianpu_jihuo").getVal() %></span>
                <i class="iconfont icon-confirm1"></i>
            </li>
        </ul></div>
                    <!--mod_tv-->
                    <div class="mer_pct">
                        <a href="#" onclick="jihuo();">激活</a>
                    </div>
                    <!--mer_pct-->
                </div>
                <!--modify_bottom-->
            </div>
            <!--modify_mian-->
        </div>                
</div>
<script>


function jihuo(){
	if(confirm('确认激活？')){
	   var dpid = $("#sktype option:selected").val();
	   var data = {id:dpid};
	   var url = "<%=ApiUtil.getUrl("/dianpu/jihuo.do")%>";
	   postdo(url, data, savesucdo,null, null);
	 }
}
function savesucdo(data){
	   location.href = "<%=BusiConstant.shangjia_dianpulist.getKey()%>";
}
 

</script>