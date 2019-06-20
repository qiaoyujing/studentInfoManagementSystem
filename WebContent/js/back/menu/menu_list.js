// 当前页面 --- menu_list.jsp

// 自动加载第一页 菜单信息
// 将 table_list.jsp 菜单信息页面 回调
// 并将回调的页面加载到 当前页面的 id=list 的div中
$(function() {
	$.ajax({
		url : getBasePath()+"/menu/menu_list",
		type : "POST",
		dataType : "html",
		success : function(data) {
			$("#list").html(data);
		}
	});
});

//点击分页控件触发次函数，分页查询菜单信息
function menu_list(page) {
	$.ajax({
		url : getBasePath()+"/menu/menu_list",
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
// 点击 table_list.jsp 中删除按钮 触发此函数 删除菜单信息
// 参数：(id=菜单ID，page=当前页--目的是删除后重新加载当前页信息)
function delete_info(id, page) {
	var con = confirm("你确定要删除吗?"); // 在页面上弹出对话框
	if (con == false) {
		return;
	}
	$.ajax({
		url : getBasePath()+"/menu/menu_delete",
		data : {
			"id" : id
		},
		type : "POST",
		dataType : "text",
		success : function(data) {
			if ("true" == data) {
				alert("删除成功！");
				menu_list(page);
			} else {
				alert("删除失败！");
			}
		}
	});
}
// 点击 table_list.jsp 中修改按钮 触发此函数 跳转到修改页面 - menu_edit.jsp
// 参数:id, menu_name, menu_level, url, sequence, parent_id, status
// 参数的作用：指的是修改页面需要动态获取原信息数据，在此信息基础上进行修改
function menu_edit(id, menu_name, menu_level, url, sequence, parent_id, 

status) {
	$.ajax({
		url : getBasePath()+"/menu/menu_edit",
		data : {
			'id' : id,
			'menu_name' : menu_name,
			'menu_level' : menu_level,
			'url' : url,
			'sequence' : sequence,
			'parent_id' : parent_id,
			'status' : status
		},
		dataType : "html",
		success : function(data) {
			$("#tip").remove();
			$("#list").html();
			$("#list").html(data);
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