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
            $(".datepicker").datepicker();

            $('#list').hide();
            $('#find').click(function () {
                $('#list').show();
            })
        })
      
        function cancel(){
        	 window.location.href="<%=basePath%>/pages/course/course_list"; 
        	/* alert("ss");
        	window.history:back(-1);
        	window.location.reload(); */
        }
    </script>
</head>
<body>
<% String curTime=DateUtil.getDateString();%>
    <div class="alert alert-info">当前位置<b class="tip"></b>修改课程</div>
	<form action="<%=basePath%>/pages/course/course_update" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>修改课程信息</b></td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td width="15%">课程名<font color="FF0000">*</font></td>
	                <td width="500">
	                	<input type="hidden" name="id" id="id" value="${course.id }"/>
	                    <input name="name" id="name" value="${course.name }" type="text" />
	                </td>
	                <td>编码<font color="FF0000">*</font></td>
	            	<td>
	                    <input id="code" name="code"  type="text" disabled="disabled" value="${course.code }" />
	                </td>
	            </tr>
	            <tr>
	            	<td width="500">学分<font color="FF0000">*</font></td>
	              	<td width="500">
	                    <input id="score" name="score" value="${course.score }" type="text" />
	                </td>
	                <td width="15%">学时<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="classhour" id="classhour" value="${course.classhour }" type="text" />
	                </td>
	            </tr>
	            <tr>
                    <td>描述<font color="FF0000">*</font></td>
	                <td>
	                    <input id="description" name="description" value="${course.description }" type="text" />
	               </td>
                   <td>状态<font color="FF0000">*</font></td>
	               <td>
	                    <input type="radio" name="status" ${course.status eq 1 ? "checked":"" }  value="1"/>正常
	                    <input type="radio" name="status" ${course.status eq 2 ? "checked":"" } value="2"/>无效
	                    <!-- 修改人、修改时间  -->
	              	 <input type="hidden" name="modifyId" value="${sessionScope.user.id }"></input>
	               	 <input type="hidden" name="mofifyTime" value="<%=curTime%>"></input>
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
