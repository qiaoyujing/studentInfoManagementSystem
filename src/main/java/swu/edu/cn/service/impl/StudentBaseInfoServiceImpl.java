package swu.edu.cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import swu.edu.cn.dao.StudentBaseInfoMapper;
import swu.edu.cn.entity.StudentBaseInfo;
import swu.edu.cn.service.StudentBaseInfoService;

@Service
public class StudentBaseInfoServiceImpl implements StudentBaseInfoService {

	@Resource
	private StudentBaseInfoMapper dao;

	@Override
	public StudentBaseInfo getStudentBaseInfoById(Integer id) {
		return this.dao.selectByPrimaryKey(id);
	}
	@Override
	public int selectMaxCode(){
		return dao.selectMaxCode();
	}
    @Override
	public List<StudentBaseInfo> selectByPrimaryKeySelective(StudentBaseInfo record){
    	return dao.selectByPrimaryKeySelective(record);
    }
    @Override
    public int insertSelective(StudentBaseInfo record){
    	return dao.insertSelective(record);
    }
    @Override
    public List<StudentBaseInfo> getStudentBaseInfoByClassID(Integer classId){
    	return dao.getStudentBaseInfoByClassID(classId);
    }
    
    @Override
    public List<StudentBaseInfo> selectByCode(String code){
    	return dao.selectByCode(code);
    }
    
    @Override
    public List<StudentBaseInfo> selectByPartCode(String code,int startRow,int pageSize){
    	return dao.selectByPartCode(code, startRow, pageSize);
    }
    
    @Override
    public List<StudentBaseInfo> selectAll(){
    	return dao.selectAll();
    }
	    
    @Override
    public List<StudentBaseInfo> selectAllPage(int startRow,int pageSize){
    	return dao.selectAllPage(startRow, pageSize);
    }
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}
	@Override
	public int insert(StudentBaseInfo record) {
		return dao.insert(record);
	}
	@Override
	public StudentBaseInfo selectByPrimaryKey(Integer id) {
		return dao.selectByPrimaryKey(id);
	}
	@Override
	public int updateByPrimaryKeySelective(StudentBaseInfo record) {
		return dao.updateByPrimaryKeySelective(record);
	}
	@Override
	public int updateByPrimaryKey(StudentBaseInfo record) {
		return dao.updateByPrimaryKey(record);
	}
}
