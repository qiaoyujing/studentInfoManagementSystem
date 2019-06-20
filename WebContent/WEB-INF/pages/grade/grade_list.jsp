<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="swu.edu.cn.util.DateUtil"%>
<%@page import="swu.edu.cn.util.Notes"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/admin-all.css" />
    <script type="text/javascript" src="<%=basePath %>/js/back/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=basePath %>/js/back/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/ui-lightness/jquery-ui-1.8.22.custom.css" />
    
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
<% String curTime=DateUtil.getDateString();
int count=1;
%>
    <div class="alert alert-info">当前位置<b class="tip"></b>成绩管理<b class="tip"></b>成绩列表</div>
    <table class="table table-striped table-bordered table-condensed">
        <thead>
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
	            	<td width="25%" class="td_detail">学号 <input type="text" value="${getStudentCode}" id="studentCode" name="studentCode" style="width:60%"/>
	            	&nbsp;
	            	
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
	                    	<a href="javascript:doSearch()" class="btn btn-primary btn-danger">搜索 </a>
	                    	<a href="javascript:doUpdateAll()" class="btn btn-primary btn-danger">修改全部 </a>
	                    	<input id="academicyear" readonly="readonly" style="width:60%" name="academicyear" type="hidden" value=""/>
	                </td>
	        </tr>  
	        </thead>
	        
	        <tbody>
	        <tr>
	        <td colspan="4">
	            <table class="table table-striped table-bordered table-condensed" id="top">
		            <tr class="tr_detail">
		           		<td class="auto-style1">序号</td>
		                <td class="auto-style1">课程编号 </td>
		                <td class="auto-style1">课程名</td>
		                <td class="auto-style1">学生编号</td>
		                <td class="auto-style1">学生名</td>
		                <td class="auto-style1">平时成绩</td>
		                <td class="auto-style1">考试成绩</td>
		                <td class="auto-style1">总成绩</td>
		                <td class="auto-style1">操作</td>
		            </tr>
	          <c:forEach items="${gradeList }" var="grade">
	            <tr>
	            	<td><%out.print(count++);%></td>
	                <td>${grade.courseCode }</td>
	                <td>${grade.courseName }</td>
	                <td>${grade.studentCode } </td>
	                <td>${grade.studentName}</td>
	                <td>${grade.testgrade }</td>
	                <td>${grade.examgrade } </td>
	                <td>${grade.allgrade}</td>
	                <td>
	                	<c:forEach items="${menuList }" var="menu">
		                		<c:if test="${menu.url eq '/grade/grade_edit' }">
				                	<a href="<%=basePath %>/pages/grade/grade_editPage?id=${grade.id }" class="btn btn-mini btn-danger">修改</a> 
		                		</c:if>
		                	</c:forEach>
		                	
		                	<c:forEach items="${menuList }" var="menu">
		                		<c:if test="${menu.url eq '/grade/grade_delete' }">
			                		<a href="javascript:del(${grade.id })" class="btn btn-mini btn-danger">删除</a>
			                	</c:if>
		                	</c:forEach>
	                </td>
	            </tr>
	           </c:forEach> 

            <tr class="tr_pagenumber">
                <td colspan="100">当前第${page.currentPage}页/共${page.countPage }页&nbsp;&nbsp;共${page.totalNum }条记录&nbsp;&nbsp;
                	<a href="<%=basePath %>/pages/grade/grade_list?currentPage=${page.firstPage }" class="badge badge-inverse">首页</a>&nbsp;
                    <a href="<%=basePath %>/pages/grade/grade_list?currentPage=${page.previousPage }" class="badge badge-inverse">上一页</a>&nbsp;
                    <a href="<%=basePath %>/pages/grade/grade_list?currentPage=${page.nextPage }" class="badge badge-inverse">下一页</a>&nbsp;
                    <a href="<%=basePath %>/pages/grade/grade_list?currentPage=${page.lastPage }" class="badge badge-inverse">尾页</a>
                 </td>
            </tr>
        </table>
        </td>
        </tr>
        </tbody>
    </table>
</body>
<script type="text/javascript">
  function del(id){
	  var flag = confirm("你确定要删除吗");
	  if(flag){
			window.location.href = "<%=basePath%>/pages/grade/grade_delete?id="+id;
		}
  }
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
  function doSearch(){
	  	var getFaculty=$("#xueyuan").find("option:selected").val();
	  	var getDiscipline=$("#zhuanye").find("option:selected").val();
	  	var getClass=$("#banji").find("option:selected").val();
	  	var getStudentCode=$("#studentCode").val();
	    var getCourseId=$("#courseId").val();
	  	var getacademicyear=$("#academicyear").val(); 
	  	window.location.href = "<%=basePath %>/pages/grade/doSearch2?getFaculty="+getFaculty+"&getDiscipline="+getDiscipline+"&getClass="+getClass+"&getStudentCode="+getStudentCode+"&getCourseId="+getCourseId+"&getacademicyear="+getacademicyear;	
	}
  function doUpdateAll(){
	  	var getFaculty=$("#xueyuan").find("option:selected").val();
	  	var getDiscipline=$("#zhuanye").find("option:selected").val();
	  	var getClass=$("#banji").find("option:selected").val();
	  	var getStudentCode=$("#studentCode").val();
	    var getCourseId=$("#courseId").val();
	  	var getacademicyear=$("#academicyear").val(); 
	  	window.location.href = "<%=basePath %>/pages/grade/grade_editPageAll?getFaculty="+getFaculty+"&getDiscipline="+getDiscipline+"&getClass="+getClass+"&getStudentCode="+getStudentCode+"&getCourseId="+getCourseId+"&getacademicyear="+getacademicyear;	
	
  }
</script>
</html>