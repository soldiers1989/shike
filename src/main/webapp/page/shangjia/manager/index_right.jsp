<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">


<div class="fine">
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
                                    <option value="1">右手大咖</option>
                            </select>

                            <a href="<%=BusiConstant.shangjia_dianpulist.getKey()%>" target="_blank" style="color: #4e87c8; line-height: 28px; margin-left: 20px;">绑定店铺</a>
                        <span class="Validform_checktip Validform_wrong">请选择！</span></div>
                    </div>
                    <div class="item">
                        <span class="label"><span>*</span>标题活动：</span>
                        <div class="item-con">
                            <input type="text" class="w560 Validform_error" datatype="*" id="sk_activity_name" name="sk_activity_name" errormsg="请填写信息" maxlength="18" nullmsg="请填写信息！">
                        <span class="Validform_checktip Validform_wrong">请填写信息！</span></div>
                    </div>
                    <div class="item">
                        <span class="label"><span>*</span>宝贝链接：</span>
                        <div class="item-con">
                            <input type="text" class="w560 Validform_error" datatype="url" name="sk_activity_url" value="" id="sk-link" placeholder="此链接一律不对外开放，仅管理员可查看" nullmsg="请填写信息！">
                        <span class="Validform_checktip Validform_wrong">请填写信息！</span></div>
                    </div>
                </div>


                <div class="slide-btn btn-red btn slide-link" onclick="getTaobao();"> 点击获取宝贝信息<span class="iconfont icon-open-bottom" style="margin-left:10px;"></span> </div>
            </div>

            <div class="slide-item">
                <div class="l-title">
                    <span>3</span>设置展示信息
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
                        <p>默认第1个为主图</p>
                    </div>
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
                        <img style="display:inline-block;vertical-align:middle;" id="picbbzt" class="pic bbzt" src="/Content/images/JPin/up-img1.png">
                        <span style="display:inline-block;vertical-align:middle;">该图为您的宝贝在淘宝/京东搜索页展示的下单主图</span>
                    </div>
                    <input type="hidden" id="sk_bis_upload_pic" name="sk_bis_upload_pic" value="">
                </div>


                <div class="item">
                    <span class="label vt"><span>*</span>联系QQ：</span>
                    <div class="item-con">
                        <input type="text" class="w150" id="sk_qq" name="sk_qq" datatype="n6-16">
                        <span class="gray">用户获得资格后展示，必须设置QQ权限为允许任何人，允许临时会话</span>
                    <span class="Validform_checktip"></span></div>
                </div>
                
                <div class="item">
                    <span class="label vt" style="width: 100px;"><span>*</span>宝贝下单价：</span>
                    <div class="item-con">
                        <input type="text" class="w82" name="sk_clinch_price" id="sk_clinch_price" datatype="num" value="0"> 元
                      
                    <span class="Validform_checktip"></span></div>
                </div>
                <input type="hidden" name="sk_tryout_count" id="sk_tryout_count">
                <input type="hidden" name="sk_day_count_list" id="sk_day_count_list">
                <input type="hidden" name="sk_take_rates_list" id="sk_take_rates_list">

              
                <div class="item">
                    <span class="label vt"><span></span>商品规格：</span>
                    <div class="item-con">
                        <input type="text" style="width:786px;" class="w82" id="sk_size" name="sk_size" placeholder="（如需用户指定规格，此项必填，如未填，默认可拍任意规格；鞋服类宝贝不可限制规格。）">                  
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
                        <input type="date" class="w150" datatype="*" nullmsg="请选择" placeholder="活动开始时间" id="begindate" name="sk_begindate" value="2018-09-10">
                        -
                        <input type="date" class="w150" datatype="*" nullmsg="请选择" placeholder="活动结束时间" id="enddate" name="sk_enddate"  value="2018-09-15">

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
                                <td id="week0"></td>
                                <td id="week1"></td>
                                <td id="week2"></td>
                                <td id="week3"></td>
                                <td id="week4"></td>
                                <td id="week5"></td>
                                <td id="week6"></td>
                            </tr>
                            <tr>
                                <td id="week7"></td>
                                <td id="week8"></td>
                                <td id="week9"></td>
                                <td id="week10"></td>
                                <td id="week11"></td>
                                <td id="week12"></td>
                                <td id="week13"></td>
                            </tr>
                            <tr>
                                <td id="week14"></td>
                                <td id="week15"></td>
                                <td id="week16"></td>
                                <td id="week17"></td>
                                <td id="week18"></td>
                                <td id="week19"></td>
                                <td id="wee20"></td>
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

                <div class="key-word" id="app-key">
                    <div class="title">
                            <span>移动端搜索关键词（填写宝贝标题里有的词 做为关键词 ，如未按要求填写 会导致搜索不到 活动效果变差 降低综合排名）</span>
                    </div>
                    <div class="item">
                        <span class="label vt"><span>*</span>分配占比：</span>
                        <div class="item-con">
                            <input type="text" class="w180 search-rate" id="app_search_bili" datatype="int" value="" placeholder="请输入1或2位整数"> %
                            <span class="gray" style="margin-right:30px;">注：三个占比相加为100</span>
                         </div>

                    </div>
                    <div class="item list-word">
                        <div id="key-list">
                                    <div class="item-con add-key mb10">
                                        <span class="label"><span>*</span>搜索关键词：</span>
                                        <input type="text" name="app_search_keys" id="app_search_keys" maxlength="20" class="w150" datatype="*" placeholder="精确词相对权重较高" value="">

                                        <span class="label ml30"><span>*</span>排序方式：</span>
                                        <select name="app_sort_claim" id="app_sort_claim" datatype="*" nullmsg="请选择！">
                                            <option value="">请选择</option>
                                                <option value="1" selected="">综合</option>
                                                <option value="2">销量</option>
                                                <option value="3">人气</option>
                                                <option value="4">信用</option>
                                                <option value="5">价格</option>

                                        </select>
                                        <i class="iconfont icon-add key-word-icon"></i>
                                    <span class="Validform_checktip"></span></div>
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
                            <input type="text" class="w180 search-rate" datatype="int" id="app_qr_bili" value="" placeholder="请输入1或2位整数"> %
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
                <span class="submit page-btn onepage-btn" onclick="savebaobei()">提交</span>
            </div>
        </div>

      
        </div>

