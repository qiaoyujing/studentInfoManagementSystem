package swu.edu.cn.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import swu.edu.cn.entity.Account;
import swu.edu.cn.entity.Faculty;
import swu.edu.cn.entity.Menu;
import swu.edu.cn.entity.Role;
import swu.edu.cn.entity.StudentBaseInfo;
import swu.edu.cn.service.Common;
import swu.edu.cn.service.GradeService;
import swu.edu.cn.service.RoleService;
import swu.edu.cn.service.StudentBaseInfoService;
import swu.edu.cn.util.PageUtil;

@Controller

@RequestMapping(value = "/pages")
@SessionAttributes({"user","menuList","roleIdOnline"})
public class StudentBaseInfoController {
	
	  //用户业务层实例化
    @Autowired(required = false)   
    private RoleService roleService;
    @Autowired(required = false)   
    private StudentBaseInfoService studentBaseInfoService;
    @Autowired(required = false)
    private Common commonService;
    @Autowired(required = false)   
    private GradeService gradeService;
    //private static Logger log=Logger.getLogger(StudentBaseInfoController.class);


    //学生添加页面
    @RequestMapping(value = "/user/user_add")
    public String ReturnUserAdd(@ModelAttribute("user") Account userInfo,Model model) throws Exception {
        System.out.println("进入user_add.jsp");
        System.out.println("userInfo="+userInfo.getName()+"  "+userInfo.getCode());
        List<Role> roleList=(List<Role>) roleService.selectAll();
        if (roleList!=null && !roleList.isEmpty()) {
        	model.addAttribute("roleList", roleList);
        }
        //学院集合
        List<Faculty> facultyList=null;
        facultyList=commonService.selectCodeAndNameFaculty();
        if(facultyList.size()>0){
        	model.addAttribute("facultyList", facultyList);
        }
        int code=0;
        code=studentBaseInfoService.selectMaxCode()+1;
        if(code>0){
        	model.addAttribute("code", code);
        }
        if(userInfo.getId()!=-1){
        	model.addAttribute("user", userInfo);
        }
        return "/user/user_add";
    }
    //学生列表页面
	@RequestMapping("/user/user_list")
    public String ReturnUserList(@ModelAttribute("user") Account acc,Model model,StudentBaseInfo studentBaseInfo, HttpServletRequest request, HttpServletResponse response) {
    	ArrayList<Menu> menuList=null;
    	menuList=(ArrayList<Menu>) request.getSession().getAttribute("menuList");
    	int roleIDOnline=(int)(request.getSession().getAttribute("roleIdOnline"));
    	List<StudentBaseInfo> userList=new ArrayList<StudentBaseInfo>();
    	PageUtil pu =new  PageUtil();
    	String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			pu.setCurrentPage(Integer.valueOf(currentPage));
		}
		pu.setTotalNum(studentBaseInfoService.selectAll().size());
		pu.calculation();
		if(roleIDOnline ==5 ||roleIDOnline==6){
			userList=studentBaseInfoService.selectByCode(acc.getCode());
		}else{
			
    		//通过获取全部进行查询
    		 userList=studentBaseInfoService.selectAllPage(pu.getIndexNum(), pu.getPageSize());
    	}
    	if(!userList.isEmpty() &&  userList!=null){
    		model.addAttribute("userList", userList);
    	}
    	model.addAttribute("page", pu);
    	model.addAttribute("menuList", menuList);
        return "/user/user_list";
    }
	@RequestMapping("/user/user_list2")
    public String ReturnUserList2(@ModelAttribute("user") Account acc,Model model, HttpServletRequest request, HttpServletResponse response) {
    	ArrayList<Menu> menuList=null;
    	menuList=(ArrayList<Menu>) request.getSession().getAttribute("menuList");
    	int roleIDOnline=(int)(request.getSession().getAttribute("roleIdOnline"));
    	List<StudentBaseInfo> userList=new ArrayList<StudentBaseInfo>();
    	PageUtil pu =new  PageUtil();
    	String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			pu.setCurrentPage(Integer.valueOf(currentPage));
		}
		pu.setTotalNum(studentBaseInfoService.selectAll().size());
		pu.calculation();
		if(roleIDOnline ==5 ||roleIDOnline==6){
			userList=studentBaseInfoService.selectByCode(acc.getCode());
		}else{
	    	String userCode=request.getParameter("searchCode");
	    	if(userCode!=null && !"".equals(userCode)){
	    		userList=studentBaseInfoService.selectByPartCode(userCode,pu.getIndexNum(), pu.getPageSize());
	    	}
		}
    	if(!userList.isEmpty() &&  userList!=null){
    		model.addAttribute("userList", userList);
    	}else{
    		try {
				response.getWriter().write("<script>alert('no record!!');window.location.href='./user_list';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
    		
    	}
    	model.addAttribute("page", pu);
    	model.addAttribute("menuList", menuList);
        return "/user/user_list2";
    }
    //学生修改页面
    @RequestMapping("/user/user_editPage")
    public String ReturnUserEdit(Model model,StudentBaseInfo studentBaseInfo, HttpServletRequest request, HttpServletResponse response) {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	 System.out.println("studentBaseInfo.getId()="+id);
    	 List<Role> roleList=(List<Role>) roleService.selectAll();
         if (roleList!=null && !roleList.isEmpty()) {
         	model.addAttribute("roleList", roleList);
         }
    	StudentBaseInfo user= studentBaseInfoService.getStudentBaseInfoById(id);
    	if(user!=null){
    		model.addAttribute("studentUser", user);
    	}
        return "/user/user_edit";
    } 
    //学生保存功能，之后调转到列表页面
    @RequestMapping("/user/user_save")
    public String ReturnUserSave(@ModelAttribute("form") StudentBaseInfo studentBaseInfo,Model model, HttpServletRequest request, HttpServletResponse response) {
    	String xueyuan=request.getParameter("xueyuan");
    	String majorCode=request.getParameter("majorCode");
    	String shengfen=request.getParameter("shengfen");
    	String time=request.getParameter("enrollmentyear").toString().substring(0,4);;
    	studentBaseInfo.setCode(studentBaseInfo.getDegree()+time+xueyuan+majorCode+studentBaseInfo.getCode());
    	studentBaseInfo.setAddress(studentBaseInfo.getNationality()+shengfen+studentBaseInfo.getAddress());
    	System.out.println("studentBaseInfo.getId()="+studentBaseInfo);
    	Account acc=new Account();
    	acc.setCode(studentBaseInfo.getCode());
    	acc.setName(studentBaseInfo.getName());
    	acc.setPassword(studentBaseInfo.getPassword());
    	acc.setRoleId(studentBaseInfo.getRoleId());
    	acc.setStatus(studentBaseInfo.getSchoolrollStatus());
    	int j= commonService.insertSelective(acc);
    	int i= studentBaseInfoService.insertSelective(studentBaseInfo);
    	System.out.println("添加了="+i+"条记录");
    	System.out.println("账户表添加了="+i+"条记录");
        return "/user/user_list";
    }
    //课程保存功能，之后调转到列表页面
    @RequestMapping("/user/user_update")
    public void ReturnUserUpdate(@ModelAttribute("form") StudentBaseInfo studentBaseInfo,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	System.out.println("进入课程保存操作中——course.getId()="+studentBaseInfo);
    	
    	int i= studentBaseInfoService.updateByPrimaryKeySelective(studentBaseInfo);
    	System.out.println("更新了="+i+"条记录");
    	response.getWriter().write("<script>alert('update successfully');window.location.href='./user_list';</script>");
		
    }
    
    @RequestMapping("/user/user_delete")
    public void ReturnUserDelete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	
    	 System.out.println("user.getId()="+id);
    	 String code=studentBaseInfoService.selectByPrimaryKey(id).getCode().toString().trim();
    	 int accountCount=commonService.deleteAccountByCode(code);
    	 System.out.println("zhanghubiao删除了"+accountCount+"条学生记录");
    	 //通过ID获取记录
    	int i= studentBaseInfoService.deleteByPrimaryKey(id);
    	System.out.println("删除了"+i+"条学生记录");
    	int gCount=gradeService.deleteAllGradeByStudentId(id);
    	System.out.println("删除了"+gCount+"条成绩记录");
    	
    	if(i>0){
    		response.getWriter().write("<script>alert('delete successfully');window.location.href='./user_list';</script>");
    	}else{
    		response.getWriter().write("<script>alert('delete failed');window.location.href='./user_list';</script>");
    	
    	}
    } 
}
