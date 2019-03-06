var today = getdatestr(new Date());
// 时间控件
laydate.render({
	elem : '#begindate',
	type : 'date',
	min : today,
	done : function(value, date) {
		getDays();
	}
});
// 时间控件
laydate.render({
	elem : '#enddate',
	type : 'date',
	min : today,
	done : function(value, date) {
		getDays();
	}
});
//活动类型设置
function baobeitype(){
	setTimeout('getDays()',500);
}


// 根据时间，设置任务日期
function getDays() {
	var begindateStr = $("#begindate").val();
	var enddateStr = $("#enddate").val();
	var begindate = convertDateFromString(begindateStr);
	var enddate = convertDateFromString(enddateStr);
	if (begindate > enddate) {
		alert("开始时间不能大于结束时间");
		return;
	}

	var days = parseInt(enddate.getTime() / (1000 * 60 * 60 * 24))
			- parseInt(begindate.getTime() / (1000 * 60 * 60 * 24)) + 1;
	if (days > 15) {
		alert("活动不能超过15天");
		return;
	}
	drowriqi(begindate, days);
}

// 计算天数
function countAll() {
	var ct = 0;
	var hdtypeid = $(".jp-watch dt.act").index() + 1;
	if(hdtypeid == 4){
		$("input[name=detailnum]").each(function(i,numitem){
			ct += parseInt(numitem.value);
		})
	}else{
		for (var i = 0; i < 21; i++) {
			var fenshu = $("#fenshu" + i);
			if (fenshu && fenshu.val()) {
				ct += parseInt(fenshu.val());
			}
		}
	}
	$("#all-num").html(ct);
}

// 进行日期绘画
function drowriqi(begindate, days) {
	$("#Date-num").html(days);
	for (var i = 0; i < 21; i++) {
		$("#week" + "" + i).html("");
	}
	var hdtypeid = $(".jp-watch dt.act").index() + 1;
	var bday = begindate.getDay();
	for (var i = 0; i < days; i++) {
		var tempday = dayadd(begindate, i);
		var daystr = tempday.Format("yyyy-MM-dd");
		var dd = tempday.Format("dd");
		var dayhtml = "<input type='hidden' id='shijian" + i + "' value='"
				+ daystr + "'/>";
		var fenshu = "<input type='text' id='fenshu"
				+ i
				+ "' name='name' class='day-num' onchange='countAll();' value='1'>";
		var zhuanhua = "<input type='text' id='zhuanhua" + i
				+ "' name='name' class='day-num1' value='0'  maxlength='2'>";
		// 预热
		var html = "<div class='date-con'><h3>" + dd + dayhtml
				+ "</h3><i class='iconfont icon-going'></i><h2>活动预热</h2></div>";
		// 一般的抽奖
		var html1 = "<div class='date-con'><h3>" + dd + dayhtml
				+ "</h3><p><label>发放份数：</label>" + fenshu
				+ "</p><p><label>日转化率：</label>" + zhuanhua
				+ "<span>%</span></p></div>";
	
		if (hdtypeid == 4) {
			var html2 = "<div class='date-con'><h3>" + dd + dayhtml + "<button onclick='addbizhongp(this)'>加</button></h3>";
			for (var n = 0; n < 3; n++) {
				var hour1 = 8 + n * 4;
				var hour2 = 12 + n * 4;
				html2 += initbizhonghtml(hour1, hour2, 10);
			}
			html2 += "</div>";
			$("#week" + bday).html(html2);
		} else if (i == 0) {
			//$("#week" + bday).html(html);
			$("#week" + bday).html(html1);
		} else {
			$("#week" + bday).html(html1);
		}
		bday++;
	}
	countAll();
}

function initbizhonghtml(hour1,hour2,value){
	// 必中任务 样式
	var inputstyle1 = "text-indent:0px;width:18px; height:20px; font-size: 14px; line-height: 20px; border: 1px solid #ddd;";
	var inputstyle2 = "text-indent:0px;width:25px; height:20px; font-size: 14px; line-height: 20px; border: 1px solid #ddd;";
	var starttime1 = "<input type='text' name='starthour' style='"
			+ inputstyle1 + "' value='" + hour1 + "'>";
	var endtime1 = "<input type='text' name='endhour' style='"
			+ inputstyle1 + "' value='" + hour2 + "'>";
	var fenshu1 = "<input type='text' name='detailnum' style='"
			+ inputstyle2 + "' onchange='countAll();' value='"+value+"'>";
	var html2 = "<p><label>" + starttime1 + "-" + endtime1 + "点："
			+ fenshu1 + "份<button onclick='deletebizhongp(this)'>删</button></label></p>";
	return html2;
}
function deletebizhongp(obj){
	$(obj).parent().parent().remove();
}

function addbizhongp(obj){
	$(obj).parent().parent().append(initbizhonghtml(0,0,10));
}

