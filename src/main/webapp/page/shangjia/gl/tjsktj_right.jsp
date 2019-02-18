<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="shiy_ti">
        <form id="userListchaxun">
            <span style="float:none;margin-right:5px;">编号</span>
            <input name="id" type="text" style="width:80px" >

            <span style="float:none;margin-right:5px;">手机号</span>
            <input name="phone" type="text" style="width:80px" >

            <span style="float:none;margin-right:5px;">QQ</span>
            <input name="noQq" type="text" style="width:80px" >

            <span style="float:none;margin-right:5px;">支付宝</span>
            <input name="noAlipay" type="text" value="" style="width:80px" >

            <span style="float:none;margin-right:5px;">淘宝</span>
            <input name="noTaobao" type="text" value="" style="width:80px" >
            
            <span style="float:none;margin-right:5px;">推荐人id</span>
            <input name="refereeId" type="text" value="" style="width:80px" >
            
             <span style="float:none;">审核状态</span>
        	<select name="auditStatus" style="width:auto;">
            <option value="" selected="selected">全部</option>
                <option value="0">未审核</option>
                <option value="1">审核通过</option>
                <option value="2">不通过</option>

        </select>
        </form>
        <input onclick="chongzhilist(1)" type="button" value="搜索">
    </div>

    <div class="hxt">
    </div>
    <!--zh_title-->
    <div class="huodong">
        <div class="glht_contant">
            <table  border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <thead>
        
   		 		</thead>
             <tbody>
                
          	</tbody>
          	</table>
        </div>
        <div id="fanye">

        </div>
    </div>
    <!--page-->
</div>
<!--huodong-->
<!--right_bottom-->
            </div>

<script>
    $.fn.serializeObject = function(){
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    }

	var table = createtable("listtable");

	var optfun = function(row){
        var tdinner = "";
        var auditStatus = row.auditStatus;
        if (auditStatus != 1) {
        	 tdinner = "<button type='button' onclick='auditPass("+row.id+")'>审核通过</button>&nbsp;";
        	 tdinner += "<button type='button' onclick='auditUnpass("+row.id+")'>不通过</button>&nbsp;";
        }
        tdinner += "<button type='button' onclick='editTaoqizhi("+row.id+")'>淘气值</button>";
        return tdinner;
	}

	var xinyongfun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.buyerTotalPoint){
			f =  row.sKTaobao.buyerTotalPoint+"单<br>平均每周："+row.sKTaobao.weekAvg+"<br>好评率:"+row.sKTaobao.sellerGoodRate;
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	var huiyuanfun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.vip){
			f =  row.sKTaobao.vip+"级";
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	
	var huoyuefun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.activePoint){
			f =  row.sKTaobao.activePoint+"点，<br>"+row.sKTaobao.activeLevel+"级";
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	var shimingfun = function(row){
		var f = "否";
		if(row.sKTaobao && row.sKTaobao.shiming == '1'){
			f = "是";
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	var zhucefun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.regTime){
			f =  row.sKTaobao.regTime;
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}

	var taobaoimgfun = function(row){
		var f =  row.taobaoImg;
		if(f){	
            var tdinner = "<a target='_blank' href='"+row.taobaoImg+"'>有</a>";
            return tdinner;
		}
		return '无';
	}

	var taoqizhifun = function(row){
        var f = "";
        if(row.sKTaobao && row.sKTaobao.taoqizhi){
            f =  row.sKTaobao.taoqizhi;
        }
        var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
        return tdinner;
	}

	var nannvfun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.sex){
			f =  row.sKTaobao.sex;
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}

	var auditfun =  function(row){
        var auditStatus = row.auditStatus;
        var tdinner = '';
        if (auditStatus == 0) {
            tdinner = "未审核";
        } else if (auditStatus == 1) {
            tdinner = "审核通过";
        } else if (auditStatus == 2) {
            tdinner = "不通过("+ row.remark +")";
        }
        return tdinner;
    }
	
	var refereeUserfun =  function(row){
        var refereeId = row.refereeId;
        var tdinner = '无';
        if(refereeId){
        	tdinner = row.refereeUser.name+"<br>("+refereeId+")";
        }
        return tdinner;
    }
	
	table.th = [{w:50,na:"编号",colname:"id"}
	,{w:55,na:"真实姓名",colname:"realname"}
	,{w:80,na:"手机号",colname:"phone"}
	,{w:80,na:"qq账号",colname:"noQq"}
	,{w:50,na:"余额",colname:"yue"}
	,{w:80,na:"创建时间",colname:"createdTimeStr"}
	,{w:80,na:"支付宝",colname:"noAlipay"}
	,{w:40,na:"实名",callfun:shimingfun}
	,{w:100,na:"淘宝账号",colname:"noTaobao"}
	,{w:100,na:"注册时间",callfun:zhucefun}
	,{w:40,na:"淘宝截图",callfun:taobaoimgfun}
	,{w:60,na:"淘气值",callfun:taoqizhifun}
	,{w:130,na:"买家信用",callfun:xinyongfun}
	,{w:40,na:"男女",callfun:nannvfun}
	,{w:40,na:"淘宝等级",callfun:huiyuanfun}
	,{w:60,na:"活跃度",callfun:huoyuefun}
	,{w:50,na:"活动申请数",colname:"sqNum"}
	,{w:50,na:"中奖数",colname:"zjNum"}
	,{w:80,na:"第一次消费时间",colname:"firstShoptimeStr"}	
	,{w:80,na:"推荐人",callfun:refereeUserfun}
	,{w:100,na:"审核状态",callfun:auditfun}
	,{w:200,na:"操作",callfun:optfun}];
	
	table.thinit();
	
	function sucdo(data){
		var rows = data.resultData.rows;
        fanye.init(data.resultData.total);
        table.data = rows == null ? [] : rows;
		table.tdinit();
    }
	
	var fanye = new FanYe("fanye", "chongzhilist", 0, 20, 1);

   function chongzhilist(current){
        if(!fanye.setpage(current)){
            return;
        }

	   // var data = {type: 1, pageNo: fanye.current, pageSize: fanye.limit};
       var data = $('#userListchaxun').serializeObject();
       data.type = 1;
       data.pageNo = fanye.current;
       data.pageSize = fanye.limit;

	   var url = "<%=ApiUtil.getUrl("/user/userlist.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   var data = {id:id};
	   var url = "<%=BusiConstant.ht_chongzhitongguo_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
   chongzhilist(1);


    function auditPass(id) {
        var data = {id:id, status: 1};
        var url = "<%=BusiConstant.shike_user_audit_do.getKey()%>";
        postdo(url, data, successCallBack,null, null);
    }

    function auditUnpass(id) {
        var reason = prompt("不通过原因","")
        if (reason!=null && reason!="") {
            var data = {id:id, status: 2, remark: reason};
            var url = "<%=BusiConstant.shike_user_audit_do.getKey()%>";
            postdo(url, data, successCallBack,null, null);
        } else {
            alert("请输入审核不通过原因")
        }
    }

    function editTaoqizhi(id) {
        var taoqizhi = prompt("请输入淘气值","")
        if (taoqizhi!=null && taoqizhi!="") {
            var data = {id:id, taoqizhi: taoqizhi};
            var url = "<%=BusiConstant.shike_update_taoqizhi_do.getKey()%>";
            postdo(url, data, successCallBack,null, null);
        }
    }
    
    function successCallBack(data) {
        alert("操作成功")
        chongzhilist(fanye.current);
    }
   
</script>