// 加载数据
function loaddata(abc) {

	var userid = $('#userid').val();
	var userflag = $('#flag').val();
	var organizid = $('#organizid').val();

	var resUrl = userflag == 'M' ? 'integrated/info/page2'
			: 'integrated/info/page1'
	var nums = 5; // 每页出现的数据量

	layui
			.use(
					[ 'layer', 'form' ],
					function() {

						var $ = layui.jquery, layer = layui.layer, form = layui.form;

						var ajDate = $
								.ajax({
									url : resUrl,
									data : {
										num : 1,
										size : nums
									},
									success : function(data) {
										// your code
										layui
												.use(
														[ 'laypage', 'layer' ],
														function() {
															var laypage = layui.laypage, layer = layui.layer;
															// 模拟渲染
															var render = function(
																	res) {
																var list = eval(res).list;
																var element = '';
																if (list.length > 0) {

																	for (var i = 0; i < list.length; i++) {
																		var news = list[i];

																		element += '<tr>';
																		element += '        <td><div class="ui blue ribbon label" id="title-second" title="'
																				+ news.info_title
																				+ '"><p>'
																				+ news.info_title
																				+ '</p></div></td>';
																		element += '<td> '
																				+ news.cuser_organiz_name
																				+ '</td>';
																		element += '<td> '
																				+ news.cdate
																				+ '</td>';

																		if (news.approval_status == '1') {

																			element += '<td> <i class="check green circle icon"></i>已审批</td>';

																			if (news.handl_status > 0) {

																				element += '<td> <i class="check green circle icon"></i>已办理</td>';

																			} else {
																				element += '<td> <i class="warning yellow circle  icon"></i>未办理</td>';
																			}
																		} else {

																			if (news.approval_status == '2') {
																				element += '<td> <i class="remove red circle icon"></i>已拒绝</td>';
																			} else {
																				element += '<td> <i class="warning yellow circle  icon"></i>未审批</td>';
																			}
																			element += '<td> <i class="warning yellow circle  icon"></i>未办理</td>';
																		}

																		element += '<td>   <div>'
																				+ '<button class="layui-btn" data="'
																				+ news.info_id
																				+ '" onclick="detail(this)">详情</button>';
																		if (userflag == 'M') {
																			var dis = news.approval_status == '1'
																					&& news.handl_status != '1' ? ''
																					: 'layui-disabled';
																			var dis3 = news.approval_status == '1'
																					&& news.handl_status != '1' ? ''
																					: 'disabled';
																			element += '<button class="layui-btn layui-btn-normal '
																					+ dis
																					+ ' " data="'
																					+ news.info_id
																					+ '" onclick="onfinish(this)" '
																					+ dis3
																					+ '>办理</button>';
																		} else if (userflag == 'A') {

																		}

																		if (userid == news.cuser_id) {

																			var dis1 = news.approval_status == '1' ? 'layui-disabled'
																					: '';
																			var dis2 = news.approval_status == '1' ? 'disabled'
																					: '';
																			var dis4 = news.handl_status == '1' ? ''
																					: 'disable'
																			var dis5 = news.handl_status == '1' ? ''
																					: 'layui-disabled'
																			element += '<button class="layui-btn layui-btn-normal '
																					+ dis1
																					+ ' "  data="'
																					+ news.info_id
																					+ '" onclick="onupd(this)" '
																					+ dis2
																					+ '>修改</button>';
																			element += '<button class="layui-btn layui-btn-danger '
																					+ dis1
																					+ ' "  data="'
																					+ news.info_id
																					+ '" onclick="ondel(this)" '
																					+ dis2
																					+ '>删除</button>'
																			element += '<button class="layui-btn layui-btn-danger '
																					+ dis5
																					+ ' "  data="'
																					+ news.info_id
																					+ '" onclick="onfinish_(this)" '
																					+ dis4
																					+ '>完成</button>'
																		}

																		element += '</div></td>';
																		element += '</tr>';

																	}
																	// $('#new_app_list
																	// tbody').html(element);
																}
																return element;
															};

															// 调用分页
															laypage({
																cont : $('#biuuu_city_list'),
																curr : 1, // 初始化当前页
																groups : 3, // 连续显示分页数
																pages : data.totalPage, // 得到总页数
																jump : function(
																		obj) {
																	$
																			.getJSON(
																					resUrl,
																					{
																						num : obj.curr, // 当前页
																						size : nums,
																					},
																					function(
																							res) {
																						// render(res);
																						$(
																								'#integrated_info_list tbody')
																								.html(
																										render(res));
																						layer
																								.close(abc);

																					});

																}
															});
														});
									}
								});
					});
}

