package swu.edu.cn.dao;

import java.util.List;
import java.util.Map;


import swu.edu.cn.entity.Grade;

public interface GradeMapper {
    int deleteByPrimaryKey(Integer id);
    
    int deleteAllGradeByStudentId(Integer studentId);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
    
    List<Grade> selectAll();
    
    List<Grade> selectAllPage(int startRow,int pageSize);
    
   // List<Grade> selectAllGrade(@Param("studentIdColl") List<Integer> studentIdColl,@Param("getCourseId") int getCourseId,@Param("getacademicyear") String getacademicyear);
    List<Grade> selectAllGrade(Map<String, Object> params);
    List<Grade> selectAllGrade2(Map<String, Object> params);
    //List<Grade> selectAllGrade2(@Param("studentIdColl") List<Integer> studentIdColl,@Param("getCourseId") int getCourseId,@Param("getacademicyear") String getacademicyear,@Param("startRow") int startRow,@Param("pageSize") int pageSize);
}