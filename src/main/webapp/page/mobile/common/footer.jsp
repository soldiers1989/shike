<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shikemobilepath;
%>

<footer class="footer clearfix">
    <div style="height: 58px;">
        <a id="index1" class=" relation" href="<%=BusiConstant.shike_index.getKey() %>">
            <i class="iconfont icon-home"></i>
            <i class="iconfont iconS icon-homeS"></i>
            首页
        </a>
        <a id="haohuo" class=" home" href="<%=BusiConstant.shike_haohuo.getKey() %>">
            <i class="iconfont icon-gift"></i><i class="iconfont iconS icon-giftS"></i>试呗好货
        </a>
        <a class=" daily_task" href="http://m.meilipa.com/Invitation">
            <img src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/zuan.gif" class="zuan" alt="Alternate Text">分享赚钱
        </a>
        <a id="wdhd" class=" myjp" href="<%=BusiConstant.shike_wdhd.getKey() %>">
            <i class="iconfont icon-jpIcon"></i><i class="iconfont iconS icon-jpiconS"></i>我的活动
        </a>
        <a class=" more" href="<%=BusiConstant.shike_mine.getKey() %>">
            <i class="iconfont icon-people"></i><i class="iconfont iconS icon-peopleS"></i>我的
        </a>
    </div>
</footer>

<script>
    function setcheckclass(){
        var pn = window.location.pathname;
        var tag = "";
        if(pn.indexOf('wdhd') != -1){
            tag = "wdhd";
            checkuser();
        }else if(pn.indexOf('index') != -1){
            tag = "index1";
        }else if(pn.indexOf('haohuo') != -1){
            tag = "haohuo";
        }else if(pn.indexOf('mine') != -1){
            tag = "mine";
            checkuser();
        }

        $("#"+tag).addClass("on");
        // $("#"+tag).find("i").addClass("icon-"+tag);
    }
    setcheckclass();

    function checkuser(){
       var mdtype = $.cookie("mdtype");
       if(!mdtype || mdtype != 1){
           window.location.href="<%=BusiConstant.shike_login.getKey()%>";
       }
    }
</script>
