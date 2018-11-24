<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/base.css" rel="stylesheet">
<link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/index(1).css" rel="stylesheet">
<link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/pagination.css" rel="stylesheet">
<link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/guide.css" rel="stylesheet">
<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/jquery-1.8.3.js"></script>
<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/jquery.pagination.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context %>/common/http.js?ver=<%=BusiConstant.version%>"></script>
<style>
    body{min-height: 1000px;}
</style>
    <input id="id" type="hidden" value="${id}">
</head><body marginwidth="0" marginheight="0"><div class="detail_nv">
    <a class="set">宝贝介绍</a>
    <%--<a href="https://test.com/Home/ApplyFlow?id=108900">新手流程</a><span></span>--%>
</div>
<!--detail_nv-->
<div class="clearfix deta_main">
    <div id="usual1_2">
        <div class="sq_sm">
    <div class="tryout">
        <%--<h3> 宝贝介绍：</h3>--%>
        <span>
            <%--<img class="desc_anchor" id="desc-module-1" src="<%=BusiConstant.shikewebepath %>/haohuo/detail/spaceball.gif">--%>
            <p id="deatilpic">

            </p>
        </span>
    </div>
        </div>

    </div>
</div>

<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/detailpic.js"></script>

</body></html>
