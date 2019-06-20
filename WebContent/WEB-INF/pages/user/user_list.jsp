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
    <script type="text/javascript">
        $(function () {
            $('#center').hide();
            $('#bottom').hide();
            $('.top-next').click(function () {
                $('#top').hide();
                $('#center').show();
            })
            $('.center-next').click(function () {
                $('#center').hide();
                $('#bottom').show();
            })
            $('.center-prev').click(function () {
                $('#center').hide();
                $('#top').show();
            })
            $('.bottom-prev').click(function () {
                $('#bottom').hide();
                $('#center').show();
            })
        })
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
    <div class="alert alert-info">当前位置<b class="tip"></b>表单风格<b class="tip"></b>向导</div>
    <table class="table table-striped table-bordered table-condensed" id="top">
       	 <thead>
	        <tr>
	        	<td colspan="10" width="100%">
	        		学号：<input type="text" id="searchCode" name="searchCode" >&nbsp;&nbsp;&nbsp;
	        	 	<a href="javascript:doSearch()" class="badge badge-inverse">搜索</a>
	        	</td>
	        </tr>
	     </thead>
	        <thead>
            <tr class="tr_detail">
                <td class="auto-style1">编号 </td>
                <td class="auto-style1">用户名</td>
                <td class="auto-style1">昵称</td>
                <td class="auto-style1">出生日期</td>
                <td class="auto-style1">性别 </td>
                <td class="auto-style1">电话 </td>
                <td class="auto-style1">邮箱 </td>
                <td class="auto-style1">状态</td>
                <td class="auto-style1">操作</td>
            </tr>
        </thead>
        <tbody>
          <c:forEach items="${userList }" var="user">
            <tr>
                <td>${user.id }</td>
                <td>${user.name }</td>
                <td>${user.nikename } </td>
                <td><fmt:formatDate value="${user.dayofbirth }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>
                
                       <c:if test="${user.sex eq '女' }">
	                		女
	                	</c:if>
	                	<c:if test="${user.sex eq '男' }">
	                		男
	                	</c:if>
                
                </td>
                <td>${user.phone}</td>
                <td>${user.exmail }</td>
                <td>
                        <c:if test="${user.schoolrollStatus eq 0 }">
	                		已离校
	                	</c:if>
	                	<c:if test="${user.schoolrollStatus eq 1 }">
	                		注册学籍
	                	</c:if>
	                	<c:if test="${user.schoolrollStatus eq 2 }">
	                		保留学籍
	                	</c:if>
                
                </td>
                <td>
                	
                	<c:forEach items="${menuList }" var="menu">
	                		<c:if test="${menu.url eq '/user/user_edit' }">
			                	<a href="<%=basePath %>/pages/user/user_editPage?id=${user.id }" class="btn btn-mini btn-danger">修改</a> 
	                		</c:if>
	                	</c:forEach>
	                	
	                	<c:forEach items="${menuList }" var="menu">
	                		<c:if test="${menu.url eq '/user/user_delete' }">
		                		<a href="javascript:del(${user.id })" class="btn btn-mini btn-danger">删除</a>
		                	</c:if>
	                	</c:forEach>
                </td>
            </tr>
           </c:forEach> 
             
            <tr class="tr_pagenumber">
                <td colspan="100">当前第${page.currentPage }页/共${page.countPage }页&nbsp;&nbsp;共${page.totalNum }条记录&nbsp;&nbsp;
                	<a href="<%=basePath %>/pages/user/user_list?currentPage=${page.firstPage }" class="badge badge-inverse">首页</a>&nbsp;
                    <a href="<%=basePath %>/pages/user/user_list?currentPage=${page.previousPage }" class="badge badge-inverse">上一页</a>&nbsp;
                    <a href="<%=basePath %>/pages/user/user_list?currentPage=${page.nextPage }" class="badge badge-inverse">下一页</a>&nbsp;
                    <a href="<%=basePath %>/pages/user/user_list?currentPage=${page.lastPage }" class="badge badge-inverse">尾页</a>
                 </td>
            </tr>
        </tbody>
    </table>
</body>
<script type="text/javascript">
  function del(id){
	  var flag = confirm("会删除学生相关所有信息，确定要删除吗");
	  if(flag){
			window.location.href = "<%=basePath%>/pages/user/user_delete?id="+id;
		}
  }
  function doSearch(){
	  var searchCode=$("#searchCode").val();
	  //alert(searchCode);
	  window.location.href = "<%=basePath%>/pages/user/user_list2?searchCode="+searchCode;
  }
</script>
</html>