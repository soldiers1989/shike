<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>



 
        <div class="shangjia_right elg-width">
                
<style>
    .shangjia_left {
        border: none !important;
    }
</style>
<script type="text/javascript" src="<%=context%>/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=context%>/Common.js"></script>
<script type="text/javascript" src="<%=context%>/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=context%>/jquery.form.js"></script>

<link rel="stylesheet" type="text/css" href="<%=context%>/jquery.fancybox.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/pagination.css">

<script src="<%=context%>/ZeroClipboard.js" type="text/javascript"> </script>
<script src="<%=context%>/bisindex.js"></script>
<link href="<%=context%>/layer(1).css" rel="stylesheet">
<script src="<%=context%>/layer.js"></script>
<script type="text/javascript">
   
</script>
<style>
    .shangjia_right {
        /*background: #f4f5f9;
        padding: 0;
        width: 1040px;
            */
        width: 1043px;
        padding: 22px 0 0 0;
        position: relative;
    }
</style>




<div class="clearfix">



    <div style="float:left;">
        <!--dept1-->

        <div class="right_top">
            <div class="right_mian clearfix" style="width: 100%; margin:22px 0;">
                <div class="bis_bg_top_left">
                    <div class="bis_bg_user_pic">
                        <img id="imgPic" style="cursor: pointer;width: 86px;height: 86px;border-radius: 86px" src="//wwc.alicdn.com/avatar/getAvatar.do?userId=644834856&width=160&height=160&type=sns">
                        <a href="javascript:" id="touming" title="上传头像" style="display: none;">上传头像</a>
                    </div>
                    <p class="name" id="loginname"></p>

                </div>
                <div class="bis_bg_top_mid">
                    <p class="type">
                        		会员等级：
                           		 普通会员
                    </p>
                    <p class="clearfix">
                           		 您还未成为黄金会员哦！
                    </p>

                    <a href="#" class="bis_bg_top_btn" style="margin-top: 12px;margin-right:24px;" target="_blank">会员功能</a>
               
                    
                </div>
                <div class="bis_bg_top_vertical_line"></div>
                <div class="bis_bg_top_mid">
                    <p>账户余额：<span style="font-weight:600;font-size:18px;line-height:28px;" id="zhanghuye">0.00</span> 元</p>
                    
                    <div class="clearfix" style="margin-top:12px;">
                        <a class="bis_bg_top_btn" href="<%=BusiConstant.shangjia_chongzhi.getKey() %>" target="_blank">充 值</a>
                        <a class="bis_bg_top_btn2" href="#" target="_blank">账户明细</a>
                        <i style="float: left; color: #666;line-height: 28px;">|</i>
                        <a class="bis_bg_top_btn2" href="javascript:" >提现</a>
                    </div>
                </div>
            </div>
        </div>


        <!--dept3-->
        <div class="bis_bg_data_show">
            

            <div class="clearfix">
                
                <ul class="clearfix">
                    <li>
                        <a href="https://www.meilipa.com/JPinShopissueBis?status=5" target="_blank" class="bis_bg_top_btn3">
                            待支付：<em>0</em><i></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.meilipa.com/JPinShopissueBis?status=1" target="_blank" class="bis_bg_top_btn3" style="margin-left: -1px;width: 267px;">
                            <i style="float:left"></i>进行中：<em>0</em><i></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.meilipa.com/JPinShopissueBis?status=4" target="_blank" class="bis_bg_top_btn3" style="margin-left:-1px;width:267px;">
                            <i style="float:left"></i>已完成：<em>0</em>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

  
        <!--dept4-->
        <div class="mc-notice clearfix">
            <div class="mc-notice-left">
                <span class="mc-notice-header">商家公告</span>
                <div class="shangjia_ggleft">
                    <ul>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/help/BusinessRules" target="_blank" title="美丽啪商家服务协议">
                                    <div style="float:left;width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 美丽啪商家服务协议
                                    </div>
                                    <em style="float:right;color:#999999;">2018-07-21</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=42" target="_blank" title="商家维护通知">
                                    <div style="float:left;width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 商家维护通知
                                            <em class="iconfont icon-hot" style="font-size:15px;color:#ff464e;"></em>
                                    </div>
                                    <em style="float:right;color:#999999;">2018-07-10</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=25" target="_blank" title="解/换绑店铺规则">
                                    <div style="float:left;width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 解/换绑店铺规则
                                    </div>
                                    <em style="float:right;color:#999999;">2018-07-07</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/help/userRules2" target="_blank" title="美丽啪用户处罚规则">
                                    <div style="float:left;width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 美丽啪用户处罚规则
                                            <em class="iconfont icon-hot" style="font-size:15px;color:#ff464e;"></em>
                                    </div>
                                    <em style="float:right;color:#999999;">2018-07-07</em>
                                </a>

                            </li>
                    </ul>
                </div>
            </div>
            <div class="mc-notice-right">
                <span class="mc-notice-header">店铺运营技巧和分析</span>
                <div class="shangjia_ggleft">
                    <ul>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=28" target="_blank" title="淘宝100问必读">
                                    <div style="float:left; width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 淘宝100问必读
                                    </div>
                                    <em style="float:right;color:#999999;">2018-05-14</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=30" target="_blank" title="店铺降权了怎么办？">
                                    <div style="float:left; width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 店铺降权了怎么办？
                                            <em class="iconfont icon-hot" style="font-size:15px;color:#ff464e;"></em>
                                    </div>
                                    <em style="float:right;color:#999999;">2018-05-14</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=29" target="_blank" title="如何获取手淘首页流量？">
                                    <div style="float:left; width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 如何获取手淘首页流量？
                                    </div>
                                    <em style="float:right;color:#999999;">2018-03-10</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=32" target="_blank" title="【问答】淘宝运营问答">
                                    <div style="float:left; width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 【问答】淘宝运营问答
                                            <em class="iconfont icon-hot" style="font-size:15px;color:#ff464e;"></em>
                                    </div>
                                    <em style="float:right;color:#999999;">2018-03-10</em>
                                </a>

                            </li>
                    </ul>
                </div>
            </div>

        </div>

    </div>
</div>

<script>
$("#loginname").html($.cookie("mdname"));
function sucdo(data){
	var row = data.resultData.row;
	if(row && row.yue){
		$("#zhanghuye").html(row.yue);
	}	
}
function zhanghuye(){
   var data = {};
   var url = "<%=BusiConstant.userzhyue_do.getKey()%>";
   postdo(url, data, sucdo,null, null);
}
zhanghuye();
</script>


            </div>

    