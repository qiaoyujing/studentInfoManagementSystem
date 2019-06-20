package swu.edu.cn.service;

import java.util.List;

import swu.edu.cn.entity.Teacher;

public interface TeacherService {
	 int deleteByPrimaryKey(Integer id);

	    int insert(Teacher record);

	    int insertSelective(Teacher record);

	    Teacher selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Teacher record);

	    int updateByPrimaryKey(Teacher record);
	    
	    List<Teacher> selectAll();
	    
	    List<Teacher> selectAllPage(int startRow,int pageSize);
	    
	    int selectMaxCode();
	
}
