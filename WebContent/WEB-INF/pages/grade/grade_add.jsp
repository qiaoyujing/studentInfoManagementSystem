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
<% String curTime=DateUtil.getDateString();
int count=1;
%>
    <div class="alert alert-info">当前位置<b class="tip"></b>添加成绩</div>
	<form action="<%=basePath%>/pages/grade/grade_save" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	    
	        <thead>
	            <tr>
	                <td colspan="4"><b>添加成绩信息</b></td>
	            </tr>
	            <tr>
	            	<td width="25%">学院&nbsp;&nbsp;
	            	 <select id="xueyuan" name="xueyuan" style="width:70%">
	            	 		<option value=""></option>
	             			<c:forEach items="${facultyList}" var="faculty">
	                    		<option value="${faculty.code }" ${getFacultyCode eq faculty.code ? "selected":"" }>${faculty.name }</option>
	                    	</c:forEach>
	            	 </select>
	            	</td>
	            	<td width="25%">专业&nbsp;&nbsp;
	            	 <select id="zhuanye" name="zhuanye" disabled="disabled" style="width:70%">
	            	 <option value=""></option>
	             			<c:forEach items="${disciplineList}" var="discipline">
	                    		<option value="${discipline.code }" ${getDisciplineCode eq discipline.code ? "selected":"" }>${discipline.name }</option>
	                    	</c:forEach>
	            	 </select>
	            	</td>
	            	<td width="25%">班级&nbsp;&nbsp;
	            	 <select id="banji" name="banji" disabled="disabled" style="width:70%">
	            	 <option value=""></option>
	             			<c:forEach items="${classInfoList}" var="classInfo">
	                    		<option value="${classInfo.id }" ${getClassId eq classInfo.id ? "selected":"" }>${classInfo.name }</option>
	                    	</c:forEach>
	            	 </select>
	            	 </td>
	            	<td width="25%">学号 <input type="text" value="${getStudentCode}" id="studentCode" name="studentCode" style="width:60%"/>
	            	&nbsp;
	            	<a href="javascript:doSearch()" class="btn btn-mini btn-danger">搜索 </a>
	            	</td>
	           </tr>
	           <tr>
	            	<td width="25%">科目<font color="FF0000">*</font>&nbsp;
	                    <select id="courseId" name="courseId" style="width:70%">
	            	 		<option value=""></option>
	             			<c:forEach items="${courseList}" var="course">
	                    		<option value="${course.id}">${course.name }</option>
	                    	</c:forEach>
	            	 	</select>
			                    <!-- 增加注册人、注册时间  -->
		              	 <input type="hidden" name="inputId" id="inputId" value="${sessionScope.user.id }"></input>
		               	 <input type="hidden" name="inputTime" id="inputTime" value="<%=curTime%>"></input>
	                </td>
	                <td width="25%">
	             		学年<font color="FF0000">*</font>&nbsp;
	             		<select id="nianfen" name="nianfen" style="width:70%">
	            	 		<option value="2024-2025" selected="selected">2024-2025</option>
	            	 		<option value="2023-2024">2023-2024</option>
	            	 		<option value="2022-2023">2022-2023</option>
	            	 		<option value="2021-2022">2021-2022</option>
	            	 		<option value="2020-2021">2020-2021</option>
	            	 		<option value="2019-2020">2019-2020</option>
	            	 		<option value="2018-2019">2018-2019</option>
	            	 		<option value="2017-2018">2017-2018</option>
	            	 		<option value="2016-2017">2016-2017</option>
	            	 		<option value="2015-2016">2015-2016</option>
	            	 		<option value="2014-2015">2014-2015</option>
	            	 		<option value="2013-2014">2013-2014</option>
	            	 		<option value="2012-2013">2012-2013</option>
	            	 		<option value="2011-2012">2011-2012</option>
	            	 		<option value="2010-2011">2010-2011</option>
	            	 	</select>
	            	 </td>
	            	<td width="25%">学期<font color="FF0000">*</font>&nbsp;
	            	 	<select id="xueqi" name="xueqi" style="width:70%">
	            	 		<option value="1">1</option>
	            	 		<option value="2">2</option>
	            	 	</select>
	            	 	</td>
	            	<td width="25%">
	                    	时间段
	                    	<input id="academicyear" readonly="readonly" style="width:60%" name="academicyear" type="text" value=""/>
	                </td>
	        </tr>  
	        </thead>
	        <tbody>
	        <tr>
	        <td colspan="4">
	            <table class="table table-striped table-bordered table-condensed" id="top">
	            <tbody>
		            <tr class="tr_detail">
		                <td class="auto-style1">序号 </td>
		                <td class="auto-style1">学号</td>
		                <td class="auto-style1">学生姓名</td>
		                <td class="auto-style1">实验成绩</td>
		                <td class="auto-style1">考试成绩</td>
		            </tr>
			          <c:forEach items="${studentBaseInfoList }" var="studentBaseInfo">
			            <tr>
			            	<td><%out.print(count);%></td>
			                <td>${studentBaseInfo.code }
			                	<input id="studentId_<%=count%>" name="studentId_<%=count%>" value="${studentBaseInfo.id}" type="hidden" />
			                </td>
			                <td>${studentBaseInfo.name }
			               
			                </td>
			                <td><input id="testgrade_<%=count%>" name="testgrade_<%=count%>" value="0" type="text" /></td>
			                <td><input name="examgrade_<%=count%>" id="examgrade_<%=count%>" value="0" type="text" /></td>
			            </tr>
			            <%count++;%>
			           </c:forEach>
			    </tbody>
	            </table>
	          </td>	            
	         </tr>
	        </tbody>
	        <tfoot>
	            <tr>
	                <td colspan="4">
	                 <input type="hidden" name="count" id="count" value="<%=count%>"></input>
	                    <input class="btn btn-inverse" type="submit" value="保存"/>
	                    <input class="btn btn-inverse" type="button" value="取消" onclick="cancel();" /></td>
	            </tr>
	        </tfoot>
	    </table>
    </form>
