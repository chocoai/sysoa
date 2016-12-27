var render = function(res, curr, nums) {
    var userid = $('#userid').val();
    var userflag = $('#flag').val();
    var organizid = $('#organizid').val();
    var list = eval(res).list;
    var element = '';
    if (list.length > 0) {

        for (var i = 0; i < list.length; i++) {
            var news = list[i];
            
            var sno = Number((curr-1)*nums);
            var sno1 = sno+i+1; 
            /**
             * 延期---红色  #FF5722
             *          提交已审批--橙色
             *          
             * 工作完成--绿色  #5FB878
             * 
             */

            var _neio = '';
            var neio = '';
            var approval_flag_ele1 = '';  
            var approval_flag_ele2 = '';
            //判断当前用户是否是在督办工作的承办单位
            var _flag_o_t = news.require_organiz_id.indexOf(organizid+',');
            if(_flag_o_t !=-1){
            
            	approval_flag_ele1 =  _findApprovalStatus(news.progress_id) ? '<div class="layui-btn layui-btn-danger layui-btn-mini">已拒绝</div>':'';
            
            }
            if(userflag =='M'){
            	
            	approval_flag_ele2 =  _findApproval_Status(news.progress_id) ? '<div class="layui-btn layui-btn-warm layui-btn-mini">待审批</div>':'';
            }
            
            if (news.isfinish !=='2') {
            	 neio = haveDate(news.cdate, news.require_finish_limit) ? 'positive' : 'warning';
            	_neio = haveDate(news.cdate, news.require_finish_limit) ? '<i class="warning green circle icon"></i>' : '<i class="warning red circle icon"></i>'; 
            } else {
            	_neio = ''; 
            }

            
         /*   if(news.isfinish !=='2'){
            	 _neio = haveDate(news.rec_time, news.require_finish_limit) ? '' : 'background-color: #FF5722 !important ;';
            }else{
            	_neio = 'background-color: #5FB878 !important ;';
            }*/
            
            element += '<tr class="'+neio+'" style=" cursor:pointer; " data="' + news.info_id + '" ondblclick="ondetail(this)" title="双击查看详情">';
            element += '        <td><span>' +sno1+ '</span>'+approval_flag_ele1+approval_flag_ele2+'</td>';
            element += '        <td><p>' + news.rec_time.substr(0,10) + '</p></div></td>';
            element += '        <td><p>' + formartDic(news.rec_organiz_id, 'CODE_REC_ORGANIZS') + '</p></div></td>';/*_organiz(news.rec_organiz_id)*/
            element += '        <td><p>' + news.rec_sno + '</p></div></td>';
            
            element += '        <td><p>' + news.info_title + '</p></div></td>';
            element += '        <td><p>' + news.info_con + '</p></div></td>';
            element += '        <td><p>' + _organiz(news.require_organiz_id) + '</p></div></td>';

            //element += '<td> 办理情况</td>';
            element += '<td>' + formartDic(news.info_type, 'CODE_EVENT_SUPERVISE') + '</td>';
            
            element += '<td>' +_neio + formartDic(news.progress_status, 'CODE_HANDLE_STATIUS') + '</td>';

            // element += '<td>' + news.cdate + '</td>';
            //element += '<td>' + formartDic(news.require_finish_limit, 'CODE_HANDLE_LIMIT') + '</td>';
            
            element += '        <td>';
           // element += '        <td>   <div>' + '<button class="layui-btn layui-btn-mini" data="' + news.info_id + '" onclick="ondetail(this)">查看详情</button>';
            var dis = news.progress_status == 'HANDLE_STATIUS_02' ? 'layui-disabled' : '';
            var dis1 = news.progress_status == 'HANDLE_STATIUS_02' ? 'disabled' : '';
            if(news.isfinish !='2'){
	            if (userflag == 'M') {
	            	 if(_flag_o_t !=-1){

			                element += '<button class="layui-btn  layui-btn-normal ' + dis + '"  ' + dis1 + ' data="' + news.progress_id + '" onclick="onProgress(this)">工作进展</button>';
			         
		                }
	                var _dis = news.progress_status == 'HANDLE_STATIUS_02' && news.isfinish != '2' ? '' : 'layui-disabled';
	                var _dis1 = news.progress_status == 'HANDLE_STATIUS_02' && news.isfinish != '2' ? '' : 'disabled title="工作未完成" ';
	                element += '<button class="layui-btn  layui-btn-normal ' + _dis + '"  ' + _dis1 + ' data="' + news.info_id + '" onclick="onfinish(this)">完成</button>';
	               
	            } else if (userflag == 'A') {
	
	                element += '<button class="layui-btn  layui-btn-normal ' + dis + '"  ' + dis1 + ' data="' + news.progress_id + '" onclick="onProgress(this)">工作进展</button>';
	            }
            }else if(news.isfinish =='2'){
            	 element += '<p>' + news.supervise_info_con + '</p>';
            }
          /*  if (userid == news.cuser_id) {
                element += '<button class="layui-btn layui-btn-normal ' + dis + '"  ' + dis1 + '  data="' + news.info_id + '" onclick="onedit(this)">修改</button>';
                element += '<button class="layui-btn layui-btn-danger ' + dis + '"  ' + dis1 + '  data="' + news.info_id + '" onclick="ondel(this)">删除</button>';
            }*/

            element += '</td>';
            element += '</tr>';

        }
        // $('#new_app_list
        // tbody').html(element);
    }
    return element;
};

