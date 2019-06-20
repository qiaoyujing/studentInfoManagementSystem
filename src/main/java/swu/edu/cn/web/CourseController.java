package swu.edu.cn.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import swu.edu.cn.entity.Faculty;
import swu.edu.cn.entity.Menu;
import swu.edu.cn.entity.Role;
import swu.edu.cn.entity.StudentBaseInfo;
import swu.edu.cn.entity.Account;
import swu.edu.cn.entity.Course;
import swu.edu.cn.service.CourseService;
import swu.edu.cn.util.PageUtil;

@Controller
@RequestMapping(value = "/pages")
@SessionAttributes({"user","menuList","roleIdOnline"})
public class CourseController {
	 //用户业务层实例化
    @Autowired(required = false)   
    private CourseService courseService;
    //课程添加页面
    @RequestMapping(value = "/course/course_add")
    public String returncCourseAdd(@ModelAttribute("user") Account userInfo,Model model) throws Exception {
        System.out.println("进入course_add.jsp");
        //获取所以角色记录     
        if(userInfo.getId()!=-1){
        	model.addAttribute("user", userInfo);
        }
        int code=0;
        code=courseService.selectMaxCode()+1;
        if(code>0){
        	model.addAttribute("code", code);
        }
        return "/course/course_add";
    }
    //课程列表页面
    @SuppressWarnings("unchecked")
	@RequestMapping("/course/course_list")
    public String ReturnCourseList(@ModelAttribute("menuList") ArrayList<Menu> menuList, Model model, HttpServletRequest request, HttpServletResponse response) {
    	response.setCharacterEncoding("UTF-8");
    	List<Course> courseList=new ArrayList<Course>();
    	PageUtil pu =new  PageUtil();
    	String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			pu.setCurrentPage(Integer.valueOf(currentPage));
		}
		
		pu.setTotalNum(courseService.selectAll().size());
		pu.calculation();
		
    	//if(course==null){
    		//获取全部的课程记录
    		courseList=courseService.selectAllPage(pu.getIndexNum(), pu.getPageSize());
    	//}else{
	    	//通过组合查询条件进行查询
	    	//courseList=courseService.selectBySelective(course);
    	//}
    	if(courseList.size()>0){
    		model.addAttribute("courseList", courseList);
    	}
    	model.addAttribute("menuList", menuList);
    	model.addAttribute("page", pu);
        return "/course/course_list";
    }
    //课程修改页面
    @RequestMapping("/course/course_editPage")
    public String ReturnCourseEdit(Model model, HttpServletRequest request, HttpServletResponse response) {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	response.setCharacterEncoding("UTF-8");
    	 System.out.println("course.getId()="+id);
    	 //通过ID获取记录
    	Course course= courseService.selectByPrimaryKey(id);
    	if(course!=null){
    		model.addAttribute("course", course);
    	}
        return "/course/course_edit";
    } 
  //课程删除页面
    @RequestMapping("/course/course_delete")
    public void ReturnCourseDelete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	response.setCharacterEncoding("UTF-8");
    	 System.out.println("course.getId()="+id);
    	 //通过ID获取记录
    	int i= courseService.deleteByPrimaryKey(id);
    	System.out.println("删除了"+i+"条记录");
    	if(i>0){
    		response.getWriter().write("<script>alert('delete successfully');window.location.href='./course_list';</script>");
    	}else{
    		response.getWriter().write("<script>alert('delete failed');window.location.href='./course_list';</script>");
    	
    	}
    } 
    //课程保存功能，之后调转到列表页面
    @RequestMapping("/course/course_save")
    public void ReturnCourseSave(@ModelAttribute("form") Course course,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入课程保存操作中——course.getId()="+course);
    	
    	int i= courseService.insertSelective(course);
    	System.out.println("添加了="+i+"条记录");
    	response.getWriter().write("<script>alert('add successfully');window.location.href='./course_list';</script>");
		
    }
    //课程保存功能，之后调转到列表页面
    @RequestMapping("/course/course_update")
    public void ReturnCourseUpdate(@ModelAttribute("form") Course course,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入课程保存操作中——course.getId()="+course);
    	
    	int i= courseService.updateByPrimaryKeySelective(course);
    	System.out.println("更新了="+i+"条记录");
    	response.getWriter().write("<script>alert('update successfully');window.location.href='./course_list';</script>");
		
    }
}
