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

    <div style="width: 200px; position: absolute;top: 22px;right: 20px;">
        <h5 style="width:198px;background:#fff;color:#666;font-size:12px;line-height:12px;margin-bottom:10px;">
            <em style="color:#f25f55">&nbsp;■&nbsp;</em>
            商家专属推荐
            <!--<a href="/BisForum/PartnerProduct/" target="_blank" style="color:#999;font-size:12px;font-weight:normal;float:right;margin-right:3px;">更多></a>-->
        </h5>
        <div style="width:200px;" class="clearfix">
                    <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=3002504856&amp;site=qq&amp;menu=yes" onclick="clickNumber(46)" target="_brank"><img src="<%=context%>/91584bb4-9a55-4c46-beed-69032e608538" style="width:200px; height:190px; margin-bottom:10px; border:none; float:left"></a>
                    <a href="http://sms.chaochujue.cn//user/goRegist?orangeKey=BGV3FVA6" onclick="clickNumber(51)" target="_brank"><img src="<%=context%>/fd2f1c38-80a9-4d93-9ece-512633b69e8d" style="width:200px; height:190px; margin-bottom:10px; border:none; float:left"></a>
                    <a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit" onclick="clickNumber(24)" target="_brank"><img src="<%=context%>/1e16eecd-72c0-45ef-a2cb-73f42f26d9e8" style="width:200px; height:190px; margin-bottom:10px; border:none; float:left"></a>

        </div>
    </div>

    <div style="float:left;">
        <!--dept1-->

        <div class="right_top">
            <div class="right_mian clearfix" style="width: 100%; margin:22px 0;">
                <div class="bis_bg_top_left">
                    <div class="bis_bg_user_pic">
                        <img id="imgPic" style="cursor: pointer;width: 86px;height: 86px;border-radius: 86px" src="<%=context%>/shopdefaultavatar.jpg">
                        <a href="javascript:" id="touming" title="上传头像" style="display: none;">上传头像</a>
                    </div>
                    <p class="name" id="loginname"></p>

                </div>
                <div class="bis_bg_top_mid">
                    <p class="type">
                        会员等级：
                            普通商家
                    </p>
                    <p class="clearfix">
                            您还未成为VIP会员哦！
                    </p>

                    <a href="#" class="bis_bg_top_btn" style="margin-top: 12px;margin-right:24px;" target="_blank">会员功能</a>
                    <a href="#" class="bis_bg_top_btn" style="margin-top:12px;background:#ffe8e8;border:1px solid #ff464e;color:#ff464e;box-sizing: border-box;line-height:26px;" id="obtain_freeDraw" target="_blank">
                        试用介绍
                    </a>
                    
                </div>
                <div class="bis_bg_top_vertical_line"></div>
                <div class="bis_bg_top_mid">
                    <p>账户余额：<span style="font-weight:600;font-size:18px;line-height:28px;" id="zhanghuye">0.00</span> 元</p>
                    
                    <div class="clearfix" style="margin-top:12px;">
                        <a class="bis_bg_top_btn" href="#" target="_blank">充 值</a>
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

        <!--dept2-->
        <ul class="bis_bg_btn_box clearfix">
            <li>
                <a href="https://www.meilipa.com/Bis/BoundShopBis" target="_blank"><img src="<%=context%>/bis_bg_btn_icon1.png">绑定店铺<i></i></a>
            </li>
            <li>
                <a href="https://www.meilipa.com/CompareOrder/Index" target="_blank"><img src="<%=context%>/bis_bg_btn_icon2.png">订单比对<i></i></a>
            </li>
            <li>
                <a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit" target="_blank"><img src="<%=context%>/bis_bg_btn_icon2.png">发布活动<i></i></a>
            </li>
            <li>
                <a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit" target="_blank"><img src="<%=context%>/bis_bg_btn_icon4.png">活动报名</a>
            </li>
        </ul>
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

        <div class="right_centr" style="width:982px; padding: 10px 17px 18px 20px">
            <div class="right_centr_top clearfix ">
                <span class="tuija_sy act">人气单品 <em class="tuija_sy_line"></em></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=1&amp;px=1#trygoodstype" target="_blank">女装</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=2&amp;px=1#trygoodstype" target="_blank">男装</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=4&amp;px=1#trygoodstype" target="_blank">鞋包</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=7&amp;px=1#trygoodstype" target="_blank">电器</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=5&amp;px=1#trygoodstype" target="_blank">百货</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=10&amp;px=1#trygoodstype" target="_blank">家居</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=6&amp;px=1#trygoodstype" target="_blank">母婴</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=8&amp;px=1#trygoodstype" target="_blank">美妆</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=9&amp;px=1#trygoodstype" target="_blank">配饰</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=3&amp;px=1#trygoodstype" target="_blank">食品</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=11&amp;px=1#trygoodstype" target="_blank">车品</a></span>

                
                <!--tuija_sy-->
                <div class="qbsy">
                    <a href="https://jing.meilipa.com/" target="_blank">
                        更多推荐
                        <img src="<%=context%>/sy_lsy_qb.jpg" style="margin-left: 5px;">
                    </a>
                </div>
            </div>


            <!--qbsy-->
            <div class="tre_cst">
                <div class="trd_lcq">
                    
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/78921.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/TB2wuIliBnTBKNjSZPfXXbf1XXa_!!1595887680.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tb"></span>
                                    <a href="https://jing.meilipa.com/78921.html" target="_blank">貂绒毛衣女中长款</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">110.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>29304</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/71625.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/TB2kbvAy7yWBuNjy0FpXXassXXa_!!3942835591-0-item_pic.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tm"></span>
                                    <a href="https://jing.meilipa.com/71625.html" target="_blank">夹克男原宿风bf宽松</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">103.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>16071</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/72589.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/TB2n9cZFHSYBuNjSspfXXcZCpXa_!!67978459.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tb"></span>
                                    <a href="https://jing.meilipa.com/72589.html" target="_blank">广西百香果一件30个</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">33.80</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>15556</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/79186.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/O1CN011tfz7h3IrVEhGwL_!!3711085930.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tb"></span>
                                    <a href="https://jing.meilipa.com/79186.html" target="_blank">波士顿女包枕头包2018秋季新款</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">175.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>27238</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/79263.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/TB1VEiGownH8KJjSspcXXb3QFXa_!!0-item_pic.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tm"></span>
                                    <a href="https://jing.meilipa.com/79263.html" target="_blank">5400mAh胖宠暖手宝 </a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">148.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>15404</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/79274.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/TB2vBFEtyMnBKNjSZFCXXX0KFXa_!!398172128.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tm"></span>
                                    <a href="https://jing.meilipa.com/79274.html" target="_blank">55度恒温暖暖杯 少女心爆棚 萌炸啦</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">138.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>25397</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>

                </div>
                <!--trd_lcq-->

            </div>
            <!--tre_cst-->
            <!--qbsy-->
            <div class="tre_cst">
                <div class="trd_lcq">
                </div>
                <!--trd_lcq-->

            </div>
            <!--tre_cst-->
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

    