// 添加申请
function addintegrateinfo() {
	layui.use('layer', function() {
		var layer = layui.layer;
		layer.open({
			title : '综合申请',
			area : [ '750px', '300px' ],
			type : 2,
			content : [ 'goaddintegrated', 'no' ],
			btn : [ '提交', '取消' ],
			yes : function(index, layero) {
				var body = layer.getChildFrame('body', index);

				// var type = body.find('form #type').val();
				var con = body.find('form  #con').val();
				var title = body.find('form  #title').val();

				layer.close(index);

				if (con && title) {
					$.getJSON("integrated/info/add", {
						con : con,
						title : title
					}, function(data) {
						loaddata();
						var icon = 5;
						if (data.isSuccess) {
							icon = 6
						}
						layer.msg(data.msg, {
							icon : icon,
							anim : 6
						});

					});
				} else {

					layer.msg('表单不完整请重新输入！', {
						icon : 5,
						anim : 6
					});
				}

			},
			btn2 : function(index, layero) {
				layer.closeAll();
			}
		});
	});
}
layui.use([ 'layer', 'form' ], function() {

	var $ = layui.jquery, layer = layui.layer, form = layui.form;

	var abc = layer.load(0, {
		time : 10 * 1000
	});
	loaddata(abc);
});
function detail(dom) {

	var userid = $('#userid').val();
	var userflag = $('#flag').val();
	var organizid = $('#organizid').val();
	var id = $(dom).attr('data');
	// window.location.href='goSuperviseDetail?id='+id;
	layui.use('layer', function() {
		var layer = layui.layer;
		$.getJSON("integrated/info/findbyid", {
			id : id,
		}, function(data) {
			// loaddata();

			layer.open({
				title : '查看详情',
				area : [ '750px', '500px' ],
				type : 2,
				content : [ 'gointegrateddetail', 'no' ],
				success : function(layero, index) {
					// 赋值
					var body = layer.getChildFrame('body', index);
					body.find('form  #title').val(data.info_title);
					body.find('form  #con').val(data.info_con);

					var select = body.find('form #type');
					var option = select.find("option[value='"
							+ data.approval_status + "']");
					// $(option).attr("checked");//select的值
					$(option).attr("selected", true);// select的值
					body.find('form  #type .layui-form-radio').val(
							option.text());// select的title

					body.find('form  #idea').val(data.approval_idea);

					var handl = data.handl_status == '1' ? "已办理" : "未办理";

					body.find('form  #handl').val(handl);

					var s1 = userflag == 'M' ? '' : body.find('form  #type')
							.addClass('layui-hide');

					/*
					 * var iframeWin = window[layero.find('iframe')[0]['name']];
					 * //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method(); var
					 * form = iframeWin.initform(); //body.find('form
					 * #con').val();
					 * 
					 * var c_dom = body.find('form div .layui-unselect
					 * .layui-form-radio'); for(var i=0; i<c_dom.length;i++){
					 * c_dom[i].addEventListener('click', function(dom){
					 * _pro($(dom +' span ').text()); }); } function _pro(s){
					 * var c_dom = body.find('form input["name=type"]'); for(var
					 * i=0;i<c_dom.length;i++){ if($(c_dom[i]).attr('title') ==
					 * s){ $(c_dom[i]).attr('checked', true); }
					 * $(c_dom[i]).attr('checked', false); } }
					 */
				},
				btn : [ '提交', '取消' ],
				yes : function(index, layero) {
					var body = layer.getChildFrame('body', index);

					// var type = body.find('form #type').val();
					var idea = body.find('form  #idea').val();
					var type = body.find('form  select[name="type"]').val();
					layer.close(index);

					if (type && idea) {
						$.getJSON("integrated/info/oncheck", {
							type : type,
							con : idea,
							appid : data.approval_id
						}, function(data) {
							loaddata();
							var icon = 5;
							if (data.isSuccess) {
								icon = 6
							}
							layer.msg(data.msg, {
								icon : icon,
								anim : 6
							});

						});
					} else {

						layer.msg('表单不完整请重新输入！', {
							icon : 5,
							anim : 6
						});
					}

				},
				btn2 : function(index, layero) {
					layer.closeAll();
				}
			});

		});

	})
}
function ondel(dom) {
	var id = $(dom).attr('data');
	// window.location.href='goSuperviseDetail?id='+id;
	layui.use("layer", function() {
		var layer = layui.layer;
		$.getJSON('integrated/info/del', {
			id : id
		}, function(res) {
			var icon = 5;
			if (res.isSuccess) {
				loaddata();
				icon = 6;
			}
			layer.msg(res.msg, {
				icon : icon,
				anim : 6
			});

		});
	})
}
function onfinish(dom) {
	var id = $(dom).attr('data');
	layui.use("layer", function() {
		var layer = layui.layer;
		$.getJSON('integrated/handling/upd_1', {
			id : id
		}, function(res) {
			var icon = 5;
			if (res.isSuccess) {
				loaddata();
				icon = 6;
			}
			layer.msg(res.msg, {
				icon : icon,
				anim : 6
			});

		});
	})
}
function onfinish_(dom) {
	var id = $(dom).attr('data');
	layui.use("layer", function() {
		var layer = layui.layer;
		$.getJSON('integrated/info/finished', {
			id : id
		}, function(res) {
			var icon = 5;
			if (res.isSuccess) {
				loaddata();
				icon = 6;
			}
			layer.msg(res.msg, {
				icon : icon,
				anim : 6
			});

		});
	})
}
function onupd(dom) {
	var id = $(dom).attr('data');
	layui.use('layer', function() {
		var layer = layui.layer;
		$.getJSON("integrated/info/findbyid", {
			id : id,
		}, function(data) {
			layer.open({
				title : '修改',
				area : [ '750px', '300px' ],
				type : 2,
				content : [ 'gointegratedupd', 'no' ],
				success : function(layero, index) {
					// 赋值
					var body = layer.getChildFrame('body', index);
					body.find('form  #title').val(data.info_title);
					body.find('form  #con').val(data.info_con);
				},
				btn : [ '提交', '取消' ],
				yes : function(index, layero) {
					var body = layer.getChildFrame('body', index);
					var con = body.find('form  #con').val();
					var title = body.find('form #title').val();
					layer.close(index);

					if (con && title) {
						$.getJSON("integrated/info/upd", {
							id : id,
							con : con,
							title : title
						}, function(data) {
							loaddata();
							var icon = 5;
							if (data.isSuccess) {
								icon = 6
							}
							layer.msg(data.msg, {
								icon : icon,
								anim : 6
							});

						});
					} else {

						layer.msg('表单不完整请重新输入！', {
							icon : 5,
							anim : 6
						});
					}

				},
				btn2 : function(index, layero) {
					layer.closeAll();
				}
			});

		});

	})
}