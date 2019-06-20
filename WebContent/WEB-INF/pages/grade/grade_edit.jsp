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
        	window.location.href="<%=basePath%>/pages/grade/grade_list";
        }
    </script>
</head>
<body>
<% String curTime=DateUtil.getDateString();%>
    <div class="alert alert-info">当前位置<b class="tip"></b>修改成绩</div>
	<form action="<%=basePath%>/pages/grade/grade_update" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>修改成绩信息</b></td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td width="15%">课程号<font color="FF0000">*</font></td>
	                <td width="500">
	                <input type="hidden" name="id" id="id" value="${grade.id }"/>
	                    
	                	<input type="hidden" name="courseId" id="courseId" value="${grade.courseId }"/>
	                    <input name="courseCode" id="courseCode" disabled="disabled" value="${grade.courseCode }" type="text" />
	                </td>
	                <td>课程名<font color="FF0000">*</font></td>
	            	<td>
	                    <input id="courseName" name="courseName"  type="text" disabled="disabled" value="${grade.courseName }" />
	                </td>
	            </tr>
	            <tr>
	            	<td width="500">学号<font color="FF0000">*</font></td>
	              	<td width="500">
	              		<input type="hidden" name="studentId" id="studentId"  value="${grade.studentId }"/>
	                    <input id="studentCode" name="studentCode" value="${grade.studentCode }" disabled="disabled" type="text" />
	                </td>
	                <td width="15%">学生名<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="studentName" id="studentName"  disabled="disabled" value="${grade.studentName }" type="text" />
	                </td>
	            </tr>
	            <tr>
                    <td>实验成绩<font color="FF0000">*</font></td>
	                <td>
	                    <input id="testgrade" name="testgrade" value="${grade.testgrade }" type="text" />
	               </td>
                   <td>考试成绩<font color="FF0000">*</font></td>
	               <td>
	                 <input id="examgrade" name="examgrade" value="${grade.examgrade }" type="text" />
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
