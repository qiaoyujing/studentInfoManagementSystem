<%@page import="swu.edu.cn.util.DateUtil"%>
<%@page import="swu.edu.cn.util.Notes"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/common/date/shijian.css" />
    <script type="text/javascript" src="<%=basePath %>/js/back/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=basePath %>/js/common/date/jquery_shijian.js?ver=1"></script>
    <script type="text/javascript" src="<%=basePath %>/js/back/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <style type="text/css">
    	input[type="text"] {
		    height: inherit;
		}
    </style>
   <script type="text/javascript">
        $(function () {
    		var code=$("#code2").val();
    		code=('00'+code).slice(-3);
    		document.getElementById("code").value=code;
    		
    		
            $(".datepicker").datepicker();

            $('#list').hide();
            $('#find').click(function () {
                $('#list').show();
            })
        })
      
        function cancel(){
        	window.location.href="<%=basePath%>/pages/course/course_list";
        }
    </script>
</head>
<body>
<% String curTime=DateUtil.getDateString();%>
    <div class="alert alert-info">当前位置<b class="tip"></b>添加课程</div>
	<form action="<%=basePath%>/pages/course/course_save" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>添加课程信息</b></td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	             	<td>编码<font color="FF0000">*</font></td>
	            	<td>
	            		<input id="code" name="code"  type="hidden"  />
	                    <input id="code2" name="code2"  type="text" value="${code }" disabled="disabled"/>
	                </td>
	                <td width="15%">课程名<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="name" id="name" value="" type="text" />
	                </td>
	            </tr>
	            <tr>
	            	<td width="500">学分<font color="FF0000">*</font></td>
	              	<td width="500">
	                    <input id="score" name="score" value="" type="text" />
	                </td>
	                <td width="15%">学时<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="classhour" id="classhour" value="" type="text" />
	                </td>
	            </tr>
	            <tr>
                    <td>描述<font color="FF0000">*</font></td>
	                <td>
	                    <input id="description" name="description" value="" type="text" />
	               </td>
                   <td>状态<font color="FF0000">*</font></td>
	               <td>
	                    <input type="radio" name="status" checked="checked" value="1"/>正常
	                    <input type="radio" name="status" value="2"/>无效
	                    <!-- 增加注册人、注册时间  -->
	              	 <input type="hidden" name="inputId" value="${sessionScope.user.id }"></input>
	               	 <input type="hidden" name="inputTime" value="<%=curTime%>"></input>
	                </td>
	            </tr> 
	        </tbody>
	        <tfoot>
	            <tr>
	                <td colspan="4">
	                    <input class="btn btn-inverse" type="submit" value="保存"/>
	                    <input class="btn btn-inverse" type="button" value="取消" onclick="cancel();" /></td>
	            </tr>
	        </tfoot>
	    </table>
    </form>
</body>
</html>
