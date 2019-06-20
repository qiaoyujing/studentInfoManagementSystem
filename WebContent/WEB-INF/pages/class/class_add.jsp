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
        	code=('000'+code).slice(-3);
        	document.getElementById("code").value=code;
        	
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
    <div class="alert alert-info">当前位置<b class="tip"></b>添加班级</div>
	<form action="<%=basePath%>/pages/class/class_save" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>添加班级信息</b></td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	             	<td>编码<font color="FF0000">*</font></td>
	            	<td>
	            		<input id="code" name="code"  type="hidden" />
	                    <input id="code2" name="code2"  type="text" value="${code}" disabled="disabled"/>
	                </td>
	                <td width="15%">班级名<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="name" id="name" value="" type="text"  />
	                </td>
	            </tr>
	            <tr>
	            <td>所属学院<font color="FF0000">*</font></td>
	            <td>
	            <input type="hidden" id="xueyuanText" name="xueyuanText"/>
	            <input type="hidden" id="zhuanyeText" name="zhuanyeText"/>
	            	 <select id="xueyuan" name="xueyuan">
	            	 		<option value=""></option>
	             			<c:forEach items="${facultyList}" var="faculty">
	                    		<option value="${faculty.code }">${faculty.name }</option>
	                    	</c:forEach>
	            	 </select>
	            </td>
	            <td>所属专业</td>
	            <td>
	            	 <select id="zhuanye" name="zhuanye">
	             			<%-- <c:forEach items="${disciplineList}" var="discipline">
	                    		<option value="${discipline.code }">${discipline.name }</option>
	                    	</c:forEach> --%>
	             	</select>
	            </td>
	            </tr>
	            <tr>
	            	<td width="500">学生人数<font color="FF0000">*</font></td>
	              	<td width="500">
	                    <input id="studentnum" name="studentnum" value="" type="text" />
	                </td>
	                <td width="15%">预计毕业年份<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="graduateyear" id="graduateyear" value="" type="text" />
	                </td>
	            </tr>
	            <tr>
	            	<td>班主任编号<font color="FF0000">*</font></td>
	            	<td>
	            		<input type="text" name="teacherId" id="teacherId" />
	            	</td>
	            	<td>班长编号</td>
	            	<td>
	            		<input type="text" name="managerId" id="managerId" />
	            	</td>
	            </tr>
	            <tr>
                    <td>描述</td>
	                <td>
	                    <input id="description" name="description" value="" type="text" />
	               </td>
                   <td>口号</td>
	               <td>
	                    <input type="text" id="slogan" name="slogan" value=""/>
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
<script type="text/javascript">  
    $("#xueyuan").change(function(){
    	var xueyuan=$("#xueyuan").find("option:selected").val();
    	$("#zhuanye").empty();
    	$.ajax({
    		url:"<%=basePath%>/pages/getMajor",
    		type:"post",
    		data:{'parentCode':xueyuan},
    		success:function(data){
    			
    			for(var i=0;i<data.length;i++){
    				var option=document.createElement("option");
    				$(option).val(data[i].code);
    				$(option).text(data[i].name);
    				$("#zhuanye").append(option);
    			}
    			var xuText=$("#xueyuan").find("option:selected").text();
    	    	var zhuanText=$("#zhuanye").find("option:selected").text();
    	    	alert(xuText+"ddd"+zhuanText);
    	    	document.getElementById("xueyuanText").value=xuText;
    	    	document.getElementById("zhuanyeText").value=zhuanText;
    		}
    	});
    });
   
    	
    
</script>

</html>
