<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>

<link rel="stylesheet" type="text/css" href="jsPlugin/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css" href="css/login.jsp.css">
<script src="js/jquery.min.js"></script>
<script src="jsPlugin/semantic/semantic.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	 
/* 	document.onkeypress = function(event){
		 var e = event || window.event || arguments.callee.caller.arguments[0];
		 
		  if (e.keyCode == 13) {
			   sub();
		  }
	  } */
	$('#form').form({
		fields : {
			name : {
				identifier : 'username',
				rules : [ {
					type : 'empty',
					prompt : '请输入用户名'
				} ]
			},
			pwd : {
				identifier : 'password',
				rules : [ {
					type : 'empty',
					prompt : '密码不能为空'
				} ]
			}
		},
		//inline : true,
		on : 'blur'
	});
	  
	  
	var ss = '${msg}';
	if(ss){
		$('#msg').text(ss);
		$('#msg').css("display","block");
	}
}

/* function sub()
{
    document.getElementById("form").submit();    
} */
</script>
<body>

<div class="ui middle aligned center aligned grid" style="height: 100%">
  <div class="column" style="max-width: 450px;">
    <h2 class="ui image header">
      <img src="images/logo.png" class="image">
      <div class="content">
        兰州市公安局办公室督办管理系统
      </div>
    </h2>
    <form class="ui large form" action="login" method="post" id="form">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="username" placeholder="用户名">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="密码">
          </div>
        </div>
         <input type="hidden" name="submit_type" value="supervise">
        <div class="ui fluid large blue submit button">登录</div>
      </div>

      <div class="ui error message" id="msg"></div>
    </form>
  </div>
</div>


<script type="text/javascript">

</script>

</body>
</html>