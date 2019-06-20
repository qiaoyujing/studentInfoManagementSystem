package swu.edu.cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import swu.edu.cn.dao.ClassMapper;
import swu.edu.cn.entity.ClassInfo;
import swu.edu.cn.service.ClassService;
@Service
public class ClassServiceImpl implements ClassService{
	@Resource
	private ClassMapper dao;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(ClassInfo record) {
		return dao.insert(record);
	}

	@Override
	public int insertSelective(ClassInfo record) {
		return dao.insertSelective(record);
	}

	@Override
	public ClassInfo selectByPrimaryKey(Integer id) {
		return dao.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(ClassInfo record) {
		return dao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(ClassInfo record) {
		return dao.updateByPrimaryKey(record);
	}

	@Override
	public int selectMaxCode() {
		return dao.selectMaxCode();
	}

	@Override
	public List<ClassInfo> selectAll() {
		return dao.selectAll();
	}
	@Override
	public List<ClassInfo> selectAllPage(int startRow, int pageSize) {
		return dao.selectAllPage(startRow, pageSize);
	}
	@Override
	public List<ClassInfo> selectCodeAndNameByParentCode(String parentCode) {
		return dao.selectCodeAndNameByParentCode(parentCode);
	}

}
