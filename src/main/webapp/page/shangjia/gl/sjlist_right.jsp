<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
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

	var table = createtable("listtable");
	
	var sourcetdfun =  function(row){
        var noTaobao = row.source+"<button type='button' onclick='editsource("+row.id+")'>修改</button>&nbsp;";
        return noTaobao;
    }
	
	var remarktdfun =  function(row){
        var noTaobao = row.remark+"<button type='button' onclick='editremark("+row.id+")'>修改</button>&nbsp;";
        return noTaobao;
    }
	
	table.th = [{w:100,na:"编号",colname:"id"}
	,{w:200,na:"商家姓名",colname:"name"}
	,{w:80,na:"手机号",colname:"phone"}
	,{w:80,na:"qq账号",colname:"noQq"}
	,{w:50,na:"余额",colname:"yue"}
	,{w:80,na:"创建时间",colname:"createdTimeStr"}
	,{w:200,na:"商家来源",callfun:sourcetdfun}
	,{w:200,na:"备注",callfun:remarktdfun}];
	
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
	   var data = {type:2};
       data.pageNo = fanye.current;
       data.pageSize = fanye.limit;
	   var url = "<%=BusiConstant.shike_userlist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   var data = {id:id};
	   var url = "<%=BusiConstant.ht_chongzhitongguo_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
   chongzhilist(1);
	
	function editsource(id) {
        var source = prompt("请输入商家来源","")
        if (source!=null && source!="") {
            var data = {id:id, source: source};
            var url = "<%=BusiConstant.shike_update_source_do.getKey()%>";
            postdo(url, data, editCallBack,null, null);
        }
    }

	function editremark(id) {
        var source = prompt("请输入商家备注","")
        if (source!=null && source!="") {
            var data = {id:id, remark: source};
            var url = "<%=ApiUtil.getUrl("/user/updateRemark.do")%>";
            postdo(url, data, editCallBack,null, null);
        }
    }
	
    function editCallBack(data) {
        chongzhilist(fanye.current);
    }
   
</script>