<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <base href="<%=basePath %>">
    <title>学生信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/base.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/back/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script type="text/javascript" src="<%=basePath %>/js/back/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=basePath %>/js/back/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/js/back/index.js"></script>
</head>
<body>
    <div class="warp">
        <!--头部开始-->
        <div class="top_c">
            <div class="top-nav">

            	上午好，欢迎您， ${sessionScope.user.name }！&nbsp;&nbsp;
            <a href="#">修改密码</a> | <a href="javascript:logout('<%=basePath %>');">安全退出</a></div>
        </div>
        <!--头部结束-->
        <!--左边菜单开始-->
        <div class="left_c left">
            <h1>系统操作菜单</h1>
            <div class="acc">
            	<c:forEach items="${menuList }" var="menu">
	                <c:if test="${menu.menuLevel eq 1 }">
		                <div>
		                    <a class="one">${menu.menuName }</a>
		                    <ul class="kid">
		                   	 <c:forEach items="${menuList }" var="menu02">
	                			<c:if test="${menu02.menuLevel eq 2 && menu02.parentId eq menu.id && menu.id < 6 }">
	                				<li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/${menu02.url}">${menu02.menuName }</a></li>
		                      	</c:if>
		                      	<c:if test="${menu02.menuLevel eq 2 && menu02.parentId eq menu.id && menu.id eq 6 }">
			                      		<li><b class="tip"></b>${menu02.menuName }</li>
			                      		
			                      		 <ul class="kid2">
					                   	 <c:forEach items="${menuList }" var="menu03">
				                			<c:if test="${menu03.menuLevel eq 3 && menu03.parentId eq menu02.id }">
					                        	<li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/${menu03.url}">${menu03.menuName }</a></li>
					                        </c:if>
					                     </c:forEach>
					                     </ul>
					                     
		                      	</c:if>	
               				 </c:forEach>
		                    </ul>
		                </div>
	                </c:if>
                </c:forEach>
                <div id="datepicker"></div>
            </div>

        </div>
        <!--左边菜单结束-->
        <!--右边框架开始-->
        <div class="right_c">
            <div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>

        </div>
        <div class="Conframe">
            <iframe name="Conframe" id="Conframe"></iframe>
        </div>
        <!--右边框架结束-->

       
    </div>
</body>
</html>