package swu.edu.cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import swu.edu.cn.entity.Course;
import swu.edu.cn.entity.StudentBaseInfo;

public interface StudentBaseInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StudentBaseInfo record);

    int insertSelective(StudentBaseInfo record);

    StudentBaseInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StudentBaseInfo record);

    int updateByPrimaryKey(StudentBaseInfo record);
    
    List<StudentBaseInfo> selectByCode(String code);
    List<StudentBaseInfo> selectByPartCode(@Param("code") String code,@Param("startRow") int startRow,@Param("pageSize") int pageSize);
    int selectMaxCode();
    
    List<StudentBaseInfo> selectByPrimaryKeySelective(StudentBaseInfo record);
    List<StudentBaseInfo> getStudentBaseInfoByClassID(Integer classId);
    
    List<StudentBaseInfo> selectAll();
    
    List<StudentBaseInfo> selectAllPage(int startRow,int pageSize);
}