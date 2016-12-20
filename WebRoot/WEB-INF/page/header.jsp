<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ui mini menu" style="margin-top: 0px; top: 0em ;" id="nav-top">
    <div class="item">
		<a class="ui logo icon image"><img src="images/logo.png" style="max-width: 70px;"></a> 
	</div>
<%-- 	<div class="item">
		<div class="ui basic  button" ><a href="${flag=='M'?'goRecpManagerIndex':'goRecpUserIndex' }" >接待</a></div>
		<!-- <div class="ui basic  button" ><a href="goRecpManagerIndex" >M接待</a></div> -->
		 <div class="ui basic  button pointing dropdown link" id="news">
		    <span class="text"><a>新闻</a></span>
		    <i class="dropdown icon"></i>
		    <div class="menu">
		      <div class="item"><a href="goNewsUserIndex" >添加新闻</a></div>
		      <div class="item"><a href="goNews1User" >查看新闻列表</a></div>
		    </div>
		  </div>
		<div class="ui basic  button" ><a href="goSupervises" >督办</a></div>
		<div class="ui basic  button" ><a href="gointegratedindex" >综合</a></div>
	</div> --%>
	<div class="right menu">
		<div class="item" >
		  <a>${username!=null?username:'请登录' }</a>
		</div>
		<div class="item" >
		  <div class="ui basic  button" id="editpwd"><a>修改密码</a></div>
		</div>
		<div class="item">
			<div class="ui basic  button" ><a href="exit">退出</a></div>
		</div>
	</div>
</div>

<script type="text/javascript">
/* var loginUrl = $('#basepath').val() ;
function relogin(){
	var name = '${username}';
	if(name || name.length == 0){
		window.top.location = loginUrl;
	}
} */
function loadDrop(){
	
	$('#news').dropdown();
}
loadDrop();
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

$('#editpwd').on('click', function(){
	var userid = $('#userid').val();
	layui.use('layer', function(){
		var layer = layui.layer;
		layer.open({
			  title:'修改密码',
			  skin: 'layui-layer-lan',
			  area: ['550px','220px'],
			  type: 2, 
			  content:['goEditpwd', 'no'],
		      btn: ['提交', '取消'],
		      yes: function(index, layero){
		    	var body = layer.getChildFrame('body', index);
		    	
				var oldpwd = body.find('form  #oldpwd').val();
				var newpwd = body.find('form  #newpwd').val();
			
				
				layer.close(index);
				
				if (oldpwd && newpwd) {
					$.getJSON("user/editPasswdPro",{userid:userid, newpwd:newpwd, oldpwd:oldpwd}, function(data){
							layer.open({
								  title: '消息提示',
								  content: data.msg,
								  skin: 'layui-layer-lan',
								  icon: 2
								});
						
					});
				}else{
					layer.open({
						  title: '错误提示',
						  content: '表单不完整请重新输入！',
						  skin: 'layui-layer-lan',
						  icon: 2
						});
				}
		  
			  },btn2: function(index, layero){
	           layer.closeAll();
		  }
		});
	});
});

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

</script>