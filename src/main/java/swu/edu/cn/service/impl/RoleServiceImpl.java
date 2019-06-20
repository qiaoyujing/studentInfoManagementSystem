package swu.edu.cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import swu.edu.cn.dao.RoleMapper;
import swu.edu.cn.entity.Role;
import swu.edu.cn.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService{
	@Resource
	private RoleMapper dao;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		
		return dao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Role record) {
		return dao.insert(record);
	}

	@Override
	public int insertSelective(Role record) {
		return dao.insertSelective(record);
	}

	@Override
	public Role selectByPrimaryKey(Integer id) {
		return dao.selectByPrimaryKey(id);
	}

	@Override
	public List<Role> selectAll() {
		return dao.selectAll();
	}

	@Override
	public int updateByPrimaryKeySelective(Role record) {
		return dao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Role record) {
		return dao.updateByPrimaryKey(record);
	}

}
