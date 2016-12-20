function loaddata(abc) {

    var resUrl = 'supervise/progress/info/query3';
    var nums = 5; // 每页出现的数据量
    var ajDate = $.ajax({
        url: resUrl,
        data: { num: 1, size: nums, progress_id: progress_id },
        success: function(data) {
            layui.use(['laypage', 'layer'],
                function() {
                    var laypage = layui.laypage,
                        layer = layui.layer;
                    // 模拟渲染
                    var render = function(res) {
                        var list = eval(res).list;
                        var element = '';
                        if (list.length > 0) {

                            $(list).each(function(i, item) {
                                var _dis0 = item.progress_info_status == 'HANDLE_STATIUS_02' ? '' : 'disabled title="工作未完成"';
                                var _dis1 = item.progress_info_status == 'HANDLE_STATIUS_02' ? '' : 'layui-disabled';

                                var icon = "";
                                if (item.apply_status == '0') { icon = '<i class="warning yellow circle icon"></i>'; } else if (item.apply_status == '1') { icon = '<i class="check green circle icon"></i>'; } else if (item.apply_status == '2') { icon = '<i class="remove red circle icon"></i>'; }

                                var cdate = item.cdate ? item.cdate.substr(0, 16) : '';
                                var apply_date = item.apply_date ? item.apply_date.substr(0, 16) : '';
                                var con = item.progress_info_con ? item.progress_info_con : '';
                                var app_org_name = item.apply_user_organiz_name ? item.apply_user_organiz_name : '';
                                var info_url = item.progress_info_url ? item.progress_info_url : '';
                                var imagelist = "";

                                if (item.progress_info_img) {
                                    $(item.progress_info_img.split(',')).each(function(i, jt) {
                                        imagelist += '<img src="' + jt + '" style="height: 2em;cursor: pointer;" title="点击查看大图">';
                                    });
                                }
                                element += '<tr>';
                                element += '<td><p class="status">' + formartDic(item.progress_info_status, 'CODE_HANDLE_STATIUS') + '</p></td>';
                                element += '<td class="description"><p>' + con + '</p></td>';
                                element += '<td><p>' + formartDic(item.progress_info_url_type, 'CODE_REPORT_MATERIAL_TYPE') + '</p>';
                                element += info_url ? ' <i class="file text blue small icon"></i><a data-url="' + item.progress_info_url + '" title="预览" onclick="lookfile(this)" style="cursor: pointer;">' + info_url.substr(27, info_url.length) + ' </a>' : '';
                                element += imagelist ? '<div class="ui segment">' + '  <p>相关图片</p>' + '  <div class="image imagelist">' + imagelist + '  </div>' + '</div>' : '';
                                element += '</td>';
                                element += '<td><p>' + item.cuser_organiz_name + '</p>';
                                element += '    <p>' + cdate + '</p></td>';
                                element += '<td><p class="apply-status">' + icon + formartDic(item.apply_status, 'CODE_APPROVAL') + '</p></td>';
                                element += '<td><p>' + app_org_name + '</p>';
                                element += '    <p>' + apply_date + '</p>';
                                element += '</td>';
                                element += '<td>';
                               
                                var _dis2 = item.cuser_organiz_id == curr_user_organizid ?'':'disabled title="非本部门工作" ';
                                var _dis3 = item.cuser_organiz_id == curr_user_organizid ?'':'layui-disabled';
                                element += userflag == 'M' && 　supervise_isfinish != '2' ? ' <button data-id="' + item.progress_info_id + '" class="layui-btn ' + _dis1 + ' " onclick="onapply(this)" ' + _dis0 + '>审批</button>' : '';
                                element += userflag == 'A' && item.apply_status != '0' ? '<button data-id="' + item.apply_con + '" class="layui-btn '+_dis3+'" onclick="lookidea(this)" '+_dis2+'>查看审批意见</button>' : '';
                                element += '</td>';
                                element += '</tr>';
                            });
                        }
                        return element;
                    };

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
                                progress_id: progress_id
                            }, function(res) {
                                //render(res);
                                $('#list tbody').html(render(res));
                                layer.close(abc);

                                layer.ready(function() { //为了layer.ext.js加载完毕再执行
                                    layer.photos({
                                        photos: '.imagelist',
                                        anim: 1 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
                                    });
                                });


                            });

                        }
                    });
                });
        }
    });

}


function _render() {
    var data = $('#list .status');
    var apply = $('#list .apply-status')
    $(data).each(function(i, item) {
        if ($(item).html()) {
            $(item).html(formartDic($(item).html(), 'CODE_HANDLE_STATIUS'));
        } else {
            $(item).html();
        }
    });
    $(apply).each(function(i, item) {
        if ($(item).html()) {
            var icon = "";
            if ($(item).html() == '0') { icon = '<i class="warning yellow circle icon"></i>'; } else if ($(item).html() == '1') { icon = '<i class="check green circle icon"></i>'; } else if ($(item).html() == '2') { icon = '<i class="remove red circle icon"></i>'; }
            $(item).html(icon + formartDic($(item).html(), 'CODE_APPROVAL'));


        } else {
            $(item).html();
        }
    });
    $('#type').html('文件类型：' + formartDic(info_type, 'CODE_EVENT_SUPERVISE'));
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

    //计算出相差天数
    var days = Math.floor(date3 / (24 * 3600 * 1000))

    //计算出小时数

    var leave1 = date3 % (24 * 3600 * 1000) //计算天数后剩余的毫秒数
    var hours = Math.floor(leave1 / (3600 * 1000))
        //计算相差分钟数
    var leave2 = leave1 % (3600 * 1000) //计算小时数后剩余的毫秒数
    var minutes = Math.floor(leave2 / (60 * 1000))
        //计算相差秒数
    var leave3 = leave2 % (60 * 1000) //计算分钟数后剩余的毫秒数
    var seconds = Math.round(leave3 / 1000)

    var str = days + "天 " + hours + "小时 "; //+minutes+" 分钟"+seconds+" 秒";
    //alert(" 相差 "+days+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒")

    if (date3 > 0) {
        return str;
    } else {
        return false;
    }
}

