function apply() {
	$('#apply').modal('show');
	
	$('#apply .form').form({
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
			},
			organiz : {
				identifier : 'or.require_user_organiz',
				rules : [ {
					type : 'empty',
					prompt : '请输入接待部门'
				} ]
			},
			trip : {
				identifier : 'or.require_trip',
				rules : [ {
					type : 'empty',
					prompt : '请输入行程安排'
				} ]
			},
			users : {
				identifier : 'or.require_users',
				rules : [ {
					type : 'empty',
					prompt : '请输入陪同人员'
				} ]
			},
			cars : {
				identifier : 'or.require_cars',
				rules : [ {
					type : 'empty',
					prompt : '请输入用车要求'
				} ]
			},
			live : {
				identifier : 'or.require_live',
				rules : [ {
					type : 'empty',
					prompt : '请输入住宿要求'
				} ]
			},
			route : {
				identifier : 'or.require_route',
				rules : [ {
					type : 'empty',
					prompt : '请输入行车路线'
				} ]
			}
		},
		inline : true,
		on : 'blur'
	});
}
//提交申请
function addApply() {

	var ss = $("#apply form").serialize();
	
	if(ss){
	$.ajax({
		url : 'apply/addMangerApplyEvent',
		data : ss,
		success : function(data) {
			// your code
		}
	});
	}
	
}

