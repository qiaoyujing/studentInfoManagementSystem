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
    <div class="alert alert-info">当前位置<b class="tip"></b>教师管理<b class="tip"></b>教师列表</div>
    <table class="table table-striped table-bordered table-condensed" id="top">
        <thead>
            <tr class="tr_detail">
                <td class="auto-style1">编号 </td>
                <td class="auto-style1">用户名</td>
                <td class="auto-style1">昵称</td>
                <td class="auto-style1">电话 </td>
                <td class="auto-style1">邮箱 </td>
                <td class="auto-style1">入职日期 </td>
                <td class="auto-style1">职位</td>
                <td class="auto-style1">学历</td>
                <td class="auto-style1">操作</td>
            </tr>
        </thead>
        <tbody>
          <c:forEach items="${teacherList }" var="teacher">
            <tr>
                <td>${teacher.code }</td>
                <td>${teacher.name }</td>
                <td>${teacher.nikename } </td>
                <td>${teacher.phone}</td>
                <td>${teacher.exmail }</td>
                <td><fmt:formatDate value="${teacher.enrollmentyear }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${teacher.position }</td>
                <td>${teacher.degree }</td>
                <td>
                	<c:forEach items="${menuList }" var="menu">
	                		<c:if test="${menu.url eq '/teacher/teacher_edit' }">
			                	<a href="<%=basePath %>/pages/teacher/teacher_editPage?id=${teacher.id }" class="btn btn-mini btn-danger">修改</a> 
	                		</c:if>
	                	</c:forEach>
	                	
	                	<c:forEach items="${menuList }" var="menu">
	                		<c:if test="${menu.url eq '/teacher/teacher_delete' }">
		                		<a href="javascript:del(${teacher.id })" class="btn btn-mini btn-danger">删除</a>
		                	</c:if>
	                	</c:forEach>
                </td>
            </tr>
           </c:forEach> 
             
<!--             <tr class="tr_pagenumber"> -->
<!--                 <td colspan="100"> -->
<!--                     <input class="btn btn-inverse top-next" id="find" type="button" value="下一步" /></td> -->
<!--             </tr> -->
            <tr class="tr_pagenumber">
                <td colspan="100">当前第${page.currentPage }页/共${page.countPage }页&nbsp;&nbsp;共${page.totalNum }条记录&nbsp;&nbsp;
                	<a href="<%=basePath %>/pages/teacher/teacher_list?currentPage=${page.firstPage }" class="badge badge-inverse">首页</a>&nbsp;
                    <a href="<%=basePath %>/pages/teacher/teacher_list?currentPage=${page.previousPage }" class="badge badge-inverse">上一页</a>&nbsp;
                    <a href="<%=basePath %>/pages/teacher/teacher_list?currentPage=${page.nextPage }" class="badge badge-inverse">下一页</a>&nbsp;
                    <a href="<%=basePath %>/pages/teacher/teacher_list?currentPage=${page.lastPage }" class="badge badge-inverse">尾页</a>
                 </td>
            </tr>
        </tbody>
    </table>
</body>
<script type="text/javascript">
  function del(id){
	  var flag = confirm("你确定要删除吗");
	  if(flag){
			window.location.href = "<%=basePath %>/pages/teacher/teacher_delete?id="+id;
		}
  }
</script>
</html>