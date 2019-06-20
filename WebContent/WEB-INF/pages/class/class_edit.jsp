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
        	window.location.href="<%=basePath%>/pages/class/class_list";
        }
    </script>
</head>
<body>
<% String curTime=DateUtil.getDateString();%>
    <div class="alert alert-info">当前位置<b class="tip"></b>修改班级</div>
	<form action="<%=basePath%>/pages/class/class_update" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>修改班级信息</b></td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	             	<td>编码<font color="FF0000">*</font></td>
	            	<td>
	                    <input id="code2" name="code2"  type="text" value="${classInfo.code}" disabled="disabled"/>
	                </td>
	                <td width="15%">班级名<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="id" id="id" value="${classInfo.id }" type="hidden" />
	               
	               <input name="name" id="name" value="${classInfo.name }" type="text" disabled="disabled" />
	                </td>
	            </tr>
	            
	            <tr>
	            	<td width="500">学生人数<font color="FF0000">*</font></td>
	              	<td width="500">
	                    <input id="studentnum" name="studentnum" value="${classInfo.studentnum }" type="text" />
	                </td>
	                <td width="15%">预计毕业年份<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="graduateyear" id="graduateyear" value="${classInfo.graduateyear }" disabled="disabled" type="text" />
	                </td>
	            </tr>
	            	            <tr>
	            	<td>班主任<font color="FF0000">*</font></td>
	            	<td>
	            		<input type="text" name="teacherId" id="teacherId" value=" ${classInfo.teacherId }"/>
	            	</td>
	            	<td>班长</td>
	            	<td>
	            		<input type="text" name="managerId" id="managerId" value="${classInfo.managerId} "/>
	            	</td>
	            </tr>
	            <tr>
                    <td>描述</td>
	                <td>
	                    <input id="description" name="description" value="${classInfo.description }" type="text" />
	               </td>
                   <td>口号</td>
	               <td>
	                    <input type="text" id="slogan" name="slogan" value="${classInfo.slogan }"/>
	                    <!-- 增加注册人、注册时间  -->
	              	 <input type="hidden" name="modifyId" value="${sessionScope.user.id }"></input>
	               	 <input type="hidden" name="modifyTime" value="<%=curTime%>"></input>
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
