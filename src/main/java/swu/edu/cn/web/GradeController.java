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

import swu.edu.cn.entity.Account;
import swu.edu.cn.entity.ClassInfo;
import swu.edu.cn.entity.Course;
import swu.edu.cn.entity.Discipline;
import swu.edu.cn.entity.Faculty;
import swu.edu.cn.entity.Grade;
import swu.edu.cn.entity.Menu;
import swu.edu.cn.entity.StudentBaseInfo;
import swu.edu.cn.service.ClassService;
import swu.edu.cn.service.Common;
import swu.edu.cn.service.CourseService;
import swu.edu.cn.service.GradeService;
import swu.edu.cn.service.StudentBaseInfoService;
import swu.edu.cn.util.Function;
import swu.edu.cn.util.Notes;
import swu.edu.cn.util.PageUtil;

@Controller
@RequestMapping(value = "/pages")
@SessionAttributes({"user","menuList","roleIdOnline"})
public class GradeController {
	 //用户业务层实例化
    @Autowired(required = false)   
    private GradeService gradeService;
    @Autowired(required = false)
    private Common commonService;
    @Autowired(required = false)   
    private ClassService classService;
    @Autowired(required = false)   
    private StudentBaseInfoService studentBaseInfoService;
    @Autowired(required = false)   
    private CourseService courseService;
    
    //成绩添加页面
    @RequestMapping(value = "/grade/grade_add")
    public String returncGradeAdd(@ModelAttribute("user") Account userInfo,Model model) throws Exception {
        System.out.println("进入grade_add.jsp");
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
        //班级集合
        List<ClassInfo> classInfoList=null;
        classInfoList=classService.selectAll();
        if(classInfoList.size()>0){
        	model.addAttribute("classInfoList", classInfoList);
        }
        List<Course> courseList=new ArrayList<Course>();
        courseList=courseService.selectAll();
        if(courseList.size()>0){
        	model.addAttribute("courseList", courseList);
        }
        return "/grade/grade_add";
    }
    //通过学院获取专业
    @ResponseBody
    @RequestMapping("/getMajor2")
    public List<Discipline> getMajor2(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	String parentCode=request.getParameter("parentCode");
        List<Discipline> disciplineList=null;
        disciplineList=commonService.selectCodeAndNameByParentCode(parentCode);
        if(disciplineList.size()>0){
        	model.addAttribute("disciplineList", disciplineList);
        }
       
        return disciplineList;
    }
    //通过专业获取班级
    @ResponseBody
    @RequestMapping("/getClass")
    public List<ClassInfo> getClass(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	String parentCode=request.getParameter("parentCode2");
        List<ClassInfo> classInfoList=null;
        classInfoList=classService.selectCodeAndNameByParentCode(parentCode);
        if(classInfoList.size()>0){
        	model.addAttribute("classInfoList", classInfoList);
        }
        return classInfoList;
    }
  /*  //通过班级获取学生
    @ResponseBody
    @RequestMapping("/getStudent")
    public List<StudentBaseInfo> getStudent(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	int parentId=Integer.parseInt(request.getParameter("class_id"));
        List<StudentBaseInfo> studentBaseInfoList=null;
        studentBaseInfoList=studentBaseInfoService.getStudentBaseInfoByClassID(parentId);
        if(studentBaseInfoList.size()>0){
        	model.addAttribute("studentBaseInfoList", studentBaseInfoList);
        }
        return studentBaseInfoList;
    }*/
    //成绩列表页面
	@RequestMapping("/grade/grade_list")
    public String ReturnGradeList(@ModelAttribute("menuList") ArrayList<Menu> menuList, Model model, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
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
        //班级集合
        List<ClassInfo> classInfoList=null;
        classInfoList=classService.selectAll();
        if(classInfoList.size()>0){
        	model.addAttribute("classInfoList", classInfoList);
        }
        //课程集合
        List<Course> courseList=new ArrayList<Course>();
        courseList=courseService.selectAll();
        if(courseList.size()>0){
        	model.addAttribute("courseList", courseList);
        }
        //成绩集合
		List<Grade> gradeList=new ArrayList<Grade>();
    	PageUtil pu =new  PageUtil();
    	String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			pu.setCurrentPage(Integer.valueOf(currentPage));
		}
		
