<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
	<base href="<%=basePath%>">
    <title>学生信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/back/base.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/back/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/back/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/back/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/back/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>/js/back/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/back/jquery.spritely-0.6.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/back/chur.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/back/ChurAlert.min.js?skin=blue"></script>
    <script type="text/javascript" src="<%=basePath%>/js/back/chur-alert.1.0.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/back/login.css" />
    <script type="text/javascript">
        $(function () {
        	//login页面动态效果，蒲公英，云
        	snowStorm = new SnowStorm('<%=basePath%>');
            $('#clouds').pan({ fps: 20, speed: 0.7, dir: 'right', depth: 10 });
            $('.login').click(function () {
            	var code = $('#code').val();
            	var passwrod = $('#password').val();
            	//如果没有输入信息，将会给予错误提示
                if ( code == "" || passwrod == "") { 
                	$('.tip').html('用户名或密码不可为空！'); 
                	$.ajax({
                		url:"<%=basePath%>/login",
                		type:'GET',
                		data:{'code':code,'password':passwrod},
                		dataType:'text',
                		success:function(data){
                			if("true"==data){
                				alert("登陆成功！");

                				parent.window.location.href='<%=basePath%>/pages/index';
                			}else{
                				alert("用户名或密码输入有误，请重新输入！");
                			}
                		}
                	});
                    
                }
            });
        });
    </script>
</head>
<body>
<form method="post">
    <div id="clouds" class="stage"></div>
    <div class="loginmain">
    </div>

    <div class="row-fluid">
        <h1>学生信息管理系统</h1>
        <p>
            <label>帐&nbsp;&nbsp;&nbsp;号：<input type="text" name="code" id="code" /></label>
        </p>
        <p>
            <label>密&nbsp;&nbsp;&nbsp;码：<input type="password"name="password" id="password" /></label>
        </p>
        <p class="tip">&nbsp;</p>
        <hr />
        <input type="button" value=" 登 录 " class="btn btn-primary btn-large login" />
        &nbsp;&nbsp;&nbsp;<input type="button" value=" 取 消 " class="btn btn-large" />
    </div>
    <div id="msg"></div>
</form>
</body>
</html>