function _render_page() {
    if (haveDate(endtime, limit)) {
        $('#require2').text(formartDic(limit, 'CODE_HANDLE_LIMIT')+ ' 剩余时间：' + haveDate(endtime, limit));

    } else {
        $('#require2').text('已延期');
        $('#require2').addClass('layui-quote-jg');
        $('#require1').addClass('layui-quote-jg');
        $('#require1').parent().removeClass('Teal');
        $('#require1').parent().addClass('red');
    }

}

(function() {


    endtime = $('#t_end_time').val();
    info_type = $('#t_info_type').val();
    str = $('#t_str').val();
    limit = $('#t_limit').val();
    info_img_url = $('#t_info_img_url').val();
    progress_id = $('#t_progress_id').val();
    userflag = $('#t_userflag').val();
    supervise_info_con = $('#t_supervise_info_con').val();
    supervise_isfinish = $('#t_supervise_isfinish').val();
    curr_user_organizid = $('#t_curr_user_organizid').val();

    layui.use('layer', function() {

        var layer = layui.layer;
        var abc = layer.load(0, { time: 10 * 1000 });
        loaddata(abc);
    });
    _render();
    if (supervise_isfinish == '2') {

        $('#require2').text('批示件上报情况：' + supervise_info_con);

    } else { _render_page(); }

    $('#require1').text('办理部门：' + str);
})()


layui.use('layer', function() {
    var layer = layui.layer;
    $('#info-img-url').on('click', function() {

        var _this = this;
        layer.tips('<img src="' + info_img_url + '">', _this, {
            tips: [4, 'rgba(0,0,0,0)']
        });
    });
    layer.ready(function() { //为了layer.ext.js加载完毕再执行
        layer.photos({
            photos: '#layer-photos-demo',
            anim: 1 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
        });
    });
});

function onapply(dom) {
    var id = $(dom).attr('data-id');
    layui.use("layer", function() {
        var layer = layui.layer;
        $.getJSON("supervise/progress/info/query2", {
            id: id,
        }, function(data) {
            layer.open({
                title: '审批',
                skin: 'layui-layer-lan',
                area: ['500px', '280px'],
                type: 2,
                content: ['gosuperviseprogressinfo', 'no'],
                success: function(layero, index) {
                    // 赋值
                    if (data.obj.apply_status != '0') {
                        var body = layer.getChildFrame('body', index);
                        var select = body.find('form #status');
                        var option = select.find("option[value='" + data.obj.apply_status + "']");
                        $(option).attr("selected", true); // select的值
                        body.find('form #con').val(data.obj.apply_con);
                        var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        var f = iframeWin.initform();
                    }
                },
                btn: ['提交', '取消'],
                yes: function(index, layero) {
                    var body = layer.getChildFrame('body', index);

                    var idea = body.find('form  #con').val();
                    var type = body.find('form  select[name="status"]').val();


                    layer.close(index);

                    if (type && idea) {
                        $.getJSON("supervise/progress/info/apply/check", {
                            type: type,
                            con: idea,
                            id: data.obj.progress_info_id
                        }, function(data) {
                            var abc = layer.load(0, { time: 10 * 1000 });
                            loaddata(abc);
                            var icon = 5;
                            if (data.isSuccess) {
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

    });

}
function lookidea(dom){
	var con = $(dom).attr('data-id');
	 layui.use("layer", function() {
	        var layer = layui.layer;
	        layer.open({
	            title: '查看审批意见',
	            //area: ['800px', '600px'],
	            skin: 'layui-layer-lan',
	           // type: 2,
	            content: con,
	            btn: '关闭',
	            yes: function(index, layero) {
	                layer.closeAll();
	            }
	        });
	 });
}
function lookfile(dom) {
    var url = $(dom).attr('data-url');
    //window.open('godoc?url='+url);
    layui.use("layer", function() {
        var layer = layui.layer;
        layer.open({
            title: '文件预览',
            area: ['800px', '600px'],
            skin: 'layui-layer-lan',
            type: 2,
            content: ['godoc?url=' + url, 'no'],
            success: function(layero, index) {

            },
            btn: '关闭',
            yes: function(index, layero) {
                layer.closeAll();
            }
        });
    });

}
/**jqprint 实现网页局部打印
 ***/
//<![CDATA[
$(function() {
    $("#jq-print").on('click', function() {
        //Print ele4 with custom options
        $(".container").print({
            //Use Global styles
            globalStyles: true,
            //Add link with attrbute media=print
            mediaPrint: true,
            //Custom stylesheet
            //stylesheet : $('#basepath').val()+"css/login.jsp.css",
            //Print in a hidden iframe
            iframe: true,
            //Don't print this
            noPrintSelector: ".no-print",
            //Add this at top
            // prepend : "兰州市公安局<br/>",
            //Add this on bottom
            append: '<br/><footer align="center">兰州市公安局</footer>'
        });
    });
    // Fork https://github.com/sathvikp/jQuery.print for the full list of options
});
//]]>
