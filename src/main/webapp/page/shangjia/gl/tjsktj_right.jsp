<%@page import="co.kensure.mem.DateUtils"%>
<%@page import="java.util.Date"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	Date date1 = new Date();
	Date date2 = DateUtils.getPastDay(date1, 1);	
	String start = DateUtils.format(date1,DateUtils.DAY_FORMAT);
	String end = DateUtils.format(date2,DateUtils.DAY_FORMAT);
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="shiy_ti">
        <form id="userListchaxun">
            <span style="float:none;margin-right:5px;">生成时间</span>
        <input name="startCreatedTime" type="date" value="<%=start%>">至
        <input name="endCreatedTime" type="date" value="<%=end%>" >
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
	
	table.th = [{w:50,na:"编号",colname:"refereeId"}
	,{w:80,na:"手机号",colname:"user.phone"}
	,{w:80,na:"qq账号",colname:"user.noQq"}
	,{w:80,na:"创建时间",colname:"user.createdTimeStr"}
	,{w:100,na:"推荐人员数",colname:"cnt"}];
	
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

       var data = $('#userListchaxun').serializeObject();
       data.type = 1;
       data.pageNo = fanye.current;
       data.pageSize = fanye.limit;

	   var url = "<%=ApiUtil.getUrl("/user/tjtj.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
      
   chongzhilist(1);
   
</script>