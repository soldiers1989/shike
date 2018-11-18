<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String id = (String)request.getAttribute("id");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<style>
    .tc-em em {
        display: inline-block;
        width: 80px;
        text-align: right;
    }

        .tc-em em#input-num-all {
            display: inline;
        }

    .tc-em p {
        display: inline-block;
        width: 130px;
        text-align: left;
    }

    .payList {
        width: 580px;
        margin: 0 auto;
    }

        .payList td, .payList th {
            border-bottom: 1px solid #dedede;
            padding: 8px 0;
            line-height: 21px;
            font-size: 14px;
        }

        .payList table {
            width: 100%;
        }

            .payList table tr td, .payList table tr th {
                width: 50%;
            }

                .payList table tr td:first-child, .payList .tl {
                    text-align: left !important;
                    width: 25%;
                }

                .payList table tr td:last-child, .payList .tr {
                    text-align: right !important;
                    width: 25%;
                }

    .tc {
        text-align: center;
    }

    .payList b {
        color: #ff464e;
    }

    .payList .input {
        text-align: center;
    }

        .payList .input * {
            display: inline-block;
            vertical-align: middle;
            margin-top: 20px;
        }

        .payList .input input {
            width: 300px;
            height: 28px;
            border: 1px solid #ddd;
            outline: none;
            text-indent: 1em;
        }

            .payList .input input:focus {
                border: 1px solid #ff464e;
                box-shadow: 0 0 5px #ff464e;
            }

    .payList span.blue {
        color: #0094ff;
        cursor: pointer;
    }
    .wez{
     	font-size:20px;
     	 color: #0094ff;
    }
    .pics{
     	font-size:20px;
     	 color: #0094ff;
    }
    .pics img{
     	width:300px;
    }
    .pics li{
    	width:310px;
    	float:left;
    	margin-right:10px;
     	 border: 1px solid #ff464e;
    }
     
  
   
    .table-style table tr {
    margin-bottom: 2px;
    border: 1px solid #e8e8e8;
    background: #f9f9f9;
    display: block;
	}

</style>

<div class="clearfix glhoutai" style="padding-bottom: 0;">
   
    <div class="clearfix right_g" style="display: none">
        <div class="right_contant table-style">
        	<div id="zt"  class="wez">
         	
            </div>
         	<div id="headtable" class="pics">
         	
            </div>
         
        </div>
     
    </div>

    <div class="right_contant table-style">
        <p id="currStatus"></p>
        <table cellspacing="0" style="table-layout:fixed;font-size: large; color: black" cellpadding="2">
            <thead>

            <tr class="trhead">
                <td width="200"><strong>状态</strong></td>
                <td width="400"><strong>创建时间</strong></td>
                <td width="700"><strong>查看</strong></td>
            </tr>
            </thead>
            <tbody>
            <tr id="dpm" style="display: none">
                <td width="200">申请完成</td>
                <td width="400" id="dpmDate"></td>
                <td width="700" id="dpmContent"></td>
            </tr>
            <tr id="sc" style="display: none">
                <td width="200">收藏完成</td>
                <td width="400" id="scDate"></td>
                <td width="700" id="scContent"></td>
            </tr>
            <tr id="gz" style="display: none">
                <td width="200">关注完成</td>
                <td width="400" id="gzDate"></td>
                <td width="700" id="gzContent"></td>
            </tr>
            <tr id="ddh" style="display: none">
                <td width="200">订单号</td>
                <td width="400" id="ddhDate"></td>
                <td width="700" id="ddhContent"></td>
            </tr>
            <tr id="dd" style="display: none">
                <td width="200">订单图</td>
                <td width="400" id="ddDate"></td>
                <td width="700" id="ddContent"></td>
            </tr>
            <tr id="hpy" style="display: none">
                <td width="200">评价语</td>
                <td width="400" id="hpyDate"></td>
                <td width="700" id="hpyContent"></td>
            </tr>
            <tr id="hp" style="display: none">
                <td width="200">评价图</td>
                <td width="400" id="hpDate"></td>
                <td width="700" id="hpContent"></td>
            </tr>
            </tbody>
        </table>

    </div>

</div>
            </div>



