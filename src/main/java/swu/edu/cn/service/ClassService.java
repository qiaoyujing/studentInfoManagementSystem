package swu.edu.cn.service;

import java.util.List;

import swu.edu.cn.entity.ClassInfo;

public interface ClassService {
	int deleteByPrimaryKey(Integer id);

    int insert(ClassInfo record);

    int insertSelective(ClassInfo record);

    ClassInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ClassInfo record);

    int updateByPrimaryKey(ClassInfo record);
    
    List<ClassInfo> selectAll();
    
    List<ClassInfo> selectAllPage(int startRow,int pageSize);
    
    int selectMaxCode();
    
    List<ClassInfo> selectCodeAndNameByParentCode(String parentCode);
}