		pu.setTotalNum(gradeService.selectAll().size());
		pu.calculation();
		
    	//if(grade==null){
    		//获取全部的成绩记录
    		gradeList=gradeService.selectAllPage(pu.getIndexNum(), pu.getPageSize());
    	//}else{
	    	//通过组合查询条件进行查询
	    	//gradeList=gradeService.selectBySelective(grade);
    	//}
    	if(gradeList.size()>0){
    		model.addAttribute("gradeList", gradeList);
    	}
    	model.addAttribute("menuList", menuList);
    	model.addAttribute("page", pu);
        return "/grade/grade_list";
    }
    //成绩修改页面
    @RequestMapping("/grade/grade_editPage")
    public String ReturnGradeEdit(Model model, HttpServletRequest request, HttpServletResponse response) {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	 System.out.println("grade.getId()="+id);
    	 //通过ID获取记录
    	Grade grade= gradeService.selectByPrimaryKey(id);
    	if(grade!=null){
    		model.addAttribute("grade", grade);
    	}
        return "/grade/grade_edit";
    } 
    //成绩修改页面all
    @RequestMapping("/grade/grade_editPageAll")
    public String ReturnGradeEditAll(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入成绩ziugai操作2中——");
    	List<StudentBaseInfo> studentBaseInfoList=new ArrayList<StudentBaseInfo>();
    	String getFacultyCode=request.getParameter("getFaculty");
    	String getDisciplineCode=request.getParameter("getDiscipline");
    	int getClassId=0;
    	if(request.getParameter("getClass")==null || request.getParameter("getClass").equals("")){
    		
    	}else{
    		getClassId=Integer.parseInt(request.getParameter("getClass"));
    	}
    	String getStudentCode=request.getParameter("getStudentCode");  
    	int getCourseId=0;
    	if(request.getParameter("getCourseId")==null || request.getParameter("getCourseId").equals("")){
    		
    	}else{
    		getCourseId=Integer.parseInt(request.getParameter("getCourseId"));
    	}
    	String getacademicyear=request.getParameter("getacademicyear");
    	
    	//从jsp获取参数结束，进入逻辑运算
    	if(("".equals(getStudentCode) || getStudentCode==null)){
    		if(getFacultyCode.equals("") || (getDisciplineCode.equals("") || getClassId<=0)){
    			response.getWriter().write("<script>alert(' check your chooice!!!');window.location.href='./grade_list';</script>");
    		}else {//通过班级ID获取学生信息集合
    				studentBaseInfoList=studentBaseInfoService.getStudentBaseInfoByClassID(getClassId);
        	}
    	}else{
    		if(getStudentCode.length()<15 || Function.isDigit(getStudentCode)==false){
        		response.getWriter().write("<script>alert(' student's code is error!!!');window.location.href='./grade_list';</script>");
        	}else{
        		studentBaseInfoList=studentBaseInfoService.selectByCode(getStudentCode);
        	}
    	}
    	if(!studentBaseInfoList.isEmpty() && studentBaseInfoList.size()>0){
        	model.addAttribute("studentBaseInfoList", studentBaseInfoList);
        	List<Integer> studentIdColl=new ArrayList<Integer>();
        	for(int k=0;k<studentBaseInfoList.size();k++){
	        	studentIdColl.add(studentBaseInfoList.get(k).getId());
        	}
        	//成绩集合
    		List<Grade> gradeList=new ArrayList<Grade>();
    		gradeList=gradeService.selectAllGrade(studentIdColl,getCourseId,getacademicyear);
        	if(!gradeList.isEmpty() && gradeList.size()>0){
        		model.addAttribute("gradeList", gradeList);
        	}
        }else{
        	response.getWriter().write("<script>alert('No records meet the query conditions!!!');window.location.href='./grade_list';</script>");
        }

        List<Course> courseList=new ArrayList<Course>();
        courseList=courseService.selectAll();
        if(!courseList.isEmpty() && courseList.size()>0){
        	model.addAttribute("courseList", courseList);
        }
        
    	//用于回显
    	model.addAttribute("getFacultyCode",getFacultyCode);
    	model.addAttribute("getDisciplineCode",getDisciplineCode);
    	model.addAttribute("getClassId",getClassId);
    	model.addAttribute("getStudentCode",getStudentCode);
    
        return "/grade/grade_editAll";
    } 
  //成绩删除页面
    @RequestMapping("/grade/grade_delete")
    public void ReturnGradeDelete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Integer id=Integer.parseInt(request.getParameter("id"));
    	 System.out.println("grade.getId()="+id);
    	 //通过ID获取记录
    	int i= gradeService.deleteByPrimaryKey(id);
    	System.out.println("删除了"+i+"条记录");
    	if(i>0){
    		response.getWriter().write("<script>alert('delete successfully');window.location.href='./grade_list';</script>");
    	}else{
    		response.getWriter().write("<script>alert('delete failed');window.location.href='./grade_list';</script>");
    	
    	}
    } 
    //成绩保存功能，之后调转到列表页面
    @RequestMapping("/grade/grade_save")
    public void ReturnGradeSave(@ModelAttribute("form") Grade grade,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	int count=0;
    	int studentId=0;
    	double testgrade=0;
    	double examgrade=0;
    	double allgrade=0;
    	int insertCount=0;
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入成绩保存操作中——grade.getId()="+grade);
    	if(request.getParameter("count")==null || "".equals(request.getParameter("count"))){
    		response.getWriter().write("<script>alert('error');window.location.href='./grade_list';</script>");
    	}else{
    		count=Integer.parseInt(request.getParameter("count"));
    	}
    	
    	for(int i=1;i<count;i++){
    		Grade gra=new Grade();
    		gra.setAcademicyear(grade.getAcademicyear());
    		gra.setCourseId(grade.getCourseId());
    		gra.setInputId(grade.getInputId());
    		gra.setInputTime(grade.getInputTime());
    		studentId=Integer.parseInt(request.getParameter("studentId_"+i));
    		gra.setStudentId(studentId);
    		testgrade=Integer.parseInt(request.getParameter("testgrade_"+i));
    		gra.setTestgrade(testgrade);
    		examgrade=Integer.parseInt(request.getParameter("examgrade_"+i));
    		gra.setExamgrade(examgrade);
    		if(testgrade>0 && examgrade>0 ){
    			allgrade=testgrade*Notes.testRatio + examgrade*Notes.examRatio;
    		}
    		gra.setAllgrade(allgrade);
    		insertCount=insertCount+gradeService.insertSelective(gra);
    	}
    	System.out.println("添加了="+insertCount+"条记录");
    	response.getWriter().write("<script>alert('add successfully');window.location.href='./grade_list';</script>");		
    }
    //成绩保存功能，之后调转到列表页面
    @RequestMapping("/grade/grade_update")
    public void ReturnGradeUpdate(@ModelAttribute("form") Grade grade,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入成绩保存操作中——grade.getId()="+grade);
    	double allGrade=0;
    	if(grade.getTestgrade()>0 && grade.getExamgrade()>0 ){
    		allGrade=grade.getTestgrade()*Notes.testRatio+ grade.getExamgrade()*Notes.examRatio;
		}
    	grade.setAllgrade(allGrade);
    	int i= gradeService.updateByPrimaryKeySelective(grade);
    	
    	System.out.println("更新了="+i+"条记录");
    	response.getWriter().write("<script>alert('update successfully');window.location.href='./grade_list';</script>");
		
    }
  //成绩保存功能，之后调转到列表页面suoyou
    @RequestMapping("/grade/grade_updateAll")
    public void ReturnGradeUpdateAll(@ModelAttribute("form") Grade grade,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	int count=0;
    	int gradeId=0;
    	double testgrade=0;
    	double examgrade=0;
    	double allgrade=0;
    	int insertCount=0;
    	response.setCharacterEncoding("UTF-8");
    	System.out.println("进入成绩修改操作中——grade.getId()="+grade);
    	if(request.getParameter("count")==null || "".equals(request.getParameter("count"))){
    		response.getWriter().write("<script>alert('error');window.location.href='./grade_list';</script>");
    	}else{
    		count=Integer.parseInt(request.getParameter("count"));
    	}
    	
    	for(int i=1;i<count;i++){
    		Grade gra=new Grade();
    		gradeId=Integer.parseInt(request.getParameter("gradeId_"+i));
    		gra.setId(gradeId);
    		testgrade=Double.parseDouble(request.getParameter("testgrade_"+i));
    		gra.setTestgrade(testgrade);
    		examgrade=Double.parseDouble(request.getParameter("examgrade_"+i));
    		gra.setExamgrade(examgrade);
    		if(testgrade>0 && examgrade>0 ){
    			allgrade=testgrade*Notes.testRatio+ examgrade*Notes.examRatio;
    		}
    		gra.setAllgrade(allgrade);
    		insertCount=insertCount+gradeService.updateByPrimaryKeySelective(gra);
    	}
    	System.out.println("更新了="+count+"条记录");
    	response.getWriter().write("<script>alert('update successfully');window.location.href='./grade_list';</script>");
		
    }
    //成绩保存功能，之后调转到列表页面
    @RequestMapping("/grade/doSearch")
    public String ReturnGradeSearchResult(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	System.out.println("进入成绩查询操作中——");
    	response.setCharacterEncoding("UTF-8");
    	List<StudentBaseInfo> studentBaseInfoList=new ArrayList<StudentBaseInfo>();
    	String getFacultyCode=request.getParameter("getFaculty");
    	String getDisciplineCode=request.getParameter("getDiscipline");
    	int getClassId=0;
    	if(request.getParameter("getClass")==null || request.getParameter("getClass").equals("")){
    		
    	}else{
    		getClassId=Integer.parseInt(request.getParameter("getClass"));
    	}
    	String getStudentCode=request.getParameter("getStudentCode");  
    	/*int getCourseId=0;
    	if(request.getParameter("getCourseId")==null || request.getParameter("getCourseId").equals("")){
    		
    	}else{
    		getCourseId=Integer.parseInt(request.getParameter("getCourseId"));
    	}
    	String getacademicyear=request.getParameter("getacademicyear");*/
    	//从jsp获取参数结束，进入逻辑运算
    	if(("".equals(getStudentCode) || getStudentCode==null)){
    		if(getFacultyCode.equals("") || (getDisciplineCode.equals("") || getClassId<=0)){
    			response.getWriter().write("<script>alert(' check your chooice!!!');window.location.href='./grade_add';</script>");
    		}else {//通过班级ID获取学生信息集合
    				studentBaseInfoList=studentBaseInfoService.getStudentBaseInfoByClassID(getClassId);
        	}
    	}else{
    		if(getStudentCode.length()<15 || Function.isDigit(getStudentCode)==false){
        		response.getWriter().write("<script>alert(' student's code is error!!!');window.location.href='./grade_add';</script>");
        	}else{
        		studentBaseInfoList=studentBaseInfoService.selectByCode(getStudentCode);
        	}
    	}
    	if(!studentBaseInfoList.isEmpty() && studentBaseInfoList.size()>0){
        	model.addAttribute("studentBaseInfoList", studentBaseInfoList);
        }else{
        	response.getWriter().write("<script>alert('No records meet the query conditions!!!');window.location.href='./grade_add';</script>");
        }

        List<Course> courseList=new ArrayList<Course>();
        courseList=courseService.selectAll();
        if(courseList.size()>0){
        	model.addAttribute("courseList", courseList);
        }
        
    	//用于回显
    	model.addAttribute("getFacultyCode",getFacultyCode);
    	model.addAttribute("getDisciplineCode",getDisciplineCode);
    	model.addAttribute("getClassId",getClassId);
    	model.addAttribute("getStudentCode",getStudentCode);
    	return "/grade/grade_add";
    }
    @RequestMapping("/grade/doSearch2")
    public String ReturnGradeSearch2Result(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	
    	System.out.println("进入成绩查询操作2中——");
    	response.setCharacterEncoding("UTF-8");
    	List<StudentBaseInfo> studentBaseInfoList=new ArrayList<StudentBaseInfo>();
    	String getFacultyCode=request.getParameter("getFaculty");
    	String getDisciplineCode=request.getParameter("getDiscipline");
    	int getClassId=0;
    	if(request.getParameter("getClass")==null || request.getParameter("getClass").equals("")){
    		
    	}else{
    		getClassId=Integer.parseInt(request.getParameter("getClass"));
    	}
    	String getStudentCode=request.getParameter("getStudentCode");  
    	int getCourseId=0;
    	if(request.getParameter("getCourseId")==null || request.getParameter("getCourseId").equals("")){
    		
    	}else{
    		getCourseId=Integer.parseInt(request.getParameter("getCourseId"));
    	}
    	String getacademicyear=request.getParameter("getacademicyear");
    	
    	//从jsp获取参数结束，进入逻辑运算
    	if(("".equals(getStudentCode) || getStudentCode==null)){
    		if(getFacultyCode.equals("") || (getDisciplineCode.equals("") || getClassId<=0)){
    			response.getWriter().write("<script>alert(' check your chooice!!!');window.location.href='./grade_list';</script>");
    		}else {//通过班级ID获取学生信息集合
    				studentBaseInfoList=studentBaseInfoService.getStudentBaseInfoByClassID(getClassId);
        	}
    	}else{
    		if(getStudentCode.length()<15 || Function.isDigit(getStudentCode)==false){
        		response.getWriter().write("<script>alert(' student's code is error!!!');window.location.href='./grade_list';</script>");
        	}else{
        		studentBaseInfoList=studentBaseInfoService.selectByCode(getStudentCode);
        	}
    	}
    	PageUtil pu =new  PageUtil();
    	String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			pu.setCurrentPage(Integer.valueOf(currentPage));
		}
    	if(!studentBaseInfoList.isEmpty() && studentBaseInfoList.size()>0){
        	model.addAttribute("studentBaseInfoList", studentBaseInfoList);
        	List<Integer> studentIdColl=new ArrayList<Integer>();
        	for(int k=0;k<studentBaseInfoList.size();k++){
	        	studentIdColl.add(studentBaseInfoList.get(k).getId());
        	}
        	
    		
    		pu.setTotalNum(gradeService.selectAllGrade(studentIdColl,getCourseId,getacademicyear).size());
    		pu.calculation();
    		
        	//成绩集合
    		List<Grade> gradeList=new ArrayList<Grade>();
    		gradeList=gradeService.selectAllGrade2(studentIdColl,getCourseId,getacademicyear,pu.getIndexNum(), pu.getPageSize());
        	if(!gradeList.isEmpty() && gradeList.size()>0){
        		model.addAttribute("gradeList", gradeList);
        	}
        }else{
        	response.getWriter().write("<script>alert('No records meet the query conditions!!!');window.location.href='./grade_list';</script>");
        }
    	model.addAttribute("page", pu);
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
        //班级集合
        List<ClassInfo> classInfoList=null;
        classInfoList=classService.selectAll();
        if(classInfoList.size()>0){
        	model.addAttribute("classInfoList", classInfoList);
        }
        List<Course> courseList=new ArrayList<Course>();
        courseList=courseService.selectAll();
        if(!courseList.isEmpty() && courseList.size()>0){
        	model.addAttribute("courseList", courseList);
        }
    	//用于回显
    	model.addAttribute("getFacultyCode",getFacultyCode);
    	model.addAttribute("getDisciplineCode",getDisciplineCode);
    	model.addAttribute("getClassId",getClassId);
    	model.addAttribute("getStudentCode",getStudentCode);
    	return "/grade/grade_list";
    }
}
