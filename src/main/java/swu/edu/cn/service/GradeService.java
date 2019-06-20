package swu.edu.cn.service;

import java.util.List;

import swu.edu.cn.entity.Grade;

public interface GradeService {
    int deleteByPrimaryKey(Integer id);
    
    int deleteAllGradeByStudentId(Integer id);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
    
    List<Grade> selectAll();
    
    List<Grade> selectAllPage(int startRow,int pageSize);
    
    List<Grade> selectAllGrade(List<Integer> studentIdColl,int getCourseId,String getacademicyear);
    
    List<Grade> selectAllGrade2(List<Integer> studentIdColl,int getCourseId,String getacademicyear,int startRow,int pageSize);

}