function loaddata(abc) {
    var userid = $('#userid').val();
    var userflag = $('#flag').val();
    var organizid = $('#organizid').val();

    var resUrl = userflag == 'M' ? 'supervise/info/getAll1Supervise' : 'supervise/info/getAll2Supervise'
    var nums = 5; // 每页出现的数据量

    var ajDate = $
        .ajax({
            url: resUrl,
            data: {
                num: 1,
                size: nums
            },
            success: function(data) {
                // your code
                layui
                    .use(
                        ['laypage', 'layer'],
                        function() {
                            var laypage = layui.laypage,
                                layer = layui.layer;
                            // 模拟渲染
                           
                            // 调用分页
                            laypage({
                                cont: $('#biuuu_city_list'),
                                curr: 1, // 初始化当前页
                                groups: 3, // 连续显示分页数
                                pages: data.totalPage, // 得到总页数
                                jump: function(obj) {
                                    $.getJSON(resUrl, {
                                        num: obj.curr, // 当前页
                                        size: nums,
                                    }, function(res) {
                                        // render(res);
                                        $('#new_app_list tbody')
                                            .html(render(res, obj.curr, nums));
                                        layer.close(abc);

                                    });

                                }
                            });
                        });
            }
        });

}

function loaddata01(abc, start, end) {
    var userid = $('#userid').val();
    var userflag = $('#flag').val();
    var organizid = $('#organizid').val();

    var resUrl = 'supervise/info/getAll3Supervise'
    var nums = 5; // 每页出现的数据量

    var ajDate = $
        .ajax({
            url: resUrl,
            data: {
                num: 1,
                size: nums,
                start: start,
                end: end
            },
            success: function(data) {
                // your code
                layui
                    .use(
                        ['laypage', 'layer'],
                        function() {
                            var laypage = layui.laypage,
                                layer = layui.layer;
                            // 调用分页
                            laypage({
                                cont: $('#biuuu_city_list01'),
                                curr: 1, // 初始化当前页
                                groups: 3, // 连续显示分页数
                                pages: data.totalPage, // 得到总页数
                                jump: function(obj) {
                                    $.getJSON(resUrl, {
                                        num: obj.curr, // 当前页
                                        size: nums,
                                        start: start,
                                        end: end
                                    }, function(res) {
                                        // render(res);
                                        $('#new_app_list01 tbody')
                                            .html(render(res, obj.curr, nums));
                                        layer.close(abc);

                                    });

                                }
                            });
                        });
            }
        });

}

