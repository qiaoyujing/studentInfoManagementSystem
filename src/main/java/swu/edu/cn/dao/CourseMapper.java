package swu.edu.cn.dao;

import java.util.List;

import swu.edu.cn.entity.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
    
    List<Course> selectAll();
    
    List<Course> selectAllPage(int startRow,int pageSize);
    
    int selectMaxCode();
}