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
    <div class="alert alert-info">当前位置<b class="tip"></b>添加用户</div>
	<form id="form1" action="<%=basePath%>/pages/user/user_save" method="post" enctype="multipart/form-data">
	    <table class="table table-striped table-bordered table-condensed list">
	        <thead>
	            <tr>
	                <td colspan="4"><b>添加用户信息</b></td>
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
	                   	<input id="code" name="code"  type="hidden"  />
	                    <input id="code2" name="code2"  type="text" value="${code }" disabled="disabled"/>
	                </td>
	                
	            </tr>
	            <tr>
	            	<td width="500">昵称<font color="FF0000">*</font></td>
	               <td width="500">
	                    <input id="nikename" name="nikename" type="text" />
	                </td>
	                <td>密码<font color="FF0000">*</font></td>
	                <td>
	                    <input id="password" name="password" value="" type="password" />
	                </td>
	            </tr>
	            <tr>
	             	<td width="15%">国家<font color="FF0000">*</font></td>
	                <td width="500">
	                   <select name="nationality" id="nationality">
		                   <option value="外国" >外国</option>
		                   <option value="中国" selected="selected">中国</option>
	                   </select>
	                </td>
	            	<td>省份<font color="FF0000">*</font></td>
	                <td>
	                   <input id="shengfen" name="shengfen" value="" type="text" />
	                </td>
	            </tr>
	            <tr>
	             	<td width="15%">详细<font color="FF0000">*</font></td>
	                <td width="500">
	                     <input id="address" name="address" value="" type="text" />
	                </td>
	            	<td>学历<font color="FF0000">*</font></td>
                   <td>
                   <select name="degree" id="degree">
	                   <option value="11" >大专</option>
	                   <option value="22" selected="selected">本科</option>
	                   <option value="33" >硕士</option>
	                   <option value="44" >博士</option>
                   </select>
                   </td>
	               
	            </tr>
	            <tr>
	             	<td width="15%">性别<font color="FF0000">*</font></td>
	                <td width="500">
	                     <input type="radio" name="sex" value="男" checked="checked"/>男
	                     <input type="radio" name="sex" value="女" />女
	                         
	                </td>
	            	<td>出生日期<font color="FF0000">*</font></td>
	                <td>
	                   <input id="dayofbirth" name="dayofbirth" value="" type="text" />
	                </td>
	               
	            </tr>
	            <tr>
	            	 <td>所属学院<font color="FF0000">*</font></td>
		            <td>
		           <!--  <input type="hidden" id="xueyuanText" name="xueyuanText"/> -->
		            <input type="hidden" id="major" name="major" value=""/>
		            	 <select id="xueyuan" name="xueyuan">
		            	 		<option value=""></option>
		             			<c:forEach items="${facultyList}" var="faculty">
		                    		<option value="${faculty.code }">${faculty.name }</option>
		                    	</c:forEach>
		            	 </select>
		            </td>
		            <td>所属专业<font color="FF0000">*</font></td>
		            <td>
		            	 <select id="majorCode" name="majorCode" disabled="disabled">
		             	</select>
		            </td>
	            </tr>
	             <tr>
	                <td>所属班级<font color="FF0000">*</font></td>
	                <td>
		                <select id="classId" name="classId" disabled="disabled">
		            	 		<%-- <option value=""></option>
		             			<c:forEach items="${classInfoList}" var="classInfo">
		                    		<option value="${classInfo.id }" ${getClassId eq classInfo.id ? "selected":"" }>${classInfo.name }</option>
		                    	</c:forEach> --%>
		            	 </select>
	                </td>
	                <td>政治面貌<font color="FF0000">*</font></td>
	                 <td>
	                    <select name="politicalstatus">
	                    <option value="1">党员</option>  
	                    <option value="2">团员</option>  
	                    <option value="3" selected="selected">群众</option>  
	                    <option value="4">民主党派</option>  
	                    </select>
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
	               <td >角色<font color="FF0000">*</font></td>
	                 <td class="td_detail">
	                    <select name="roleId">
	                    	<c:forEach items="${roleList }" var="role">
	                    		<option value="${role.id }">${role.roleName }</option>
	                    	</c:forEach>
	                    </select>
	                    <!--     增加注册人、注册时间 -->
	              	 <input type="hidden" name="inputId" value="${sessionScope.user.id }"></input>
	               	 <input type="hidden" name="inputTime" value="<%=curTime%>"></input>
	                	
	                  </td>
	                <td>入学日期<font color="FF0000">*</font></td>
	                <td>
	                 <input id="enrollmentyear" name="enrollmentyear" value="" type="text" />
	               </td>
	               </tr>
	               
	               <tr> 
	                  	<td>学籍状态<font color="FF0000">*</font></td>
	                	<td>
	                    <input type="radio" name="schoolrollStatus"  value="0"/>已离校
	                    <input type="radio" name="schoolrollStatus" checked="checked" value="1"/>注册学籍
	                    <input type="radio" name="schoolrollStatus" value="1"/>保留学籍
	                </td>
	                
	                <td >民族</td>
	                 <td class="td_detail" >
	                    <select name="ethnic" style="disabled:false">
						    <option value="1">汉族</option>  
						    <option value="2">蒙古族</option>  
						    <option value="3">回族</option>  
						    <option value="4">藏族</option>  
						    <option value="5">维吾尔族</option>  
						    <option value="6">苗族</option>  
						    <option value="7">彝族</option>  
						    <option value="8">壮族</option>  
						    <option value="9">布依族</option>  
						    <option value="10">朝鲜族</option>  
						    <option value="11">满族</option>  
						    <option value="12">侗族</option>  
						    <option value="13">瑶族</option>  
						    <option value="14">白族</option>  
						    <option value="15">土家族</option>  
						    <option value="16">哈尼族</option>  
						    <option value="17">哈萨克族</option>  
						    <option value="18">傣族</option>  
						    <option value="19">黎族</option>  
						    <option value="20">傈僳族</option>  
						    <option value="21">佤族</option>  
						    <option value="22">畲族</option>  
						    <option value="23">高山族</option>  
						    <option value="24">拉祜族</option>  
						    <option value="25">水族</option>  
						    <option value="26">东乡族</option>  
						    <option value="27">纳西族</option>  
						    <option value="28">景颇族</option>  
						    <option value="29">柯尔克孜族</option>  
						    <option value="30">土族</option>  
						    <option value="31">达斡尔族</option>  
						    <option value="32">仫佬族</option>  
						    <option value="33">羌族</option>  
						    <option value="34">布朗族</option>  
						    <option value="35">撒拉族</option>  
						    <option value="36">毛南族</option>  
						    <option value="37">仡佬族</option>  
						    <option value="38">锡伯族</option>  
						    <option value="39">阿昌族</option>  
						    <option value="40">普米族</option>  
						    <option value="41">塔吉克族</option>  
						    <option value="42">怒族</option>  
						    <option value="43">乌孜别克族</option>  
						    <option value="44">俄罗斯族</option>  
						    <option value="45">鄂温克族</option>  
						    <option value="46">德昂族</option>  
						    <option value="47">保安族</option>  
						    <option value="48">裕固族</option>  
						    <option value="49">京族</option>  
						    <option value="50">塔塔尔族</option>  
						    <option value="51">独龙族</option>  
						    <option value="52">鄂伦春族</option>  
						    <option value="53">赫哲族</option>  
						    <option value="54">门巴族</option>  
						    <option value="55">珞巴族</option>  
						    <option value="56">基诺族</option>  
						   </select>  
	                  </td>
	                  </tr>
	             
	        </tbody>
	        <tfoot>
	            <tr>
	                <td colspan="4">
	                    <input class="btn btn-inverse" type="button" onclick="doSubmitForm()" value="保存"/>
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
    		 alert("ss");
    		 var country=$("#nationality").find("option:selected").val();
    		 if(country=="中国"){
    			 $("#ethnic").attr("disabled",false);
    		 }else if(country=="外国"){
    			 $("#ethnic").attr("disabled",true);
    		 }
    	 });
    	 
    });
    function doSubmitForm(){
    	if($("#name").val()==null || $("#name").val()==""){
			alert("请输入姓名！！");
			return false;
		}
    	$("#form1").submit();
    }
    

</script>

</html>
