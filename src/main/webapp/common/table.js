//封装table类
function createtable(tableid) {
	var talbeobj ={};
	talbeobj.tableid = tableid;
	talbeobj.th = [];
	talbeobj.data = [];
	talbeobj.thinit = function(){
		var theadhtml = "<tr class='trhead'>";     
		for(var i=0;i<talbeobj.th.length;i++){
			var row = talbeobj.th[i];
			theadhtml += "<td width='"+row.w+"'>";
			theadhtml += "<strong>"+row.na+"</strong>";
			theadhtml += "</td>";      
		}
		theadhtml += "</tr>";
		$("#"+talbeobj.tableid+" thead").append(theadhtml);
	};
	
	talbeobj.tdinit = function(){
		if(talbeobj.data){
			var html = "";
			$("#"+talbeobj.tableid+" tbody").html(html);
			for(var i=0;i<talbeobj.data.length;i++){
				var trhtml =   "<tr class='trbody'> "  
				var row = talbeobj.data[i];
				for(var j =0;j<talbeobj.th.length;j++){
					var th = talbeobj.th[j];
					var td = "<td width='"+th.w+"'>" ;
					if(th.callfun){
						var temptd = th.callfun(row);
						if(!temptd && temptd != 0){
							temptd = "";
						}
						td += temptd;
					}else{
						td += talbeobj.tddef(row,th);
					}
					td += "</td>";
					trhtml+=td;
				}	
				trhtml += "</tr> "  
				html += trhtml;
			}
			$("#"+talbeobj.tableid+" tbody").append(html);
		}
	};
	talbeobj.tddef = function(row,th){
		var colname = th.colname;
		var tdinner = " <em style=\"color: #a9a9a9;\">";
		var colval = row[th.colname];
		if(colname.indexOf('.')>0){
			var vals = colname.split('.');
			colval = row;
			for(var i=0;i<vals.length;i++){
				colval = colval[vals[i]];
			}		
		}
		if(!colval && colval != 0){
			colval = "";
		}	
		tdinner+= colval+"</em>";
		return tdinner;
	};
	talbeobj.getrow = function(id){
		if(talbeobj.data){
			for(var i=0;i<talbeobj.data.length;i++){
				var row = talbeobj.data[i];
				if(row.id == id){
					return row;
				}
			}
		}
		return null;
	}
	return talbeobj;
};