</div>

            
 <script>
 
 Date.prototype.Format = function (fmt) {
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		for (var k in o){
			if (new RegExp("(" + k + ")").test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			}
	    }
	    return fmt;
	}
 
	function taobaosucdo(data){
		var rows = data.resultData.rows;
		if(rows){	
			var imgs = $("#img-con").children();
			for(var i=0;i<rows.length && i < 4;i++){
				var row = rows[i];		
				var img = imgs[i];
				if(img){
					img.src = row;
				}
			}
		}
	}
   function getTaobao(){ 
	   var data = {url:$("#sk-link").val()};
	   var url = "<%=BusiConstant.shangjia_taobaoinfo_do.getKey()%>";
	   postdo(url, data, taobaosucdo,null, null);
   }
   
   function getDays(){ 
	   var begindateStr = $("#begindate").val();
	   var enddateStr = $("#enddate").val();
	   var begindate = convertDateFromString(begindateStr);
	   var enddate = convertDateFromString(enddateStr);
	   if(begindate>enddate){
		   alert("开始时间不能大于结束时间");
		   return;
	   }
	   
	   var days = parseInt(enddate.getTime()/ (1000 * 60 * 60 * 24)) -  parseInt(begindate.getTime()/ (1000 * 60 * 60 * 24))+1;
	   if(days > 15){
		   alert("活动不能查过15天");
		   return;
	   }
	   $("#Date-num").html(days);
	      
	   for(var i=0;i<days;i++){
		  var tempday = dayadd(begindate,i);
		  var week = tempday.getDay();
		  var daystr = tempday.Format("yyyy-MM-dd");
		  var hml = "<input type='text' readonly='readonly' style='width:100px;' id='shijian"+i+"' value='"+daystr+"'/><br>投放份数:<input type='text' style='width:50px;' id='fenshu"+i+"' value=''/><br>转化率:<input type='text' style='width:50px;' id='zhuanhua"+i+"' value=''/>%";
		  $("#week"+""+week).html(hml);
	   }  
   }
   
   getDays();
   
   function convertDateFromString(dateString) { 
	   if (dateString) { 
		   var arr1 = dateString.split(" "); 
		   var sdate = arr1[0].split('-'); 
		   var date = new Date(sdate[0], sdate[1]-1, sdate[2]); 
		   return date;
	   } 
   }
   
   function dayadd(begindate,p_count) {
       var dd = new Date();
       dd.setDate(begindate.getDate() + p_count);//获取p_count天后的日期 
       return dd;
   }
   
   
   function savebaobei(){
	   var data = {dpid:$("#sk_shop_name option:selected").val(),title:$("#sk_activity_name").val()};
	   data.url = $("#sk-link").val();
	   data.taokl = $("#sk_taokouling").val();
	   data.zturl = $("#picbbzt").val();
	   data.sale_price = $("#sk_clinch_price").val();
	   data.jiangli = 0;
	   data.no_qq = $("#sk_qq").val();
	   data.guige = $("#sk_size").val();
	   data.typeid = $("#sk_commodity_type option:selected").val();
	   data.hdtypeid = 1;
	   data.xinyongka = $("#sk_is_useCreditCard").val();
	   data.huabei = $("#sk_is_useTokio").val();
	   data.shaitu = $("#sk_no_appraise_chart").val();
	   data.wangwang = $("#sk_no_contact_chat").val();
	   
	   //图片
	   var tplist = [];
	   var imgs = $("#img-con").children();
		for(var i=0;i<imgs.length && i < 4;i++){	
			var img = imgs[i];
			var tp = {url:img.src};
			tplist.push(tp);
		}      
	   data.tplist = JSON.stringify(tplist);
	   
	   //进店路径
	   var jdlist = [];
	   var app_search_bili = $("#app_search_bili").val();
	   var txt_taokoulingBz = $("#txt_taokoulingBz").val();
	   var app_qr_bili = $("#app_qr_bili").val();
	   var search = {typeid:1,bili:app_search_bili};
	   var kouling = {typeid:2,bili:txt_taokoulingBz};
	   var qr = {typeid:3,bili:kouling};
	   jdlist.push(search);
	   jdlist.push(kouling);
	   jdlist.push(qr);
	   data.jdlist = JSON.stringify(jdlist);
	   
	   //关键字
	   var wordlist = [];
	   var app_search_keys = $("#app_search_keys").val();
	   var app_sort_claim = $("#app_sort_claim option:selected").val(); 
	   var key1 = {word:app_search_keys,ordermethod:app_sort_claim};
	   wordlist.push(key1);
	   data.wordlist = JSON.stringify(wordlist);
	   
	   //宝贝任务
	   var bbrwlist = [];
	   for(var i=0;i<21;i++){
		  var sj = $("#shijian"+i); 
		  if(sj){
			  var rwdata = {daydes:sj.val,bbnum:$("#fenshu"+i).val(),zhuanhua:$("#zhuanhua"+i).val()};
			  bbrwlist.push(rwdata);
			  
		  }
	   }
	   data.bbrwlist = JSON.stringify(bbrwlist);
	   
	   var url = "<%=BusiConstant.shangjia_baobeiadd_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
   

   
  
   
</script>           
            
            
            

    