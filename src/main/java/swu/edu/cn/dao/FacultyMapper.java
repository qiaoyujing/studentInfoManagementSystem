package swu.edu.cn.dao;

import java.util.List;

import swu.edu.cn.entity.Faculty;

public interface FacultyMapper {
    int deleteByPrimaryKey(Integer key);

    int insert(Faculty record);

    int insertSelective(Faculty record);

    Faculty selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(Faculty record);
    
    List<Faculty> selectCodeAndName();
}