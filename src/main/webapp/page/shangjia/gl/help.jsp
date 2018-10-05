<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.sys.model.SKCMS"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	SKCMS obj = (SKCMS)request.getAttribute("obj");
	List<SKCMS> sj = (List<SKCMS>)request.getAttribute("sj");
	List<SKCMS> sk = (List<SKCMS>)request.getAttribute("sk");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="contant">

    <!--help_header-->
    <div class="clearfix main">
        
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shangjiacss%>/base1.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shangjiacss%>/help.css">

<div class="mian_left clearfix">
    <div class="mi_ler">
        <a id="id2" href="javascript:void(0)" class="<%=obj.getTypeid()==2?"seled":""%>" onclick="check(2)" >用户中心</a>
        <a id="id1" class="<%=obj.getTypeid()==1?"seled":""%>" href="javascript:void(0)" onclick="check(1)" style="border-left: 1px solid #dcdcdc;">商家中心</a>
    </div>
    
    <div class="left_ree" id="list1" style="<%=obj.getTypeid()==1?"":"display:none;"%>">
        <ul>
        <%for(SKCMS s:sj) {%>
            <li><a href="<%=BusiConstant.context%>/help/<%=s.getId()%>" <%=s.getId().longValue()==obj.getId().longValue()?"class='rtf'":""%>><%=s.getTitle() %></a></li>
         <%} %>
        </ul>
    </div>
    
    <div class="left_ree" id="list2" style="<%=obj.getTypeid()==2?"":"display:none;"%>">
        <ul>
        <%for(SKCMS s:sk) {%>
            <li><a href="<%=BusiConstant.context%>/help/<%=s.getId()%>" <%=s.getId().longValue()==obj.getId().longValue()?"class='rtf'":""%>><%=s.getTitle() %></a></li>
         <%} %>
        </ul>
    </div>
   
</div>

        <!--mian_left-->
        <div class="mian_right">
            <div class="clearfix zhu_ces" id="contentid">
                <div class="rh_z">
                    <%=obj.getTitle() %>
                </div>
             	<%=obj.getContent() %>
            </div>
            <!--zhu_ces-->
        </div>
        <!--mian_right-->
    </div>
    <!--main-->
</div>


<script>
	
function check(index){
	$("#id1").removeClass("seled");
	$("#id2").removeClass("seled");
	$("#id"+index).addClass("seled");
	$("#list1").css("display","none");
	$("#list2").css("display","none");
	$("#list"+index).css("display","block");
}


   
</script>