function loaddata02(abc) {
    var userid = $('#userid').val();
    var userflag = $('#flag').val();
    var organizid = $('#organizid').val();

    var resUrl = userflag == 'M' ? 'supervise/info/getAll4Supervise':'supervise/info/getAll4Supervise_user';
    var nums = 5; // 每页出现的数据量

    var ajDate = $
        .ajax({
            url: resUrl,
            data: {
                num: 1,
                size: nums
            },
            success: function(data) {
                // your code
                layui
                    .use(
                        ['laypage', 'layer'],
                        function() {
                            var laypage = layui.laypage,
                                layer = layui.layer;
                            // 调用分页
                            laypage({
                                cont: $('#biuuu_city_list02'),
                                curr: 1, // 初始化当前页
                                groups: 3, // 连续显示分页数
                                pages: data.totalPage, // 得到总页数
                                jump: function(obj) {
                                    $.getJSON(resUrl, {
                                        num: obj.curr, // 当前页
                                        size: nums
                                    }, function(res) {
                                        // render(res);
                                        $('#new_app_list02 tbody')
                                            .html(render(res, obj.curr, nums));
                                        layer.close(abc);

                                    });

                                }
                            });
                        });
            }
        });

}


function haveDate(st, limit) {
    var ldate = 0;
    if ("HANDLE_LIMIT_01" == limit) {
        ldate = 24 * 3600 * 1000;
    } else if ("HANDLE_LIMIT_02" == limit) {
        ldate = 3 * 24 * 3600 * 1000;
    } else if ("HANDLE_LIMIT_03" == limit) {
        ldate = 7 * 24 * 3600 * 1000;
    }

    var date1 = new Date();
    st = st.substring(0, 19).replace(/-/g, "/");;
    var date2 = new Date(st);
    var date3 = ldate - (date1.getTime() - date2.getTime());

    // 计算出相差天数
    var days = Math.floor(date3 / (24 * 3600 * 1000))

    // 计算出小时数

    var leave1 = date3 % (24 * 3600 * 1000) // 计算天数后剩余的毫秒数
    var hours = Math.floor(leave1 / (3600 * 1000))
        // 计算相差分钟数
    var leave2 = leave1 % (3600 * 1000) // 计算小时数后剩余的毫秒数
    var minutes = Math.floor(leave2 / (60 * 1000))
        // 计算相差秒数
    var leave3 = leave2 % (60 * 1000) // 计算分钟数后剩余的毫秒数
    var seconds = Math.round(leave3 / 1000)

    var str = days + "天 " + hours + "小时 "; // +minutes+" 分钟"+seconds+" 秒";
    // alert(" 相差 "+days+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒")

    if (date3 > 0) {
        return str;
    } else {
        return false;
    }
}

function addSupervise() {
    layui.use('layer', function() {

        var layer = layui.layer;
        layer.open({
            title: '添加督办工作',
            area: ['980px', '90%'],
            type: 2,
            skin: 'layui-layer-lan',
            content: ['goaddSupervise', 'yes'],
            btn: ['提交', '取消'],
            yes: function(index, layero) {
                var body = layer.getChildFrame('body', index);

                var type = body.find('form  #type').val();
                var con = body.find('form  #con').val();
                var title = body.find('form  #title').val();
                var rdate = body.find('form  #rdate').val();
                var organiz = body.find('form  #organiz').val();
                var info_sno = body.find('form  #info_sno').val();
                var rec_sno = body.find('form  #rec_sno').val();
                var info_img = body.find('form  #info_img').val();
                var app_type = body.find('form  #app_type').val();

                var limit = body.find('form  #limit').val();
            /*    var chk_value = [];
                body.find('form input[name="organizs"]:checked').each(
                    function() {
                        chk_value.push($(this).val());
                    });
                var ids = chk_value.join(",") + ",";*/
                var ids = body.find('form  #organizs').val();

                if (type && con && title && rec_sno && info_sno && rdate && organiz && ids && limit && app_type) {
                	
                	layer.close(index);
                	
                    $.getJSON("supervise/info/add", {
                        type: type,
                        con: con,
                        title: title,
                        rec_sno: rec_sno,
                        info_sno: info_sno,
                        rdate: rdate,
                        organiz: organiz,
                        info_img: info_img,
                        limit: limit,
                        ids: ids,
                        app_type: app_type
                    }, function(data) {
                        var icon = 5;
                        if (data.isSuccess) {
                            icon = 6
                            var abc = layer.load(0, { time: 10 * 1000 });
                            loaddata(abc);
                            loaddata01(abc);
                            loaddata02(abc);
                        }
                        layer.msg(data.msg, {
                            icon: icon,
                            anim: 6
                        });

                    });
                } else {

                    layer.msg('表单不完整请确认！', {
                        icon: 5,
                        anim: 6
                    });
                    
                    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                    iframeWin.vdform();
                }

            },
            btn2: function(index, layero) {
                layer.closeAll();
            }
        });
    });
}

