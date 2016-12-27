
//全局的AJAX访问，处理AJAX清求时SESSION超时
$.ajaxSetup({
    contentType:"application/x-www-form-urlencoded;charset=utf-8",
    complete:function(XMLHttpRequest,textStatus){
          //通过XMLHttpRequest取得响应头，sessionstatus           
          var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); 
          loginUrl = XMLHttpRequest.getResponseHeader("location"); 
          if(sessionstatus=='00004'){
               //这里怎么处理在你，这里跳转的登录页面
        	 // if( window.top != window.self ){
  				window.top.location = loginUrl;
  			//}
       }
    }
});


var dicMap={};
/**
 * 数得数据字典文本
 * @param code
 */
function getDicText(code,fun){
    $.ajax({
        type:"post",
        url:"dicList",
        data:{code:code},
        dataType:"json",
        async:false,
        success:function(data){
            fun(data);
        }
    });
}
 
/**
 * 缓数数据字典
 * @param value
 * @param rowData
 */
function cacheDic(value,code){
    if(dicMap[code]==undefined){
        getDicText(code,function(data){
            if((typeof data=='object')&&data.constructor==Array){
                var obj={};
                $(data).each(function(i,item){
                    if(item.value!="!"){
                        obj[item.value]=item.text;
                    }
                });
                dicMap[code]=obj;
            }
        });
    }
    if(dicMap[code][value]==undefined){
        return "";
    }
    return dicMap[code][value];
}
/**
 * 格式化数据字典
 * @param value
 * @param rowData
 * @param rowIndex
 */
function formartDic(value,code){
    return cacheDic(value,code);
}

var _organizs = "";
function idtoName(){
	if(!_organizs){
		$.getJSON("dicOrganiz", function(data){
			_organizs = data;
		});
	}
}

function _organiz01(id){
	var s =''; 
	$(_organizs).each(function(i,item){
		
		if(item.id == id){
			s = item.user_organiz_name;
			
		}
	});
	return s;
}
function _organiz(id){
	var str = '';
	id = id +'';
	var i = id.split(',');
	if(i.length > 1){
		$(id.split(',')).each(function(j,jitem){
			$(_organizs).each(function(i,item){
				
				if(item.id == jitem){
					if(str.length >0){str += '、';}
					str += item.user_organiz_name;
					
				}
			});
		});
	}else{
		
		$(_organizs).each(function(i,item){
			
			if(item.id == id){
				str = item.user_organiz_name;
				
			}
		});
	}
	return str;
}
idtoName();

(function ($) {  
    $.fn.extend({  
        //表格合并单元格，colIdx要合并的列序号，从0开始  
        "rowspan": function (colIdx) {  
            return this.each(function () {  
                var that;  
                $('tr', this).each(function (row) {  
                    $('td:eq(' + colIdx + ')', this).filter(':visible').each(function (col) {  
                        if (that != null && $(this).html() == $(that).html()) {  
                            rowspan = $(that).attr("rowSpan");  
                            if (rowspan == undefined) {  
                                $(that).attr("rowSpan", 1);  
                                rowspan = $(that).attr("rowSpan");  
                            }  
                            rowspan = Number(rowspan) + 1;  
                            $(that).attr("rowSpan", rowspan);  
                            $(this).hide();  
                        } else {  
                            that = this;  
                        }  
                    });  
                });  
            });  
        }  
    });  
  
})(jQuery); 
//日期格式化
Date.prototype.format = function(format) {  
    /* 
     * eg:format="yyyy-MM-dd hh:mm:ss"; 
     */  
    var o = {  
        "M+" : this.getMonth() + 1, // month  
        "d+" : this.getDate(), // day  
        "h+" : this.getHours(), // hour  
        "m+" : this.getMinutes(), // minute  
        "s+" : this.getSeconds(), // second  
        "q+" : Math.floor((this.getMonth() + 3)/3), // quarter  
        "S" : this.getMilliseconds()  
        // millisecond  
    }  
  
    if (/(y+)/.test(format)) {  
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4  
                        - RegExp.$1.length));  
    }  
  
    for (var k in o) {  
        if (new RegExp("(" + k + ")").test(format)) {  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1  
                            ? o[k]  
                            : ("00" + o[k]).substr(("" + o[k]).length));  
        }  
    }  
    return format;  
}  