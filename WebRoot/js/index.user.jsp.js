function close(dom) {
	$(dom).parent().model('hide');
}
// 新增接待申请的弹层
function apply() {
	$('#add').modal('show');

	$('#add .form').form({
		fields : {
			start : {
				identifier : 'oo.persion_start_time',
				rules : [ {
					type : 'empty',
					prompt : '请输入抵达时间'
				} ]
			},
			end : {
				identifier : 'oo.persion_end_time',
				rules : [ {
					type : 'empty',
					prompt : '请输入离开时间'
				} ]
			},
			name : {
				identifier : 'oo.persion_name',
				rules : [ {
					type : 'empty',
					prompt : '请输入接待人姓名'
				} ]
			},
			position : {
				identifier : 'oo.persion_position',
				rules : [ {
					type : 'empty',
					prompt : '请输入接待人职务'
				} ]
			},
			depart : {
				identifier : 'oo.persion_depart',
				rules : [ {
					type : 'empty',
					prompt : '请输入接待人所在部门'
				} ]
			},
			popurs : {
				identifier : 'oo.persion_purpose_tolz',
				rules : [ {
					type : 'empty',
					prompt : '请输入来栏目的'
				} ]
			}
		},
		inline : true,
		on : 'blur'
	});
}
//提交申请
function addApply() {
	
   var d = $("#applyForm").serialize();
	$.ajax({
		
		type: "POST",
		url : 'apply/addUserApplyEvent',
		data : $("#applyForm").serialize(),
		success : function(data) {
			// your code
			$('#add').modal('hide');
			result1();
		}
	});
}
//提交申请
function updApply() {

	$.ajax({
		url : 'apply/updUserApplyEvent',
		data : $("#updapplyForm").serialize(),
		success : function(data) {
			$('#add').modal('hide');
			result1();
		}
	});
}
//修改申请
function edit(dom) {
	var data = $(dom).attr('data');
	var msg = JSON.parse(data);

	//拼接弹出层
	//赋值
	$('#updapplyForm #appid').val(msg.apply_id);
	$('#updapplyForm #start').val(msg.start.substr(0, 10));
	$('#updapplyForm #end').val(msg.end.substr(0, 10));
	$('#updapplyForm #name').val(msg.persionName);
	$('#updapplyForm #position').val(msg.persionPosition);
	$('#updapplyForm #depart').val(msg.persionDepart);
	$('#updapplyForm #purpose').val(msg.persionPurpose);

	//弹层
	$('#upd').modal('show');

}
//删除
function del(dom) {
	var id = $(dom).attr('data');
	//提示
	$(dom).popup({
		on : 'click'
	})
	//删除
	$.ajax({
		url : 'apply/delUserApplyEvent',
		data : {
			id : id
		},
		success : function(data) {
			//刷新页面
			if (data.isSuccess) {
				$(dom).parent().parent().remove();
			}

		}
	});

}
//查看要求
function require(dom) {
	var data = $(dom).attr('data');
	var msg = JSON.parse(data);
	//赋值

	$('#applyForm2 .start').val(msg.persion_start_time.substr(0, 10));
	$('#applyForm2 .end').val(msg.persion_end_time.substr(0, 10));
	$('#applyForm2 .name').val(msg.persion_name);
	$('#applyForm2 .position').val(msg.persion_position);
	$('#applyForm2 .depart').val(msg.persion_depart);
	$('#applyForm2 .purpose').val(msg.persion_purpose_tolz);

	$('#applyForm2 #organiz').val(msg.require_user_organiz);
	
	$('#applyForm2 #trip').val(msg.require_trip);
	$('#applyForm2 #users').val(msg.require_users);
	$('#applyForm2 #cars').val(msg.require_cars);
	$('#applyForm2 #live').val(msg.require_live);
	$('#applyForm2 #route').val(msg.require_route);
	$('#applyForm2 #cdate').val(msg.cdate.substr(0, 19));

	$('#upd2 .button').attr('data', msg.require_id);

	//判断是填写了反馈信息
	feedinfo(msg.require_id);

	//下拉菜单初始化
	$('#applyForm2 .dropdown').dropdown({
		maxSelections : 3

	});
	//弹层
	$('#upd2').modal('show');

}

//获取反馈信息
function feedinfo(requireid) {

	$.ajax({
		url : 'feed/getFeedbyRequireId',
		data : {
			id : requireid
		},
		success : function(data) {
			data = eval(data);
			if (data.isSuccess) {
				var feed = data.list;
				if (feed && feed.length > 0) {
					var con = feed[0].feed_con;
					$('#applyForm2 .feed-con').val(con);
					$('#applyForm2 #feed').addClass("disabled");
					$('#upd2 #com-feed').addClass("disabled");
				}
			}

		}
	});
}

function addfeed(dom) {
	var id = $(dom).attr('data');
	var feed = $('#applyForm2 .feed-con').val();

	if (id && feed) {
		//反馈提交
		$.ajax({
			url : 'feed/addFeed',
			data : {
				id : id,
				feed : feed
			},
			success : function(data) {
				// your code
				alert(date);
			}
		});
	}
	//关闭弹层
	$('#upd2').modal('hide');
	result2();
}
//完成
function finished(dom) {
	var id = $(dom).attr('data');

	$.ajax({
		url : 'apply/finishApply',
		data : {
			id : id
		},
		success : function(data) {
			if (data.isSuccess) {
				//数据初始化
				$(dom).parent().parent().remove();
			}
		}
	});
}