function addRequire() {

    layui.use('layer', function() {

        var layer = layui.layer;
        $.getJSON("supervise/info/checkInfo", function(data) {
            if (data.isSuccess) {

                layer.open({
                    title: '督办任务下发',
                    area: ['550px', '320px'],
                    skin: 'layui-layer-lan',
                    type: 2,
                    content: ['goaddRequire', 'yes'],
                    btn: ['提交', '取消'],
                    yes: function(index, layero) {
                        var body = layer.getChildFrame('body', index);

                        var supervise = body.find('form  #supervise').val();
                        // var organizid = body.find('form #organizs').val();
                        // var finish = new Date(body.find('form
                        // #finish').val().replace(/-/g, "/"));
                        var limit = body.find('form  #limit').val();
                        var chk_value = [];
                        body.find('form input[name="organizs"]:checked').each(
                            function() {
                                chk_value.push($(this).val());
                            });

                        var ids = chk_value.join(",") + ",";
                        layer.close(index);

                        if (supervise && limit && chk_value) {
                            $.getJSON("supervise/require/add", {
                                supervise: supervise,
                                ids: ids,
                                limit: limit
                            }, function(data) {
                                var icon = 5;
                                if (data.isSuccess) {
                                    icon = 6
                                }
                                layer.msg(data.msg, {
                                    icon: icon,
                                    anim: 6
                                });
                                loaddata();
                            });
                        } else {

                            layer.msg('表单不完整请重新输入！', {
                                icon: 5,
                                anim: 6
                            });
                        }

                    },
                    btn2: function(index, layero) {
                        layer.closeAll();
                    }
                });



            } else {
                layer.msg(data.msg, {
                    icon: 5,
                    anim: 6
                });
            }
        });

    });

}

function onfinish(dom) {
    var id = $(dom).attr('data');
    layui.use("layer", function() {
        var layer = layui.layer;

        layer.open({
            title: '领导批示上报情况',
            skin: 'layui-layer-lan',
            area: '600px',
            // type : 2,
            content: ' <textarea name="con" id="t0_v3_con" placeholder="请输入内容"' + '              class="layui-textarea"></textarea>',
            btn: ['提交', '取消'],
            yes: function(index, layero) {
                var con = $('#t0_v3_con').val();
                layer.close(index);
                if (con) {
                    $.getJSON('supervise/info/onfinish', {
                        id: id,
                        con: con
                    }, function(res) {
                    	var abc = layer.load(0, { time: 10 * 1000 });
                        loaddata(abc);
                        loaddata01(abc);
                        loaddata02(abc);
                        
                        layer.msg(res.msg, {
                            icon: 6,
                            anim: 6
                        });

                    });

                } else {

                    layer.msg('表单不完整请重新输入！', {
                        icon: 5,
                        anim: 6
                    });
                }

            },
            btn2: function(index, layero) {
                layer.closeAll();
            }
        });
    });
}

function ondetail(dom) {
    var id = $(dom).attr('data');
    window.location.href = 'goSuperviseDetail/' + id;
}

function ondel(dom) {
    var id = $(dom).attr('data');
    layui.use("layer", function() {
        var layer = layui.layer;
        $.getJSON('supervise/info/del', {
            id: id
        }, function(res) {
            loaddata();
            layer.msg(res.msg, {
                icon: 6,
                anim: 6
            });

        });
    })
}

