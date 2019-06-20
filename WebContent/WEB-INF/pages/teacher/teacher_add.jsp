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
    <div class="alert alert-info">当前位置<b class="tip"></b>添加教师</div>
	<form action="<%=basePath%>/pages/teacher/teacher_save" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>添加教师信息</b></td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td width="15%">姓名<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="name" id="name" value="" type="text" />
	                </td>
	                <td>学号<font color="FF0000">*</font></td>
	            	<td>
	                    <input id="code" name="code"  type="hidden" />
	                    <input id="code2" name="code2" disabled="disabled" type="text" value="${code}"  />
	                </td>
	            </tr>
	            <tr>
	            	<td width="500">昵称<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input id="nikename" name="nikename" type="text" />
	                </td>
	                <td>密码<font color="FF0000">*</font></td>
	                <td>
	                    <input id="address" name="password" value="" type="password" />
	                </td>
	            </tr>
	           
	            <tr>
	            	<td width="500">电话号码<font color="FF0000">*</font></td>
	              	<td width="500">
	                    <input id="phone" name="phone" value="" type="text" />
	                </td>
	                <td width="15%">邮箱<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="exmail" value="" type="text" />
	                </td>
	            </tr>
	            
	            <tr>
	               <td>角色</td>
	                 <td class="td_detail">
	                    <select name="roleId" id="roleId" onchange="change()">
	                    	<c:forEach items="${roleList }" var="role">
	                    		<option value="${role.id }">${role.roleName }</option>
	                    	</c:forEach>
	                    </select>
	                
	                       <!-- 增加注册人、注册时间  -->
	              	 <input type="hidden" name="inputId" value="${sessionScope.user.id }"></input>
	               	 <input type="hidden" name="inputTime" value="<%=curTime%>"></input>
	                </td>
	               <td>学历</td>
                   <td>
                   <select name="degree" id="degree">
	                   <option value="11" >大专</option>
	                   <option value="22" >本科</option>
	                   <option value="33" >硕士</option>
	                   <option value="44" >博士</option>
                   </select>
                   </td>
	               </tr>
	               
	             <tr>
                    <td>入职日期<font color="FF0000">*</font></td>
	                <td>
	                    <input id="enrollmentyear" name="enrollmentyear" value="" type="text" />
	               </td>
                   <td>状态<font color="FF0000">*</font></td>
	               <td>
	                    <input type="radio" name="status" checked="checked" value="1"/>正常
	                    <input type="radio" name="status" value="2"/>离职
	                    <input type="radio" name="status" value="3"/>停职
	                </td>
	            </tr> 
	            <tr>
	            <td>岗位</td>
	            <!--   岗位  -->   
	             <td>
	             <input type="hidden" name="position" id="position" value=""/>
	             <textarea id="description" class="form-control" rows="3" name="description" >
	           
	             </textarea>
	           
	             </td>
	             <td>所属学院：</td>
	             <td>
	             <select id="xueyuan" name="xueyuan">
	             			<c:forEach items="${facultyList}" var="faculty">
	                    		<option value="${faculty.code }">${faculty.name }</option>
	                    	</c:forEach>
	             </select>
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
function change(){
	var s=$("#roleId").find("option:selected").text();
	alert("s="+s);
	document.getElementById("position").value=s;
}
$("#enrollmentyear").shijian();

function addPreZero(){ 
	var code=$("#code2").val();
	alert("code="+code);
	code=('00000'+code).slice(-6);
	alert("code2="+code);
	document.getElementById("code").value=code;
} 
addPreZero();
</script>
</html>
