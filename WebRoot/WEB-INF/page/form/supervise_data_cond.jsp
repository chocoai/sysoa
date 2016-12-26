<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jsPlugin/layui/layui.js"></script>
<link href='jsPlugin/layui/css/layui.css' rel=stylesheet />
<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<script src="jsPlugin/laydate/laydate.js"></script>
<script src='js/jquery.min.js'></script>
<link href='css/form-style.css' rel='stylesheet' />
<script src="jsPlugin/jqprint/jQuery.print.js"></script>
</head>
<body>
	<div class="form-div">

		<div class="ui segment no-print">
			<form class="layui-form layui-form-pane layui-box">
				<div class="layui-form-item">
					<label class="layui-form-label">日期范围</label>
					<div class="layui-input-inline">
						<input class="layui-input" id="start" placeholder="开始日"
							onclick="layui.laydate({elem: this, istime: false, format: 'YYYY-MM-DD'})">
					</div>
					<div class="layui-input-inline">
						<input class="layui-input" id="end" placeholder="截止日"
							onclick="layui.laydate({elem: this, istime: false, format: 'YYYY-MM-DD'})">
					</div>
				</div>
			</form>
			<button class="layui-btn layui-btn-normal" onclick="findCondiction()">查询</button>
		</div>

		<div class="layui-tab layui-tab-brief">
			<ul class="layui-tab-title">
				<li class="layui-this">来文单位</li>
				<li>承办单位</li>
			</ul>
			<div class="layui-tab-content print">
				<div class="layui-tab-item layui-show">
					<jsp:include page="../table/supervise_data_rec.jsp"></jsp:include>
				</div>
				<div class="layui-tab-item print">
					<jsp:include page="../table/supervise_data_require.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</body>
<script>


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
//周数
function getYearWeek(date){  
    var date2=new Date(date.getFullYear(), 0, 1);  
    var day1=date.getDay();  
    if(day1==0) day1=7;  
    var day2=date2.getDay();  
    if(day2==0) day2=7;  
    d = Math.round((date.getTime() - date2.getTime()+(day2-day1)*(24*60*60*1000)) / 86400000);    
    return Math.ceil(d /7)+1;   
} ;

	layui.use(['form', 'laydate', 'element'], function() {
		var form = layui.form(), element = layui.element();
	});
	
	//渲染页面
	var render = function(res){
        var ele = '';
		if(res){
				$(res.page.list).each(function(j, jtem){
						
						var s = new Date(jtem.START.replace(/-/g,"/"))
						var e = new Date(jtem.END.replace(/-/g,"/")) 
						ele += "<tr>";
						ele += '<td >'+jtem.LEADERNAME+'</td>';
						ele += '<td >'+s.format('MM月dd日 hh:mm')+'-'+e.format('MM月dd日 hh:mm')+'</td>';
						ele += '<td >'+jtem.SUBJECT+'</td>';
						ele += '<td >'+jtem.SCH_POSITION+'</td>';
						ele += '<td ></td>';
						ele += "</tr>";
				});
		}
		
		$('.layui-table tbody').html(ele);
		
		//合并单元格
         $('.layui-table').rowspan(0);
	};
	
	var _render = function(){
		
		
	};
	
	function findCondiction(){ 
		layui.use('layer', function() {
			var layer = layui.layer;
			var abc = layer.load(0, { time: 10 * 1000 });
			
			if($('#start').val() && $('#end').val()){
				var start = new Date($('#start').val().replace(/-/g,"/"));
				var end = new Date($('#end').val().replace(/-/g,"/"));	
				
				//var fs = new Date($('#start').val());
				//var fe = new Date($('#end').val());
				
				var str = getYearWeek(start);
				$('table caption').text(start.getFullYear()+'年 第'+str+'周  ('+start.format('MM月dd日 ')+'至'+end.format('MM月dd日')+')');
				 
				$.getJSON("leaderSchedule/oneweektable", { num:1, size:100, start:Math.round(start.getTime()/1000), end:Math.round(end.getTime()/1000)}, function(data){
					
					render(data);
					
					layer.close(abc);
					
				});
			}else{
					 layer.msg('请完整输入日期范围', {
	                     icon: 5,
	                     anim: 6
	                 });
			}
		});
	}
	
	/**jqprint 实现网页局部打印
	 ***/
	//<![CDATA[
	    function JQprint() {
	        //Print ele4 with custom options
	        $(".print").print({
	            //Use Global styles
	            globalStyles: true,
	            //Add link with attrbute media=print
	            mediaPrint: true,
	            //Custom stylesheet
	            //stylesheet : $('#basepath').val()+"css/login.jsp.css",
	            //Print in a hidden iframe
	            iframe: true,
	            //Don't print this
	            noPrintSelector: ".no-print"
	            //Add this at top
	            // prepend : "兰州市公安局<br/>",
	            //Add this on bottom
	            //append: '<br/><footer align="center">兰州市公安局</footer>'
	        });
	    };
	    // Fork https://github.com/sathvikp/jQuery.print for the full list of options
	//]]>
	
</script>
</html>