function onedit(dom) {
    var id = $(dom).attr('data');
    layui.use("layer", function() {
        var layer = layui.layer;
        layer.open({
            title: '修改',
            area: ['980px', '100%'],
            skin: 'layui-layer-lan',
            type: 2,
            content: ['goupdSupervise', 'yes'],
            success: function(layero, index) {
                $.getJSON("supervise/info/getbyid", {
                    id: id
                }, function(data) {

                    // 给表单赋值
                    if (data) {
                        var body = layer.getChildFrame('body', index);
                        body.find('#updsupervise #con').val(data.info_con);
                        body.find('#updsupervise #title').val(data.info_title);
                        body.find('#updsupervise #rdate').val(data.rec_time);
                        body.find('#updsupervise #rec_sno').val(data.rec_sno);
                        body.find('#updsupervise #info_sno').val(data.info_sno);
                        body.find('#updsupervise input[name="oo.info_id"]').val(data.info_id);
                        body.find('#updsupervise input[name="or.dbrequire_id"]').val(data.dbrequire_id);

                        var select1 = body.find('#updsupervise #organiz');
                        var select2 = body.find('#updsupervise #type');
                        var select3 = body.find('#updsupervise input[name="organizs"]');
                        var select4 = body.find('#updsupervise #limit');


                        var option1 = select1.find("option[value='" + data.rec_organiz_id + "']");
                        var option2 = select2.find("option[value='" + data.info_type + "']");

                        $(select3).each(function(i, item) {
                            $(data.require_organiz_id.split(',')).each(function(j, jem) {
                                $(item).val() == jem ? $(item).attr('checked', true) : '';
                            });
                        });

                        var option4 = select4.find("option[value='" + data.require_finish_limit + "']");

                        $(option1).attr("selected", true); // select的值
                        $(option2).attr("selected", true); // select的值
                        // $(option3).attr("selected",true);//select的值
                        $(option4).attr("selected", true); // select的值

                        var iframeWin = window[layero.find('iframe')[0]['name']]; // 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        var f = iframeWin.loadform();
                        f.render();

                    }
                });
            },
            btn: ['提交', '取消'],
            yes: function(index, layero) {
                var body = layer.getChildFrame('body', index);
                var chk_value = [];
                body.find('form input[name="organizs"]:checked').each(
                    function() {
                        chk_value.push($(this).val());
                    });

                var ids = chk_value.join(",") + ",";
                body.find('#require_organiz_id').val(ids);

                var ser = body.find('form').serialize();

                layer.close(index);

                if (ser) {
                    $.getJSON("supervise/info/upd", ser, function(data) {
                        var icon = 5;
                        if (data.isSuccess) {
                            loaddata()
                            icon = 6
                        }
                        layer.msg(data.msg, {
                            icon: icon,
                            anim: 6
                        });

                    });
                } else {

                    layer.msg('表单不完整请重新输入！', {
                        icon: 5,
                        anim: 6
                    });
                }

            },
            btn2: function(index, layero) {
                layer.closeAll();
            }
        });
    });
}