function result1(){
	//加载数据1 
	$
			.ajax({
				url : "apply/getUserDurationEvent",
				beforeSend : function() {
					/* 	layui.use('layer', function() {

							var layer = layui.layer;
							var abc = layer.load(0, {time: 10*1000});
							
						}); */
				},
				success : function(data) {
					$("#data1").removeClass('dimmer');
					//拼接数据
					var element = "";
					var msgs1 = eval(data);

					for (var i = 0; i < msgs1.length; i++) {

						msg = msgs1[i];
						
						var dis = msg.approval_flag == '1' ? 'disabled':'';
						var _dis = msg.approval_flag == '1' ? '':'disabled';
						var close = msg.approval_flag == '1' ? '':"<i class='close "+dis+" icon' title='删除' data='"+ msg.id+ "' onclick='del(this)'></i>";
						
						element += "<div class='card' ondblclick= 'edit(this)' title='双击查看详情' data='"+JSON.stringify(msg)+"' style='cursor: pointer;'><div class='content'>";
						element += close;
						element += '<div class="header">' ;
						if (msg.approval_flag == '1') {
							element += '<i class="check green circle icon" title="已审批"></i>';
						} else if(msg.approval_flag == '2'){
							element += '<i class="Warning red Circle icon" title="已拒绝"></i>';
							
						}else{
							element += '<i class="Warning yellow Circle icon" title="未审批"></i>';
						}

						element += msg.title+'</div>';
						element += '<div class="description"><p>'
								+ msg.persionPosition + '</p></div>';
						element += '<div class="description"><p>'
								+ msg.persionPurpose + '</p></div>';
						element += '<div class="description"><p>'
								+ msg.start.substr(0, 10) + '~'
								+ msg.end.substr(0, 10) + '</p></div></div>';
						element += '<div class="ui buttons">'
						element += '<button class="ui blue button ' + _dis
								+ '" data="' + msg.id
								+ '" onclick="finished(this)">完成</button>'
						/*
						 * element += "<button class='ui green button' data='" +
						 * JSON.stringify(msg) + "'
						 * onclick='parent.edit(this)'>修改</button>";
						 */
						element += '</div></div>';
				

					}

					$("#con-lef").html(element);
				}
			});
	
}

function result2(){
	//加载数据2
	$
			.ajax({
				url : "apply/getUserEvent",
				success : function(data) {
					$("#data2").removeClass('dimmer');
					//拼接数据
					var element = "";
					var msgs = eval(data);

					for (var i = 0; i < msgs.length; i++) {

						msg = msgs[i];

						element += "<div class='card' ondblclick= 'require(this)' title='双击查看详情' data='"
								+ JSON.stringify(msg)
								+ "' style='cursor: pointer;'><div class='content'>";
						element += '<div class="header">';
						if (msg.confirm_flag == '0') {
							element += '<i class="Warning red circle icon" title="意见被拒绝/反馈意见未同意"></i>';
						} else if (msg.confirm_flag == '1') {
							element += '<i class="Warning yellow Circle icon" title="要求未被全部确认"></i>';
						} else if (msg.confirm_flag == '2') {
							element += '<i class="check green Circle icon" title="反馈意见被确认"></i>';
						}
						element += msg.persion_name+'</div>';
						element += '<div class="description"><p>'
								+ msg.persion_position + '</p></div>';
						element += '<div class="description"><p>'
								+ msg.persion_purpose_tolz + '</p></div>';
						element += '<div class="description"><p>'
								+ msg.persion_start_time.substr(0, 10) + '~'
								+ msg.persion_end_time.substr(0, 10)
								+ '</p></div></div>';

						var dis0 = msg.confirm_flag == '2' ? '' : 'disabled';
						element += '<div class="ui buttons"><button class="ui blue '
								+ dis0
								+ ' button" data="'
								+ msg.apply_id
								+ '" onclick="finished(this)">完成</button>';

						element += "</div></div>";
					}
					$("#con-rig").html(element);
				}
			});
}

window.onload = function() {
	//加载日期插件
	laydate({
		elem : '#applyForm .stime',
		isdate : true,
		min : laydate.now(),
		format : 'YYYY-MM-DD '
	});
	laydate({
		elem : '#applyForm .etime',
		isdate : true,
		min : laydate.now(),
		format : 'YYYY-MM-DD '
	/* 		choose: function(datas){
	 var tstart =  new Date($('#start').val().replace(/-/g,"/"));
	 var tend =  new Date(datas.replace(/-/g,"/"));
	
	 if(tstart.getTime()<tend.getTime()){
	
	 }else{
	
	
	 }
	 } */
	});

	//选项卡初始化
    layui.use(['layer', 'element'], function() {
        var layer = layui.layer,
            element = layui.element();
       // var abc = layer.load(0, { time: 10 * 1000 });
    });
	
	result1();
	result2();
}