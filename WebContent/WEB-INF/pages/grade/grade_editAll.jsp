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
<% String curTime=DateUtil.getDateString();
int count=1;
%>
    <div class="alert alert-info">当前位置<b class="tip"></b>成绩管理<b class="tip"></b>成绩列表</div>
<form action="<%=basePath%>/pages/grade/grade_updateAll" method="post" enctype="multipart/form-data">
    <table class="table table-striped table-bordered table-condensed" id="top">
        		<tbody>
		            <tr class="tr_detail">
		           		<td class="auto-style1">序号</td>
		                <td class="auto-style1">课程编号 </td>
		                <td class="auto-style1">课程名</td>
		                <td class="auto-style1">学生编号</td>
		                <td >学生名</td>
		                <td class="auto-style1">平时成绩</td>
		                <td class="auto-style1">考试成绩</td>
		            </tr>
		        
		          <c:forEach items="${gradeList }" var="grade">
		            <tr>
		            	<td><%out.print(count);%></td>
		                <td>
		                ${grade.courseCode }</td>
		                <td>${grade.courseName }</td>
		                <td>${grade.studentCode } </td>
		                <td>${grade.studentName}
		                <input id="gradeId_<%=count%>" name="gradeId_<%=count%>" value="${grade.id }" type="hidden" />
		                </td>
		                <td class="td_detail"><input id="testgrade_<%=count%>" name="testgrade_<%=count%>" value=" ${grade.testgrade }" type="text" /></td>
				        <td class="td_detail"><input name="examgrade_<%=count%>" id="examgrade_<%=count%>" value="${grade.examgrade}" type="text" /></td>
				         <%count++;%>
		            </tr>
		                   <!-- 修改人、修改时间  -->
	              	 <input type="hidden" name="modifyId" value="${sessionScope.user.id }"></input>
	               	 <input type="hidden" name="mofifyTime" value="<%=curTime%>"></input>
		           </c:forEach> 
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
</body>
</html>