//加载数据1 
function result1() {
	$
			.ajax({

				url : "apply/getManagerDurationEvent",
				success : function(data) {
					$("#data1").removeClass('dimmer');
					//拼接数据
					var element = "";
					var msgs = eval(data);

					for (var i = 0; i < msgs.length; i++) {

						msg = msgs[i];
						element += "<div class='card' ondblclick= 'lookApply(this)' title='双击查看详情' data='"+JSON.stringify(msg)+"' style='cursor: pointer;'><div class='content'>";
						element += '<div class="header">';
						if (msg.approval_flag == '1') {
							element += '<i class="check green circle icon" title="已审批"></i>';
						} else if(msg.approval_flag == '2'){
							element += '<i class="Warning red Circle icon" title="已拒绝"></i>';
							
						}else{
							element += '<i class="Warning yellow Circle icon" title="未审批"></i>';
						}
						element +=  msg.persion_name+'</div>';
						element += '<div class="description"><p>'
								+ msg.persion_position + '</p></div>';
						element += '<div class="description"><p>'
								+ msg.persion_purpose_tolz + '</p></div>';
						element += '<div class="description"><p>申请部门：'
								+ msg.user_organiz_name + '</p></div>';
						element += '<div class="description"><p>'
								+ msg.persion_start_time.substr(0, 10) + '~'
								+ msg.persion_end_time.substr(0, 10)
								+ '</p></div></div>';
						element += '<div class="ui buttons">';
						/*	if (msg.approval_flag == '0') {
								element += '<button class="ui green button" data="'
										+ msg.apply_id
										+ '" onclick="updApply(this)">审批</button>';
							}*/
						element += "<button class='ui blue button' data='"
								+ JSON.stringify(msg)
								+ "' onclick='lookApply(this)'>查看详情</button></div></div>";
					}
					$("#con-lef").html(element);
				}
			});
}
//加载数据2
function result2() {
	$
			.ajax({

				url : "apply/getManagerEvent",
				success : function(data) {
					$("#data2").removeClass('dimmer');
					//拼接数据
					var element = "";
					var msgs = eval(data);

					for (var i = 0; i < msgs.length; i++) {

						msg = msgs[i];
						element += "<div class='card' data='"
							+ JSON.stringify(msg)
							+ "' ondblclick='detail(this)' title='双击查看详情' style='cursor: pointer;'><div class='content'>" ;
									/*"<i class='close icon' title='删除' data='"
									+ msg.apply_id
									+ "' onclick='delApply(this)'></i>";*/
						element += '<div class="header">';
						if (msg.confirm_flag == '0') {
							element += '<i class="Warning red circle icon" title="意见被拒绝/未填写意见"></i>';
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
						element += '<div class="ui buttons"><button class="ui blue button" data="'
								+ msg.require_id
								+ '" onclick="feeds(this)">反馈</button>';
						if (msg.confirm_flag == '2') {
							element += '<button class="ui green button" data="'
									+ msg.require_id
									+ '" onclick="addmodel(this)">下载</button>';
						} else {
							element += '<button class="ui  green button disabled" data="'
									+ msg.require_id
									+ '" onclick="addmodel(this)">下载</button>';
						}

						element += "</div></div>";
					}
					$("#con-rig").html(element);
				}
			});
}
window.onload = function() {
	//加载日期插件
	laydate({
		elem : '#start',
		isdate : true,
		min : laydate.now(),
		format : 'YYYY-MM-DD '
	});
	laydate({
		elem : '#end',
		isdate : true,
		min : laydate.now(),
		format : 'YYYY-MM-DD ',
		choose : function(datas) {
			var tstart = new Date($('#start').val().replace(/-/g, "/"));
			var tend = new Date(datas.replace(/-/g, "/"));

			if (tstart.getTime() < tend.getTime()) {

			} else {

			}
		}
	});
	//下拉菜单初始化
	$('#apply .dropdown').dropdown({
		maxSelections : 3

	});
	//选项卡初始化
    layui.use(['layer', 'element'], function() {
        var layer = layui.layer,
            element = layui.element();
       // var abc = layer.load(0, { time: 10 * 1000 });
    });

	//表单验证
	$('.ui.form').form({
		fields : {
			name : {
				identifier : 'oo.persion_name',
				rules : [ {
					type : 'empty',
					prompt : '请输入接待人姓名'
				} ]
			}
		},
		inline : true,
		on : 'blur'
	});
	result1();
	result2();
}

//下发任务详情
function detail(dom) {

	var data = $(dom).attr('data');
	var msg = JSON.parse(data);

	//赋值
	$('#updApply .start').val(msg.persion_start_time.substr(0, 10));
	$('#updApply .end').val(msg.persion_end_time.substr(0, 10));
	$('#updApply .name').val(msg.persion_name);
	$('#updApply .position').val(msg.persion_position);
	$('#updApply .depart').val(msg.persion_depart);
	$('#updApply .purpose').val(msg.persion_purpose_tolz);

	$('#updApply #organiz').val(msg.require_user_organiz);

	$('#updApply #trip').val(msg.require_trip);
	$('#updApply #users').val(msg.require_users);
	$('#updApply #cars').val(msg.require_cars);
	$('#updApply #live').val(msg.require_live);
	$('#updApply #route').val(msg.require_route);


	//控件初始化

	$('#updApply .dropdown').dropdown({
		maxSelections : 3
	});
	$('#updApply').modal('show');
}

//申请详情
function lookApply(dom) {
	var data = $(dom).attr('data');
	var msg = JSON.parse(data);

	//拼接弹出层
	//赋值
	$('#lookApply .start').val(msg.persion_start_time.substr(0, 10));
	$('#lookApply .end').val(msg.persion_end_time.substr(0, 10));
	$('#lookApply .name').val(msg.persion_name);
	$('#lookApply .position').val(msg.persion_position);
	$('#lookApply .depart').val(msg.persion_depart);
	$('#lookApply .purpose').val(msg.persion_purpose_tolz);
	$('#lookApply .organiz').val(msg.user_organiz_name);
	$('#lookApply .button').attr("data", msg.apply_id);
	var op = $('#lookApply option[value='+ msg.approval_flag + ']');
	op.attr("selected", true);// select的值
	$('#lookApply #con').val(msg.approval_con);
	
	
	if (msg.approval_flag == '1') { 
		$('#lookApply .button').addClass("disabled");
	} else if (msg.approval_flag == '0' || msg.approval_flag == '2') {
		$('#lookApply .button').removeClass("disabled");
	}

	$('#lookApply .dropdown').dropdown();
	//弹层
	$('#lookApply').modal('show');

}

function updApply(dom) {
	var id = $(dom).attr('data');
	
	var con = $('#lookApply #con').val();
	var type = $('#lookApply #type').val();
	
	if(con && type){
		$.ajax({
			url : "apply/updapply",
			data : {
				id : id,
				con:con,
				type:type
			},
			success : function(data) {
				if (data.isSuccess) {
					$('#lookApply').modal('hide');
					// $(dom).remove();
					//window.location.reload();
					//加载数据1
	                result1();
				}
			}
		});
	}else{
		var ss = '类型或意见不能为空';
		$('#msg').text(ss);
		$('#msg').css("display","block");
	}
}

//查询反馈列表
function feeds(dom) {
	//$('#feeds').modal('show');
	var id = $(dom).attr('data');
	var elemrnt = '';
	$
			.ajax({
				url : "feed/getFeed2byRequireId",
				data : {
					id : id
				},
				success : function(data) {
					if (data.isSuccess) {
						var msgs = data.list;
						//拿到列表展示
						if (msgs.length > 0) {
							for (var i = 0; i < msgs.length; i++) {
								var msg = msgs[i];

								elemrnt += '<div class="ui horizontal divider">'
										+ msg.user_organiz_name + '</div>'
								elemrnt += '<div class="two fields ">';
								elemrnt += '	<div class="field disabled">';
								elemrnt += '			<label>反馈信息</label> <textarea rows="2" class="feed-con">'
										+ msg.feed_con + '</textarea>';
								elemrnt += '		</div>';
								elemrnt += '		<div class="field ">';
								elemrnt += '		  <label>操作</label>';
								if (msg.feed_status == '0') {
									elemrnt += '<button class=" ui green button" data="'
											+ msg.feed_id
											+ '" onclick="agreeFeed(this)">接受</button>';
								} else if (msg.feed_status == '1') {
									elemrnt += '<button class=" ui green button disabled" data="'
											+ msg.feed_id
											+ '" onclick="agreeFeed(this)">已接受</button>';
								}
								elemrnt += '		  <button class=" ui red button" data="'
										+ msg.feed_id
										+ '" onclick="refuseFeed(this)">退回</button>';
								elemrnt += '		</div>';
								elemrnt += '</div>';

							}
						} else {
							elemrnt += '<h1 class="red">暂无反馈信息</h2>';
						}
						$('#feedsForm').html(elemrnt);
						//弹层
						$('#feeds').modal('show');
					}
				}
			});

}

function agreeFeed(dom) {
	var id = $(dom).attr('data');
	$.ajax({
		url : "feed/updFeed",
		data : {
			id : id
		},
		success : function(data) {
			if (data.isSuccess) {
				$(dom).addClass("disabled");
				$(dom).text('已接受');
				result2();
			}
		}
	});

}
function refuseFeed(dom) {
	var id = $(dom).attr('data');
	$.ajax({
		url : "feed/delFeed",
		data : {
			id : id
		},
		success : function(data) {
			if (data.isSuccess) {
				$(dom).parent().parent().remove();
				result2();
			}
		}
	});

}
//生成并下载模版
function addmodel(dom) {
	var id = $(dom).attr('data');

	location.href = "feed/downTemp?id=" + id;
}
//移除接待任务
function delApply(dom) {
	var id = $(dom).attr('data');
	$.ajax({
		url : "apply/delById",
		data : {
			id : id
		},
		success : function(data) {
			if (data) {
				$(dom).parent().parent().remove();
			}
		}
	});
}