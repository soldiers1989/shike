//封装table类
function createtable(tableid) {
	this.tableid = tableid;
	this.th = [];
	this.data = [];
	this.thinit = function(){
		var theadhtml = "<tr class='trhead'>";     
		for(var i=0;i<this.th.length;i++){
			var row = this.th[i];
			theadhtml += "<td width='"+row.w+"'>";
			theadhtml += "<strong>"+row.na+"</strong>";
			theadhtml += "</td>";      
		}
		theadhtml += "</tr>";
		$("#"+this.tableid+" thead").append(theadhtml);
	};
	
	this.tdinit = function(){
		if(this.data){
			var html = "";
			$("#"+this.tableid+" tbody").html(html);
			for(var i=0;i<this.data.length;i++){
				var trhtml =   "<tr class='trbody'> "  
				var row = this.data[i];
				for(var j =0;j<this.th.length;j++){
					var th = this.th[j];
					var td = "<td width='"+th.w+"'>" ;
					if(th.callfun){
						var temptd = th.callfun(row);
						if(!temptd){
							temptd = "";
						}
						td += temptd;
					}else{
						td += this.tddef(row,th);
					}
					td += "</td>";
					trhtml+=td;
				}	
				trhtml += "</tr> "  
				html += trhtml;
			}
			$("#"+this.tableid+" tbody").append(html);
		}
	};
	this.tddef = function(row,th){
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
		if(!colval){
			colval = "";
		}	
		tdinner+= colval+"</em>";
		return tdinner;
	};
	this.getrow = function(id){
		for(var i=0;i<this.data.length;i++){
			var row = this.data[i];
			if(row.id == id){
				return row;
			}
		}
		return null;
	}
	return this;
};

