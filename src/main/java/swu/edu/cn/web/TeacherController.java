package swu.edu.cn.web;

import java.io.IOException;
import java.util.ArrayList;
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
import swu.edu.cn.entity.Teacher;
import swu.edu.cn.service.Common;
import swu.edu.cn.service.RoleService;
import swu.edu.cn.service.TeacherService;
import swu.edu.cn.util.PageUtil;
@Controller
@RequestMapping(value = "/pages")
@SessionAttributes({"user","menuList","roleIdOnline"})
public class TeacherController {
	  //用户业务层实例化
    @Autowired(required = false)   
    private RoleService roleService;
    @Autowired(required = false)   
    private TeacherService teacherService;
    @Autowired(required = false)
    private Common commonService;

    private static Logger log=Logger.getLogger(TeacherController.class);
    //教师添加页面
    @RequestMapping(value = "/teacher/teacher_add")
    public String returnTeacherAdd(@ModelAttribute("user") Account userInfo,Model model) throws Exception {
        System.out.println("进入teacher_add.jsp");
        
        System.out.println("userInfo="+userInfo.getName()+"  "+userInfo.getCode());
        List<Faculty> facultyList=null;
        facultyList=commonService.selectCodeAndNameFaculty();
        if(facultyList.size()>0){
        	model.addAttribute("facultyList", facultyList);
        }
        int code=0;
        code=teacherService.selectMaxCode()+1;
        if(code>0){
        	model.addAttribute("code", code);
        }
        //获取所以角色记录
        List<Role> roleList=(List<Role>) roleService.selectAll();
        if (roleList!=null) {
        	model.addAttribute("roleList", roleList);
        }        
        if(userInfo.getId()!=-1){
        	model.addAttribute("user", userInfo);
        }
        return "/teacher/teacher_add";
    }
    //教师列表页面
	@RequestMapping("/teacher/teacher_list")
    public String ReturnTeacherList(@ModelAttribute("menuList") ArrayList<Menu> menuList, Model model, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		
    	List<Teacher> teacherList=new ArrayList<Teacher>();
    	PageUtil pu =new  PageUtil();
    	String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			pu.setCurrentPage(Integer.valueOf(currentPage));
		}
		
		pu.setTotalNum(teacherService.selectAll().size());
		pu.calculation();
		
    	
    	//if(teacher==null){
    		//获取全部的教师记录
    		teacherList=teacherService.selectAllPage(pu.getIndexNum(), pu.getPageSize());
    	//}else{
	    	//通过组合查询条件进行查询
	    	//teacherList=teacherService.selectBySelective(teacher);
    	//}
    	if(teacherList.size()>0){
    		model.addAttribute("teacherList", teacherList);
    	}
    	model.addAttribute("menuList", menuList);
    	model.addAttribute("page", pu);
        return "/teacher/teacher_list";
    }
    //教师修改页面
    @RequestMapping("/teacher/teacher_editPage")
    public String ReturnTeacherEdit(Model model, HttpServletRequest request, HttpServletResponse response) {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	response.setCharacterEncoding("UTF-8");
    	 System.out.println("teacher.getId()="+id);
    	//获取所以角色记录
         List<Role> roleList=(List<Role>) roleService.selectAll();
         if (roleList!=null) {
         	model.addAttribute("roleList", roleList);
         }
    	 //通过ID获取记录
    	Teacher teacher= teacherService.selectByPrimaryKey(id);
    	if(teacher!=null){
    		model.addAttribute("teacher", teacher);
    	}
        return "/teacher/teacher_edit";
    } 
  //教师删除页面
    @RequestMapping("/teacher/teacher_delete")
    public void ReturnTeacherDelete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	response.setCharacterEncoding("UTF-8");
    	 System.out.println("teacher.getId()="+id);
    	 //通过ID获取记录
    	int i= teacherService.deleteByPrimaryKey(id);
    	System.out.println("删除了"+i+"条记录");
    	if(i>0){
    		response.getWriter().write("<script>alert('delete successfully');window.location.href='./teacher_list';</script>");
    	}else{
    		response.getWriter().write("<script>alert('delete failed');window.location.href='./teacher_list';</script>");
    	
    	}
    } 
    //教师保存功能，之后调转到列表页面
    @RequestMapping("/teacher/teacher_save")
    public void ReturnTeacherSave(@ModelAttribute("form") Teacher teacher,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入教师保存操作中——teacher.getId()="+teacher);
    	String time=teacher.getEnrollmentyear().toString().substring(24, 28);
    	String degreeTemp=teacher.getDegree();
    	String facultyCode=request.getParameter("xueyuan");
    	teacher.setCode(degreeTemp+time+facultyCode+teacher.getCode());
    	
    	Account acc=new Account();
    	acc.setCode(teacher.getCode());
    	acc.setName(teacher.getName());
    	acc.setPassword(teacher.getPassword());
    	acc.setRoleId(teacher.getRoleId());
    	acc.setStatus(teacher.getStatus());
    	int j= commonService.insertSelective(acc);
    	int i= teacherService.insertSelective(teacher);
    	System.out.println("添加了="+i+"条记录");
    	System.out.println("账户表添加了="+j+"条记录");
    	response.getWriter().write("<script>alert('add successfully');window.location.href='./teacher_list';</script>");
		
    }

}
