package swu.edu.cn.dao;

import java.util.List;

import swu.edu.cn.entity.Discipline;

public interface DisciplineMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Discipline record);

    int insertSelective(Discipline record);

    Discipline selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Discipline record);

    int updateByPrimaryKey(Discipline record);
    
    List<Discipline> selectCodeAndName();
    
    List<Discipline> selectCodeAndNameByParentCode(String parentCode);
}