// 保存
var baocun = false;
function savebaobei() {
	if (baocun) {
		alert("请勿重复保存");
	}
	$("#tijiaosj").html("正在提交");
	var data = {
		dpid : $("#sk_shop_name option:selected").val(),
		title : $("#sk_activity_name").val()
	};
	var id = $('#baobeiid').val();
	if (id) {
		data.id = id;
	}
	data.url = $("#sk-link").val();
	data.taokl = $("#sk_taokouling").val();
	data.zturl = $('#picbbzt').attr("src");
	data.sale_price = $("#sk_clinch_price").val();
	data.jiangli = $("#sk_jiangli").val();
	data.no_qq = $("#sk_qq").val();
	data.guige = $("#sk_size").val();
	data.typeid = $("#sk_commodity_type option:selected").val();
	data.hdtypeid = $(".jp-watch dt.act").index() + 1;
	// 拼团
	if (data.hdtypeid == 5) {
		data.hdtypeid = 6;
	}

	data.xinyongka = $("#sk_is_useCreditCard").is(':checked') ? 1 : 0;
	data.huabei = $("#sk_is_useTokio").is(':checked') ? 1 : 0;
	data.shaitu = $("#sk_no_appraise_chart").is(':checked') ? 1 : 0;
	data.wangwang = $("#sk_no_contact_chat").is(':checked') ? 1 : 0;
	// 货比三家
	var ishbsj = $("#ishbsj").is(':checked') ? 1 : 0;
	if (ishbsj == 1) {
		var hbsj = {
			tkl1 : "",
			tkl2 : "",
			tkl3 : ""
		};
		data.hbsj = JSON.stringify(hbsj);
	}

	// 图片
	var tplist = [];
	var imgs = $("#img-con").children();
	for (var i = 0; i < imgs.length && i < 4; i++) {
		var img = imgs[i];
		var tp = {
			url : img.src
		};
		var imgId = $(img).data('id');
		if (imgId) {
			tp.id = imgId;
		}
		tplist.push(tp);
	}
	data.tplist = JSON.stringify(tplist);

	// 进店路径
	var jdlist = [];
	var app_search_bili = $("#app_search_bili").val();
	// 一口价
	var sk_one_price = $("#sk_one_price").val();
	var txt_taokoulingBz = $("#txt_taokoulingBz").val();
	var spCodesTemp = "";
	$('input:checkbox[name=name]:checked').each(function(i) {
		if (0 == i) {
			spCodesTemp = $(this).val();
		} else {
			spCodesTemp += ("," + $(this).val());
		}
	});
	var searchId = $('#app_search_bili').data('id');
	var search = {
		typeid : "1",
		bili : app_search_bili,
		ykj : sk_one_price,
		zkfw : spCodesTemp
	};
	if (searchId) {
		search.id = searchId;
	}
	var tpwdId = $("#txt_taokoulingBz").data('id');
	var kouling = {
		typeid : "2",
		bili : txt_taokoulingBz
	};
	if (tpwdId) {
		kouling.id = tpwdId;
	}

	jdlist.push(search);
	jdlist.push(kouling);
	data.jdlist = JSON.stringify(jdlist);

	// 关键字
	var wordlist = [];

	$('.add-key').each(
			function(i) {
				var app_search_keys = $(this).children(
						'input[name=app_search_keys]').val();
				var app_sort_claim = $(this).children(
						'select[name=app_sort_claim]').children(
						'option:selected').val();
				var keyWord = {
					word : app_search_keys,
					ordermethod : app_sort_claim
				};
				var keyId = $(this).data('id');
				if (keyId) {
					keyWord.id = keyId;
				}
				wordlist.push(keyWord);
			});

	data.wordlist = JSON.stringify(wordlist);

	// 宝贝任务
	var bbrwlist = [];
	for (var i = 0; i < 21; i++) {
		var $sj = $("#shijian" + i);
		if ($sj && $sj.val()) {
			var rwdata = {
				daydes : $sj.val(),
				bbnum : $("#fenshu" + i).val(),
				zhuanhua : $("#zhuanhua" + i).val()
			};
			var sjId = $sj.data('id');
			if (sjId) {
				rwdata.id = sjId;
			}
			// 必中任务
			if (data.hdtypeid == 4) {
				var plist = $("#shijian" + i).parent().parent().find("p");
				rwdata.details = [];
				plist.each(function(index, ppp) {
					var starthour = $(this).find("input[name='starthour']").val();
					var endhour = $(this).find("input[name='endhour']").val();
					var detailnum = $(this).find("input[name='detailnum']").val();
					var rwdetail = {bbnum:detailnum,hour1 :starthour,hour2:endhour};
					rwdata.details.push(rwdetail);
				})		
			}
			bbrwlist.push(rwdata);
		}
	}
	data.bbrwlist = JSON.stringify(bbrwlist);

	var url = getbaseurl("/baobei/save.do");
	postdo(url, data, svsucdo, null, svcompdo);
}

function svsucdo(data) {
	location.href = getbaseurl("/shangjia/huodonglist?status=0");
}

function svcompdo(data) {
	baocun = false;
	$("#tijiaosj").html("提交");
}

getDays();