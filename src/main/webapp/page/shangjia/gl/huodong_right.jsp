<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">
                

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
</style>
<script language="javascript" type="text/javascript">
    var count=3;
    var size=10;
    var page=1;
    var status=-1;
    var orderType=0;
    var skType = -1;
    
</script>
<div class="clearfix fabushiyong" style="padding-bottom: 0;">
    <div class="shiy_ti">
        <span style="float:none;margin-right:5px;">活动管理</span>
        <input id="key" type="text" placeholder="请输入活动名称" style="width: 200px" class="shou">
        <span style="float:none;">活动类型</span>
        <select id="sktype" onchange="searchCat();" style="width:auto;">
            <option value="-1" selected="selected">全部</option>
                <option value="0">爆款打造/维护</option>
                <option value="1"> 新品提升综合权重</option>
                <option value="2">高客单精准打造爆款</option>
                <option value="3">新人必中</option>
                <option value="4">组团开奖 实时转化</option>
        </select>
        <input onclick="search()" type="button" style="background: url('/Content/images/se.gif') no-repeat scroll -1px center transparent; border: 0px none; cursor: pointer; height: 28px; width: 101px; outline: none; position: relative; margin-left: 0px;">
    </div>
    <div class="shiy_tl">
        <a class="shiy" href="/JPinShopissueBis?status=-1&amp;orderType=0&amp;sk_type=-1">全部<i>|</i></a>
        <a class="" href="/JPinShopissueBis?status=5&amp;orderType=0&amp;sk_type=-1">待支付</a>
        <a class="" href="/JPinShopissueBis?status=0&amp;orderType=0&amp;sk_type=-1">待审核</a>
        <a class="" href="/JPinShopissueBis?status=1&amp;orderType=0&amp;sk_type=-1">进行中</a>
        <a class="" href="/JPinShopissueBis?status=3&amp;orderType=0&amp;sk_type=-1">已结束</a>
        <a class="" href="/JPinShopissueBis?status=2&amp;orderType=0&amp;sk_type=-1">已驳回</a>
    </div>
    <div class="clearfix right_g">
        <div class="right_contant table-style">
         
            <table width="996" cellspacing="0" cellpadding="0" id="listtable">
                <tbody><tr>
                    
                    <td width="270" height="33" valign="middle" bgcolor="#f5f5f5" style="text-align: center;">
                        <strong>活动名称</strong>
                    </td>
                    <td width="176" height="33" valign="middle" bgcolor="#f5f5f5" style="text-align: center;">
                        <strong>开始时间</strong>
                    </td>
                    <td width="150" height="33" valign="middle" bgcolor="#f5f5f5" style="text-align: center;">
                        <strong>活动进度</strong>
                    </td>
                    <td width="200" height="33" valign="middle" bgcolor="#f5f5f5" style="text-align: center;">
                        <strong>活动操作</strong>
                    </td>
                    <td width="200" height="33" valign="middle" bgcolor="#f5f5f5" style="text-align: center;">
                        <strong>用户操作</strong>
                    </td>
                </tr>
                  
                  
            </tbody></table>
        </div>
    </div>
</div>
            </div>



<script>
	function sucdo(data){
		var rows = data.resultData.rows;
		if(rows){		
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var html =   "<tr> "       
                +"<td width=\"270\" height=\"100\" valign=\"middle\">"
                +"<div class=\"xi_lt clearfix\" style=\"margin-right: 0\">"
                +"    <div class=\"cd_lxq cm_cd_lxq\">"
                +"        <a href=\"//jing.meilipa.com/83882.html\" target=\"_blank\" style=\"margin-right: 0\">"
                +"            <span style=\"margin-left: 0px; width: 170px; line-height: 12px;\">" 
                +"                <em class=\"iconfont icon-tb\" style=\"font-weight:500;font-size:15px;\">" 
                +"                </em>"+row.title 
                +"            </span>" 
                +"        </a>" 
                +"        <input style=\"height: 15px; background: transparent; margin: 10px 0;\" type=\"text\" placeholder=\"备注\" class=\"beizhu\" id=\"sk_note_83882\" onblur=\"SetNoet(83882, 7, '') \">" 
                +"    </div>" 
                +" </div>" 
                +"</td>" 
                +"<td height=\"100\" valign=\"middle\" width=\"176\" align=\"center\">" 
                +" <em style=\"color: #a9a9a9;\">"+row.startTimeStr+"</em>" 
                +"</td>" 
                +" <td height=\"100\" valign=\"middle\" align=\"center\" width=\"150\">" 
                +"     <em style=\"color: #f25f55\">"+row.statusStr+"</em>" 
                +"  </td>" 
                +" <td height=\"100\" align=\"center\" width=\"200\">" 
                +"    <div class=\"wae_cer\">" 
                +"        <input type='button' value='审核通过' onclick='tongguo("+row.id+")'"
                +"   </div>" 
                +"</td>" 
                +"<td height=\"100\" align=\"center\" width=\"200\">--</td>" 
                +" </tr>" 
				$("#listtable").append(html);
			}
		}
		
	}

   function dianpulist(){
	   var data = {};
	   var url = "<%=BusiConstant.shangjia_baobeilist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   dianpulist();
   
   function tongguo(id){
	   var data = {id:id};
	   var url = "<%=BusiConstant.ht_baobeitongguo_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
      
</script>