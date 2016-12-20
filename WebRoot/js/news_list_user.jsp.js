function loadDate(abc) {
	
    var userid = $('#userid').val();   
    var userflag = $('#flag').val();
    var resUrl = userflag =='M'?'news/app/queryAll2':'news/app/queryAll1';
    
    var nums = 5; //每页出现的数据量
    var ajDate = $.ajax({
        url: resUrl,
        data: { number: 1, size: nums },
        success: function(data) {
            // your code
            layui.use(['laypage', 'layer'], function() {
                var laypage = layui.laypage,
                    layer = layui.layer;


                //模拟渲染
                var render = function(res) {
                	 var list = eval(res).list;
                	 var element = '';
                     if (list.length > 0) {
                         
                         for (var i = 0; i < list.length; i++) {
                             var news = list[i];


                             element += '<tr>';
                             element += '        <td><div class="ui blue ribbon label" id="title-first" title="' + news.app_title + '"><p>' + news.app_title + '</p></div></td>';
                             if (news.app_type == '0') {
                                 element += '        <td>文字新闻</td>';
                             } else if (news.app_type == '1') {
                                 element += '        <td>图片新闻</td>';
                             }

                             //element += '        <td>' + news.app_content + '</td>';
                             element += '        <td>' + news.cuser_organiz_name + '</td>';
                             element += '        <td>' + news.cdate + '</td>';
                             if(news.approval_flag1 == '0'){
                            	 element += '        <td>已提交</td>';
                             }else if(news.approval_flag1 == '1' && news.approval_flag2 == '0'){
                            	 element += '        <td><i class="check yellow circle icon"></i>管理员已通过</td>';
                             }else if(news.approval_flag1 == '2' && news.approval_flag2 == '0'){
                            	 element += '        <td><i class="remove  red circle icon"></i>管理员已拒绝</td>';
                             }else if(news.approval_flag1 == '1' && news.approval_flag2 == '1'){
                            	 element += '        <td><i class="check green circle icon"></i>领导已通过</td>';
                             }else if(news.approval_flag1 == '2' && news.approval_flag2 == '1'){
                            	 element += '        <td><i class="remove  red circle icon"></i>领导已经拒绝</td>';
                             }
                             
                             element += '        <td>   <div>'
                            	    +'<button class="layui-btn" data="'+news.app_id+'" onclick="onDetail(this)">查看详情</button>';
                            if(userflag =='M'){
                            	element +='<button class="layui-btn layui-btn-normal"  data="'+news.approval_id+'" onclick="onCheck1(this)">审批</button>';
                            }	    
                            
                            if(userid == news.cuser_id){
                             element +='<button class="layui-btn layui-btn-danger"  data="'+news.app_id+'" onclick="onDel(this)">删除</button>'
                            }
                             
                             element +='</div></td>';
                             element += '</tr>';

                         }
                         //$('#new_app_list tbody').html(element);
                     }
                    return element;
                };

                //调用分页
                laypage({
                    cont: $('#biuuu_city_list'),
                    curr: 1, //初始化当前页  
                    groups: 3, //连续显示分页数
                    pages: data.totalPage, //得到总页数
                    jump: function(obj) {
                        $.getJSON(resUrl, {
                            number: obj.curr, //当前页  
                            size: nums,
                        }, function(res) {
                        	//render(res);
                            $('#new_app_list tbody').html(render(res));
                            layer.close(abc);
                        });



                    }
                });
            });
        }
    });
}


function onDetail(dom){
	var appid = $(dom).attr('data');

	window.location.href = "goNewsDetail/"+appid;
}
function onCheck1(dom){
	var appid = $(dom).attr('data');
	layui.use("layer",function(){
		var layer = layui.layer;
		
		layer.open({
			 content: '<textarea name="desc" placeholder="审批意见" class="layui-textarea" id="app_con"></textarea>',
			  formType: 2,
			  title: '审批意见',
			  area: ['500px', '250px'] //自定义文本域宽高
			 ,btn: ['同意', '拒绝', '取消']
			  ,yes: function(index, layero){
				 var con = $('#app_con').val();
				 layer.close();
				  $.getJSON('news/app/appM', {
					  approval_id: appid,
				         app_con:con
				     }, function(res) {
				    	 loadDate();
				          layer.msg(res.msg) ;
				          
				     });
			  },btn2: function(index, layero){
				  var con = $('#app_con').val();
					 layer.close();
				  $.getJSON('news/app/appN', {
					  approval_id: appid,
				         app_con:con
				     }, function(res) {
				    	 loadDate();
				          layer.msg(res.msg) ;
				          
				     });
				  
			  },btn3: function(index, layero){
			  }
			  ,cancel: function(){ 
			    //右上角关闭回调
			  }
		});
		
	/*	 $.getJSON('news/app/appM', {
	         appid: appid
	     }, function(res) {
	    	 loadDate();
	          layer.msg(res.msg) ;
	          
	     });*/
	})
}
function onDel(dom){
	var appid = $(dom).attr('data');
	//var msg = JSON.parse(data);
	layui.use("layer",function(){
		var layer = layui.layer;
		 $.getJSON('news/app/del', {
	         appid: appid
	     }, function(res) {
	    	 loadDate();
	          layer.msg(res.msg) ;
	          
	     });
	})
	
}

window.onload = function(){
	layui.use('layer', function() {

		var layer = layui.layer;
		var abc = layer.load(0, {time: 10*1000});
		loadDate(abc);
	});

}