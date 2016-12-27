<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='jsPlugin/layui/css/layui.css' rel=stylesheet />
<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<link href='css/form-style.css' rel='stylesheet' />
<script src="jsPlugin/laydate/laydate.js"></script>
<script src='js/jquery.min.js'></script>
<script src="jsPlugin/layui/layui.js"></script>
<script src="js/util.js"></script>
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

	layui.use(['form', 'laydate', 'element'], function() {
		var form = layui.form(), element = layui.element();
	});
	
	//渲染页面
	var render = function(res){
        var ele = '';
		if(res){
				$(res).each(function(j, jtem){
						var sum = jtem.sum == null ? '':jtem.sum;
						var done = jtem.done == null ? '':jtem.done;
						var doing = jtem.doing == null ? '':jtem.doing;
						ele += "<tr>";
						ele += '<td >'+formartDic(jtem.user_organiz_type, 'CODE_ORGANIZ_TYPE')+'</td>';
						ele += '<td >'+jtem.user_organiz_name+'</td>';
						ele += '<td >'+sum +'</td>';
						ele += '<td >'+done+'</td>';
						ele += '<td >'+doing +'</td>';
						ele += '<td > </td>';
						ele += "</tr>";
				});
		}
		
		$('#supervise_list01 tbody').html(ele);
		
		//合并单元格
        $('#supervise_list01 tbody').rowspan(0);
	};
	
	var _render = function(res){
		  var ele = '';
			if(res){
					$(res.list).each(function(j, jtem){
							j=j+1;
							ele += "<tr>";
							ele += '<td >'+j+'</td>';
							ele += '<td >'+new Date(jtem.rec_time).format("MM月dd日")+'</td>';
							ele += '<td >'+formartDic(jtem.rec_organiz_id, 'CODE_REC_ORGANIZS')+'</td>';
							ele += '<td >'+jtem.rec_sno+'</td>';
							ele += '<td >'+jtem.info_title+'</td>';
							ele += '<td >'+jtem.info_con+'</td>';
							ele += '<td >'+_organiz(jtem.require_organiz_id)+'</td>';
							ele += '<td >'+formartDic(jtem.info_type, 'CODE_EVENT_SUPERVISE')+'</td>';
							ele += '<td >'+formartDic(jtem.progress_status, 'CODE_HANDLE_STATIUS')+'</td>';
							var _con = findprogressinfo(jtem.progress_id);
							ele += '<td >'+_con+'</td>';
							ele += "</tr>";
					});
			}
			
			$('#supervise_list02 tbody').html(ele);
	};
	function findprogressinfo(progress_id){
		$.ajaxSettings.async = false;
		var con = '';
		$.getJSON("supervise/progress/info/query3", { num:1, size:100000, progress_id: progress_id }, function(data){
			$(data.list).each(function(i, item){
				con += '<p>'+ item.progress_info_con +'</p>';
			});
		});
		return con;
	}
	function findCondiction(){ 
		layui.use('layer', function() {
			
			var layer = layui.layer;
			var abc = "";
			
			if($('#start').val() && $('#end').val()){
				 abc = layer.load(0, { time: 10 * 1000 });
				/* var start = new Date($('#start').val().replace(/-/g,"/"));
				var end = new Date($('#end').val().replace(/-/g,"/"));	 */
				//var fs = new Date($('#start').val());
				//var fe = new Date($('#end').val());
				var start = $('#start').val();
				var end = $('#end').val();
				//var str = getYearWeek(start);
				//$('table caption').text(start.getFullYear()+'年 第'+str+'周  ('+start.format('MM月dd日 ')+'至'+end.format('MM月dd日')+')');
				 //start:Math.round(start.getTime()/1000)
				$.getJSON("supervise/info/getcountfororganiz", {start:start, end:end}, function(data){
					
					render(data);
					
					layer.close(abc);
					
				});
				$.getJSON("supervise/info/getcountforall", { num:1, size:100000, start:start, end:end}, function(data){
					
					_render(data);
					
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
	function _isnan(ct) {
	    if (ct == 'NaN' || ct == '' || ct == 'underfined') {
	        return null;
		}
	}
	

	/**jqprint 实现网页局部打印
	 ***/
	    function JQprint() {
	        //Print ele4 with custom options
	        $(".print").print({
	            //Use Global styles
	            globalStyles: true,
	            //Add link with attrbute media=print
	            mediaPrint: true,
	            //importCSS: true,
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
</script>
</html>