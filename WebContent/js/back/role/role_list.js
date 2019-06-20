// 当前页面 --- role_list.jsp

// 自动加载第一页 角色信息
// 将 table_list.jsp 角色信息页面 回调
// 并将回调的页面加载到 当前页面的 id=list 的div中
$(function() {
	$.ajax({
		url : getBasePath()+"/role/role_list",
		type : "POST",
		dataType : "html",
		success : function(data) {
			$("#list").html(data);
		}
	});
});

//点击分页控件触发次函数，分页查询菜单信息
function role_list(page) {
	$.ajax({
		url : getBasePath()+"/role/role_list",
		data : {
			"conuntPage" : page
		},
		type : "POST",
		dataType : "html",
		success : function(data) {
			$("#list").html();
			$("#list").html(data);
		}
	});
}
//查询指定角色 所拥有的权限
function role_menu_list(role_id,page){
	$.ajax({
		url : getBasePath()+"/role/role_menu_list",
		data : {
			"role_id":role_id,
			"currentPage" : page
		},
		type : "POST",
		dataType : "html",
		success : function(data) {
			$("#list").html();
			$("#list").html(data);
		}
	});
}
//根据角色id和菜单id 删除此角色拥有的一个菜单权限
 function delete_menu(level,mid,rid,page){
	 if(level=='1'){
		 var con = confirm("此功能包含子功能，删除此功能会直接影响子功能权限，确定删除吗?"); // 在页面上弹出对话框
			if (con == false) {
				return;
		}
	 }else{
		 var con = confirm("你确定要删除吗?"); // 在页面上弹出对话框
			if (con == false) {
				return;
		}
	 }
	 $.ajax({
			url : getBasePath()+"/role/role_menu_delete",
			data : {
				"rid":rid,
				"mid":mid,
				"level":level
			},
			type : "POST",
			dataType : "html",
			success : function(data) {
				if ("true" == data) {
					alert("删除成功！");
					role_menu_list(rid,page);
				} else {
					alert("删除失败！");
				}
			}
		});
 }
 
//根据角色id 删除此角色信息
 function delete_info(rid,page){
	var con = confirm("你确定要删除吗?"); // 在页面上弹出对话框
	if (con == false) {
		return;
	}
	 $.ajax({
			url : getBasePath()+"/role/role_delete",
			data : {
				"rid":rid
			},
			type : "POST",
			dataType : "html",
			success : function(data) {
				if ("true" == data) {
					alert("删除成功！");
					role_list(page);
				} else {
					alert("删除失败！");
				}
			}
		});
 }
//获取上下文项目路径
function getBasePath(){  
    var pathName = window.location.pathname.substring(1);  
    var webName = pathName == '' ? '' : pathName.substring(0, 

pathName.indexOf('/'));  
    return window.location.protocol + '//' + window.location.host + '/'+ 

webName;  
}  
