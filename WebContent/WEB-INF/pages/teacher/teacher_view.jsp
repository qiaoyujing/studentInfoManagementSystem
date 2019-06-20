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
        	window.location.href="<%=basePath%>/pages/teacher/teacher_list";
        }
    </script>
</head>
<body>
<% String curTime=DateUtil.getDateString();%>
    <div class="alert alert-info">当前位置<b class="tip"></b>查看教师</div>
	<form action="<%=basePath%>/pages/teacher/teacher_save" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>查看教师信息</b></td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td width="15%">姓名<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="name" id="name" value="${teacher.name }" disabled="disabled" type="text" />
	                </td>
	                <td>学号<font color="FF0000">*</font></td>
	            	<td>
	                    <input id="code" name="code" value="${teacher.code}"  disabled="disabled" type="text" />
	                </td>
	            </tr>
	            <tr>
	            	<td width="500">昵称<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input id="nikename" name="nikename" value="${teacher.nikename}" disabled="disabled" type="text" />
	                </td>
	                <td>密码<font color="FF0000">*</font></td>
	                <td>
	                    <input id="address" name="password"  disabled="disabled" value="${teacher.password }" type="text" />
	                </td>
	            </tr>
	           
	            <tr>
	            	<td width="500">电话号码<font color="FF0000">*</font></td>
	              	<td width="500">
	                    <input id="phone" name="phone" disabled="disabled" value="${teacher.phone }" type="text" />
	                </td>
	                <td width="15%">邮箱<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="exmail" disabled="disabled" value="${teacher.exmail }" type="text" />
	                </td>
	            </tr>
	            
	            <tr>
	               <td>角色</td>
	                 <td class="td_detail">
	                    <select name="roleId" id="roleId" disabled="disabled">
	                    	<c:forEach items="${roleList }" var="role">
	                    		<option value="${role.id }" ${ role.id eq teacher.roleId ?  "selected":""}>${role.roleName }</option>
	                    	</c:forEach>
	                    </select>
	                
	                </td>
	               <td>学历</td>
                   <td>
                   <select name="degree" id="degree" disabled="disabled">
	                   <option value="11"  ${teacher.degree eq "11" ? "selected":""} >大专</option>
	                   <option value="22"  ${teacher.degree eq "22" ? "selected":""} >本科</option>
	                   <option value="33"  ${teacher.degree eq "33" ? "selected":""} >硕士</option>
	                   <option value="44"  ${teacher.degree eq "44" ? "selected":""} >博士</option>
                   </select>
                   </td>
	               </tr>
	               
	             <tr>
                   <td>状态<font color="FF0000">*</font></td>
	               <td>
	                    <input type="radio" name="status" disabled="disabled" ${teacher.status eq 1 ? "checked":"" } value="1"/>正常
	                    <input type="radio" name="status" disabled="disabled" ${teacher.status eq 2 ? "checked":"" } value="2"/>离职
	                    <input type="radio" name="status" disabled="disabled" ${teacher.status eq 3 ? "checked":"" } value="3"/>停职
	                </td>
	            	<td>描述</td>
	           		 <td><textarea id="description" class="form-control" rows="3" name="description" disabled="disabled">
	             		${teacher.description}
	            	 	 </textarea>
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
<script type="text/javascript"> 
$("#enrollmentyear").shijian()
</script>
</html>
