<%@page import="java.util.Date"%>
<%@page import="co.kensure.mem.DateUtils"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	Date now = new Date();
	String day1 = DateUtils.format(now,DateUtils.DAY_FORMAT);
	String day2 = DateUtils.format(DateUtils.getPastDay(now, 6),DateUtils.DAY_FORMAT);
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
                
                <jsp:include page="baobeitype.jsp" flush="true"/> 

              
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
                                
                        </select>
                    <span class="Validform_checktip"></span></div>
                </div>
                <div class="item">
                    <span class="label vt"><span>*</span>宝贝图片：</span>
                    <div class="item-con" id="img-con">
                        <img class="pic act" src="<%=context%>/no_pic.jpg">
                        <img class="pic" src="<%=context%>/no_pic.jpg">
                        <img class="pic" src="<%=context%>/no_pic.jpg">
                        <img class="pic" src="<%=context%>/no_pic.jpg">
                        <p>默认第1个为主图</p>
                    </div>
                </div>      
           
                <div class="item">
                    <span class="label vt">下单主图：</span>
                    <div class="item-con">
                        <img style="display:inline-block;vertical-align:middle;" id="picbbzt" class="pic bbzt" src="<%=context%>/no_pic.jpg">
                        <span style="display:inline-block;vertical-align:middle;">该图为您的宝贝在淘宝/京东搜索页展示的下单主图</span>
                    </div>
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
                        <input type="text" class="w82" name="sk_clinch_price11" id="sk_clinch_price" value="0"> 元
                      
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
                        <input type="checkbox" name="sk_is_useCreditCard" id="sk_is_useCreditCard" value="1">
                        <label for="sk_is_useCreditCard" style="margin-right: 53px;"><em>允许买家使用信用卡支付</em></label>
                        <input type="checkbox" name="sk_is_useTokio" id="sk_is_useTokio" value="1">
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
                        <input type="checkbox" name="sk_no_appraise_chart" id="sk_no_appraise_chart" value="1">
                        <label for="sk_no_appraise_chart" style="margin-right: 53px;">无需晒图</label>
                        
                        <input type="checkbox" name="sk_no_contact_chat" id="sk_no_contact_chat" value="1">
                        <label for="sk_no_contact_chat" style="margin-right: 53px;">无需<em id="ptText6">旺旺聊天</em></label>
                    </div>
                </div> 
            </div>

            <div class="slide-item">
                <div class="l-title">
                    <span>4</span>活动周期设置
             
                </div>

                <div class="item">
                    <span class="label vt"><span>*</span>活动时间：</span>
                    <div class="item-con">
                        <input type="date" class="w150" datatype="*" onchange="getDays()" placeholder="活动开始时间" id="begindate" name="sk_begindate" value="<%=day1%>">
                        -
                        <input type="date" class="w150" datatype="*" onchange="getDays()" placeholder="活动结束时间" id="enddate" name="sk_enddate"  value="<%=day2%>">

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
               
            </div>

            <div class="slide-item slide5">
                <div class="l-title">
                    <span>5</span>进店路径设置              
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
                                    <input type="checkbox" name="name" value="包邮"> 包邮
                                </label>
                                <label>
                                    <input type="checkbox" name="name" value="天猫"> 天猫
                                </label>
                                <label>
                                    <input type="checkbox" name="name" value="消费者保障"> 消费者保障
                                </label>
                                <label>
                                    <input type="checkbox" name="name" value="全球购"> 全球购
                                </label>
                                <label>
                                    <input type="checkbox" name="name" value="公益宝贝"> 公益宝贝
                                </label>
                                <label>
                                    <input type="checkbox" name="name" value="淘金币抵钱"> 淘金币抵钱
                                </label>
                                <label>
                                    <input type="checkbox" name="name" value="7+天内退货"> 7+天内退货
                                </label>                        
                                <label>
                                    <input type="checkbox" name="name" value="花呗分期"> 花呗分期
                                </label>
                                <label>
                                    <input type="checkbox" name="name" value="通用排序"> 通用排序
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
            
            </div>
            <div class="one-operate">
                <span class="submit page-btn onepage-btn"  >下一页</span>
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

                    <div class="fold jd-hide">
                        <div class="f-title">
                            <input type="checkbox" checked="checked" disabled=""> <span>查看买家记录</span>
                            <i class="iconfont icon-Toboottom"></i>
                            <i class="iconfont icon-Totop"></i>
                        </div>
                        <p class="f-warn">
                            <span class="sj"></span>
                            买家近期在淘宝/京东中的购买记录
                        </p>
                    </div>

                  

                   
                </div>
              
            </div>

          
            <div class="two-operate">
                <span class="page-btn twopage-btn">上一页</span>
                <span class="submit page-btn onepage-btn" id="tijiaosj" onclick="savebaobei()">提交</span>
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
	   getDays();
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
	   for(var i=0;i<21;i++){
		   $("#week"+""+i).html("");
	   }
	   var hdtypeid = $(".jp-watch dt.act").index()+1;
	   var bday = begindate.getDay();
	   for(var i=0;i<days;i++){
		  var tempday = dayadd(begindate,i);
		  var daystr = tempday.Format("yyyy-MM-dd");
		  var dd = tempday.Format("dd");
		  var dayhtml = "<input type='hidden' id='shijian"+i+"' value='"+daystr+"'/>";
		  var fenshu = "<input type='text' id='fenshu"+i+"' name='name' class='day-num' onchange='countAll();' value='1'>";
		  var zhuanhua = "<input type='text' id='zhuanhua"+i+"' name='name' class='day-num1' value='0'  maxlength='2'>";
		  var html = "<div class='date-con'><h3>"+dd+dayhtml+"</h3><i class='iconfont icon-going'></i><h2>活动预热</h2></div>";
		  var html1 = "<div class='date-con'><h3>"+dd+dayhtml+"</h3><p><label>发放份数：</label>"+fenshu+"</p><p><label>日转化率：</label>"+zhuanhua+"<span>%</span></p></div>";
		  if(i == 0){
			  if(hdtypeid == 4){
				  $("#week"+bday).html(html1);
			  }else{
				  $("#week"+bday).html(html);
			  }		  
		  }else{
			  $("#week"+bday).html(html1);
		  }		  
		  bday++;
	   }  
	   countAll();
   }
   
   getDays();
   
   
   function countAll(){
	   var ct = 0;
	   for(var i=0;i<21;i++){
		  var fenshu = $("#fenshu"+i); 
		  if(fenshu && fenshu.val()){
			  ct += parseInt(fenshu.val());
		  }
	   }
	   $("#all-num").html(ct);
   }
   
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
   
   var baocun = false;
   function savebaobei(){
	   if(baocun){
		   alert("请勿重复保存");
	   }  
	   $("#tijiaosj").html("正在提交");
	   var data = {dpid:$("#sk_shop_name option:selected").val(),title:$("#sk_activity_name").val()};
	   data.url = $("#sk-link").val();
	   data.taokl = $("#sk_taokouling").val();
	   data.zturl = $("#picbbzt")[0].src;
	   data.sale_price = $("#sk_clinch_price").val();
	   data.jiangli = 0;
	   data.no_qq = $("#sk_qq").val();
	   data.guige = $("#sk_size").val();
	   data.typeid = $("#sk_commodity_type option:selected").val();
	   data.hdtypeid = $(".jp-watch dt.act").index()+1;
	
	   data.xinyongka = $("#sk_is_useCreditCard radio:checked").val();
	   data.huabei = $("#sk_is_useTokio radio:checked").val();
	   data.shaitu = $("#sk_no_appraise_chart radio:checked").val();
	   data.wangwang = $("#sk_no_contact_chat radio:checked").val();
	   
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
	   //一口价
	   var sk_one_price = $("#sk_one_price").val();
	   var txt_taokoulingBz = $("#txt_taokoulingBz").val();
	   var spCodesTemp = "";
       $('input:checkbox[name=name]:checked').each(function(i){
	        if(0==i){
	         spCodesTemp = $(this).val();
	        }else{
	         spCodesTemp += (","+$(this).val());
        }
       });
	   var search = {typeid:"1",bili:app_search_bili,ykj:sk_one_price,zkfw:spCodesTemp};
	   var kouling = {typeid:"2",bili:txt_taokoulingBz};

	   jdlist.push(search);
	   jdlist.push(kouling);
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
		  if(sj && sj.val()){
			  var rwdata = {daydes:sj.val(),bbnum:$("#fenshu"+i).val(),zhuanhua:$("#zhuanhua"+i).val()};
			  bbrwlist.push(rwdata);
		  }
	   }
	   data.bbrwlist = JSON.stringify(bbrwlist);
	   
	   var url = "<%=BusiConstant.shangjia_baobeiadd_do.getKey()%>";
	   postdo(url, data, svsucdo,null, svcompdo);
   }
   
   function svsucdo(data){
	   location.href = "<%=BusiConstant.shangjia_huodonglist.getKey()%>?status=0";
   }
   
   function svcompdo(data){
	   baocun = false;
	   $("#tijiaosj").html("提交");
   }
   
   function sucdo(data){
		var rows = data.resultData.rows;
		if(rows){		
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var html = "<option value='"+row.id+"'>";
				html += row.name+"</option>";
				$("#sk_shop_name").append(html);
			}
		}
	}

  function dianpulist(){
	   var data = {};
	   var url = "<%=BusiConstant.shangjia_dianpualist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
  }
  dianpulist();
  
  function dictsucdo(data){
		var rows = data.resultData.rows;
		for(var i=0;i<rows.length;i++){
			var row = rows[i];
			var html = "<option value='"+row.code+"'>";
			html += row.name+"</option>";
			$("#sk_commodity_type").append(html);
		}	
	}
	function dictlist(){
	   var data = {typeid:1};
	   var url = "<%=BusiConstant.sys_dictlist_do.getKey()%>";
	   postdo(url, data, dictsucdo,null, null);
	}
	dictlist();
</script>           
            
            
            

    