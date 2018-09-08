<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">


<div class="fine">
    <form action="/JPinShopissueBis/AddOrEditSubmit" id="form" method="post">

        <div class="onepage">
            <h2 class="title">发布免费试用</h2>
            <div class="slide-item">
                <div class="l-title">
                    <span>1</span>设置活动类型
                    <em class="open-slide">修改</em> <i class="iconfont icon-zhengque"></i>
                </div>

                <div class="item" style="padding-top: 30px;">
                    <span class="label vt"><span>*</span>平台类型：</span>
                    <div class="item-con">
                        <input style="" type="radio" name="ptlei" id="ptlei1" value="0" checked="'ckecked'"><label for="ptlei1">天猫淘宝</label>
                    </div>
                </div>

                <div class="item">

                    <span class="label vt"><span>*</span>活动类型：</span>
                </div>
                <input type="hidden" name="sk_type" id="sk_type" value="0">
                <dl class="jp-watch">
                    <dt class="act" data-type="0">爆款打造/维护<i class="iconfont icon-gou"></i></dt>
                    <dt class="lst" data-type="1">新品提升<br>综合权重<i class="iconfont icon-gou rt26"></i></dt>
                    <dt class="lst" data-type="4">
                        组团开奖<i class="iconfont icon-gou rt26"></i>
                        <br>实时转化
                    </dt>
                    <dt class="lst" data-type="2">
                        高客单精准打造爆款
                        <br>（全面优化店铺权重）<i class="iconfont icon-gou rt20"></i>
                    </dt>

                    <dt data-type="3">新人必中<i class="iconfont icon-gou rt50"></i></dt>
                    <dd class="act">
                        <h4><i class="iconfont icon-select"></i>快速提升关键词排名/加购率/多天回访率/全维度UV价值</h4>
                        <ul>
                            <li class="ddfirst">
                                <p class="gray">适合店铺类型：</p>
                                <p>有一定销量/流量的店铺</p>
                                <p>店铺人群标签混乱</p>
                                <p>日常宝贝转化率低于行业均值</p>
                                <p>排名不稳定</p>
                                <div>适合店铺类型：<br><span style="color:#333;">任何京东店铺</span></div>
                            </li>
                            <li class="red">
                                <p>效果建议投放单期总份数：</p>
                                <p>小于50元客单（0-50元）≥<em class="alt-num">30</em>份</p>
                                <p>50-100元客单≥<em class="alt-num">25</em>份</p>
                                <p>100-300元客单≥<em class="alt-num">20</em>份</p>
                                <p>高于300元客单≥<em class="alt-num">15</em>份</p>
                                <p></p>
                            </li>
                            <li>
                                <p>提升权重建议：</p>
                                <p>建议不低于2期，每期5-10天，数据统计95%成功案例连续投放<em>4-6</em>周期完成爆款的打造和稳定</p>
                            </li>
                        </ul>
                        <div>任务开奖时间：每日<em>10点，21点</em>开奖。</div>
                        <div>
                            买家申请流程：
                            <span>
                                根据商家活动类型的不同，买家分1~6天申请。完成浏览、加购、收藏/关注店铺 宝贝、深度访问、<label id="ptText8">货比多家、浏览副宝贝、手淘问大家.</label>等操作后，才可获得购买资格。
                                <br>快速稳定优化商品权重。
                            </span>
                        </div>
                    </dd>
                    <dd>
                        <h4><i class="iconfont icon-select"></i>快速提升关键词排名/加购率/转化率/快速聚集人气/宝贝流量</h4>
                        <ul>
                            <li>
                                <p class="gray">适合店铺类型：</p>
                                <p>销量偏低</p>
                                <p>店铺宝贝销评破零</p>
                                <p>综合数据低于同行</p>
                                <p>排名增长缓慢</p>
                            </li>
                            <li class="red">
                                <p>效果建议投放单期总份数：</p>
                                <p>小于50元客单（0-50元）≥<em class="alt-num">25</em>份</p>
                                <p>50-100元客单≥<em class="alt-num">20</em>份</p>
                                <p>100-300元客单≥<em class="alt-num">15</em>份</p>
                                <p>高于300元客单≥<em class="alt-num">10</em>份</p>
                                <p></p>
                            </li>
                            <li>
                                <p>提升权重建议：</p>
                                <p>建议不低于3期，每期5-10天，数据统计95%成功案例连续投放<em>4-7</em>周期完成新品的综合数据和权重的提升</p>
                            </li>
                        </ul>
                        <div>任务开奖时间：每日<em>10点，21点</em>开奖。</div>
                        <div>
                            买家申请流程：
                            <span>
                                根据商家活动类型的不同，买家分1~6天申请。完成浏览、加购、收藏店铺 宝贝、深度访问、货比多家、浏览副宝贝、手淘问大家.等操作后，才可获得购买资格。
                                <br> 快速稳定优化商品权重。
                            </span>
                        </div>
                    </dd>

                    <dd>
                        <h4><i class="iconfont icon-select"></i>快速提升关键词排名/加购率/转化率/快速聚集人气/宝贝流量</h4>
                        <ul>
                            <li>
                                <p class="gray">适合店铺类型：</p>
                                <p>无基础销量</p>
                                <p>宝贝流量较少</p>
                                <p>店铺宝贝评价破零</p>
                                <p>宝贝评价优化</p>
                            </li>
                            <li class="red">
                                <p>效果建议投放单期总份数：</p>
                                <p>小于50元客单（0-50元）≥<em class="alt-num">25</em>份</p>
                                <p>50-100元客单≥<em class="alt-num">20</em>份</p>
                                <p>100-300元客单≥<em class="alt-num">15</em>份</p>
                                <p>高于300元客单≥<em class="alt-num">10</em>份</p>
                                <p></p>
                            </li>
                            <li>
                                <p>提升权重建议：</p>
                                <p>建议不低于3期，每期5-10天，数据统计95%成功案例连续投放<em>4-7</em>周期完成新品的综合数据和权重的提升</p>
                            </li>
                        </ul>
                        <div>任务开奖时间：达到<em>成团人数</em>即开奖。</div>
                        <div>
                            买家申请流程：
                            <span>
                                根据商家活动类型的不同，买家分1~6天申请。完成浏览、加购、收藏店铺 宝贝、深度访问<label id="ptText9">、货比多家、浏览副宝贝、手淘问大家.</label>等操作后，才可获得购买资格。
                                <br> 快速稳定优化商品权重。
                            </span>
                        </div>
                    </dd>
                    <dd>
                        <h4 class="mb30">
                            <i class="iconfont icon-select"></i>
                            <span style="display: inline-block;width: 540px;vertical-align: top;">
                                延长抽奖周期至3天或5天，吸引更多买家申请更有助于提升收藏、加购、重复访问等
                                <br>店铺和商品基础权重快速提升商品排名，打开无线端展现
                            </span>
                        </h4>
                        <ul>
                            <li>
                                <p class="gray">适合店铺类型：</p>
                                <p>新老店均可，售价高于100元</p>
                                <p>手淘自然排名较低</p>
                                <p>直通车投入产出比较差</p>
                                <p>转化率过低，影响产品利润</p>
                            </li>
                            <li class="red">
                                <p>效果建议投放单期总份数：</p>
                                <p>100-300元客单≥<em class="alt-num">8</em>份</p>
                                <p>高于300元客单≥<em class="alt-num">5</em>份</p>
                                <p></p>
                            </li>
                            <li>
                                <p>提升权重建议：</p>
                                <p>建议不低于2期，每期5-10天，数据统计98%成功案例连续投放<em>3-5</em>周期完成高客单宝贝爆款的打造和稳定</p>
                            </li>
                        </ul>
                        <div>任务开奖时间：每日<em>10点，21点</em>开奖。</div>
                        <div>
                            买家申请流程：
                            <span>
                                买家申请活动需多天进店，完成浏览、加购、收藏店铺 宝贝、深度访问、货比多家、浏览副宝贝、手淘问大家等操作后，才可获得购买资格
                            </span>
                        </div>
                    </dd>

                    <dd>
                        <h4><i class="iconfont icon-select"></i>快速提升关键词排名/加购率/多天回访率/全维度UV价值</h4>
                        <ul>
                            <li>
                                <p class="gray">适合店铺类型：</p>
                                <p>需要更多销量链接</p>
                                <p>需要更快收货评价</p>
                                <p>需要提高转化率</p>
                                <p>需要增加真实买家购买信心</p>
                            </li>
                            <li class="red" style="width: 220px;">
                                <p>最低份数：</p>
                                <p>总货值不低于2000元</p>
                                <p>（客单价*份数=总货值）</p>
                                <p></p>
                            </li>
                            <li style="width:405px;">
                                <p>活动介绍及效果：</p>
                                <p>
                                    1、新人专享活动，冲销量，快速提排名
                                    <br>
                                    2、平台筛选匹配产品的精准用户下单，帮助提升标签权重
                                    <br>
                                    3、平台根据天平系统帮助商家控制每日下单量，提升销量权重
                                    <br>
                                    4、平台帮助商家安排不同活动流程，提升UV链条权重
                                    <br>
                                </p>
                            </li>
                        </ul>
                        <div>任务开奖时间：每日<em>10点，21点</em>开奖。</div>
                        <div>
                            买家申请流程：
                            <span>
                                根据商家活动类型的不同，买家分1~6天申请。完成浏览、加购、收藏店铺 宝贝、深度访问、货比多家、浏览副宝贝、手淘问大家.等操作后，才可获得购买资格。 用户申请必中，申请人数达总份额后会自动从平台下架
                                <br>快速稳定优化商品权重。
                            </span>
                        </div>
                    </dd>
                </dl>

                <div class="slide-btn btn-red btn">
                    确定
                </div>
            </div>


            <div class="slide-item">
                <div class="l-title">
                    <span>2</span>设置目标推广宝贝信息
                    <em class="open-slide">修改</em> <i class="iconfont icon-zhengque"></i>
                </div>
                <div class="key-word">
                    <div class="item">
                        <span class="label"><span>*</span>店铺名称：</span>
                        <div class="item-con">
                            <select id="sk_shop_name" name="sk_shop_name" datatype="*" nullmsg="请选择！" class="Validform_error">
                                <option value="">请选择</option>
                                    <option value="右手大咖">右手大咖</option>
                            </select>

                            <a href="/Bis/BoundShopBis" target="_blank" style="color: #4e87c8; line-height: 28px; margin-left: 20px;">绑定店铺</a>
                        <span class="Validform_checktip Validform_wrong">请选择！</span></div>
                    </div>
                    <div class="item">
                        <span class="label"><span>*</span>标题活动：</span>
                        <div class="item-con">
                            <input type="text" class="w560 Validform_error" datatype="*" name="sk_activity_name" errormsg="请填写信息" maxlength="18" nullmsg="请填写信息！">
                        <span class="Validform_checktip Validform_wrong">请填写信息！</span></div>
                    </div>
                    <div class="item">
                        <span class="label"><span>*</span>宝贝链接：</span>
                        <div class="item-con">
                            <input type="text" class="w560 Validform_error" datatype="url" name="sk_activity_url" value="" id="sk-link" placeholder="此链接一律不对外开放，仅美丽啪管理员可查看" nullmsg="请填写信息！">
                        <span class="Validform_checktip Validform_wrong">请填写信息！</span></div>
                    </div>
                </div>


                <div class="slide-btn btn-red btn slide-link"> 点击获取宝贝信息<span class="iconfont icon-open-bottom" style="margin-left:10px;"></span> </div>
            </div>

            <div class="slide-item">
                <div class="l-title">
                    <span>3</span>设置美丽啪展示信息
                    <em class="open-slide">修改</em> <i class="iconfont icon-zhengque"></i>
                </div>

                <div class="item">
                    <span class="label"><span>*</span>宝贝类目：</span>
                    <div class="item-con">
                        <select name="sk_commodity_type" id="sk_commodity_type" datatype="*">
                            <option value="" selected="selected">请选择产品类型</option>
                                <option value="10">家居建材</option>
                                <option value="1">潮流女装</option>
                                <option value="2">时尚男装</option>
                                <option value="4">鞋子箱包</option>
                                <option value="7">数码家电</option>
                                <option value="5">日用百货</option>
                                <option value="6">母婴用品</option>
                                <option value="8">护肤美妆</option>
                                <option value="9">珠宝配饰</option>
                                <option value="3">食品保健</option>
                                <option value="11">车品车饰</option>
                        </select>
                    <span class="Validform_checktip"></span></div>
                </div>
                <div class="item">
                    <span class="label vt"><span>*</span>宝贝图片：</span>
                    <div class="item-con" id="img-con">
                        <img class="pic act" src="/Content/images/supertry/no_pic.jpg">
                        <img class="pic" src="/Content/images/supertry/no_pic.jpg">
                        <img class="pic" src="/Content/images/supertry/no_pic.jpg">
                        <img class="pic" src="/Content/images/supertry/no_pic.jpg">
                        <p>默认第1个为主图，点击图片可切换主图</p>
                    </div>
                    <input type="hidden" id="sk_logo_pic" name="sk_logo_pic" value="">
                    <input type="hidden" id="currentImg" name="sk_img_index" value="0">
                    <input type="hidden" id="tbshopname" name="sk_tb_shopname">
                </div>

                
                <div class="item">
                    <span class="label vt">上传图片：</span>
                    <div class="item-con" style="line-height:30px;color:#ff464e;">
                        推荐上传400 * 400的高清图片，如果因为图片太小造成模糊，平台概不负责！
                    </div>
                </div>
                <div class="item">
                    <span class="label vt">下单主图：</span>
                    <div class="item-con">
                        <img style="display:inline-block;vertical-align:middle;" class="pic bbzt" src="/Content/images/JPin/up-img1.png">
                        <span style="display:inline-block;vertical-align:middle;">该图为您的宝贝在淘宝/京东搜索页展示的下单主图</span>
                    </div>
                    <input type="hidden" id="sk_bis_upload_pic" name="sk_bis_upload_pic" value="">
                </div>


                <div class="item">
                    <span class="label vt"><span>*</span>联系QQ：</span>
                    <div class="item-con">
                        <input type="text" class="w150" name="sk_qq" datatype="n6-16">
                        <span class="gray">用户获得资格后展示，必须设置QQ权限为允许任何人，允许临时会话</span>
                    <span class="Validform_checktip"></span></div>
                </div>
                <div class="item">
                    <span class="label vt"><span>*</span>是否包邮：</span>
                    <div class="item-con">
                        <input type="radio" checked="checked"> 是
                        <span class="gray">（本活动承诺宝贝全国包邮 ）</span>
                    </div>
                </div>
                <div class="item">
                    <span class="label vt" style="width: 100px;"><span>*</span>宝贝下单价：</span>
                    <div class="item-con">
                        <input type="text" class="w82" name="sk_clinch_price" id="sk_clinch_price" datatype="num" value="0"> 元
                        <input type="checkbox" id="sk_isvoucher" name="sk_isvoucher" value="false" style="margin-left: 40px;"> 需用户领优惠券下单

                    <span class="Validform_checktip"></span></div>
                </div>
                <input type="hidden" name="sk_tryout_count" id="sk_tryout_count">
                <input type="hidden" name="sk_day_count_list" id="sk_day_count_list">
                <input type="hidden" name="sk_take_rates_list" id="sk_take_rates_list">

                <div class="key-word none" style="display: none" id="quanInfo">
                    <div class="title">
                        <span>优惠券</span>
                    </div>
                    <div class="item">
                        <div class="item">
                            <input type="radio" name="sk_VoucHer_Type" id="sk_VoucHer_Type1" checked="'checked'" value="0" datatype="*">
                            <label for="sk_VoucHer_Type1" style="margin-right: 53px;"> 隐藏优惠券</label>
                            <input type="radio" name="sk_VoucHer_Type" id="sk_VoucHer_Type2" value="1" datatype="*">
                            <label for="sk_VoucHer_Type2" style="margin-right: 53px;"> 店铺优惠券</label>
                        <span class="Validform_checktip"></span></div>
                        <div class="item-con">
                            <span class="label vt"><span>*</span>优惠券金额：</span>
                            <input type="text" id="sk_voucher_price" name="sk_voucher_price" class="w180" datatype="num" value="0">
                            <span class="label vt ml20" style="width: auto;">原价：</span>
                            <span id="AllPrice" style="margin-left: 0px;">0</span> 元
                        <span class="Validform_checktip"></span></div>
                        <div class="item" id="quanUrl" style="">
                            <span class="label"><span>*</span>优惠券链接：</span>
                            <div class="item-con">
                                <input type="text" class="w560" datatype="url" name="sk_voucher_url" placeholder="请输入优惠券链接" nullmsg="请填写信息！">
                            <span class="Validform_checktip"></span></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <span class="label vt"><span></span>商品规格：</span>
                    <div class="item-con">
                        <input type="text" style="width:786px;" class="w82" name="sk_size" placeholder="（如需用户指定规格，此项必填，如未填，默认可拍任意规格；鞋服类宝贝不可限制规格。）">
                        
                    </div>
                </div>

                <div class="key-word">
                    <div class="title">
                        <span>付款方式 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;允许使用信用卡和<em class="ptText11">花呗</em>支付，将会使数据更加真实</span>
                    </div>
                    <div class="item">
                        <input type="checkbox" name="sk_is_useCreditCard" id="sk_is_useCreditCard" value="false">
                        <label for="sk_is_useCreditCard" style="margin-right: 53px;"><em>允许买家使用信用卡支付</em></label>
                        <input type="checkbox" name="sk_is_useTokio" id="sk_is_useTokio" value="false">
                        <label for="sk_is_useTokio" style="margin-right: 53px;"><em>允许买家使用<em class="ptText11">花呗</em>支付</em></label>
                    </div>
                </div>
                <div class="item" id="sk_lottery_mode-con" style="display: none">
                    <span class="label vt"><span>*</span>开奖方式：</span>
                    <div class="item-con">
                        <input type="radio" name="sk_lottery_mode" id="sk_lottery_mode1" value="1" checked="'checked'">
                        <label for="sk_lottery_mode1">正常开奖</label>
                    </div>
                </div>
                <div class="item">
                    <span class="label vt" style="width: 110px;">购买提醒：</span>
                    <div class="item-con">
                        <input type="checkbox" name="sk_no_appraise_chart" id="sk_no_appraise_chart" value="false">
                        <label for="sk_no_appraise_chart" style="margin-right: 53px;">无需晒图</label>
                        
                        <input type="checkbox" name="sk_no_contact_chat" id="sk_no_contact_chat" value="false">
                        <label for="sk_no_contact_chat" style="margin-right: 53px;">无需<em id="ptText6">旺旺聊天</em></label>
                    </div>
                </div>
                <div class="slide-btn btn-red btn">
                    确定
                </div>
            </div>

            <div class="slide-item">
                <div class="l-title">
                    <span>4</span>活动周期设置
                    <label id="showtime" style="margin-left:100px;display:none;font-size:15px;">
                        <u style="color:#ff464e;display:inline;text-decoration:none;vertical-align:middle;">开奖时间：</u>
                        <label style="color:#ff464e;display:inline !important; font-size:15px;vertical-align:middle;"></label>
                    </label>
                    <em class="open-slide">修改</em> <i class="iconfont icon-zhengque"></i>
                </div>

                <div class="item">
                    <span class="label vt"><span>*</span>活动时间：</span>
                    <div class="item-con">
                        <input type="text" class="w150" datatype="*" nullmsg="请选择" placeholder="活动开始时间" id="begindate" name="sk_begindate" onclick=" WdatePicker({ minDate: '2017-11-30', maxDate: '#F{$dp.$D(\'enddate\')||\'2030-10-01\'}', dateFmt: 'yyyy-MM-dd', onpicked: function () { document.getElementById('enddate').click(); timeChange(); } })" value="2018-09-05">
                        -
                        <input type="text" class="w150" datatype="*" nullmsg="请选择" placeholder="活动结束时间" id="enddate" name="sk_enddate" onclick="WdatePicker({ minDate: '#F{$dp.$D(\'begindate\')||\'2030-10-01\'}', dateFmt: 'yyyy-MM-dd', onpicked: function () { timeChange(); } })" value="2018-09-05">

                        <span style="margin-left: 20px">共</span><em id="Date-num">7</em><span>天</span> <span style="margin-left: 10px;">总份数： <em id="all-num" style="color: #ff464e;">0</em></span>
                        <span style="margin-left: 20px;color:#ff464e;display: none;" id="data-warn">活动天数不能大于15天</span>
                    <span class="Validform_checktip"></span></div>
                </div>
                <div class="kt" style="line-height: 30px; padding-bottom: 10px; display: none;">
                    <span style="color:#ff464e;">商家须知</span>：为保证能顺利开团，请根据实际情况设置转化率，建议转化率<span style="color:#ff464e;">不要设置的太低</span>；
                </div>
                <div class="Date">
                    <table style="width: 100%;" class="gray">
                        <thead>
                            <tr>
                                <th>日</th>
                                <th>一</th>
                                <th>二</th>
                                <th>三</th>
                                <th>四</th>
                                <th>五</th>
                                <th>六</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="slide-btn btn-red btn">
                    确定
                </div>
            </div>

            <div class="slide-item slide5">
                <div class="l-title">
                    <span>5</span>进店路径设置
                    <em class="open-slide">修改</em> <i class="iconfont icon-zhengque"></i>
                </div>



                <input type="hidden" id="sk_find_percent" name="sk_find_percent">
                <div class="key-word" id="app-key">
                    <div class="title">
                            <span>移动端搜索关键词（填写宝贝标题里有的词 做为关键词 ，如未按要求填写 会导致搜索不到 活动效果变差 降低综合排名）</span>
                    </div>
                    <div class="item">
                        <span class="label vt"><span>*</span>分配占比：</span>
                        <div class="item-con">
                            <input type="text" class="w180 search-rate" datatype="int" value="" placeholder="请输入1或2位整数"> %
                            <span class="gray" style="margin-right:30px;">注：三个占比相加为100</span>
                            <input type="checkbox" id="tuoguan" name="sk_is_tuoguan" title="美丽啪精准关键词托管可以让您的排名提升更显著哦" value="false">
                            <label for="tuoguan" title="美丽啪精准关键词托管可以让您的排名提升更显著哦">精准关键词托管</label>

                        <span class="Validform_checktip"></span></div>

                    </div>
                    <div class="item list-word">
                        <div id="key-list">
                                    <div class="item-con add-key mb10">
                                        <span class="label"><span>*</span>搜索关键词：</span>
                                        <input type="text" name="app_search_keys" maxlength="20" class="w150" datatype="*" placeholder="精确词相对权重较高" value="">

                                        <span class="label ml30"><span>*</span>排序方式：</span>
                                        <select name="app_sort_claim" datatype="*" nullmsg="请选择！">
                                            <option value="">请选择</option>
                                                <option value="综合" selected="">综合</option>
                                                <option value="销量">销量</option>
                                                <option value="人气">人气</option>
                                                <option value="信用">信用</option>
                                                <option value="价格">价格</option>

                                        </select>
                                        <i class="iconfont icon-add key-word-icon"></i>
                                    <span class="Validform_checktip"></span></div>

                        <div class="item-con add-key mb10">
                                        <span class="label"><span>*</span>搜索关键词：</span>
                                        <input type="text" name="app_search_keys" maxlength="20" class="w150" datatype="*" placeholder="精确词相对权重较高" value="">

                                        <span class="label ml30"><span>*</span>排序方式：</span>
                                        <select name="app_sort_claim" datatype="*" nullmsg="请选择！">
                                            <option value="">请选择</option>
                                                <option value="综合" selected="">综合</option>
                                                <option value="销量">销量</option>
                                                <option value="人气">人气</option>
                                                <option value="信用">信用</option>
                                                <option value="价格">价格</option>

                                        </select>
                                        <i class="iconfont icon-remove key-word-icon"></i>
                                    <span class="Validform_checktip"></span></div></div>
                        
                        <input type="hidden" name="sk_app_search_keys" id="sk_app_search_keys" maxlength="20">
                        <input type="hidden" name="sk_app_sort_claim" id="sk_app_sort_claim" value="综合">
                        

                        <div class="item-con price-qujian">
                            <span class="label" id="ptText1"><span>*</span>一口价：</span>
                            <input type="text" class="w82" name="sk_one_price" id="sk_one_price" datatype="num" value="0"> 元
                            <span style="color:#ff464e;margin:0 15px;">搜索展示价</span>
                            <span class="word-dia">提升宝贝人气选项</span>
                        <span class="Validform_checktip"></span></div>

                        <div class="item" id="zhekou">
                            <span class="label vt" style="width:596px;">折扣和服务:（如关键词排名较低，建议设置以下项，缩小搜索范围，以便试客能找到商品）</span>
                            <div class="item-con service">
                                <label>
                                    <input type="checkbox" name="name" data-value="1" value="false"> 包邮
                                </label>
                                <label>
                                    <input type="checkbox" name="name" data-value="2" value="false"> 天猫
                                </label>
                                <label>
                                    <input type="checkbox" name="name" data-value="4" value="false"> 消费者保障
                                </label>
                                <label>
                                    <input type="checkbox" name="name" data-value="8" value="false"> 全球购
                                </label>
                                <label>
                                    <input type="checkbox" name="name" data-value="16" value="false"> 公益宝贝
                                </label>
                                <label>
                                    <input type="checkbox" name="name" data-value="32" value="false"> 淘金币抵钱
                                </label>
                                <label>
                                    <input type="checkbox" name="name" data-value="64" value="false"> 7+天内退货
                                </label>
                                
                                <label>
                                    <input type="checkbox" name="name" data-value="256" value="false"> 花呗分期
                                </label>
                                <label>
                                    <input type="checkbox" name="name" data-value="512" value="false"> 通用排序
                                </label>
                            </div>
                            <input type="hidden" name="sk_discounts_services" id="service" data-value=" " value="0">
                        </div>
                    </div>

                </div>
                <div class="key-word" id="">
                    <div class="title">
                        <span>
                            <em class="ptText7">淘口令搜索</em>
                        </span>
                    </div>
                    <div class="item">
                        <span class="label vt"><span>*</span>分配占比：</span>
                        <div class="item-con">
                            <input type="text" id="txt_taokoulingBz" class="w180 search-rate" datatype="int" value="" placeholder="请输入1或2位整数"> %
                            <span class="gray">注：三个占比相加为100</span>
                        <span class="Validform_checktip"></span></div>
                    </div>
                    <div class="item list-word">
                        <input type="hidden" value="0" name="sk_querytype" id="queryType">
                            <span class="label vt">
                                <span>*</span>
                                <em class="ptText7">淘口令</em>：
                            </span>
                            <div class="item-con">
                                <input type="text" name="sk_taokouling" class="w560" datatype="*">
                            <span class="Validform_checktip"></span></div>
                    </div>

                </div>
                <div class="key-word">
                    <div class="title">
                        <span>二维码搜索</span>
                    </div>
                    <div class="item">
                        <span class="label vt"><span>*</span>分配占比：</span>
                        <div class="item-con">
                            <input type="text" class="w180 search-rate" datatype="int" value="" placeholder="请输入1或2位整数"> %
                            <span class="gray">注：三个占比相加为100</span>
                        <span class="Validform_checktip"></span></div>
                    </div>
                    <div class="item list-word">
                        <span class="label vt"><span>*</span>二维码</span>
                        <div class="item-con" id="qrcodeTable">
                        </div>
                    </div>
                </div>

            </div>
            <div class="one-operate">
                <span class="page-btn onepage-btn">下一页</span>
            </div>
        </div>


        <div id="slide" class="twopage">
            <h2 class="title">选择服务内容</h2>
            <div class="slide-item">
                <div class="l-title">
                    <span>1</span>免费服务
                    <em class="open-slide">修改</em> <i class="iconfont icon-zhengque"></i>
                </div>

                <div class="key-word">

                    <div class="fold jd-hide">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>货比多家</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <p class="f-warn">
                            <span class="sj"></span>
                            用户会浏览你的产品的同行产品，最终到你这里下单，更进一步提升你的搜索转化效果
                        </p>
                    </div>

                    <div class="fold">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>无线端下单</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <p class="f-warn">
                            <span class="sj"></span>
                            用户会通过手机淘宝/手机京东的方式领取任务，完成浏览/加购/收藏/下单/评价 等方式进一步提升你的单品转化权重和店铺转化权重！
                        </p>
                    </div>

                    <div class="fold">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>试用心得审核</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <p class="f-warn">
                            <span class="sj"></span>
                            用户提交试用心得—商家审核—审核通过后，用户复制到淘宝/京东；标准级、专业级、星耀级会员享有该功能。
                                <a class="up" target="_blank" href="/VIP/ApplyVip?isadd=1">去升级</a>
                        </p>
                    </div>

                    <div class="fold">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>账号安全</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <p class="f-warn">
                            <span class="sj"></span>
                            中奖用户淘宝/京东周订单量不超过5，月订单量不超过10，身份证实名验证
                        </p>
                    </div>
                    <div class="fold">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>账号防重复</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <p class="f-warn">
                            <span class="sj"></span>
                            同个商品在规定时间内不会有人重复中奖
                        </p>
                    </div>
                    <div class="fold jd-hide">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>猜你喜欢</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <p class="f-warn">
                            <span class="sj"></span>
                            免费提供猜你喜欢功能，用户下单后，在您的生意参谋后台会显示 购买路径为猜你喜欢
                        </p>
                    </div>

                    <div class="fold">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>优先审核</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <p class="f-warn">
                            <span class="sj"></span>
                            你发布的活动系统会优先安排审核，审核通过之后获得最佳的发布曝光时间！
                        </p>
                    </div>

 
                    <div class="fold  " id="jp-con">
                        <div class="f-title">
                            <input name="sk_iscontest" type="checkbox" value="False"> <span>指定竞品货比</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <div class="item">
                            <span class="label">占比：</span>
                            <div class="item-con">
                                <input type="text" name="sk_contest_per" id="sk_contest_per" class="w317 jp-num" value="0"> %
                            </div>
                        </div>
                        <div class="item">
                            <span class="label">竞品链接1：</span>
                            <div class="item-con">
                                <input type="text" class="w560 jp-link" value="">
                            </div>
                        </div>
                        <div class="item">
                            <span class="label">竞品链接2：</span>
                            <div class="item-con">
                                <input type="text" class="w560 jp-link" value="">
                            </div>
                        </div>
                        <div class="item">
                            <span class="label">竞品链接3：</span>
                            <div class="item-con">
                                <input type="text" class="w560 jp-link" value="">
                            </div>
                        </div>
                        <input type="hidden" name="sk_change" value="false" id="sk-change">
                        <input type="hidden" name="sk_contest_url" id="jp-link">
                        <div class="line"></div>
                    </div>


                    <div class="fold act">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>买家回访宝贝</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <div class="item">
                            <span class="label vt">回访概率：</span>
                            <div class="item-con">
                                <select name="sk_visit">
                                    <option value="">请选择</option>
                                    <option value="10%">10%</option>
                                    <option value="20%">20%</option>
                                    <option value="30%">30%</option>
                                    <option value="40%">40%</option>
                                </select>
                            </div>
                        </div>
                        <div class="line"></div>
                    </div>


                    <div class="fold act">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>细化控制行为/人群</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <div class="item">
                            <span class="label vt" style=" width:161px;">宝贝浏览时长：</span>
                            <div class="item-con">
                                <select name="sk_view_time" nullmsg="请选择！" id="view">
                                    <option value="">请选择</option>
                                    <option value="20-40S">20-40S</option>
                                    <option value="40-80S">40-80S</option>
                                    <option value="80-120S">80-120S</option>
                                    <option value="120S以上">120S以上</option>
                                </select>
                            </div>
                        </div>
                        <div class="item">
                            <span class="label vt" style=" width:161px;">深度浏览店铺副宝贝：</span>
                            <div class="item-con">
                                <select name="sk_deepview" nullmsg="请选择！">
                                    <option value="">请选择</option>
                                    <option value="10%">10%</option>
                                    <option value="20%">20%</option>
                                    <option value="30%">30%</option>
                                    <option value="40%">40%</option>
                                    <option value="50%">50%</option>
                                    <option value="60%">60%</option>
                                    <option value="70%">70%</option>
                                    <option value="80%">80%</option>
                                    <option value="90%">90%</option>
                                    <option value="100%">100%</option>
                                </select>
                            </div>
                        </div>
                        <div class="item">
                            <span class="label vt" style="width:161px;">查看产品参数比例：</span>
                            <div class="item-con">
                                <select name="sk_view_param" nullmsg="请选择！">
                                    <option value="">请选择</option>
                                    <option value="10%">10%</option>
                                    <option value="20%">20%</option>
                                    <option value="30%">30%</option>
                                    <option value="40%">40%</option>
                                </select>
                            </div>
                        </div>
                        <div class="item">
                            <span class="label vt" style=" width:161px;">货比同类目宝贝时长：</span>
                            <div class="item-con">
                                <select name="sk_view_answer" nullmsg="请选择！">
                                    <option value="">请选择</option>
                                    <option value="6-8min">6-8min</option>
                                    <option value="8-12min">8-12min</option>
                                    <option value="12-16min">12-16min</option>
                                    <option value="16-20min">16-20min</option>
                                </select>
                            </div>
                        </div>
                        <div class="item">
                            <span class="label vt" style=" width:161px;">浏览宝贝评价比例：</span>
                            <div class="item-con">
                                <select name="sk_view_evaluate" nullmsg="请选择！">
                                    <option value="">请选择</option>
                                    <option value="10%">10%</option>
                                    <option value="20%">20%</option>
                                    <option value="30%">30%</option>
                                    <option value="40%">40%</option>
                                </select>
                            </div>
                        </div>
                        <div class="line"></div>
                    </div>
                    <div class="fold act">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>买家性别</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <div class="item">
                            <span class="label vt"><span>*</span>买家性别：</span>
                            <div class="item-con">
                                <input style="" type="radio" name="sk_sex2" id="sk_sex4">设置性别比例
                                <div id="sex-con" style="display: none;">
                                    男：
                                    <input type="text" name="sk_sexstr1" id="sk_sexstr1" class="w50" datatype="int" value="">
                                    <span>%</span>
                                    女：
                                    <input type="text" name="sk_sexstr2" class="w50" id="sk_sexstr2" datatype="int" value="">
                                    <span>%</span>
                                <span class="Validform_checktip"></span></div>
                                <input style="margin-left: 20px;" type="radio" name="sk_sex2" id="sk_sex3" checked="checked">无要求
                                <input type="hidden" name="sk_sex" id="sk_sex2">
                            </div>
                        </div>
                        <div class="line"></div>
                    </div>


                    <div class="fold act">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>买家年龄</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <div class="item list-word" style="border:none;">
                            <span class="label vt"><span>*</span>买家年龄：</span>
                            <div class="item-con">
                                <input type="hidden" name="sk_age" id="sk_age">
                                <input type="text" name="sk_age0" id="sk_age0" class="w50" datatype="num2" maxlength="2" value=""> -
                                <input type="text" name="sk_age1" id="sk_age1" class="w50" datatype="num2" maxlength="2" value="">
                                <span class="gray">注：年龄只能是大于15小于60</span>
                            <span class="Validform_checktip"></span></div>
                        </div>
                        <div class="line"></div>
                    </div>


                    <div class="fold act">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>人群标签</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <div class="item">
                            <div class="item-con">
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">在校学生</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">职场白领</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">技术蓝领</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">家庭主妇</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">专职司机</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">公务员</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">医护人员</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">餐饮行业</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="zt-job">自由职业</label>

                                <input type="hidden" name="sk_occupation" id="sk_occupation">
                            </div>
                        </div>
                        <div class="line"></div>
                    </div>

                    <div class="fold act  jd-hide">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>买家淘气值</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <div class="item">
                            <div class="item-con">
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="people-tq">501-600</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="people-tq">601-800</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="people-tq">801-1000</label>
                                        <label style="margin:0 20px 0 10px"><input type="checkbox" value="false" class="people-tq">1000以上</label>

                                <input type="hidden" name="sk_tag_popularity" id="sk_tag_popularity">
                            </div>
                        </div>
                        <div class="line"></div>
                    </div>

                    <div class="fold act">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>买家消费层级</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <div class="item">
                            <div class="item-con">
                                        <label style="margin:0 20px 0 10px"><input type="radio" name="sk_tag_level" id="sk_tag_level1" value="1">10-50元</label>
                                        <label style="margin:0 20px 0 10px"><input type="radio" name="sk_tag_level" id="sk_tag_level2" value="2">51-150元</label>
                                        <label style="margin:0 20px 0 10px"><input type="radio" name="sk_tag_level" id="sk_tag_level3" value="3">151-250元</label>
                                        <label style="margin:0 20px 0 10px"><input type="radio" name="sk_tag_level" id="sk_tag_level4" value="4">251-350元</label>
                                        <label style="margin:0 20px 0 10px"><input type="radio" name="sk_tag_level" id="sk_tag_level5" value="5">351-500元</label>
                                        <label style="margin:0 20px 0 10px"><input type="radio" name="sk_tag_level" id="sk_tag_level6" value="6">500元以上</label>

                                <label><input style="margin-left: 20px;" type="radio" name="sk_tag_level" value="" checked="'checked'">无要求</label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="slide-btn btn-red btn">
                    收起
                </div>
            </div>

            <div class="slide-item">
                <div class="l-title">
                    <span>2</span>选择增值服务
                    <em class="open-slide">修改</em> <i class="iconfont icon-zhengque"></i>
                        <label style="border:none;margin-left: 30px;">开通会员可以使用以下服务</label>
                        <a href="/VIP/VIPDetailNew" class="up" target="_blank">会员特权</a>
                </div>
                <div class="item ptText10" style="font-size:14px ; display:block !important">
                    1、手淘问大家，2、旺旺聊天，3、晒图评价，4，追评晒图，5、多天追评；
                </div>
                <div class="key-word" style="display:none;padding:20px 40px;width: 879px;">

                    <div>
                        <div class="item" id="ptText5">
                            <span class="label vt">手淘问大家：</span>
                            <div class="item-con">
                                <input type="checkbox" name="sk_is_ask" id="sk_is_ask" value="false"><label for="sk_is_ask">（<em class="sevice-ask">2</em>元/份）</label>
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="item">
                            <span class="label vt" id="ptText3">旺旺聊天：</span>
                            <div class="item-con">
                                <input type="checkbox" name="sk_is_chat" id="sk_is_chat" value="false"><label for="sk_is_chat">（2元/份）</label>
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="fold act" style="padding:0;">
                            <div class="f-title">
                                <input type="checkbox" checked="checked" disabled=""> <span>评价要求设置：（晒图+无需评价 之和不能超过活动发放份数）</span>
                                <i class="iconfont icon-Toboottom"></i>
                                <i class="iconfont icon-Totop"></i>
                            </div>
                            
                            <div class="item">
                                <span class="label vt" style="width: 112px;">晒图（含评价）：</span>
                                <div class="item-con">
                                    <input type="text" class="w180 addPrice addprice2" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" id="sk_print_count" name="sk_print_count" value="0" placeholder="请输入执行人数"><span>个买家评价时进行晒图（2元/份）（若购买提醒中选择“无需晒图”，则无法填写）</span>
                                </div>
                            </div>
                            <div class="item">
                                <span class="label vt" style="width: 112px;">无需评价：</span>
                                <div class="item-con">
                                    <input type="text" class="w180 addPrice addprice2" id="sk_star_count" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="sk_star_count" value="0" placeholder="请输入执行人数"><span>个买家不给与评价，剩余买家照常评价（0元/份）</span>
                                </div>
                            </div>
                                <div class="item">
                                    <span class="label vt" style="width: 112px;">追加评价/晒图：</span>
                                    <div class="item-con">
                                        <input type="checkbox" id="sk_is_addappraise" name="sk_is_addappraise" value="false">
                                    </div>
                                </div>
                                <div id="add-con" style="display: none;">
                                    <div class="item">
                                        <span class="label vt" style="width:300px;">①、设置追评开始时间及执行人数</span>
                                    </div>
                                    <div style="margin-left: 36px;">
                                        <div class="item">
                                            <span class="label vt" style="width: 60px; text-align: right;">2天后：</span>
                                            <div class="item-con">
                                                <input type="text" class="w180 addPrice appendnum" placeholder="请输入执行人数" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" id="sk_add1_allot_count" name="sk_add1_allot_count" value="0"><label for="zj-time1">人去执行（2元/份）</label>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <span class="label vt" style="width: 60px; text-align: right;">3天后：</span>
                                            <div class="item-con">
                                                <input type="text" class="w180 addPrice appendnum" placeholder="请输入执行人数" id="sk_add2_allot_count" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="sk_add2_allot_count" value="0"><label for="zj-time1">人去执行（3元/份）</label>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <span class="label vt" style="width: 60px; text-align: right;">4天后：</span>
                                            <div class="item-con">
                                                <input type="text" class="w180 addPrice appendnum" placeholder="请输入执行人数" id="sk_add3_allot_count" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="sk_add3_allot_count" value="0"><label for="zj-time1">人去执行（4元/份）</label>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <span class="label vt" style="width: 60px;text-align: right;">5天后：</span>
                                            <div class="item-con">
                                                <input type="text" class="w180 addPrice appendnum" id="sk_add4_allot_count" name="sk_add4_allot_count" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="0" placeholder="请输入执行人数"><label for="zj-time1">人去执行（5元/份）</label>
                                            </div>
                                        </div>
                                    </div>

                                    
                                    <div class="item">
                                        <span class="label vt" style="width:600px;">②、设置追加晒图的执行人数；（请设置“①”后再设置追评晒图执行人数；）</span>
                                    </div>

                                    <div class="item">
                                        <span class="label vt" style="text-align: right;width:130px;">追评中需含有晒图：</span>
                                        <div class="item-con">
                                            <input type="text" class="w180 addPrice pic-num" placeholder="请输入执行人数" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="sk_add_print_count" id="sk_add_print_count" value="0"><label>人去执行（1元/份）</label>
                                            <span class="word-dia" style="display: block;margin-top: 13px;margin-left: 0px;">
                                                追评晒图执行人数不填表示无该项要求
                                            </span>
                                        </div>
                                    </div>

                                </div>

                            <div class="line"></div>
                        </div>

                    </div>


                    <div class="item">
                        <span class="label vt" style="width: 182px;">中奖后重新搜索关键词下单：</span>
                        <div class="item-con">
                            <input type="checkbox" id="sk_is_search_again" value="false">
                            <label for="sk_is_search_again">（2元/份）</label>
                        </div>
                    </div>
                    <div id="add-con-search-again" style="display: none;">
                        <div style="margin-left: 36px;">
                            <div class="item">
                                <span class="label vt" style="width: 127px;">需要重新搜索下单：</span>
                                <div class="item-con">
                                    <input type="text" class="w180" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" id="sk_search_again_count" name="sk_search_again_count" value="0" placeholder="请输入执行人数"><span>个买家中奖后需要重新搜索关键词下单（2元/份）</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <span class="label vt" style="width:252px;">设置用户深度浏览宝贝详情页的问题：</span>
                        <div class="item-con">
                            <input type="checkbox" id="sk_ishave_question" name="sk_ishave_question" value="false">
                            <label for="sk_ishave_question">（20元）</label>
                        </div>
                    </div>
                    <div class="item" style="padding-top:0;">
                        请在您发布的商品详情页中，查找1个商品信息作为本次活动的问题和答案;平台将在用户第1天进店访问时展示
                    </div>
                    
                    <div id="add-con-shopissue-question" style="display: none;">
                        <div style="margin-left: 36px;">
                            <div class="item">
                                <span class="label vt" style="width:60px;">问题：</span>
                                <div class="item-con">
                                    <input type="text" class="w560" maxlength="25" id="sk_shopissue_question" name="sk_shopissue_question" placeholder="商品信息中，商品的面料是什么" datatype="*"><span></span>
                                <span class="Validform_checktip"></span></div>
                                <br>
                                <br>
                                <span class="label vt " style="width: 60px;">答案：</span>
                                <div class="item-con">
                                    <input type="text" class="w317" id="sk_shopissue_answer" maxlength="6" name="sk_shopissue_answer" placeholder="舒适面料" datatype="*"><span></span>
                                <span class="Validform_checktip"></span></div>
                            </div>
                        </div>
                        <div class="item" style="margin-left: 36px;">
                            <em style="color:#ff464e;">请设置简单易找的问题，如果问题太难，活动概不通过！</em>
                        </div>
                    </div>
                    <div class="line"></div>

                    <div class="item">
                        <span class="label vt"><span>*</span>千里传音：</span>
                        <div class="item-con">
                            <input type="radio" name="sk_send_message" id="sk_sms_fee0" value="1" checked="checked">
                            <label for="sk_sms_fee0">短信通知（审核通过却不见下单？美丽啪在通过用户后发送短信通知用户0.07元/条）</label>
                        </div>
                    </div>

                </div>

            </div>
            <input type="hidden" id="sk_id" name="sk_id" value="0">
            <input type="hidden" id="sk_fromid" name="sk_fromid" value="0">
            <div class="two-operate">
                <span class="page-btn twopage-btn">上一页</span>
                <span class="submit page-btn onepage-btn">提交</span>
            </div>
        </div>
    </form>
</div>

            </div>

    