<script>

    function sucdo(data) {
        var row = data.resultData.row;

        $("#currStatus").html("当前状态:    " + '<font style="font-size: large; color: red">'+ row.statusStr +'</font>');

        for (var i = 0; i < row.jylist.length; i++) {
            var jy = row.jylist[i];

            // 加购物车
            if (jy.busitype == 'dpm') {
                $("#dpm").show();
                $("#dpmDate").html(jy.createdTimeStr)
                $("#dpmContent").html(jy.content)
            }

            // 收藏
            if (jy.busitype == 'sc') {
                $("#sc").show();
                $("#scDate").html(jy.createdTimeStr)
                var sc = "<a href='" + jy.content + "' target='_blank'><img style='height: 150px' src='" + jy.content + "'></a>";
                $("#scContent").html(sc)
            }

            // 收藏
            if (jy.busitype == 'gz') {
                $("#gz").show();
                $("#gzDate").html(jy.createdTimeStr)
                var gz = "<a href='" + jy.content + "' target='_blank'><img style='height: 150px' src='" + jy.content + "'></a>";
                $("#gzContent").html(gz)
            }

            // 下单图
            if (jy.busitype == 'dd') {
                $("#dd").show();
                $("#ddDate").html(jy.createdTimeStr)
                var dd = "<a href='" + jy.content + "' target='_blank'><img style='height: 150px' src='" + jy.content + "'></a>";
                $("#ddContent").append(dd)
            }
            // 下单号
            if (jy.busitype == 'ddh') {
                $("#ddh").show();
                $("#ddhDate").html(jy.createdTimeStr)
                var ddh = jy.content;
                $("#ddhContent").append(ddh)
            }

            // 好评语
            if (jy.busitype == 'hpy') {
                $("#hpy").show();
                $("#hpyDate").html(jy.createdTimeStr)
                var hpy = jy.content;
                $("#hpyContent").html(hpy)
            }

            // 好评图
            if (jy.busitype == 'hp') {
                $("#hp").show();
                $("#hpDate").html(jy.createdTimeStr)
                var hp = "<a href='" + jy.content + "' target='_blank'><img style='height: 150px' src='" + jy.content + "'></a>";
                $("#hpContent").html(hp)
            }


        }
    }
	
	// function sucdo(data){
	// 	var row = data.resultData.row;
	// 	var html = "<ul>";
	// 	html += "<li>当前状态"+row.statusStr+"</li>";
	// 	 html += "</ul>";
	// 	$("#zt").append(html);
	//
	// 	html = "<ul>";
	// 	var jys = row.jylist;
	// 	var jymap = {};
	// 	for(var j=0;jys && j<jys.length;j++){
	// 		var jy = jys[j];
	// 		var key = jy.status+"-"+jy.typeid+"-"+jy.busitype;
	// 		jymap[key] = jy;
	// 	}
	// 	var sc213 = "";
	// 	if(jymap["21-3-gz"]){
	// 		sc213 =  jymap["21-3-sc"].content
	// 	}
	// 	html += "<li>收藏图:<br><img src='"+sc213 +"'></li>";
	//
	// 	var gz213 = "";
	// 	if(jymap["21-3-gz"]){
	// 		gz213 =  jymap["21-3-gz"].content
	// 	}
	// 	html += "<li>关注图:<br><img src='"+gz213 +"'></li>";
	//
	// 	var ddh612 = "";
	// 	if(jymap["61-2-ddh"]){
	// 		ddh612 =  jymap["61-2-ddh"].content
	// 	}
	//
	// 	var dd613 = "";
	// 	if(jymap["61-3-dd"]){
	// 		dd613 =  jymap["61-3-dd"].content
	// 	}
	// 	html += "<li>订单号："+ddh612+"<br>订单图:<br><img src='"+dd613 +"'></li>";
	//
	// 	var hpy812 = "";
	// 	if(jymap["81-2-hpy"]){
	// 		hpy812 =  jymap["81-2-hpy"].content
	// 	}
	//
	// 	var hp813 = "";
	// 	if(jymap["81-3-hp"]){
	// 		hp813 =  jymap["81-3-hp"].content
	// 	}
	// 	html += "<li>好评语:"+hpy812+"<br>好评图:<br><img src='"+hp813 +"'></li>";
	// 	 html += "</ul>";
	// 	$("#headtable").append(html);
	// }

	
   function xiangqing(){
	   var data = {id:<%=id%>};
	   var url = "<%=ApiUtil.getUrl("/skqk/getdetail.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   xiangqing();
   
      
</script>