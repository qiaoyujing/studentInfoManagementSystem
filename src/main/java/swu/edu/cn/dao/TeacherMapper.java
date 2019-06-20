package swu.edu.cn.dao;

import java.util.List;

import swu.edu.cn.entity.Teacher;

public interface TeacherMapper {
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