function onProgress(dom) {
    var id = $(dom).attr('data');
    layui.use("layer", function() {
        var layer = layui.layer;
        layer.open({
            title: '添加工作进展记录',
            area: ['550px', '480px'],
            skin: 'layui-layer-lan',
            type: 2,
            content: ['goaddProgress', 'yes'],
            success: function(layero, index) {
         /*       $.getJSON("supervise/progress/info/query1", {
                    pid: id
                }, function(data) {

                    // 给表单赋值
                    if (data && data.progress_info_status && data.progress_info_con) {
                        var body = layer.getChildFrame('body', index);
                        body.find('#addprogress #con').val(data.progress_info_con);

                        var select = body.find('#addprogress #complete');
                        var option = select.find("option[value='" + data.progress_info_status + "']");
                        $(option).attr("selected", true); // select的值

                        body.find('#addprogress #info_file').val(data.progress_info_url);
                        body.find('#addprogress #info_img').val(data.progress_info_img);

                        var select2 = body.find('#addprogress #type');
                        var option2 = select2.find("option[value='" + data.progress_info_url_type + "']");
                        $(option2).attr("selected", true); // select的值

                        // body.find('#addprogress .layui-select-title
                        // input').val(data.progress_info_complete+'%');//select的title
                        // 汇报材料已经上报不可修改

                        body.find('#addprogress #url_type').css("display", "none");
                        body.find('#addprogress #image_segment').css("display", "none");

                        var iframeWin = window[layero.find('iframe')[0]['name']]; // 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        var f = iframeWin.initform();
                    }
                });*/
            },
            btn: ['提交', '取消'],
            yes: function(index, layero) {
                var body = layer.getChildFrame('body', index);

                var complete = body.find('form  #complete').val();
                var con = body.find('form  #con').val();
                var type = body.find('form  #type').val();
                var url = body.find('form  #info_file').val();
                var img = body.find('form  #info_img').val();


                if (complete && con && type) {
                	 layer.close(index);
                    $.getJSON("supervise/progress/info/add", {
                        complete: complete,
                        con: con,
                        type: type,
                        url: url,
                        img: img,
                        id: id
                    }, function(data) {
                        var icon = 5;
                        if (data.isSuccess) {
                        	var abc = layer.load(0, { time: 10 * 1000 });
                            loaddata(abc);
                            loaddata01(abc);
                            loaddata02(abc);
                            icon = 6
                        }
                        layer.msg(data.msg, {
                            icon: icon,
                            anim: 6
                        });

                    });
                } else {

                    layer.msg('表单不完整请重新输入！', {
                        icon: 5,
                        anim: 6
                    });
                    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                    iframeWin.vdform();
                }

            },
            btn2: function(index, layero) {
                layer.closeAll();
            }
        });
    });
}

//查询审批是否被拒绝
function _findApprovalStatus(proid){
	
	var flag = false;
	$.ajaxSettings.async = false;
    $.getJSON("supervise/info/getProInfoApprovalStatus", {
    	proid: proid
    }, function(data) {
      if(data){flag = data}
    });
    return flag;
}
//查询是否有新的提交
function _findApproval_Status(proid){
	
	var flag = false;
	$.ajaxSettings.async = false;
    $.getJSON("supervise/info/getProInfoApprovalStatus_un", {
    	proid: proid
    }, function(data) {
      if(data){flag = data}
    });
    return flag;
}

function _findCondiction() {


    var start = _isnan($('#start').val());
    var end = _isnan($('#end').val());

    var layer = layui.layer;
    var abc = layer.load(0, { time: 10 * 1000 });
    loaddata01(abc, start, end)
}

function _isnan(ct) {
    if (ct == 'NaN' || ct == '' || ct == 'underfined') {
        return null;
    }

    // ct = new Date(ct.replace(/-/g,"/")).getTime();

    return ct;
}
// 加载数据
window.onload = function() {
    layui.use(['layer', 'element'], function() {
        var layer = layui.layer,
            element = layui.element();
        var abc = layer.load(0, { time: 10 * 1000 });
        loaddata(abc);
        loaddata01(abc);
        loaddata02(abc);
    });
}
/***
 * 数据统计
 * @returns
 */
function find_data_cond() {
	layui.use([ 'layer', 'element' ], function() {
		var layer = layui.layer;
		layer.open({
			title : '督办数据统计',
			skin : 'layui-layer-lan',
			area : [ '100%', '100%' ],
			type : 2,
			content : [ 'gosupdatacond', 'yes' ],
			success : function(layero, index) {

			/*	var body = layer.getChildFrame('body', index);

				//给表单赋值
				body.find('#start').val(fstart);
				body.find('#end').val(fend);

				//调用子页面渲染方法
				var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：
				//iframeWin._render();
				var ifr = iframeWin.findCondiction();
*/
			},
			btn : [ '打印', '关闭' ],
			yes : function(index, layero) {
				var iframeWin = window[layero.find('iframe')[0]['name']];

				iframeWin.JQprint();
			},
			btn2 : function(index, layero) {
				layer.close(index);
			}

		});
	});
}

