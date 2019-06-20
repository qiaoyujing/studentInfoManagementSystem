<%@page import="swu.edu.cn.util.DateUtil"%>
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
    		code=('00'+code).slice(-3);
    		document.getElementById("code").value=code;
    		
            $(".datepicker").datepicker();

            $('#list').hide();
            $('#find').click(function () {
                $('#list').show();
            })
        })
      
        function cancel(){
        	window.location.href="<%=basePath%>/pages/user/user_list";
        }
    </script>
</head>
<body>
<% String curTime=DateUtil.getDateString();

%>
    <div class="alert alert-info">当前位置<b class="tip"></b>修改用户</div>
	<form action="<%=basePath%>/pages/user/user_update" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>修改用户信息</b></td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td width="15%">姓名<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="name" id="name"  disabled="disabled" value="${studentUser.name }" type="text" />
	                </td>
	                <td>学号<font color="FF0000">*</font></td>
	            	<td>
	                   	<input id="code" name="code"  type="hidden"  />
	                    <input id="code2" name="code2"  type="text" value="${studentUser.code }" disabled="disabled"/>
	                </td>
	                
	            </tr>
	            <tr>
	            	<td width="500">昵称<font color="FF0000">*</font></td>
	               <td width="500">
	                    <input id="nikename" name="nikename" value="${studentUser.nikename }" type="text" />
	                </td>
	                <td>密码<font color="FF0000">*</font></td>
	                <td>
	                    <input id="password" name="password"  value="${studentUser.password }" type="text" />
	                </td>
	            </tr>
	            <tr>
	             	<td width="15%">国家<font color="FF0000">*</font></td>
	                <td width="500">
	                   <select name="nationality" id="nationality"  disabled="disabled">
		                   <option value="中国"  ${studentUser.nationality eq "中国" ? "selected":""}>中国</option>
	                   		<option value="外国" ${studentUser.nationality eq "外国" ? "selected":""}>外国</option>
		                </select>
	                </td>
	            	
	             	<td width="15%">地址<font color="FF0000">*</font></td>
	                <td width="500">
	                     <input id="address" name="address" value="${ studentUser.address}" type="text" />
	                </td>
	             </tr>
	             <tr>
	            	<td>学历<font color="FF0000">*</font></td>
                   <td>
                   <select name="degree" id="degree"  disabled="disabled">
	                   <option value="22" ${studentUser.degree eq "22" ? "selected":""}>本科</option>
	                   <option value="11" ${studentUser.degree eq "11" ? "selected":""}>大专</option>
	                   <option value="33" ${studentUser.degree eq "33" ? "selected":""}>硕士</option>
	                   <option value="44" ${studentUser.degree eq "44" ? "selected":""}>博士</option>
                   </select>
                   </td>
	               <td>专业<font color="FF0000">*</font></td>
		            <td>
		            	 <input id="major" name="major" value="${studentUser.major }" disabled="disabled"/>
		            </td>
	            </tr>
	            <tr>
	             	<td width="15%">性别<font color="FF0000">*</font></td>
	                <td width="500">
	                     <input type="radio" name="sex"  disabled="disabled"  value="男" ${studentUser.sex eq '男' ? "checked":"" }/>男
	                     <input type="radio" name="sex"  disabled="disabled" value="女" ${studentUser.sex eq '女' ? "checked":"" }/>女
	                         
	                </td>
	            	<td>出生日期<font color="FF0000">*</font></td>
	                <td>
	                   <input id="dayofbirth"  disabled="disabled" name="dayofbirth" value="${studentUser.dayofbirth}" type="text" />
	                </td>
	            </tr>
	            
	             <tr>
	                <td>所属班级</td>
	                <td>
		                <input type="text" name="classId" id="classId"  disabled="disabled" value="${studentUser.classId}"/>
	                </td>
	                <td>政治面貌<font color="FF0000">*</font></td>
	                 <td>
	                    <select name="politicalstatus"  disabled="disabled">
	                    <option value="1" ${studentUser.politicalstatus eq 1 ? "checked":"" }>党员</option>  
	                    <option value="2" ${studentUser.politicalstatus eq 2 ? "checked":"" }>团员</option>  
	                    <option value="3" ${studentUser.politicalstatus eq 3 ? "checked":"" }>群众</option>  
	                    <option value="4" ${studentUser.politicalstatus eq 4 ? "checked":"" }>民主党派</option>  
	                    </select>
	                </td>
	              </tr> 
	            <tr>
	            	<td width="500">电话号码<font color="FF0000">*</font></td>
	              	 <td width="500">
	                    <input id="phone" name="phone" value="${studentUser.phone }" type="text" />
	                </td>
	                <td width="15%">邮箱<font color="FF0000">*</font></td>
	                <td width="500">
	                    <input name="exmail" value="${studentUser.exmail }" type="text" />
	                </td>
	               
	            </tr>
	            
	              <tr>
	               <td >角色<font color="FF0000">*</font></td>
	                 <td class="td_detail">
	                    <select name="roleId"  disabled="disabled">
	                    	<c:forEach items="${roleList }" var="role">
	                    		<option value="${role.id }" ${studentUser.roleId eq role.id ? "selected":"" }>${role.roleName }</option>
	                    	</c:forEach>
	                    </select>
	                     <!-- 修改人、修改时间  -->
	              	 <input type="hidden" name="modifyId" value="${sessionScope.user.id }"></input>
	               	 <input type="hidden" name="modifyTime" id="modifyTime" value="<%=curTime%>"></input>
	                	
	                  </td>
	                <td>入学日期<font color="FF0000">*</font></td>
	                <td>
	                 <input id="enrollmentyear" name="enrollmentyear"  disabled="disabled" value="${studentUser.enrollmentyear }" type="text" />
	               </td>
	               </tr>
	               
	               <tr> 
	                  	<td>学籍状态<font color="FF0000">*</font></td>
	                	<td>
	                    <input type="radio"  disabled="disabled" name="schoolrollStatus" ${studentUser.schoolrollStatus eq 2 ? "checked":"" } value="2"/>已离校
	                    <input type="radio"  disabled="disabled" name="schoolrollStatus" ${studentUser.schoolrollStatus eq 1 ? "checked":"" } value="1"/>注册学籍
	                    <input type="radio"  disabled="disabled" name="schoolrollStatus" ${studentUser.schoolrollStatus eq 3 ? "checked":"" } value="3"/>保留学籍
	                </td>
	                
	                <td >民族</td>
	                 <td class="td_detail">
	                    <input name="ethnic" id="ethnic" value="${studentUser.ethnic}"  disabled="disabled"/>
	                    	 <input name="id" id="id" value="${studentUser.id}" type="hidden"/>
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
	var parentCodeTotal="";
    $("#xueyuan").change(function(){
    	var xueyuan=$("#xueyuan").find("option:selected").val();
    	if(xueyuan!=""){
    	parentCodeTotal=xueyuan;
    	$("#majorCode").empty();
    	$("#majorCode").attr("disabled",false);
    	$.ajax({
    		url:"<%=basePath%>/pages/getMajor",
    		type:"post",
    		data:{'parentCode':xueyuan},
    		success:function(data){
    			var option2=document.createElement("option");
				$(option2).val("");
				$(option2).text("");
				$("#majorCode").append(option2);
    			for(var i=0;i<data.length;i++){
    				var option=document.createElement("option");
    				$(option).val(data[i].code);
    				$(option).text(data[i].name);
    				$("#majorCode").append(option);
    			}
    	    	
    		}
    	});
    }else{
    	$("#majorCode").attr("disabled",true);
    	$("#majorCode").empty();
    	}
    }); 
    $("#majorCode").change(function(){
    	var zhuanye=$("#majorCode").find("option:selected").val();
    	if(zhuanye!=""){
	    	parentCodeTotal=parentCodeTotal+zhuanye;
	    	$("#classId").attr("disabled",false);
	    	$("#classId").empty();
	    	$.ajax({
	    		url:"<%=basePath%>/pages/getClass",
	    		type:"post",
	    		data:{'parentCode2':parentCodeTotal},
	    		success:function(data){
	    			var option2=document.createElement("option");
					$(option2).val("");
					$(option2).text("");
					$("#classId").append(option2);
	    			for(var i=0;i<data.length;i++){
	    				var option=document.createElement("option");
	    				$(option).val(data[i].id);
	    				$(option).text(data[i].name);
	    				$("#classId").append(option);
	    			}
	    		}
	    	});
	    	var zhuanText=$("#majorCode").find("option:selected").text();
	    	document.getElementById("major").value=zhuanText;
	    	alert("major="+document.getElementById("major").value);
    	}else{
			$("#classId").attr("disabled",true);
			$("#classId").empty();
    	}
    });  
    $(function(){
    	 $("#nationality").change(function(){
    		 var country=$("#nationality").find("option:selected").val();
    		 if(country=="中国"){
    			 $("#ethnic").attr("disabled",false);
    		 }else if(country=="外国"){
    			 $("#ethnic").attr("disabled",true);
    		 }
    	 });
    });
</script>

</html>
