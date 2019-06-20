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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import swu.edu.cn.entity.Faculty;
import swu.edu.cn.entity.Menu;
import swu.edu.cn.entity.StudentBaseInfo;
import swu.edu.cn.entity.Account;
import swu.edu.cn.entity.ClassInfo;
import swu.edu.cn.entity.Discipline;
import swu.edu.cn.service.ClassService;
import swu.edu.cn.service.Common;
import swu.edu.cn.util.PageUtil;

@Controller
@RequestMapping(value = "/pages")
@SessionAttributes({"user","menuList","roleIdOnline"})
public class ClassContoller {
	 //用户业务层实例化
    @Autowired(required = false)   
    private ClassService classService;
    @Autowired(required = false)
    private Common commonService;
    //班级添加页面
    @RequestMapping(value = "/class/class_add")
    public String returncClassAdd(@ModelAttribute("user") Account userInfo,Model model) throws Exception {
        System.out.println("进入class_add.jsp");
        
        //获取所以角色记录     
        if(userInfo.getId()!=-1){
        	model.addAttribute("user", userInfo);
        }
        //学院集合
        List<Faculty> facultyList=null;
        facultyList=commonService.selectCodeAndNameFaculty();
        if(facultyList.size()>0){
        	model.addAttribute("facultyList", facultyList);
        }
        //专业集合
        List<Discipline> disciplineList=null;
        disciplineList=commonService.selectCodeAndNameDiscipline();
        if(disciplineList.size()>0){
        	model.addAttribute("disciplineList", disciplineList);
        }
        //编码
        int code=0;
        code=classService.selectMaxCode()+1;
        if(code>0){
        	model.addAttribute("code", code);
        }
        
        return "/class/class_add";
    }
    //班级列表页面
	@RequestMapping("/class/class_list")
    public String ReturnClassList(@ModelAttribute("menuList") ArrayList<Menu> menuList, Model model, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
    	List<ClassInfo> classList=new ArrayList<ClassInfo>();
    	PageUtil pu =new  PageUtil();
    	String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			pu.setCurrentPage(Integer.valueOf(currentPage));
		}
		
		pu.setTotalNum(classService.selectAll().size());
		pu.calculation();
		
    	//if(Class==null){
    		//获取全部的班级记录
    		classList=classService.selectAllPage(pu.getIndexNum(), pu.getPageSize());
    	//}else{
	    	//通过组合查询条件进行查询
	    	//ClassList=ClassService.selectBySelective(Class);
    	//}
    	if(classList.size()>0){
    		model.addAttribute("classList", classList);
    	}
    	model.addAttribute("menuList", menuList);
    	model.addAttribute("page", pu);
        return "/class/class_list";
    }
    //班级修改页面
    @RequestMapping("/class/class_editPage")
    public String ReturnClassEdit(Model model, HttpServletRequest request, HttpServletResponse response) {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	 System.out.println("class.getId()="+id);
    	 response.setCharacterEncoding("UTF-8");
    	 //通过ID获取记录
    	 ClassInfo classInfo= classService.selectByPrimaryKey(id);
    	if(classInfo!=null){
    		model.addAttribute("classInfo", classInfo);
    	}
        return "/class/class_edit";
    } 
  //班级删除页面
    @RequestMapping("/class/class_delete")
    public void ReturnClassDelete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	response.setCharacterEncoding("UTF-8");
    	 System.out.println("class.getId()="+id);
    	 //通过ID获取记录
    	int i= classService.deleteByPrimaryKey(id);
    	System.out.println("删除了"+i+"条记录");
    	if(i>0){
    		response.getWriter().write("<script>alert('delete successfully');window.location.href='./class_list';</script>");
    	}else{
    		response.getWriter().write("<script>alert('delete failed');window.location.href='./class_list';</script>");
    	
    	}
    } 
    //班级保存功能，之后调转到列表页面
    @RequestMapping("/class/class_save")
    public void ReturnClassSave(@ModelAttribute("form") ClassInfo classInfo,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入班级保存操作中——Class.getId()="+classInfo);
    	String disciplineCode=request.getParameter("zhuanye");
    	String facultyCode=request.getParameter("xueyuan");
    	String disciplineText=request.getParameter("zhuanyeText");
    	String facultyText=request.getParameter("xueyuanText");
    	classInfo.setCode(facultyCode+disciplineCode+classInfo.getCode());
    	classInfo.setUrl("/"+disciplineText+"/"+facultyText);
    	
    	int i= classService.insertSelective(classInfo);
    	System.out.println("添加了="+i+"条记录");
    	response.getWriter().write("<script>alert('add successfully');window.location.href='./class_list';</script>");
		
    }
    //班级保存功能，之后调转到列表页面
    @RequestMapping("/class/class_update")
    public void ReturnClassUpdate(@ModelAttribute("form") ClassInfo classInfo,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入班级保存操作中——Class.getId()="+classInfo);
    	
    	int i= classService.updateByPrimaryKeySelective(classInfo);
    	System.out.println("更新了="+i+"条记录");
    	response.getWriter().write("<script>alert('update successfully');window.location.href='./class_list';</script>");
		
    }
    
    //级联
    @ResponseBody
    @RequestMapping("/getMajor")
    public List<Discipline> getMajor(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setCharacterEncoding("UTF-8");
    	String parentCode=request.getParameter("parentCode");
        List<Discipline> disciplineList=null;
        disciplineList=commonService.selectCodeAndNameByParentCode(parentCode);
        if(disciplineList.size()>0){
        	model.addAttribute("disciplineList", disciplineList);
        }
        return disciplineList;
    }
}
