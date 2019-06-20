package swu.edu.cn.service;

import java.util.List;

import swu.edu.cn.entity.StudentBaseInfo;

public interface StudentBaseInfoService {
	/*通过ID获取实体类*/
	public StudentBaseInfo getStudentBaseInfoById(Integer id);
	/*通过实体类里任何n个字段获取实体类集合*/
	 public List<StudentBaseInfo> selectByPrimaryKeySelective(StudentBaseInfo record);
	/* 新增学生基本信息*/
	 int insertSelective(StudentBaseInfo record);
	 
	 List<StudentBaseInfo> getStudentBaseInfoByClassID(Integer classId);
	 
	 List<StudentBaseInfo>  selectByCode(String code);
	 
	 List<StudentBaseInfo> selectByPartCode(String code,int startRow,int pageSize);
	 
	 int selectMaxCode();
	 
	    
	 List<StudentBaseInfo> selectAll();
	    
	 List<StudentBaseInfo> selectAllPage(int startRow,int pageSize);
	 
	    int deleteByPrimaryKey(Integer id);

	    int insert(StudentBaseInfo record);


	    StudentBaseInfo selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(StudentBaseInfo record);

	    int updateByPrimaryKey(StudentBaseInfo record);
}

