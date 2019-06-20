<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <div class="alert alert-info">当前位置<b class="tip"></b>班级列表</div>
    <table class="table table-striped table-bordered table-condensed" id="top">
        <thead>
            <tr class="tr_detail">
                <td class="auto-style1">编号 </td>
                <td class="auto-style1">班级名称</td>
                <td class="auto-style1">学生人数</td>
                <td class="auto-style1">预计 毕业年份</td>
                <td class="auto-style1">班主任 </td>
                <td class="auto-style1">操作 </td>
            </tr>
        </thead>
        <tbody>
          <c:forEach items="${classList }" var="classInfo">
            <tr>
                <td>${classInfo.code }</td>
                <td>${classInfo.name }</td>
                <td>${classInfo.studentnum}</td>
                <td><fmt:formatDate value="${classInfo.graduateyear }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${classInfo.teacherId }</td>
                <td>
                	<c:forEach items="${menuList }" var="menu">
	                		<c:if test="${menu.url eq '/class/class_edit' }">
			                	<a href="<%=basePath %>/pages/class/class_editPage?id=${classInfo.id }" class="btn btn-mini btn-danger">修改</a> 
	                		</c:if>
	                	</c:forEach>
	                	
	                	<c:forEach items="${menuList }" var="menu">
	                		<c:if test="${menu.url eq '/class/class_delete' }">
		                		<a href="javascript:del(${classInfo.id })" class="btn btn-mini btn-danger">删除</a>
		                	</c:if>
	                	</c:forEach>
                </td>
            </tr>
           </c:forEach> 
             
            <tr class="tr_pagenumber">
                <td colspan="100">当前第${page.currentPage }页/共${page.countPage }页&nbsp;&nbsp;共${page.totalNum }条记录&nbsp;&nbsp;
                	<a href="<%=basePath %>/pages/class/class_list?currentPage=${page.firstPage }" class="badge badge-inverse">首页</a>&nbsp;
                    <a href="<%=basePath %>/pages/class/class_list?currentPage=${page.previousPage }" class="badge badge-inverse">上一页</a>&nbsp;
                    <a href="<%=basePath %>/pages/class/class_list?currentPage=${page.nextPage }" class="badge badge-inverse">下一页</a>&nbsp;
                    <a href="<%=basePath %>/pages/class/class_list?currentPage=${page.lastPage }" class="badge badge-inverse">尾页</a>
                 </td>
            </tr>
        </tbody>
    </table>
</body>
<script type="text/javascript">
  function del(id){
	  var flag = confirm("此操作会将该班级涉及到的学生、成绩信息一并删除，确定要删除吗");
	  if(flag){
			window.location.href = "<%=basePath %>/pages/class/class_delete?id="+id;
		}
  }
</script>
</html>