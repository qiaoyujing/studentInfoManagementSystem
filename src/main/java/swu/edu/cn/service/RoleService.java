package swu.edu.cn.service;

import java.util.List;

import swu.edu.cn.entity.Role;

public interface RoleService {
		int deleteByPrimaryKey(Integer id);

	    int insert(Role record);

	    int insertSelective(Role record);

	    Role selectByPrimaryKey(Integer id);
	    
	    List<Role> selectAll();

	    int updateByPrimaryKeySelective(Role record);

	    int updateByPrimaryKey(Role record);

}