<script type="text/javascript">  
var parentCodeTotal="";
    $("#xueyuan").change(function(){
    	var xueyuan=$("#xueyuan").find("option:selected").val();
    	if(xueyuan!=""){
	    	parentCodeTotal=xueyuan;
	    	$("#zhuanye").attr("disabled",false);
	    	$("#zhuanye").empty();
	    	$.ajax({
	    		url:"<%=basePath%>/pages/getMajor2",
	    		type:"post",
	    		data:{'parentCode':xueyuan},
	    		success:function(data){
	    			var optionBlank=document.createElement("option");
	    			$(option).val("");
    				$(option).text("");
    				$("#zhuanye").append(optionBlank);
	    			for(var i=0;i<data.length;i++){
	    				var option=document.createElement("option");
	    				$(option).val(data[i].code);
	    				$(option).text(data[i].name);
	    				$("#zhuanye").append(option);
	    			}
	    		}
	    	});
    	}else{
    		parentCodeTotal="";
    		$("#zhuanye").attr("disabled",true);
    	}
    });
    $("#zhuanye").change(function(){
    	var zhuanye=$("#zhuanye").find("option:selected").val();
    	if(parentCodeTotal!=""){
	    	parentCodeTotal=parentCodeTotal+zhuanye;
	    	$("#banji").attr("disabled",false);
	    	$("#banji").empty();
	    	$.ajax({
	    		url:"<%=basePath%>/pages/getClass",
	    		type:"post",
	    		data:{'parentCode2':parentCodeTotal},
	    		success:function(data){
	    			
	    			for(var i=0;i<data.length;i++){
	    				var option=document.createElement("option");
	    				$(option).val(data[i].id);
	    				$(option).text(data[i].name);
	    				$("#banji").append(option);
	    			}
	    		}
	    	});
    	}else{
			$("#banji").attr("disabled",true);
    	}
    });  
    function doSearch(){
    	var getFaculty=$("#xueyuan").find("option:selected").val();
    	var getDiscipline=$("#zhuanye").find("option:selected").val();
    	var getClass=$("#banji").find("option:selected").val();
    	var getStudentCode=$("#studentCode").val();
    	/* var getCourseId=$("#courseId").val();
    	var getacademicyear=$("#academicyear").val(); */
    	<%-- window.location.href = "<%=basePath %>/pages/grade/doSearch?getFaculty="+getFaculty+"&getDiscipline="+getDiscipline+"&getClass="+getClass+"&getStudentCode="+getStudentCode+"&getCourseId="+getCourseId+"&getacademicyear="+getacademicyear; --%>	
    	window.location.href = "<%=basePath %>/pages/grade/doSearch?getFaculty="+getFaculty+"&getDiscipline="+getDiscipline+"&getClass="+getClass+"&getStudentCode="+getStudentCode;
    }
    $(function(){
    	var xuenian=$("#nianfen").find("option:selected").val();
    	var xueqi=$("#xueqi").find("option:selected").val();
    	var academic=xuenian+"学年第"+xueqi+"学期";
    	document.getElementById("academicyear").value=(academic);
    	$("#nianfen").change(function(){
    		var xuenian=$("#nianfen").find("option:selected").val();
        	var xueqi=$("#xueqi").find("option:selected").val();
        	var academic=xuenian+"学年第"+xueqi+"学期";
        	document.getElementById("academicyear").value=(academic);
    	});
    	$("#xueqi").change(function(){
	    	var xuenian=$("#nianfen").find("option:selected").val();
	    	var xueqi=$("#xueqi").find("option:selected").val();
	    	var academic=xuenian+"学年第"+xueqi+"学期";
	    	document.getElementById("academicyear").value=(academic);
    	});
    })
</script>
</body>
</html>
